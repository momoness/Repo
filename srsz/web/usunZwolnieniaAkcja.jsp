<%@page import="baza.Zwolnienia"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneZwolnienia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie;
            int id;
            String zwol = request.getParameter("zwolnienie");
            String info[] = zwol.split(" ");
            String nazwisko = info[0];
            String imie = info[1];
            String od_ = info[3];
            String do_ = info[5];
            
            baza.DaneZwolnienia d = new baza.DaneZwolnienia(); 
            baza.DaneOsoby dO = new baza.DaneOsoby();
            
            baza.Osoby os = dO.selectOsobyImieNazwisko(imie,nazwisko);
            baza.Zwolnienia z = d.selectZwolnieniaWhere("where id_prac='"+os.getId()+"' and datediff(start,'"+od_+"')=0 and datediff(koniec,'"+do_+"')=0");
            

            id = z.getId();
            
            try{
                id = z.getId();
                d.usunZwolnienie(id);
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
