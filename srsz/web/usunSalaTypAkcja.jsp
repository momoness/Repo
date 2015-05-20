<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.SalaTyp"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneSalaTyp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie;
            int id;
            String salaT = request.getParameter("salatyp");
            
            baza.SalaTyp st = new baza.SalaTyp();
            baza.DaneSalaTyp dST = new baza.DaneSalaTyp();
            st = dST.selectPoNazwie(salaT);
            id = st.getId();
            
            baza.DaneSalaTyp d = new baza.DaneSalaTyp();           
            try{
                d.usunSalaTyp(id);
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
