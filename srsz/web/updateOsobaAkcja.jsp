<%@page errorPage="/WEB-INF/error.jsp"%> 

<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="java.lang.String"%>
<%@page import="baza.DaneTytul"%>
<%@page import="baza.DaneOsoby"%>
<%@page import="java.util.List"%>
<%@page import="baza.Tytuly"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

      
        <%
            String wyjscie;
            Integer id = Integer.parseInt(request.getParameter("formul_selek"));
            
            baza.DaneOsoby d = new baza.DaneOsoby();
            baza.Osoby o = d.zczytajOsoba(id);
         
            String tytul = request.getParameter("tytul_sel");
            String imie = request.getParameter("imie");
            String nazwisko = request.getParameter("nazwisko");
            String login = request.getParameter("login");
            String email = request.getParameter("email");
            String telefon = request.getParameter("telefon");
            Integer edytowany;

            User u = null;
            String userId;
            try {
                userId=request.getRemoteUser();
                u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));
                baza.Osoby bO = d.znajdzPoLoginie(u.getScreenName().toString());
                edytowany = bO.getId();
            } catch (Exception e) {
                edytowany = null;
            }
                
            DaneTytul dT = new DaneTytul();
            baza.Tytuly tyt = dT.znajdzTytul(tytul);
            
            o.setEmail(email);
            o.setTytul(tyt);
            o.setImie(imie);
            o.setNazwisko(nazwisko);
            o.setLogin(login);
            o.setTelefon(telefon);
            
            try{
                d.updateOsoba(o, edytowany);
                wyjscie = "Pomyślnie edytowano w bazie";
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = "Błąd. Edycja danych nie powiodła się.";
            }
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>
