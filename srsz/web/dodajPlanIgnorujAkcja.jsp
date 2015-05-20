<%@page errorPage="/WEB-INF/error.jsp"%> 
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

         <%
            String wyjscie;
            String Sem = request.getParameter("semestr");
            java.util.Date dzien = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dzien"));
            int zajecia_id = Integer.parseInt(request.getParameter("zajecia_id"));
            String opis = request.getParameter("opis");
            baza.DaneOsoby d = new baza.DaneOsoby();
            Integer dodany;

            User u = null;
            String userId;
            try {
                userId=request.getRemoteUser();
                u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));
                baza.Osoby bO = d.znajdzPoLoginie(u.getScreenName().toString());
                dodany = bO.getId();
                System.out.println("Dodany: "+dodany);
            } catch (Exception e) {
                dodany = null;
            }
            
            baza.Osoby dodajacy = new baza.Osoby();
            baza.DaneOsoby temp = new baza.DaneOsoby();
            dodajacy = temp.zczytajOsoba(dodany);
                        
            baza.Rezerwacja zajecia = new baza.Rezerwacja();
            baza.DaneRezerwacja dzaj = new baza.DaneRezerwacja();
            
            zajecia = dzaj.zczytajRezerwacja(zajecia_id);
        
            
            baza.DanePlanIgnoruj dPI = new baza.DanePlanIgnoruj();           
             
            baza.DaneSemestr dS = new baza.DaneSemestr();
            baza.Semestr sem = dS.selectSemestrTyp(Sem);
            
            try{
                dPI.dodajPlanIgnoruj(sem, dzien, zajecia, opis, dodajacy);
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