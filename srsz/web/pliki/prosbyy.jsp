<%@page import="baza.Prosba"%>
<%@page import="baza.DaneProsba"%>
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

        DaneProsba rez = new DaneProsba();
       
 
        int wlasc=1;
        if (request.getParameter("wlasc")!=null){
            try{
                wlasc= Integer.parseInt(request.getParameter("wlasc"));
            }catch(Exception e){
                
            }
        }

        List<Prosba> wynik = rez.selectProsbawlasc(wlasc);
	
	JSONArray obj = new JSONArray();
        obj.addAll(wynik);	
%>
<%=obj.toJSONString()%>