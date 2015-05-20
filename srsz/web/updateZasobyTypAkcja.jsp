<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.DaneZasobyTyp"%>
<%@page import="baza.ZasobyTyp"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String wyjscie;
            String opis = request.getParameter("zasob_typ");
            Integer id=Integer.parseInt(request.getParameter("opistyp"));
            
            baza.DaneZasobyTyp d = new baza.DaneZasobyTyp();
            baza.ZasobyTyp zt = d.zczytajZasobTyp(id);
            
            zt.setOpis(opis);
            try{
                d.updateZasobTyp(zt);
                wyjscie = "Pomyślnie edytowano w bazie";
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = "Błąd. Edycja danych nie powiodła się.";
            }
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>
