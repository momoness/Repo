<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="baza.Osoby"%>
<%@page import="baza.DaneZasobyTyp"%>
<%@page import="baza.ZasobyTyp"%>
<%@page import="baza.SalaTyp"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneSalaTyp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String wyjscie;
        int id = Integer.parseInt(request.getParameter("wybranyzasob"));
        String zasobTyp = request.getParameter("zasob_select");
        String salaTyp = request.getParameter("sala_select");
        String nazwa = request.getParameter("nazwa");
        
        
        
        baza.DaneZasob dz = new baza.DaneZasob();
        baza.DaneOsoby dO = new baza.DaneOsoby();
        
        DaneSalaTyp dST = new DaneSalaTyp();
        baza.SalaTyp sal = dST.selectPoNazwie(salaTyp);
        DaneZasobyTyp dZT = new DaneZasobyTyp();
        baza.ZasobyTyp zas = dZT.selectPoNazwie(zasobTyp);
        
        baza.DaneZasob dZ = new baza.DaneZasob();
        baza.Zasob z = dZ.zczytajZasob(id);
        
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
        
        z.setId_typ(zas);
        z.setId_sala(sal);
        z.setNazwa(nazwa);
        z.setEdytowany(dodajacy);

        Date edycja = new Date();
        z.setData_edycji(new Timestamp(edycja.getTime()));
         try{
                dz.updateZasob(z);
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