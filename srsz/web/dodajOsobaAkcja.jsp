<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="com.liferay.portal.service.persistence.PortletUtil"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@page import="com.liferay.portal.service.UserServiceUtil"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String wyjscie;
    
    String tytul = request.getParameter("tytul");
    String imie = request.getParameter("imie");
    String nazwisko = request.getParameter("nazwisko");
    String login = request.getParameter("login");
    String email = request.getParameter("email");
    String telefon = request.getParameter("telefon");
    baza.DaneOsoby d = new baza.DaneOsoby();
    Integer dodany;
    
    User u = null;
    String userId;
    try {
        userId=request.getRemoteUser();
        u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));
        baza.Osoby bO = d.znajdzPoLoginie(u.getScreenName().toString());
        dodany = bO.getId();
        System.out.println("Dodany: "+dodany);
    } catch (Exception e) {
        dodany = null;
    }
    
    baza.DaneTytul dT = new baza.DaneTytul();
    baza.Tytuly tyt = dT.zczytajTytul(Integer.parseInt(tytul));

    try{
        d.dodajOsoba(imie, nazwisko, tyt, login, email, telefon, dodany);
        wyjscie = "Pomyślnie dodano do bazy";
    }
    catch (Exception e) {
        e.printStackTrace();
        wyjscie = "Błąd. Dodawanie danych nie powiod?o si?.";
    }
    
    response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>

