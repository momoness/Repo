<%@page errorPage="/WEB-INF/error.jsp"%> <%-- 
    Document   : updateSalaTyp
    Created on : 2015-01-17, 23:05:05
    Author     : MrRemo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="baza.SalaTyp"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneSalaTyp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script  type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
            <%
                List<SalaTyp> salList = DaneSalaTyp.selectSala();
                int salSize = salList.size();
                String wyjscie[] = new String[salSize];
                for(int i=0; i<salSize; i++)
                    wyjscie[i] = salList.get(i).getOpis();
            %>
                var tab = new Array();
                
            <%
                for(int i=0; i<salSize; i++)
                {
                    %>
                        tab[<%=salList.get(i).getId()%>]="<%=salList.get(i).getOpis()%>";
                        <% } %>
                            
            function opis(){
                var a = $("#pobranasala").val();
                var b ;
                
                <%
                for(int i=0; i<salSize; i++){
                    %>
                            b="<%=salList.get(i).getOpis()%>";
                            if( a == b)
                            {
                                b=<%=salList.get(i).getId()%>;
                                $("#polesali").val(tab[b]);
                                $("#ktoryID").val(b);
                            }
                            <% } %>
                }
        </script>
    </head>
    <body>
        <form action="<portlet:renderURL><portlet:param name="jspPage" value="/updateSalaTypAkcja.jsp" /></portlet:renderURL>" method="post"  ID="formularz_sala_typ">
            <table>
                <tr>
                    <td>Typ:</td>
                    <td>
                        <select id="pobranasala" name="pobranasala" onchange="opis();">
                            <c:forEach items="<%=wyjscie%>" var="sala">
                                <option value="${sala}">${sala}</option>
                                </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>ID:</td>
                    <td><input id="ktoryID" name="ktoryID" value="" type="text" readonly="true"></td>
                </tr>
                <tr>
                    <td>Opis typu:</td>
                    <td><input type="text" id="polesali" name="polesali" value=""></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Edytuj"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
