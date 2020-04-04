/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.as1soapclient.servlet;

import com.mycompany.as1soapclient.client.ShowCrud;
import com.mycompany.as1soapclient.client.ShowCrud_Service;
import com.mycompany.as1soapclient.client.Shows;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.xml.rpc.soap.SOAPFaultException;

/**
 *
 * @author adityatuli
 */
@WebServlet(name="MainServlet")
@MultipartConfig
public class MainServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ShowCrud_Service service = new ShowCrud_Service();
        ShowCrud port = service.getShowCrudPort();
        List<Shows> showList = port.getAll();
        request.setAttribute("showList", showList);
        RequestDispatcher dispacher = request.getRequestDispatcher("/Index.jsp");
        dispacher.forward(request, response);
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String add = request.getParameter("add");
        String update = request.getParameter("update");
        String delete = request.getParameter("delete");
        System.out.println(add);
        System.out.println(update);
        System.out.println(delete);
        
        if(update==null && delete==null){
            String id=request.getParameter("id");
            String title=request.getParameter("title");
            String description=request.getParameter("description");
            String type=request.getParameter("type");
            String category=request.getParameter("category");
            String director=request.getParameter("director");
            String rating=request.getParameter("rating");
            String oldImg = request.getParameter("oldImg");
            Shows show = new Shows();
            if(id!=null){
                show.setId(BigDecimal.valueOf(Integer.parseInt(id)));
            }
            show.setTitle(title);
            show.setDescription(description);
            show.setRating(rating);
            show.setType(type);
            show.setCategory(category);
            show.setDirector(director);
            
            try{
                if(oldImg==null){
                    Part part = request.getPart("thumbnail");
                    ByteArrayOutputStream bytes= new ByteArrayOutputStream();
                    InputStream filecontent = part.getInputStream();
                    byte[] buffer = new byte[(int) part.getSize()];
                    int read = 0;
                    while((read=filecontent.read(buffer))!= -1){
                        bytes.write(buffer,0,read);

                    }
                    show.setThumbnail(buffer);
                }else{
                    show.setThumbnail(Base64.getDecoder().decode(oldImg ));
                }
                ShowCrud_Service service = new ShowCrud_Service();
                ShowCrud port = service.getShowCrudPort();
                port.add(show);
                List<Shows> showList = port.getAll();
                request.setAttribute("showList", showList);
                RequestDispatcher dispacher = request.getRequestDispatcher("/Index.jsp");
                dispacher.forward(request, response);
            }catch(Exception ex){
                request.setAttribute("msg", ex.getMessage());
                RequestDispatcher dispacher = request.getRequestDispatcher("/AddShow.jsp");
                dispacher.forward(request, response);
            }
            
        }
        if(delete!=null){
            ShowCrud_Service service = new ShowCrud_Service();
            ShowCrud port = service.getShowCrudPort();
            int showId = Integer.parseInt(request.getParameter("id"));
            port.delete(BigDecimal.valueOf(showId));
            List<Shows> showList = port.getAll();
            request.setAttribute("showList", showList);
            RequestDispatcher dispacher = request.getRequestDispatcher("/Index.jsp");
            dispacher.forward(request, response);
        }
        if(update!=null){
            ShowCrud_Service service = new ShowCrud_Service();
            ShowCrud port = service.getShowCrudPort();
            int showId = Integer.parseInt(request.getParameter("id"));
            Shows show = port.findById(BigDecimal.valueOf(showId));
            byte[] imageData = show.getThumbnail();
            if(imageData!=null){
                String b64Img = Base64.getEncoder().encodeToString(imageData);
                request.setAttribute("img", b64Img);
            }
            request.setAttribute("show", show);
            RequestDispatcher dispacher = request.getRequestDispatcher("/Update.jsp");
            dispacher.forward(request, response);
        }
//        
//        if(delete!=null){
//            int id = Integer.parseInt(request.getParameter("id"));
//            
//            
//        }
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
