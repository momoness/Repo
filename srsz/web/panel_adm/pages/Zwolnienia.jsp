<%@page errorPage="/WEB-INF/error.jsp"%> <%@page import="java.text.Format"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="baza.DaneZwolnienia"%>
<%@page import="baza.Zwolnienia"%>
<%@page import="baza.DaneSemestr"%>
<%@page import="baza.Semestr"%>
<%@page import="baza.DaneUprawnienie"%>
<%@page import="baza.Uprawnienie"%>
<%@page import="baza.DaneZasob"%>
<%@page import="java.util.List"%>
<%@page import="baza.Zasob"%>
<%@page import="baza.UprawnienieZasob"%>
<%@page import="baza.DaneOsoby"%>
<%@page import="baza.DaneUprawnienieZasob"%>
<%@page import="baza.UprawnienieOsoba"%>
<%@page import="baza.DaneUprawnienieOsoba"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="baza.Osoby"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<!doctype html>
<html lang="pl">
<head>
	<meta charset="utf-8">
	<title></title>
	<link href="/srsz/panel_adm/pages/jquery-ui.css" rel="stylesheet">
        <link href="/srsz/panel_adm/pages/Style.css" rel="stylesheet">
	  <script src="/srsz/panel_adm/pages/pace.min.js"></script>
         <link href='/srsz/panel_adm/pages/pace-theme-center-atom.css' rel='stylesheet'/>
</head>
<script>
    <%
    baza.DaneOsoby dOsoby = new baza.DaneOsoby();
    baza.Osoby bO = new baza.Osoby();
    baza.DaneUprawnienieOsoba upraOs = new baza.DaneUprawnienieOsoba();
Integer usr;
            User u = null;
                String userId;
                try {
                    userId=request.getRemoteUser();
                    u= UserLocalServiceUtil.getUserById(Long.parseLong(userId));
                    if(dOsoby.znajdzPoLoginie(u.getScreenName().toString()) != null)
                        bO = dOsoby.znajdzPoLoginie(u.getScreenName().toString());
                    else
                        bO = dOsoby.znajdzPoLoginie("student");
                    usr = bO.getId();
                    
                } catch (Exception e) {
                    usr = null;
                }
               

            boolean x = upraOs.czyAdmin(dOsoby.znajdzPoLoginie(u.getScreenName().toString()));
            if (!x) return;
            

%>
</script>
<style>
    #srsz_lewy_maly{
			position:absolute;
			left: 0px;
			top: 70px;
			min-width: 35px;
                        height:455px;
			background-color: rgba(240,240,255,.8);
			border-radius-top-right: 4px;
			border-radius-bottom-right: 4px;
			display: flex;
			z-index:100;
			overflow:hidden;
			
		}
		#srsz_glowne_okno{
			margin: 10px 10px 10px 50px;
			background-color: #d0d0FF;
			display: block;
			
		}
		.srsz_space{
			height: 1px;
		}
		#srsz_lewy_tekst{
			    color: black;
				display: flex;
				flex-flow: column nowrap;
				justify-content: center;
				min-height: 350px;
				text-align: center;
				width: 35px;
		}
		
		.img {
   -webkit-filter: blur(3x);
  -moz-filter: blur(3px);
  -o-filter: blur(3px);
  -ms-filter: blur(3px);
  filter: blur(3px);
}

		#srsz_lt_open{
			display: none;
		}
		.ui-menu{
			position:relative;
			transition: margin 250ms;
                width:200px; 
		}
		.ui-menu__close{
			display: none;
		
		}
                </style>
                
<div id="zawartosc_strony">

     
     <%
            List<Osoby> osobyList = DaneOsoby.selectOsoby();
    %>
        
         <div class='srsz_space'></div>
			<div id='srsz_lewy_maly'>
				<ul id='menu-2' class='ui-menu__close' style="opacity:0.7;">
				
       <li><span class="ui-icon-carat-1-w"></span><a href='<portlet:renderURL><portlet:param name="jspPage" value="/kalendar.jsp" /></portlet:renderURL>' style="text-decoration: none">Do kalendarza</a></li>
         <li class="ui-widget-header"><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Osoby.jsp" /></portlet:renderURL>'style="text-decoration: none">Pracownicy</a></li>
         <li><span class="ui-icon ui-icon-person"></span><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Osoby.jsp" /></portlet:renderURL>#tabs-1' style="text-decoration: none">Dodaj pracownika</a></li>
  <li><span class="ui-icon  ui-icon-pencil"></span><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Osoby.jsp" /></portlet:renderURL>#tabs-3' style="text-decoration: none">Edytuj pracownika</a></li>
  <li><span class="ui-icon ui-icon-trash"></span><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Osoby.jsp" /></portlet:renderURL>#tabs-2' style="text-decoration: none">Usun pracownika</a></li>
  <li class="ui-widget-header"><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Zasoby.jsp" /></portlet:renderURL>'style="text-decoration: none">Zasoby</a></li>    
  <li><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Zasoby.jsp" /></portlet:renderURL>#tabs-1' style="text-decoration: none">Dodaj zasób</a></li>
  <li><span class="ui-icon  ui-icon-pencil"></span><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Zasoby.jsp" /></portlet:renderURL>#tabs-3' style="text-decoration: none">Edytuj zasób</a></li>
  <li><span class="ui-icon ui-icon-trash"></span><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Zasoby.jsp" /></portlet:renderURL>#tabs-2' style="text-decoration: none">Usuń zasób</a></li>
  <li class="ui-widget-header">Rezerwacje Sal</li>    
  <li><a href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Rezerwacja.jsp" /></portlet:renderURL>" style="text-decoration: none">Rezerwacje</a></li>
  <li><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Prosby.jsp" /></portlet:renderURL>' style="text-decoration: none">Prośby</a></li>

      </ul>

				<div id='srsz_lewy_tekst' class="ui-accordion .ui-state-active ui-widget ui-widget-content ui-corner-all">
					<div id='srsz_lt_close'>
					<b>S<br/>
					<b>Z<br/>
					<b>Y<br/>
                                        <b>B<br/>
                                        <b>K<br/>
                                        <b>I<br/>
                                        <br/>
                                        
                                        
                                        <b>D</b><br/>
					<b>O</b><br/>
					<b>S</b><br/>
                                        <b>T</b><br/>
                                        <b>Ę</b><br/>
                                        <b>P</b><br/>
                                        <br/>
                                        
					</div>
					<div id='srsz_lt_open'>
					&lt;<br/>
					&lt;<br/>
					&lt;<br/>
					</div>
				</div>
			</div>
        

