<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.DaneRezerwacjaTyp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            String wyjscie;
            Integer id = Integer.parseInt(request.getParameter("rezTyp"));
            baza.DaneRezerwacjaTyp d = new baza.DaneRezerwacjaTyp();     
            try{
                d.usunRezerwacjaTyp(id);
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
