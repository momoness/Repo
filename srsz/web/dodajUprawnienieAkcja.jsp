<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            String wyjscie;
            String opis = request.getParameter("opis");
            java.util.Date od = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("od"));
            java.util.Date do_ = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("do"));
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
            
            
            baza.DaneUprawnienie dU = new baza.DaneUprawnienie();  
            
            try{
                if (od.after(do_)==true){
                    out.println("Podana data początku jest późniejsza niż końca!<br>");
                    throw new Exception();
                } else if (!dU.czyWolnaNazwa(opis)){
                    out.println("Ten opis nie jest wolny!");
                    throw new Exception();
                }
                dU.dodajUprawnienie(opis,od,do_,dodajacy);
                wyjscie = "Pomyślnie dodano do bazy";
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = null;
            }
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>