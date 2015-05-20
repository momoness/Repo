<%@page errorPage="/WEB-INF/error.jsp"%> 
<%@page import="baza.Rezerwacja"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneRezerwacja"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String wyjscie;
            int id;
            String rez = request.getParameter("rezerwacja");
            
            System.out.println(rez);
            
            baza.DaneRezerwacja d = new baza.DaneRezerwacja(); 
            baza.Rezerwacja r = new baza.Rezerwacja();
            List<Rezerwacja> rezList = DaneRezerwacja.selectRezerwacja();
            for (int i=0; i<rezList.size(); i++)
                if (rez.contains(rezList.get(i).getId_zasob().getNazwa()) &&
                    rez.contains(rezList.get(i).getStart().toString()) &&
                    rez.contains(rezList.get(i).getKoniec().toString()))
                    r = rezList.get(i);
            id = r.getId();
                      
            try{
                d.usunRezerwacja(id);
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
