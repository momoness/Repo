<%@page errorPage="/WEB-INF/error.jsp"%> <%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="baza.DaneRezerwacjaTyp"%>
<%@page import="baza.RezerwacjaTyp"%>
<%@page import="baza.DaneZasob"%>
<%@page import="baza.Zasob"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie;
            
            java.util.Date start = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(request.getParameter("dzien") + " " + request.getParameter("start"));
            java.util.Date koniec = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(request.getParameter("dzien") + " " + request.getParameter("koniec"));
            String opis = request.getParameter("opis");
            String typrez = request.getParameter("typrez");
            String wlasciciel = request.getParameter("wlasciciel");
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
            baza.Osoby dodajacy = d.zczytajOsoba(dodany);
            

            String zas = request.getParameter("zasob");
            Integer powiazany;
            try {
                powiazany = Integer.parseInt(request.getParameter("powiazany"));
            } catch (Exception  e)
            {
                powiazany = null;
            }
            
            baza.DaneOsoby dO = new baza.DaneOsoby();
            String w[] = wlasciciel.split(" ");
            baza.Osoby wlas =  dO.selectOsobyImieNazwisko(w[0],w[1]);    
       
            DaneRezerwacjaTyp dRT = new DaneRezerwacjaTyp();
            baza.RezerwacjaTyp rezTyp = dRT.selectPoNazwie(typrez);
            
            DaneZasob dZ = new DaneZasob();
            baza.Zasob zasob = dZ.selectZasobPoNazwie(zas);
            
            baza.DaneRezerwacja dR = new baza.DaneRezerwacja();
            
            
            
            try{
                if (start.after(koniec)==true){
                    out.println("Podana data początku jest późniejsza niż końca!<br>");
                    wyjscie="nie można dodać takiej rezerwacji";
                    throw new Exception();
                    
                } else {
                    wyjscie = "Pomyślnie dodano do bazy";
                    dR.dodajRezerwacja(start, koniec, opis, rezTyp, wlas, dodajacy, zasob, powiazany);
                }
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = "Błąd. Dodawanie danych nie powiodło się.";
            }
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>