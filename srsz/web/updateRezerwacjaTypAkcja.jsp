<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.DaneRezerwacjaTyp"%>
<%@page import="baza.RezerwacjaTyp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
           String wyjscie;
           Integer id=Integer.parseInt(request.getParameter("pobranytyp"));
           String typ = request.getParameter("poletekstowe");
           baza.DaneRezerwacjaTyp zapis = new baza.DaneRezerwacjaTyp();
           baza.RezerwacjaTyp tp = zapis.zczytajRezerwacjaTyp(id);
           tp.setOpis(typ);
           try{
               zapis.updateRezerwacjaTyp(tp);
               wyjscie = "Pomyślnie edytowano w bazie";
           }
           catch(Exception e) {
               e.printStackTrace();
               wyjscie = "Błąd. Edycja danych nie powiodła się.";
           }
response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>