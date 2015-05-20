<%@page errorPage="/WEB-INF/error.jsp"%> <%-- 
    Document   : index
    Created on : 2014-12-25, 19:19:24
    Author     : Chinsen
--%>

<%@page import="com.liferay.portal.service.persistence.PortletUtil"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@page import="com.liferay.portal.service.UserServiceUtil"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Baza danych - obsługa</h1>
        wersja 1.3.4<br>
        ----
        Hello~! Póki nie ma ogarniętego logowania domyślnie zalogowanym jest się jako admin.
        Enjoy.
        
        <% 
            session = request.getSession();
            session.setAttribute("id", 1);
            %>
            <form action="<portlet:renderURL><portlet:param name="jspPage" value="/wygladglowny.jsp" /></portlet:renderURL>" method="post" >
                <input type="submit" value="OK"/>
            </form>
            <form action="<portlet:renderURL><portlet:param name="jspPage" value="/kalendar.jsp" /></portlet:renderURL>" method="post">
                <input type="radio" name="jakiUser" value="1" checked>Admin<br>
                <input type="radio" name="jakiUser" value="2">Zaoczny<br>
                <input type="radio" name="jakiUser" value="3">Stacjonarny<br>
                <input type="radio" name="jakiUser" value="4">User<br>
                <input type="submit" value="Do kalendarza"/>
            </form>
             <form action="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/ZarzadzajBaz.jsp" /></portlet:renderURL>" method="post" />
                   <input type="submit" value="Do panelu"/>
            </form>
            <a href="<portlet:renderURL><portlet:param name="jspPage" value="/newProsby.jsp" /></portlet:renderURL>" method="post">Test prośby</a>
            
            <%
                User u = null;
                String userId;
                try {
                    
                    userId=request.getRemoteUser();
                    u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));

                } catch (Exception e) {
                }

                if (u!=null){
                    out.println("Zalogowany user: "+u.getScreenName());
                }  else {
                    out.println("user = null");
                }
                
                u=PortalUtil.getUser(request);
                if (u!=null){
                    out.println("Zalogowany user: "+u.getScreenName());
                }  else {
                    out.println("user = null");
                }
            %>
        

        
        
        <!--<form action="<portlet:renderURL><portlet:param name="jspPage" value="/LogowanieUzytkownika" /></portlet:renderURL>" method="post" >
            
        <table>
            <tr>
                <td>Login</td>
                <td><input type="text" id="username" name="username"/> </td>
            </tr>
            <tr>
                <td>Hasło</td>
                <td><input type="password" id="password" name="password"/> </td>
            </tr>
            <tr>
                <td><input type="submit" value ="submit"/></td>
                <td></td>
            </tr>
            <tr>
                <td>Przykładowy login: </td>
                <td>1</td>
            </tr>
            <tr>
                <td>Przykładowe hasło: </td>
                <td>admin</td>
            </tr>
        </table>
    </form>-->
        
        
        
       
    </body>
</html>
