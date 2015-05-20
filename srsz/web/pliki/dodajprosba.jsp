<%@page import="java.text.Format"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="baza.RezerwacjaTyp"%>
<%@page import="baza.DaneRezerwacjaTyp"%>
<%@page import="baza.DaneZasob"%>
<%@page import="baza.DaneOsoby"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            java.util.Date start = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("start"));
            java.util.Date koniec = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end"));
            String opis = request.getParameter("title");
            int typ = Integer.parseInt(request.getParameter("typ"));
            int wlasciciel = Integer.parseInt(request.getParameter("wlasc"));
            int id_zasob = Integer.parseInt(request.getParameter("id_zasob"));
          
            baza.DaneProsba d = new baza.DaneProsba();
            baza.DaneOsoby dos = new baza.DaneOsoby();
            
            baza.Osoby wlas = new baza.Osoby();
            DaneOsoby dO = new DaneOsoby();
            baza.RezerwacjaTyp rezTyp = new baza.RezerwacjaTyp();
             baza.DaneZasob zas = new baza.DaneZasob();
            DaneZasob dZ = new DaneZasob();
            
            Format sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Format kdf = new SimpleDateFormat("HH:mm");
            wlas = dos.zczytajOsoba(wlasciciel);
            baza.Zasob zasob = dZ.zczytajZasob(id_zasob);
            DaneRezerwacjaTyp dRT = new DaneRezerwacjaTyp();
            rezTyp = dRT.zczytajRezerwacjaTyp(typ);
            String[] osoby = new String[1];
            String temat = new String();
            temat="Zgłoszenie nowej prośby SRSiZ";
            String enter="<html><br></html>";
            osoby[0]=wlas.getEmail();
            try{
                d.dodajProsba(wlas,opis,start,koniec,zasob,rezTyp);
                baza.mail.sendEmail(temat, osoby, "Użytkownik "+wlas.getNazwisko()+" "+wlas.getImie()+" wysłał prośbę o zasób: "+zasob.getNazwa()
                        +enter+"Termin: "+sdf.format(start)+" - "+kdf.format(koniec)+ enter +" Tytuł prośby: "+opis);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        %>

