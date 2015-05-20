<%@page errorPage="/WEB-INF/error.jsp"%>
<%
    Integer idRezerwacji = Integer.parseInt(request.getParameter("id_rez"));
    String zasob="", wlasciciel="", rezTyp="", kierunek="", zczytajProsba="";
    baza.DaneRezerwacja dRez = new baza.DaneRezerwacja();
    baza.DaneProsba dPros = new baza.DaneProsba();
    Integer pro;
    try{
            pro = Integer.parseInt(request.getParameter("czyProsba"));
        if (pro==0){
            System.out.println("rezerwacja!");
            baza.Rezerwacja rezerwacja = dRez.zczytajRezerwacja(idRezerwacji);
            zasob = rezerwacja.getId_zasob().getNazwa();
            wlasciciel = rezerwacja.getWlasciciel().getTytul().getTytul()+" "+rezerwacja.getWlasciciel().getNazwisko()+" "+rezerwacja.getWlasciciel().getImie();
            rezTyp = rezerwacja.getTyp().getOpis();
            kierunek = rezerwacja.getKierunek().getNazwa(); 
        }
        else {
            baza.Prosba prosba = dPros.zczytajProsba(idRezerwacji);
            zasob = prosba.getId_zasob().getNazwa();
            wlasciciel = prosba.getWlasciciel().getTytul().getTytul()+" "+prosba.getWlasciciel().getNazwisko()+" "+prosba.getWlasciciel().getImie();
            rezTyp = prosba.getTyp().getOpis();
            kierunek = "";
        }
    } catch (Exception e){
        System.out.println("Something went wrong");
    }
%>
{"zasob":"<%=zasob%>","wlasciciel":"<%=wlasciciel%>","rezTyp":"<%=rezTyp%>","kierunek":"<%=kierunek%>"}