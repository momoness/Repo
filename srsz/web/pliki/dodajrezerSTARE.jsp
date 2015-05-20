<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="baza.Semestr"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneSemestr"%>
<%@page import="java.util.Random"%>
<!-- 
    Document   : dodajrezer
    Created on : 2015-03-11, 21:05:04
    Author     : Michasiek93
-->

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="baza.HibernateUtil"%>
<%@page import="baza.DaneRezerwacja"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%      
            // <-- Chinsen
            // Pobieranie danych
            java.util.Date start = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("start"));
            java.util.Date koniec = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end"));
            String opis = request.getParameter("title");
            int typ = Integer.parseInt(request.getParameter("typ"));
            Integer wlasciciel = Integer.parseInt(request.getParameter("wlasc"));
            Integer dodany = null;
            int id_zasob = Integer.parseInt(request.getParameter("id_zasob"));
               int los = Integer.parseInt(request.getParameter("los"));
               baza.DaneOsoby dos = new baza.DaneOsoby();
               User u = null;
                String userId;
                try {
                    userId=request.getRemoteUser();
                    u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));
                    baza.Osoby bO = dos.znajdzPoLoginie(u.getScreenName().toString());
                    dodany = bO.getId();
                    System.out.println("Dodany: "+dodany);
                } catch (Exception e) {
                    dodany = null;
                }

            
            // Ustalanie danych
            baza.Osoby dodajacy = new baza.Osoby();
            baza.Osoby wlas =  new baza.Osoby();
            baza.RezerwacjaTyp rezTyp = new baza.RezerwacjaTyp();
            baza.Zasob zaso = new baza.Zasob();
            
            
            baza.DaneRezerwacjaTyp rt = new baza.DaneRezerwacjaTyp();
            baza.DaneZasob zas = new baza.DaneZasob();
            
            dodajacy = dos.zczytajOsoba(dodany);
            wlas = dos.zczytajOsoba(wlasciciel);
            rezTyp.setId(typ);
            rezTyp.setOpis(rt.getOpis(typ));
            zaso = zas.zczytajZasob(id_zasob);
            boolean wolne = true;            
             
            boolean jest=false;  
            int idik=-1; int ktory=-1;
            Date data_powstart =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("start"));;
            Date data_powend = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end"));
            System.out.println("pow1 " +data_powstart +data_powend);
            Date pocz=null;
            Date kon=null;
            String wyjscie=" ";
            Integer powiazany = null;
                
            if (los==1){
                SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
                SimpleDateFormat format1 = new SimpleDateFormat("HHmmssSS");
                Date date = new Date();
                Date date1 = new Date();
                int liczba = Integer.parseInt(format.format(date));
                int liczba1 = Integer.parseInt(format1.format(date1));
                
                System.out.println("liczba: "+liczba);
                System.out.println("liczba1: "+liczba1);
                
                int liczbasum = liczba+liczba1;
                System.out.println("liczbasum: "+liczbasum);
                
                Random rand = new Random();
                int n = rand.nextInt(100);
                System.out.println("n: "+n);
                liczbasum+=n;
                System.out.println("razem: "+liczbasum);
                powiazany = liczbasum;
                                               
                //jest = s.czyjestRezerwacja(liczbasum);
                //System.out.println(jest);
                
                Date aktualna = new Date();
                if (aktualna!=null) System.out.println(aktualna);
                DaneSemestr s = new DaneSemestr();
                //int idik = s.znajdzSemestr(startek);
                //System.out.println(idik);
                List<Semestr> lista = DaneSemestr.selectSemestr();
                   
                for (int i = 0; i<25;i++){
                    pocz = lista.get(i).getPoczatek();
                    kon = lista.get(i).getKoniec();
                    
                    if (start.after(pocz) && start.before(kon))
                    {
                        idik = lista.get(i).getId();
                        ktory =i;
                        System.out.println(idik+ " " +ktory);
                        break;
                    }
                }
                if (ktory>=0){
                    pocz = lista.get(ktory).getPoczatek(); 
                    kon = lista.get(ktory).getKoniec(); 
                    
                    GregorianCalendar semstart = new GregorianCalendar();
                    semstart.setTime(pocz);
                    pocz.setTime(semstart.getTime().getTime());                    
                    System.out.println("pocz: "+pocz);
                    
                    GregorianCalendar semkoniec = new GregorianCalendar();
                    semkoniec.setTime(kon);
                    kon.setTime(semkoniec.getTime().getTime());
                    System.out.println("kon: "+kon);
                
                }
                
            }


            Integer kierunek;
            try{
                kierunek = Integer.parseInt(request.getParameter("kierunek"));
            } catch (Exception e){
                kierunek = null;
            }
            baza.DaneKierunek dK = new baza.DaneKierunek();
            baza.Kierunek kier = dK.zczytajKierunek(kierunek);

            
            // Rezerwacja
            baza.DaneRezerwacja d = new baza.DaneRezerwacja();
            try
            {
                GregorianCalendar calendarstart = new GregorianCalendar();
                        calendarstart.setTime(data_powstart);                        
                        GregorianCalendar calendarend = new GregorianCalendar();
                        calendarend.setTime(data_powend);
                        
                        baza.DaneZasob sa = new baza.DaneZasob();
                        baza.Zasob ss = sa.zczytajZasob(id_zasob);                        
                        baza.DaneOsoby osa = new baza.DaneOsoby();
                        baza.Osoby oss = osa.zczytajOsoba(wlasciciel);
                                                
                while((data_powend.compareTo(kon)<=0) && (wolne==true)){
                            calendarstart.add(Calendar.DATE, 7);
                            data_powstart.setTime(calendarstart.getTime().getTime());
                            calendarend.add(Calendar.DATE, 7);
                            data_powend.setTime(calendarend.getTime().getTime());                            
                         
                            if (wolne){
                                baza.DaneRezerwacja rez = new baza.DaneRezerwacja();
                                wolne = rez.sprwadzDostepnasc(data_powstart, data_powend, ss, oss);
                                System.out.println("wolne" +wolne);
                            }
                        }
                
                if (!wolne) throw new Exception();
                if(wolne){
                
                d.dodajRezerwacja(start,koniec,opis,rezTyp,wlas,dodajacy,zaso,powiazany,kier);
                    if(ktory>-1)
                    {  
                        data_powstart =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("start"));;
                        data_powend = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end"));
                        calendarstart.setTime(data_powstart);
                        calendarend.setTime(data_powend);
                        
                        int porownaj = data_powend.compareTo(kon);System.out.println(porownaj);
                        
                        while(data_powend.compareTo(kon)<=0)
                        {
                            calendarstart.add(Calendar.DATE, 7);
                            data_powstart.setTime(calendarstart.getTime().getTime());
                            calendarend.add(Calendar.DATE, 7);
                            data_powend.setTime(calendarend.getTime().getTime());
                            //System.out.println("pow1 st " +data_powstart +" kon " +data_powend);
                            porownaj = data_powend.compareTo(kon);//System.out.println(porownaj);
                            if (porownaj<0)
                            {
                                d.dodajRezerwacja(data_powstart,data_powend,opis,rezTyp,wlas,dodajacy,zaso,powiazany,kier);
                                System.out.println("dodano");
                            }
                        }
                       
                        
 
                         
                    }
                }
                            
            }
            catch (Exception e) 
            {
                e.printStackTrace();
                wyjscie = "Blokada rezerwacji!";
            }
            // Chinsen -->        
        %>    

            
           
           
    </body>  
</html>
