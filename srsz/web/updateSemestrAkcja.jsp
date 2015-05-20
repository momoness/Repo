<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.Semestr"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            String wyjscie;
            int id = Integer.parseInt(request.getParameter("formularz_semestr_wyk"));
            String typ = request.getParameter("typ");
            int rok = Integer.parseInt(request.getParameter("rok"));
            java.util.Date poczatek = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("poczatek"));
            java.util.Date koniec = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("koniec"));
            int plan_gotowy = Integer.parseInt(request.getParameter("plang"));
            
            baza.DaneSemestr d = new baza.DaneSemestr();
            try{
                if (poczatek.after(koniec)==true){
                    out.println("Podana data początku jest późniejsza niż końca!<br>");
                    throw new Exception();
                }
            baza.Semestr s = d.zczytajSemestr(id);
            s.setTyp(typ);
            s.setRok(rok);
            s.setPoczatek(poczatek);
            s.setKoniec(koniec);
            s.setPlan_gotowy(plan_gotowy);
            
            d.updateSemestr(s);
             wyjscie = "Pomyślnie edytowano w bazie";
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = "Błąd. Dodawanie danych nie powiodło się.";
            }
           
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
     %>

