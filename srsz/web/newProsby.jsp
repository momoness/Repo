<%@page import="java.util.List"%>
<%@page import="baza.Prosba"%>
<%@page import="baza.DaneProsba"%>
<%@page errorPage="/WEB-INF/error.jsp"%> 
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src='/srsz/js/jquery.min.js'></script>
        <script>
            function wyslijDoAkcji(){
                $.ajax({
                    url:"<portlet:renderURL><portlet:param name="jspPage" value="/newProsbyAkcja.jsp" /></portlet:renderURL>",
                    type:'post',
                    data:'wybranaProsba='+$('#wybranaProsba').val(),
                    success:function(odpowiedz){
                        
                    }
                });
            }
            function zmienWartosc(numer,wartosc){
                $('#wybranaProsba').val(wartosc+":"+numer);
                wyslijDoAkcji();
            }
        </script>
    </head>
    <body>
        <input type="text" value="none:00" id="wybranaProsba" hidden/>
        <%
            DaneProsba daneProsby = new DaneProsba();
            List<Prosba> listaProsb = daneProsby.selectProsba();
        %>
        <table>
            <tr>
                
            </tr>
            <% for (Prosba p: listaProsb){ %>
            <tr>
                <td><%=p.getId()%>  </td>
                <td>  <%=p.getId_zasob().getNazwa()%></td>
                <td><button onclick="zmienWartosc(<%=p.getId()%>,'akc')">Akcjeptuj</button></td>
                <td><button onclick="zmienWartosc(<%=p.getId()%>,'odr')">Odrzuć</button></td>
            </tr>
            <% } %>
        </table>      
    </body>
</html>
