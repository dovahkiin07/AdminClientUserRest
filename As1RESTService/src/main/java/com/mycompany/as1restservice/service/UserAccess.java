/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.as1restservice.service;

import java.math.BigDecimal;
import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import service.ShowCrud;
import service.ShowCrud_Service;
import service.Shows;

/**
 *
 * @author adityatuli
 */
@Path("user")
@Produces("text/json")
public class UserAccess {
    @Path("getAll")
    @GET
    public Response getAll(){
        ShowCrud_Service serv = new ShowCrud_Service();
        ShowCrud port = serv.getShowCrudPort();
        List<Shows> all = port.getAll();
        return Response.ok(all).build();
    }
    
    @Path("all/{id}")
    @GET
    public Response getShow(@PathParam("id") int id){
        ShowCrud_Service serv = new ShowCrud_Service();
        ShowCrud port = serv.getShowCrudPort();
        Shows show = port.findById(BigDecimal.valueOf(id));
        return Response.ok(show).build();
    }
}
