<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
            String wyjscie;
            String tytul = request.getParameter("tytul");
            baza.DaneTytul d = new baza.DaneTytul();           
            try{
                 d.dodajTytul(tytul);
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