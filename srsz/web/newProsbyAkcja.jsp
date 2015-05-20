<%@page import="baza.DaneOsoby"%>
<%@page import="baza.Osoby"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="baza.Kierunek"%>
<%@page import="baza.DaneKierunek"%>
<%@page import="baza.RezerwacjaTyp"%>
<%@page import="baza.DaneRezerwacjaTyp"%>
<%@page import="baza.DaneRezerwacja"%>
<%@page import="baza.DaneProsba"%>
<%@page import="baza.Prosba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="/WEB-INF/error.jsp"%> 
<%
    String wyjscie ="Operacja zakończona pomyślnie";
    String wiadomosc = request.getParameter("wybranaProsba");
    String rozbicie[] = wiadomosc.split(":");
    String operacja = rozbicie[0];
    Integer numerProsby = Integer.parseInt(rozbicie[1]);
    
    DaneProsba daneProsba = new DaneProsba();
    
    if (operacja.compareTo("akc")==0){
        DaneRezerwacja daneRezerwacja = new DaneRezerwacja();
        Prosba p = daneProsba.zczytajProsba(numerProsby);
        RezerwacjaTyp rezerwacjaTyp = p.getTyp(); 
        DaneKierunek daneKierunek = new DaneKierunek();
        Kierunek kierunek = daneKierunek.zczytajKierunek(7); //ID na nie dotyczy
        DaneOsoby daneOsoby = new DaneOsoby();
        Osoby rezerwujacy = new Osoby();
        
        User u = null;
        String userId;
        try {
            userId=request.getRemoteUser();
            u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));
            rezerwujacy = daneOsoby.znajdzPoLoginie(u.getScreenName().toString());
        } catch (Exception e) {
            wyjscie = "Nie udało się dokonać operacji";
        }
        
        try{
            daneRezerwacja.dodajRezerwacja(p.getStart(), p.getKoniec(), 
                    p.getPowod(), rezerwacjaTyp, p.getWlasciciel(), rezerwujacy, 
                    p.getId_zasob(), null, kierunek);
            wyjscie = "Operacja zakończona pomyślnie";
        } catch (Exception e){
            wyjscie = "Nie udało się dokonać operacji";
        }
    }
    daneProsba.usunProsba(numerProsby);
    response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>
