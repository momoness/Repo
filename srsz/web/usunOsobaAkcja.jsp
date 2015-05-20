<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.DaneOsoby"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String wyjscie;
            Integer id = Integer.parseInt(request.getParameter("osoba"));
            baza.DaneOsoby d = new baza.DaneOsoby();
            try{
                d.usunOsoba(id);
                wyjscie = "Pomyślnie usunięto z bazy";
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = "Błąd. Usuwanie nie powiodło się.";
            }
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>