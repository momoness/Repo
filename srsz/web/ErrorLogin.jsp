<%@page errorPage="/WEB-INF/error.jsp"%> <%-- 
    Document   : ErrorLogin
    Created on : 2015-01-04, 15:38:16
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
        <h1>Błędny login i/lub hasło!</h1>
         <form action="<portlet:renderURL><portlet:param name="jspPage" value="/index.jsp" /></portlet:renderURL>" method="post" >
                <input type="submit" value="Powrót">
            </form>
    </body>
</html>
