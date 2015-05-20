<%@page import="baza.Semestr"%>
<%@page import="baza.DaneSemestr"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    java.util.Date start;
    java.util.Date koniec;
    String opis;
    int typ;
    Integer wlasc;
    Integer id_zasob;
    Integer los;
    Integer kierunek;
    
        start = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("start"));
        koniec = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end"));
        opis = request.getParameter("title");
        typ = Integer.parseInt(request.getParameter("typ"));
        try{
            wlasc = Integer.parseInt(request.getParameter("wlasc"));
            } catch (Exception e){
        baza.DaneOsoby dosoby = new baza.DaneOsoby();
            String userId=request.getRemoteUser();
                   User u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));
                    baza.Osoby bO = dosoby.znajdzPoLoginie(u.getScreenName().toString());
                    wlasc = bO.getId();
    }
        
            
        id_zasob = Integer.parseInt(request.getParameter("id_zasob"));
        los = Integer.parseInt(request.getParameter("los"));
        kierunek = Integer.parseInt(request.getParameter("kierunek"));
    
    
    baza.DaneOsoby dos = new baza.DaneOsoby();
    baza.DaneRezerwacjaTyp rt = new baza.DaneRezerwacjaTyp();
    baza.DaneZasob dZas = new baza.DaneZasob();
    baza.DaneKierunek dK = new baza.DaneKierunek();
    
    //zczytywanie kto dodaje
    User u = null;
    String userId;
    try {
        userId=request.getRemoteUser();
        u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));
    } catch (Exception e) {
    }
    
    //ustalanie danych
    baza.RezerwacjaTyp rezTyp = rt.zczytajRezerwacjaTyp(typ);
    baza.Osoby dodajacy = dos.znajdzPoLoginie(u.getScreenName().toString());
    baza.Osoby wlasciciel = dos.zczytajOsoba(wlasc);
    baza.Zasob zasob = dZas.zczytajZasob(id_zasob);
    baza.Kierunek kier = dK.zczytajKierunek(kierunek);
    Integer powiazany = null;
 
    //jeżeli powiązany
    boolean jest=false;  
    int idik=-1; int ktory=-1;
    Date data_powstart =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("start"));;
    Date data_powend = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end"));
    Date pocz=null;
    Date kon=null;
    String wyjscie=" ";
    boolean wolne = true;
    if (los==1){
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat format1 = new SimpleDateFormat("HHmmssSS");
        Date date = new Date();
        Date date1 = new Date();
        int liczba = Integer.parseInt(format.format(date));
        int liczba1 = Integer.parseInt(format1.format(date1));

        int liczbasum = liczba+liczba1;

        Random rand = new Random();
        int n = rand.nextInt(100);
        liczbasum+=n;
        powiazany = liczbasum;

        Date aktualna = new Date();
        DaneSemestr s = new DaneSemestr();
        List<Semestr> lista = DaneSemestr.selectSemestr();

        for (int i = 0; i<25;i++){
            pocz = lista.get(i).getPoczatek();
            kon = lista.get(i).getKoniec();

            if (start.after(pocz) && start.before(kon))
            {
                idik = lista.get(i).getId();
                ktory =i;
                break;
            }
        }
        if (ktory>=0){
            pocz = lista.get(ktory).getPoczatek(); 
            kon = lista.get(ktory).getKoniec(); 

            GregorianCalendar semstart = new GregorianCalendar();
            semstart.setTime(pocz);
            pocz.setTime(semstart.getTime().getTime());                    

            GregorianCalendar semkoniec = new GregorianCalendar();
            semkoniec.setTime(kon);
            kon.setTime(semkoniec.getTime().getTime());

        }
    }
    
    baza.DaneRezerwacja dR = new baza.DaneRezerwacja();
    try {
            dR.dodajRezerwacja(start, koniec, opis, rezTyp, wlasciciel, dodajacy, zasob, powiazany, kier);
        if (los==1) {
            if (ktory>-1){
                GregorianCalendar calendarstart= new GregorianCalendar(), calendarend= new GregorianCalendar();
                data_powstart =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("start"));
                data_powend = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end"));
                data_powstart =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("start"));;
                data_powend = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end"));
                
                int porownaj = data_powend.compareTo(kon);
                        
                    while(data_powend.compareTo(kon)<=0)
                    {
                        calendarstart.setTime(data_powstart);
                        calendarend.setTime(data_powend);
                        calendarstart.add(Calendar.DATE, 7);
                        data_powstart.setTime(calendarstart.getTime().getTime());
                        calendarend.add(Calendar.DATE, 7);
                        data_powend.setTime(calendarend.getTime().getTime());
                        System.out.println("pow1 st " +data_powstart +" kon " +data_powend);
                        porownaj = data_powend.compareTo(kon);//System.out.println(porownaj);
                        if (porownaj<0)
                        {
                            //baza.Rezerwacja reeezer = new baza.Rezerwacja(data_powstart, data_powend, opis, rezTyp, wlasciciel,dodajacy, zasob, powiazany,kier);
                            dR.dodajRezerwacja(data_powstart, data_powend, opis, rezTyp, wlasciciel, dodajacy, zasob, powiazany, kier);
                            //System.out.println("dodano");
                            //dR.dodajRezerwacja(reeezer);
                        }
                    }
            }
        }
    } catch (Exception e){
        
    }
    
%>