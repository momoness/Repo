<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        java.util.Date start = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start"));
        java.util.Date koniec = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("end"));
            
        
        baza.DaneSemestr sem = new baza.DaneSemestr();
        boolean wyn;
        wyn = sem.sprawdzGotowyPlan(start, koniec);
        response.setContentType("application/json");
        response.getWriter().print(wyn);
         System.out.println("wynik funkcji to: "+wyn);
        out.flush();
%>