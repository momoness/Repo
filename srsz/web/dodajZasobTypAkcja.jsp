<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String wyjscie;
            String opis = request.getParameter("opis");
            
            baza.DaneZasobyTyp d = new baza.DaneZasobyTyp();           
            try{
                d.dodajZasobTyp(opis);
                wyjscie = "Pomyślnie dodano do bazy";
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = "Błąd. Dodawanie danych nie powiodło się.";
            }
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>