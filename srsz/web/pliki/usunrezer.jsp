<%-- 
    Document   : usunrezer
    Created on : 2015-03-12, 23:11:23
    Author     : Michasiek93
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       // <-- Remo
           //Pobieranie ID
           String wyjscie;
           int id = Integer.parseInt(request.getParameter("id"));
            
           //Usuwanie
           baza.DaneRezerwacja d = new baza.DaneRezerwacja();
           try{
               d.usunRezerwacja(id);
               wyjscie = "Pomyślnie usunięto";
           }
           catch(Exception e){
               e.printStackTrace();
               wyjscie = "Błąd. Usuwanie z danych nie powiodło się.";
           }
           // Remo -->
           %>
           
           <%=wyjscie%>
        
        
        
    </body>
</html>