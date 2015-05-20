<%@page errorPage="/WEB-INF/error.jsp"%>

<%@page import="baza.DaneTytul"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
            String wyjscie;
            Integer id = Integer.parseInt(request.getParameter("pobranytyt"));
            String nowyTytul = request.getParameter("poletytulu");
            baza.DaneTytul dT = new baza.DaneTytul();
            baza.Tytuly tyt = dT.zczytajTytul(id) ;
            tyt.setTytul(nowyTytul);
            try{
                dT.updateTytul(tyt);
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