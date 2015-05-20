<%@page errorPage="/WEB-INF/error.jsp"%> <%-- 
    Document   : LogOut
    Created on : 2015-01-04, 15:40:14
    Author     : MrRemo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Użytkownik został wylogowany! </h1>
        <form action="<portlet:renderURL><portlet:param name="jspPage" value="/index.jsp" /></portlet:renderURL>" method="post" >
            <input type="submit" value="Powrót">
        </form>
    </body>
</html>
