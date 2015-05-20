<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="baza.SemestrZmiany"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneSemestrZmiany"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie;
            int id;
            String sZmiana = request.getParameter("zmiana");
            
            baza.DaneSemestrZmiany d = new baza.DaneSemestrZmiany();
            SemestrZmiany sz = new SemestrZmiany();
            
            List<SemestrZmiany> szList = DaneSemestrZmiany.selectSemestrZmiany();
            Format sdf = new SimpleDateFormat("yyy-MM-dd");
            String data="";
            for (int i=0; i<szList.size(); i++){
                data = sdf.format(szList.get(i).getDzien());
                if (sZmiana.contains(szList.get(i).getId_semestr().getRok()+"("+szList.get(i).getId_semestr().getTyp()+") "+data))
                    sz = szList.get(i);
            }
            id = sz.getId();
            
            try{
                d.usunSemestrZmiany(id);
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
