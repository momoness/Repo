<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.DaneZasobyTyp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String wyjscie;
            Integer id = Integer.parseInt(request.getParameter("zastyp"));
            baza.DaneZasobyTyp d = new baza.DaneZasobyTyp();           
            try{
                d.usunZasobTyp(id);
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