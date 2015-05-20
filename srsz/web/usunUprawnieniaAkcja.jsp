<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.DaneUprawnienie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String wyjscie;
            Integer upr = Integer.parseInt(request.getParameter("uprawnienie"));
            baza.DaneUprawnienie d = new baza.DaneUprawnienie();
            try{
                d.usunUprawnienie(upr);
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