<!--Menu gorne -->

            <nav id="mainNav" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
                <div class="menu-item">
                    <input type="radio" id="radio1" name="menu" /><label for="radio1"><a href ="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/ZarzadzajBaz.jsp" /></portlet:renderURL>">Zarządzaj bazą</br></a></label>
                </div>
               <div class="menu-item">
                    <input type="radio" id="radio2" name="menu"/><label for="radio2" style="vertical-align: bottom;"><a href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Zarzadzaj.jsp" /></portlet:renderURL>">Uprawnienia</a></label>
                </div>
                <div class="menu-item">
                    <input type="radio" id="radio3" name="menu" /><label for="radio3"><a href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Semestry.jsp" /></portlet:renderURL>">Semestry</a></label>
                </div>
               
               
        </nav>



<!-- Menu boczne -->




<!-- Accordion -->

<div id="tabs" style="height:450px;display:inline-block; margin-left:40px; box-shadow: 10px 10px 5px #888888;">
	<ul>
		<li><a href="#tabs-1">Dodawanie zwolnień</a></li>
                
	</ul>

<div id="tabs-1">

<div id="accordion">
    
<h3>Dodaj zwolnienie</h3>
<div>
    <form id="dodajzwolnienie">
        <table class="odstepy">
            <tr>
                <td>Pracownik: </td>
                <td>
                    <select name="pracownik" class="ui-corner-all">
                                <option value=""/>        
                        <% for (Osoby oso: osobyList){
                                %> 
                            <option value="<%=oso.getId()%>"><%=oso.getNazwisko()+" "+oso.getImie()%></option>
                            <%
                            }%>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Początek: </td>
                <td><input type="text" id="datepicker1" class="ui-corner-all" name="start"/></td>
            </tr>
            <tr>
                <td>Koniec: </td>
                <td><input type="text" id="datepicker2" class="ui-corner-all"  name="koniec"/></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Dodaj" id="button5"/>
                </td>
            </tr>
        </table> 
</form>
    
</div>    
    
</div>
</div>

</div>


<div id="dialog" title="Basic dialog">
<p>Dodano pomyslnie</p>
</div>

<div id="ostrzezenie" title="Powiadomienie" align="center">
               <p><b><label id="ostrzezenie1Komunikat"></label></b></p>
 </div> 

<script src="/srsz/panel_adm/pages/external/jquery/jquery.min.js"></script>
<script src="/srsz/panel_adm/pages/jquery-ui.min.js"></script>
<script src="/srsz/panel_adm/pages/Zarzadzaj.js"></script>
<script src="/srsz/js/datepicker.js"></script>
</div>

<script>
    $("#zawartosc_strony").addClass("load");​
    $(function() {
            $( "#menu-2" ).menu({
               icons: { submenu: "ui-icon-circle-triangle-e"},
               position: { my: "right top", at: "right-10 top+5" }
            });
         });
    var dodzwolnienie = "<portlet:resourceURL><portlet:param name="jspPage" value="/dodajZwolnienieAkcja.jsp" /></portlet:resourceURL>";
      
    $('#dodajzwolnienie').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodzwolnienie,
        type:'post',
        data:$('#dodajzwolnienie').serialize(),
        success:function(odpowiedz){
            odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie1Komunikat").append(odp);
           $("#ostrzezenie").dialog("open");
            setTimeout(function(){
    $("#ostrzezenie").dialog("close");
     }, 700);
        },
    });
});


function pokaz_lewy(){

			$("#menu-2").show();
			window.setTimeout(function (){
				$("#menu-2").css("margin-left",0);
				$("zawartosc_strony").addClass("img");
				$("#srsz_lt_close").hide();
				$("#srsz_lt_open").show();
                                $("#srsz_lewy_tekst").hide();
				}, 300);
			
		}
		function ukryj_lewy(){
			
				var w=$("#menu-2").width();
				$("#menu-2").css("margin-left",-w);
				window.setTimeout(function (){
					$("#menu-2").hide();
					$("#srsz_lt_close").show();
                                         $("#srsz_lewy_tekst").show();
					$("#srsz_lt_open").hide();
				}, 300);
                               
			
		}
	
		$(document).ready(function (){
				
				$("#srsz_lewy_maly").hover(pokaz_lewy,ukryj_lewy);
				$("#menu-2").show();
				
				var w=$("#menu-2").width();
				$("#menu-2").hide();
				$("#menu-2").css("margin-left",-w);
		});


    </script>


</html>
