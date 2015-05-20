<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.ProsbaZasob"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneProsbaZasob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            String wyjscie;
            int id;
            String pz = request.getParameter("prozas");
            
            baza.DaneProsbaZasob d = new baza.DaneProsbaZasob(); 
            baza.ProsbaZasob proZ = new baza.ProsbaZasob();
            
            List<ProsbaZasob> pzList = DaneProsbaZasob.selectProsbaZasob();
            for (int i=0; i<pzList.size(); i++)
                if (pz.contains(pzList.get(i).getId_zasob().getNazwa()+" - "+pzList.get(i).getDzien().toString()+" "+pzList.get(i).getStart().toString()+"-"+pzList.get(i).getKoniec().toString()))
                    proZ = pzList.get(i);
            id = proZ.getId();
                      
            try{
                d.usunProsbaZasob(id);
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
