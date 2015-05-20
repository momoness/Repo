<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.Prosba"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneProsba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String wyjscie;
            String prosba = request.getParameter("prosba");
            int id;
            
            baza.DaneProsba d = new baza.DaneProsba(); 
            baza.Prosba pro = d.zczytajProsba(Integer.parseInt(prosba));
            id = pro.getId();
                      
            try{
                d.usunProsba(id);
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
