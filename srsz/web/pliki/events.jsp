<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="baza.DaneRezerwacja" %>
<%@page import="baza.Rezerwacja" %>
<%@page import="baza.DaneZasob"%>
<%@page import="baza.Zasob"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<portlet:defineObjects />
<%
//Wyświetlenie wszystkich rezerwacji w kalendarzu

        DaneRezerwacja rez = new DaneRezerwacja();
        DaneZasob zas = new DaneZasob();
 
        int zasob=1;
        if (request.getParameter("zasob")!=null){
            try{
                zasob= Integer.parseInt(request.getParameter("zasob"));
            }catch(Exception e){
                
            }
        }

        List<Rezerwacja> wynik = rez.selectRezerwacja(zasob);
	
	JSONArray obj = new JSONArray();
        obj.addAll(wynik);	
%>
<%=obj.toJSONString()%>