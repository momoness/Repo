<%@page errorPage="/WEB-INF/error.jsp"%> <%-- 
    Document   : usunPlanIgnorujAkcja
    Created on : 2014-12-26, 22:03:56
    Author     : Panda
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

         <%
            String wyjscie;
            int id= Integer.parseInt(request.getParameter("id"));
            baza.DanePlanIgnoruj d = new baza.DanePlanIgnoruj();           
            try{
                d.usunPlanIgnoruj(id);
                wyjscie = "Pomyślnie usunięto z bazy";
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = "Błąd. Usuwanie z danych nie powiodło się.";
            }
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>
