<%@page errorPage="/WEB-INF/error.jsp"%> <%-- 
    Document   : left
    Created on : 2015-01-08, 20:41:52
    Author     : MrRemo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body link="blue" alink="red" vlink="blue" style="background-color: #EFFEE1 ">
        
        <form action="<portlet:renderURL><portlet:param name="jspPage" value="/LoginOut" /></portlet:renderURL>" method="post" >
        <table>
            <tr>
                <td>Jesteś zalogowany jako </td></tr>
            <tr>
                <td><% out.println((String)session.getAttribute("username")); %></td>
            </tr>
            <tr>
                <td><input type="submit" value ="Wyloguj"/></td>
                <td></td>
            </tr>
        </table>
        
        <ul>
            
            <li><a href="dodajTytul.jsp" target="main">Dodaj tytuł</a></li>
            <li><a href="dodajOsoba.jsp" target="main">Dodaj osobę</a></li>
            <li><a href="dodajZasob.jsp" target="main">Dodaj zasób</a></li>
            <li><a href="dodajZwolnienie.jsp" target="main">Dodaj zwolnienie</a></li>
            <li><a href="dodajZasobTyp.jsp" target="main">Dodaj opis typu zasobu</a></li>
            <li><a href="dodajZasobOpis.jsp" target="main">Dodaj opis zasobu</a></li>
            <li><a href="dodajUprawnienieZasob.jsp" target="main">Dodaj uprawnienie do zasobu</a></li>
            <li><a href="dodajUprawnienieOsoba.jsp" target="main">Dodaj uprawnienie osobie</a></li>
            <li><a href="dodajUprawnienie.jsp" target="main">Dodaj uprawnienie</a></li>
            <li><a href="dodajPlanIgnoruj.jsp" target="main">Dodaj ignorowanie planu </a></li>
            <li><a href="dodajProsba.jsp" target="main">Dodaj prośbę </a></li>
            <li><a href="dodajProsbaZasob.jsp" target="main">Dodaj prośbę o zasób</a></li>
            <li><a href="dodajRezerwacja.jsp" target="main">Dodaj rezerwację</a></li>
            <li><a href="dodajRezerwacjaTyp.jsp" target="main">Dodaj typ rezerwacji</a></li>
            <li><a href="dodajSalaTyp.jsp" target="main">Dodaj typ sali</a></li>
            <li><a href="dodajSemestr.jsp" target="main">Dodaj semestr</a></li>
            <li><a href="dodajSemestrWykluczenia.jsp" target="main">Dodaj wykluczenie w semestrze</a></li>
            <li><a href="dodajSemestrZmiany.jsp" target="main">Dodaj zmianę w semestrze</a></li></br>
            <li><a href="usunOsoba.jsp" target="main">Usuń Osobę</a></li>
            <li><a href="usunPlanIgnoruj.jsp" target="main">Usuń Ignorowanie Planu</a></li>
            <li><a href="usunSalaTyp.jsp" target="main">Usuń Typ Sali</a></li>
            <li><a href="usunProsba.jsp" target="main">Usuń Prosbe</a></li>
            <li><a href="usunProsbaZasob.jsp" target="main">Usuń Prosbe o zasob</a></li>
            <li><a href="usunRezerwacja.jsp" target="main">Usuń Rezerwacja</a></li>
            <li><a href="usunRezerwacjaTyp.jsp" target="main">Usuń typ Rezerwacji</a></li>
            <li><a href="usunSemestr.jsp" target="main">Usuń Semestr</a></li>
            <li><a href="usunSemestrWykluczenia.jsp" target="main">Usuń Semestr Wykluczenia</a></li>
            <li><a href="usunSemestrZmiany.jsp" target="main">Usuń Semestr Zmiany</a></li>
            <li><a href="usunTytul.jsp" target="main">Usuń Tytul</a></li>
            <li><a href="usunUprawnienia.jsp" target="main">Usuń Uprawnienia</a></li>
            <li><a href="usunUprawnienieOsoba.jsp" target="main">Usuń Uprawnienia Osoby</a></li>
            <li><a href="usunUprawnienieZasob.jsp" target="main">Usuń Uprawnienia zasobu</a></li>
            <li><a href="usunZasob.jsp" target="main">Usuń zasob</a></li>
            <li><a href="usunZasobOpis.jsp" target="main">Usuń opis zasobu</a></li>
            <li><a href="usunZasobTyp.jsp" target="main">Usuń typ zasobu</a></li>
            <li><a href="usunZwolnienia.jsp" target="main">Usuń zwolnienie</a></li><br>
            <li><a href="updateOsoba.jsp" target="main">Update osoba</a></li>
            <li><a href="updateZasobTyp.jsp" target="main">Update ZasobTyp</a></li>
            <li><a href="updateTytul.jsp" target="main">Update Tytul</a></li>
            <li><a href="updateZasob.jsp" target="main">Update Zasob</a></li>
            <li><a href="UpdateZwolnienia.jsp" target="main">Update Zwolnienia</a></li>
            <li><a href="updateRezerwacjaTyp.jsp" target="main">Update RezerwacjaTyp</a></li>
            <li><a href="updateSalaTyp.jsp" target="main">Update SalaTyp</a></li>
            <li><a href="updateSemestr.jsp" target="main">Update Sem</a></li>
            <li><a href="testProsby.jsp" target="main">Testuj</a></li>
            
            
            <li><a href="updatePlanIgnoruj.jsp" target="main">Update IgnorowaniePlanu NIE DOROBIONY</a></li>
            
        </ul>        
    </body>
</html>
