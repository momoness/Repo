<%-- 
    Document   : usuwanieeventow
    Created on : 2015-04-08, 18:15:05
    Author     : miches
--%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneZasob"%>
<%@page import="baza.Zasob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       Usuwanie eventówjsp
        <%
             File f;
             List<Zasob> zasList = DaneZasob.selectZasoby();
              int tytSize = zasList.size();
             for (int i=1; i<tytSize+1; i++){
             f=new File("/tekst/events" + i+ ".jsp" );
                f.delete();
             }
                %>
    </body>
</html>
