<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie;
            String typ = request.getParameter("typ");
            int rok = Integer.parseInt(request.getParameter("rok"));
            java.util.Date poczatek = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("poczatek"));
            java.util.Date koniec = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("koniec"));
            int plan_gotowy = Integer.parseInt(request.getParameter("plan_gotowy"));
            
            baza.DaneSemestr d = new baza.DaneSemestr();           
            try{
                if (poczatek.after(koniec)==true){
                    out.println("Podana data początku jest późniejsza niż końca!<br>");
                    throw new Exception();
                }
                d.dodajSemestr(typ, rok, poczatek, koniec, plan_gotowy);
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