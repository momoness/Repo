<%@page errorPage="/WEB-INF/error.jsp"%> <%-- 
    Document   : indexafterlog
    Created on : 2015-01-04, 01:01:29
    Author     : MrRemo
--%>

<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Baza danych - obsługa</h1>
        
        
        
       
        <form action="<portlet:renderURL><portlet:param name="jspPage" value="/LoginOut" /></portlet:renderURL>" method="post" >
        <table>
            <tr>
                <td>Jesteś zalogowany jako </td>
                <td><% out.println((String)session.getAttribute("username")); %></td>
            </tr>
            <tr>
                <td><input type="submit" value ="Wyloguj"/></td>
                <td></td>
            </tr>
        </table>
    </form>
        
        <ul>
            
            <li><a href="dodajAkcje.jsp">Dodaj akcje</a></li>
            <li><a href="dodajTytul.jsp">Dodaj tytuł</a></li>
            <li><a href="dodajOsoba.jsp">Dodaj osobę</a></li>
            <li><a href="dodajZasob.jsp">Dodaj zasób</a></li>
            <li><a href="dodajZwolnienie.jsp">Dodaj zwolnienie</a></li>
            <li><a href="dodajZasobTyp.jsp">Dodaj opis typu zasobu</a></li>
            <li><a href="dodajZasobOpis.jsp">Dodaj opis zasobu</a></li>
            <li><a href="dodajUprawnienieZasob.jsp">Dodaj uprawnienie do zasobu</a></li>
            <li><a href="dodajUprawnienieOsoba.jsp">Dodaj uprawnienie osobie</a></li>
            <li><a href="dodajUprawnienie.jsp">Dodaj uprawnienie</a></li>
            <li><a href="dodajPlanIgnoruj.jsp">Dodaj Ignorowanie planu </a></li>
            <li><a href="dodajProsba.jsp">Dodaj Prośbę </a></li>
            <li><a href="dodajProsbaZasob.jsp">Dodaj Prośbę o zasób</a></li>
            <li><a href="dodajRezerwacja.jsp">Dodaj Rezerwację</a></li>
            <li><a href="dodajRezerwacjaTyp.jsp">Dodaj Rezerwację Typ</a></li>
            <li><a href="dodajSalaTyp.jsp">Dodaj Salę Typ</a></li>
            <li><a href="dodajSemestr.jsp">Dodaj Semestr</a></li>
            <li><a href="dodajSemestrWykluczenia.jsp">Dodaj Semestr Wykluczenia</a></li>
            <li><a href="dodajSemestrZmiany.jsp">Dodaj semestr zmiany</a></li>
            
        </ul>        
    </body>
</html>
