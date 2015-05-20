<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
             String wyjscie;
             String stary = request.getParameter("wartoscSelecta");
            String sala = request.getParameter("polesali");
            
            baza.DaneSalaTyp zapis = new baza.DaneSalaTyp();
            
            baza.SalaTyp st = zapis.selectPoNazwie(stary);

           st.setOpis(sala);
            
            try{
                zapis.updateSalaTyp(st);
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
