<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="baza.DaneSalaTyp"%>
<%@page import="baza.SalaTyp"%>
<%@page import="baza.DaneZasobyTyp"%>
<%@page import="java.util.List"%>
<%@page import="baza.ZasobyTyp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie;
            String zasTyp = request.getParameter("typ");
            Integer idzasob = Integer.parseInt(request.getParameter("salatyp"));
            String nazwa = request.getParameter("nazwa");
            baza.DaneOsoby Osoby = new baza.DaneOsoby();
            User u = null;
            String userId;
            Integer dodany;
            
            try {
                userId=request.getRemoteUser();
                u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));
                baza.Osoby bO = Osoby.znajdzPoLoginie(u.getScreenName().toString());
                dodany = bO.getId();
                System.out.println("Dodany: "+dodany);
            } catch (Exception e) {
                dodany = null;
            }
            baza.Osoby dodajacy = Osoby.zczytajOsoba(dodany);
            
            baza.DaneOsoby temp = new baza.DaneOsoby();
            dodajacy = temp.zczytajOsoba(dodany);
            
            baza.DaneZasob d = new baza.DaneZasob();    
     
            DaneZasobyTyp dZT = new DaneZasobyTyp();
            ZasobyTyp typ = dZT.selectPoNazwie(zasTyp);
            
              
            DaneSalaTyp dST = new DaneSalaTyp();
            SalaTyp styp = dST.zczytajSalaTyp(idzasob);
 
            try{
                d.dodajZasob(typ, styp, nazwa, dodajacy);
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