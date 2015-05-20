<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.Semestr"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<%@page import="baza.SemestrWykluczenia"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


        <%
            String wyjscie;
            int id = Integer.parseInt(request.getParameter("ktoryID"));
            
            int id_sem = Integer.parseInt(request.getParameter("id_sem"));
            java.util.Date dzien = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dzien"));
            java.util.Date poczatek = new SimpleDateFormat("HH:mm:ss").parse(request.getParameter("poczatek"));
            java.util.Date koniec = new SimpleDateFormat("HH:mm:ss").parse(request.getParameter("koniec"));
            String opis = request.getParameter("opis");
            
            //int edytowany = (Integer)request.getSession().getAttribute("id");
            baza.DaneSemestrWykluczenia ds = new baza.DaneSemestrWykluczenia();
            baza.SemestrWykluczenia s = ds.zczytajSemestrW(id);
            
            baza.DaneSemestr sa = new baza.DaneSemestr();
            baza.Semestr ss = sa.zczytajSemestr(id_sem);
                        
            s.setDzien(dzien);
            s.setPoczatek(poczatek);
            s.setKoniec(koniec);
            s.setOpis(opis);
            s.setId_semestr(ss);
            
            try{
                if (poczatek.after(koniec)==true){
                    out.println("Podana data początku jest późniejsza niż końca!<br>");
                    throw new Exception();
                }
                ds.updateSemestrWykluczenia(s);
                wyjscie = "Pomyślnie edytowano w bazie";
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = "Błąd. Edycja danych nie powiodło się.";
            }
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>
    

