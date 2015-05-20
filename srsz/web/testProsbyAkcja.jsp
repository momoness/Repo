<%@page errorPage="/WEB-INF/error.jsp"%> 
<%@page import="baza.Prosba"%>
<%@page import="baza.DaneProsba"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie="";
            List<Prosba> lP = DaneProsba.selectProsba();
            baza.DaneProsba dP = new baza.DaneProsba();
            Boolean akceptacja=false;
            Integer numer = null;
            Integer rezer = (Integer)request.getSession().getAttribute("id");
            
            for (int i=0; i<lP.size(); i++){
                if (request.getParameter("akc:"+lP.get(i).getId())!=null){
                    akceptacja=true;
                    numer=i;
                }
                if (request.getParameter("odrz:"+lP.get(i).getId())!=null){
                    akceptacja=false;
                    numer=lP.get(i).getId();
                }            
            }
            
            if (akceptacja){
                baza.DaneOsoby dOs = new baza.DaneOsoby();
                baza.Osoby rezerwujacy = dOs.zczytajOsoba(rezer);
                baza.DaneRezerwacja dRez = new baza.DaneRezerwacja();
                dRez.dodajRezerwacja(lP.get(numer).getStart(), 
                        lP.get(numer).getKoniec(), 
                        lP.get(numer).getPowod(), 
                        lP.get(numer).getTyp(), 
                        lP.get(numer).getWlasciciel(), 
                        rezerwujacy, 
                        lP.get(numer).getId_zasob(), 
                        null);
                wyjscie ="Pomyślnie dodano!";          
                dP.usunProsba(lP.get(numer).getId());
            }
            else {
                dP.usunProsba(numer);
                wyjscie="Pomyślnie usunięto!";
            }
            
        response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>>
