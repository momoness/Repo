<%@page import="java.util.Calendar"%>
<%@page import="baza.Rezerwacja"%>
<%@page import="baza.DaneRezerwacja"%>
<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="baza.DaneSemestrWykluczenia"%>
<%@page import="baza.SemestrWykluczenia"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie;
            Integer id = Integer.parseInt(request.getParameter("wykluczenie"));
            
            baza.DaneSemestrWykluczenia d = new baza.DaneSemestrWykluczenia();
            baza.DaneRezerwacja dr = new baza.DaneRezerwacja();
            List<Rezerwacja> listaRezerwacja = DaneRezerwacja.selectRezerwacja();
            List<SemestrWykluczenia> listaWykluczone = DaneSemestrWykluczenia.selectSemestrWykluczenia();
            Calendar poczatkowa = Calendar.getInstance();
            Calendar koncowa = Calendar.getInstance();
            Calendar p = Calendar.getInstance();
            p.setTime(listaWykluczone.get(id).getPoczatek());
            Calendar k = Calendar.getInstance();
            Calendar tempS = Calendar.getInstance();
            Calendar tempK = Calendar.getInstance();
            k.setTime(listaWykluczone.get(id).getKoniec());
            poczatkowa.setTime(listaWykluczone.get(id).getDzien());
            koncowa.setTime(listaWykluczone.get(id).getDzien());
            poczatkowa.set(Calendar.HOUR_OF_DAY, p.get(Calendar.HOUR_OF_DAY));
            poczatkowa.set(Calendar.MINUTE, p.get(Calendar.MINUTE));
            koncowa.set(Calendar.HOUR_OF_DAY, k.get(Calendar.HOUR_OF_DAY));
            koncowa.set(Calendar.MINUTE, k.get(Calendar.MINUTE));
            int id_r=0;
            for(int i=0;i<listaRezerwacja.size();i++){
                tempS.setTime(listaRezerwacja.get(i).getStart());
                tempK.setTime(listaRezerwacja.get(i).getKoniec());
                if((poczatkowa.compareTo(tempS)==0) && (koncowa.compareTo(tempK)==0) && (listaRezerwacja.get(i).getOpis().equals(listaWykluczone.get(id).getOpis())))
                 id_r = listaRezerwacja.get(i).getId(); 
            }
            
            try{
                d.usunSemestrWykluczenia(id);
                dr.usunRezerwacja(id_r);
                wyjscie = "Pomyślnie usunięto z bazy";
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = "Błąd. Usuwanie z  danych nie powiodło się.";
            }
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>
