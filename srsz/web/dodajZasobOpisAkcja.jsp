<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.DaneZasob"%>
<%@page import="java.util.List"%>
<%@page import="baza.Zasob"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie;
            Integer zas = Integer.parseInt(request.getParameter("zasobopis"));
            int ilosc = Integer.parseInt(request.getParameter("ilosc"));
            String opis = request.getParameter("opis");
            
            baza.DaneZasobOpis d = new baza.DaneZasobOpis(); 
            
            DaneZasob dZ = new DaneZasob();
            baza.Zasob zasob = dZ.zczytajZasob(zas);
            
            try{
                d.dodajZasobOpis(zasob,ilosc,opis);
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
