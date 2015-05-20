<%@page errorPage="/WEB-INF/error.jsp"%> 
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="baza.DaneOsoby"%>
<%@page import="java.util.List"%>
<%@page import="baza.Osoby"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
            String wyjscie;
            Integer pracownik = Integer.parseInt(request.getParameter("pracownik"));
            java.util.Date start = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start"));
            java.util.Date koniec = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("koniec"));
            baza.DaneRezerwacja rez = new baza.DaneRezerwacja();
            DaneOsoby dO = new DaneOsoby();
            baza.Osoby osoba = dO.zczytajOsoba(pracownik);
            try{
                rez.zwolnienieZajec(start, koniec, osoba);
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
