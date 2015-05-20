<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.Semestr"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneSemestr"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie;
            Integer id = Integer.parseInt(request.getParameter("semestr"));
            baza.DaneSemestr d = new baza.DaneSemestr();     
            try{
                d.usunSemestr(id);
                wyjscie = "Pomyślnie usunięto z bazy";
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = "Błąd. Usuwanie z  danych nie powiodło się.";
            }
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>