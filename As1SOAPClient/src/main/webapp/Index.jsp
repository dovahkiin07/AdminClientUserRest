<%-- 
    Document   : Index
    Created on : Apr. 1, 2020, 11:32:27 p.m.
    Author     : adityatuli
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Montserrat:400,700'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/css/materialize.min.css">
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/js/materialize.min.js"></script>
        <link rel='stylesheet' type='text/css' href='index.css'>
        <script src="index.js" type="text/javascript"></script>
        <title>Admin</title>
    </head>
    <body>
        <h1>My Shows</h1>
        <div id="app" class="grid">
            <h1><b>Shows</b> 📄</h1>
            <hr>
            <a href="AddShow.jsp">
                <button>Add Movie</button></a>
            <form method="post" action="MainServlet" id="myForm" onsubmit="return myFunction()">
                ID<select id="selectElementId" name="id" style="display: block!important;">
                    <c:forEach var="showList" items="${showList}">
                      <option value="${showList.id}" selected>${showList.id}</option>
                  </c:forEach>
                </select>
                <input type="submit" name="delete" value="Delete">
                <input type="submit" name="update" value="Update">
            </form>
            <table id="myTable">
              <thead>
                <tr>
                  <th>
                    Id
                  </th>
                  <th>
                    Title
                  </th>
                  <th id="desc">
                    Description
                  </th>
                  <th>
                    Type
                  </th>
                  <th>
                    Category
                  </th>
                  <th>
                    Director
                  </th>
                  <th>
                    Rating
                  </th>
                </tr>
              </thead>
              <tbody>
                  <c:forEach var="showList" items="${showList}">
                      <tr>
                          <td>${showList.id}</td>
                          <td>${showList.title}</td>
                          <td>${showList.description}</td>
                          <td>${showList.type}</td>
                          <td>${showList.category}</td>
                          <td>${showList.director}</td>
                          <td>${showList.rating}</td>
                      </tr>
                  </c:forEach>
              </tbody>
            </table>
            <div class="col-md-12 center text-center">
	    <span class="left" id="total_reg"></span>
            <ul class="pagination pager" id="myPager"></ul>
          </div>
      </div>
      </div>

            

            <hr>
          </div>


    </body>
</html>
