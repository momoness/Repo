<%@page errorPage="/WEB-INF/error.jsp"%> 
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="baza.Uprawnienie"%>
<%@page import="baza.DaneUprawnienie"%>
<%@page import="baza.DaneOsoby"%>
<%@page import="java.util.List"%>
<%@page import="baza.Osoby"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String wyjscie;
            Integer pracownik = Integer.parseInt(request.getParameter("pracownik"));
            Integer upr = Integer.parseInt(request.getParameter("uprawnienie"));
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
            baza.DaneUprawnienieOsoba dUO = new baza.DaneUprawnienieOsoba();
            baza.DaneOsoby os = new baza.DaneOsoby();
            DaneUprawnienie dU = new DaneUprawnienie();            
            baza.Osoby osoba = os.zczytajOsoba(pracownik);
            baza.Uprawnienie uprawnienie = dU.zczytajUprawnienie(upr);
            
            
            try{
                if (dUO.czyOsobaNieMaUprawnienia(uprawnienie, osoba))
                    dUO.dodajUprawnienieOsoba(osoba,uprawnienie,dodajacy);
                
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