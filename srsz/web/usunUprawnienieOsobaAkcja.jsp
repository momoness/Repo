<%@page errorPage="/WEB-INF/error.jsp"%> 
<%@page import="baza.DaneUprawnienieOsoba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            String wyjscie;
            Integer id = Integer.parseInt(request.getParameter("upros"));
            baza.DaneUprawnienieOsoba d = new baza.DaneUprawnienieOsoba();
            try{
                d.usunUprawnienieOsoba(id);
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