<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.SalaTyp"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="baza.DaneSalaTyp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        List<SalaTyp> stList = DaneSalaTyp.selectSala();
            int stSize = stList.size();
            String salaT[] = new String[stSize];
            for (int i=0; i<stSize; i++)
                salaT[i] = stList.get(i).getOpis();
        %>
        <form action="<portlet:renderURL><portlet:param name="jspPage" value="/usunSalaTypAkcja.jsp" /></portlet:renderURL>" method="post"  method="">
            Typ: <select name="salatyp" size="6">
                            <c:forEach items="<%=salaT%>" var="st">
                                <option><c:out value="${st}"/></option>
                            </c:forEach>
                </select></br>
                <input type="submit" value="Usun"/>
        </form>
    </body>
</html>
