<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.DaneRezerwacjaTyp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            String wyjscie;
            String opis = request.getParameter("opis");
            
            baza.DaneRezerwacjaTyp d = new baza.DaneRezerwacjaTyp();           
            try{
                d.dodajRezerwacjaTyp(opis);
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