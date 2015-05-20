<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
         <% 
             String wyjscie="";
             
            Integer id_rez = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            java.util.Date start = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("start"));
            java.util.Date end = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end"));
            Integer zas_ = Integer.parseInt(request.getParameter("zasob"));
            Integer typ__ = Integer.parseInt(request.getParameter("typ"));
            Integer powiazany;
            
            System.out.println("start: "+request.getParameter("start")+" koniec: "+request.getParameter("end"));
            try{
                powiazany = Integer.parseInt(request.getParameter("powiazany"));
            } catch (Exception e){
                powiazany = null;
            }
            Integer idkier = Integer.parseInt(request.getParameter("kierunek"));
            Integer wlasc = Integer.parseInt(request.getParameter("wlasciciel"));
            
                User u = null;
                String userId;
                try {
                    userId=request.getRemoteUser();
                    u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));
                } catch (Exception e) {
                }
            
            baza.DaneRezerwacja dRez = new baza.DaneRezerwacja();
            baza.Rezerwacja rez = dRez.zczytajRezerwacja(id_rez);
            
            baza.DaneZasob dZas = new baza.DaneZasob();
            baza.Zasob zas = dZas.zczytajZasob(zas_);
            
            baza.DaneRezerwacjaTyp dRT = new baza.DaneRezerwacjaTyp();
            baza.RezerwacjaTyp rezTyp = dRT.zczytajRezerwacjaTyp(typ__);
            
            baza.DaneKierunek dK = new baza.DaneKierunek();
            baza.Kierunek kier = dK.zczytajKierunek(idkier);
            
            baza.DaneOsoby dO = new baza.DaneOsoby();
            baza.Osoby osoba = dO.zczytajOsoba(wlasc);
            
            baza.Osoby usr = dO.znajdzPoLoginie(u.getScreenName().toString());
            
            rez.setId_zasob(zas);
            rez.setKierunek(kier);
            rez.setKoniec(end);
            rez.setOpis(title);
            rez.setPowiazany(powiazany);
            rez.setStart(start);
            rez.setTyp(rezTyp);
            rez.setWlasciciel(osoba);
            rez.setEdytujacy(usr);
            
            
            try{
                if (dRez.sprwadzDostepnascEdycji(start, end, zas, osoba,id_rez)){
                    dRez.updateRezerwacja(rez);
                    wyjscie = "Edytowano pomyślnie";
                }
                else wyjscie = "Nie można w tym czasie dokonać rezerwacji";
            } catch (Exception e){
                wyjscie = "Nie udało się edytować";
            }
            
        response.setContentType("application/json");
        response.getWriter().print(wyjscie);
        out.flush();
%>
