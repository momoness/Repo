<%@page import="baza.DaneRezerwacjaTyp"%>
<%@page import="baza.DaneZasob"%>
<%@page import="baza.RezerwacjaTyp"%>
<%@page import="baza.Zasob"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="java.util.Calendar"%>
<%@page errorPage="/WEB-INF/error.jsp"%> <%-- 
    Document   : dodajSemestrWykluczeniaAkcja
    Created on : 2014-12-27, 15:32:53
    Author     : MrRemo
--%>

<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie;
            Integer id = Integer.parseInt(request.getParameter("semestr"));
            java.util.Date dzien = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dzien"));
            String pocza = request.getParameter("poczatek");
            String koni   = request.getParameter("koniec");
            String[] parts = pocza.split(":");
            String[] parts2 = koni.split(":");
            
            Integer pocza1 = Integer.parseInt(parts[0]);
            Integer pocza2 = Integer.parseInt(parts[1]);
            Integer koni1 = Integer.parseInt(parts2[0]);
            Integer koni2 = Integer.parseInt(parts2[1]);
            
            Calendar poczatek = Calendar.getInstance();
            Calendar koniec = Calendar.getInstance();
            poczatek.set(2014, 6, 7, pocza1, pocza2);
            koniec.set(2014, 6, 7, koni1, koni2);
            
            String opis = request.getParameter("opis");
            Integer typ = Integer.parseInt(request.getParameter("rezTyp"));
            baza.DaneSemestr dS = new baza.DaneSemestr();
            baza.Semestr semestr = dS.zczytajSemestr(id);
            baza.DaneSemestrWykluczenia d = new baza.DaneSemestrWykluczenia();
            Calendar poczatkowa = Calendar.getInstance();
            Calendar koncowa = Calendar.getInstance();
            
            poczatkowa.setTime(dzien);
            koncowa.setTime(dzien);
            poczatkowa.set(Calendar.HOUR_OF_DAY, poczatek.get(Calendar.HOUR_OF_DAY));
            poczatkowa.set(Calendar.MINUTE, poczatek.get(Calendar.MINUTE));
            koncowa.set(Calendar.HOUR_OF_DAY, koniec.get(Calendar.HOUR_OF_DAY));
            koncowa.set(Calendar.MINUTE, koniec.get(Calendar.MINUTE));
            baza.DaneRezerwacja rez = new baza.DaneRezerwacja();
            
            baza.DaneOsoby os = new baza.DaneOsoby();
    Integer dodany;
    
    User u = null;
    String userId;
    try {
        userId=request.getRemoteUser();
        u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));
        baza.Osoby bO = os.znajdzPoLoginie(u.getScreenName().toString());
        dodany = bO.getId();
    } catch (Exception e) {
        dodany = null;
    }
            
            baza.DaneZasob zas = new baza.DaneZasob();
            List<Zasob> zasobyList = DaneZasob.selectZasoby();
            List<RezerwacjaTyp> rezerwacjaTypList = DaneRezerwacjaTyp.selectRezTyp();
            
            
            try{
                if (poczatek.after(koniec)==true){
                    out.println("Podana data początku jest późniejsza niż końca!<br>");
                    throw new Exception();
                }
                rez.zwolnienieZajec(poczatek.getTime(), koniec.getTime());
                for(int i=0; i<zasobyList.size(); i++)
                 rez.dodajRezerwacjaWykl(poczatek.getTime(), koniec.getTime(), opis, rezerwacjaTypList.get(typ), os.znajdzPoLoginie(u.getScreenName().toString()), os.znajdzPoLoginie(u.getScreenName().toString()), zasobyList.get(i));
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
