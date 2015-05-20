<%@page errorPage="/WEB-INF/error.jsp"%> <%-- 
    Document   : dodajRezerwacjaTyp
    Created on : 2014-12-27, 12:52:33
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
        <form action="<portlet:renderURL><portlet:param name="jspPage" value="/dodajSalaTypAkcja.jsp" /></portlet:renderURL>" method="post"  method="">
            Opis: <input type="text" name="opis"/><i>(string)</i></br>
                <input type="submit" value="Dodaj"/>
        </form>
    </body>
</html>
