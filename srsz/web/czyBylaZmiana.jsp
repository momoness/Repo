<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        java.util.Date start = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start"));
        baza.DaneSemestrZmiany sem = new baza.DaneSemestrZmiany();
        boolean wyn;
        wyn = sem.sprawdzZmian(start);
        response.setContentType("application/json");
        response.getWriter().print(wyn);
         System.out.println("wynik funkcji to: "+wyn);
        out.flush();
%>