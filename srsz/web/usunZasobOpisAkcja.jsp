<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.DaneZasobOpis"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String wyjscie;
            Integer id = Integer.parseInt(request.getParameter("zasopis"));
            baza.DaneZasobOpis d = new baza.DaneZasobOpis(); 
            try{
                d.usunZasobOpis(id);
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
