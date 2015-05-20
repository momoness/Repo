<%@page errorPage="/WEB-INF/error.jsp"%> 
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="baza.DaneUprawnienie"%>
<%@page import="baza.Uprawnienie"%>
<%@page import="baza.DaneZasob"%>
<%@page import="java.util.List"%>
<%@page import="baza.Zasob"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie = "";
            Integer zas = Integer.parseInt(request.getParameter("zasob"));
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
            //String trybDodaj = request.getParameter("trDod");
            String trybDodajZao = request.getParameter("trDodZao");
            String trybDodajStac = request.getParameter("trDodStac");
            String trybSpecjalne = request.getParameter("trPr");
               
            Integer[] trybyInt = new Integer[4];
            //trybyInt[0] = (trybDodaj.compareTo("1")==0)?1:0;
            trybyInt[0] = (trybDodajZao.compareTo("1")==0)?12:0;
            trybyInt[1] = (trybDodajStac.compareTo("1")==0)?11:0;
            trybyInt[2] = (trybSpecjalne.compareTo("1")==0)?2:0;
            
            baza.Osoby dodajacy = new baza.Osoby();
            baza.DaneOsoby temp = new baza.DaneOsoby();
            dodajacy = temp.zczytajOsoba(dodany);
            
            baza.DaneUprawnienieZasob dUZ = new baza.DaneUprawnienieZasob(); 
            baza.DaneUprawnienie dU = new baza.DaneUprawnienie();
            baza.DaneZasob dZ = new baza.DaneZasob();

            baza.Zasob zasob = dZ.zczytajZasob(zas);
            baza.Uprawnienie uprawnienie = dU.zczytajUprawnienie(upr);
            
            try{
                for (int i=0; i<3; i++){
                    if (trybyInt[i]!=0 && dUZ.czyMoznaDodacUprawnienieDoZasobu(uprawnienie,zasob,trybyInt[i])){
                                dUZ.dodajUprawnienieZasob(zasob,uprawnienie,dodajacy,trybyInt[i]);
                        }
                    }
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
