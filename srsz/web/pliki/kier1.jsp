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
        DaneRezerwacja rez = new DaneRezerwacja();
        DaneZasob zas = new DaneZasob();
 
        Integer kier;
        
        kier=1;
      //  String temp = (String)session.getAttribute("wybranyZasob");        
      //  Integer zasob;
if (request.getParameter("kier")!=null){
            try{
                kier=Integer.parseInt(request.getParameter("kier"));
            }catch(Exception e){
                
            }
        }
       

        List<Rezerwacja> wynik = rez.selectRezerwacjakier(kier);
	
	JSONArray obj = new JSONArray();
        obj.addAll(wynik);	
%>
<%=obj.toJSONString()%>