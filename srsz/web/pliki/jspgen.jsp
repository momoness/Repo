<%-- 
    Document   : jspgen
    Created on : 2015-04-04, 20:23:06
    Author     : miches
--%>

<%@page import="java.io.Writer"%>
<%@page import="baza.DaneZasob"%>
<%@page import="baza.Zasob"%>
<%@page import="java.util.List"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.*"%>
<%@page import="java.io.FileWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       Generator plików eventsid.jsp
       

<%
            
            List<Zasob> zasList = DaneZasob.selectZasoby();
              int tytSize = zasList.size();
             for (int i=1; i<tytSize+1; i++){
              //   int s = i;
                 
String str = "<" + "%" + "@" + "page import='java.util.Enumeration'" + "%" +">" +
"<" + "%" + "@"+ "page import='java.util.HashMap'" + "%" +">" +
"<" + "%" + "@" +"page import='java.util.Map'" + "%" +">"+
"<" + "%" + "@" + "page import='java.util.List'" + "%" +">" +
"<" + "%" + "@" + "page import='java.util.ArrayList'"+ "%" +">" +
"<" + "%" + "@" + "page import='org.json.simple.JSONObject'" + "%" +">" + 
"<" + "%" + "@" + "page import='org.json.simple.JSONArray'" + "%" +">" +
"<" + "%" + "@" + "page import='com.liferay.portal.model.User'" + "%" +">" +     
"<" + "%" + "@" + "page import='com.liferay.portal.util.PortalUtil'" + "%" +">" + 
"<" + "%" + "@" + "page import='baza.DaneRezerwacja'" + "%" +">" + 
"<" + "%" + "@" + "page import='baza.Rezerwacja'"  + "%" +">" + 
"<" + "%" + "@" + "page import='baza.DaneZasob'" + "%" +">" + 
"<" + "%" + "@" + "page import='baza.Zasob'" + "%" +">" + 
"<" + "%" + "@" + "page contentType='text/html'" + "%" + ">" + 
"<" + "%" + "@" + "page pageEncoding='UTF-8'" + "%" +">" + 
 "<" + "%" + "@" + "taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'" +"%" + ">"+
 "<" + "%" + "@" + "taglib uri='http://java.sun.com/portlet' prefix='portlet'" + "%" + ">"+
"<" + "portlet:defineObjects" +  "/>" + "<" + "%" +
"DaneRezerwacja rez = new DaneRezerwacja();DaneZasob zas = new DaneZasob();Integer zasob;zasob =" +i +";" +" List<Rezerwacja> wynik = rez.selectRezerwacja(zasob);JSONArray obj = new JSONArray();obj.addAll(wynik);" + "%" +">" + "<" + "%" + "=obj.toJSONString()" + "%" +">";
	

//always give the path from root. This way it almost always works.
String nameOfTextFile = "/tekst/events"+i+".jsp";
try {   
    PrintWriter pw = new PrintWriter(new FileOutputStream(nameOfTextFile));
    pw.println(str);
    //clean up
    pw.close();
} catch(IOException e) {
   out.println(e.getMessage());
}
             }
             
   



          
    %>      
          
       
          
    </body>
</html>
