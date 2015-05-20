<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="baza.Prosba"%>
<%@page import="baza.DaneProsba"%>
<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page import="baza.DaneSalaTyp"%>
<%@page import="baza.SalaTyp"%>
<%@page import="baza.ZasobyTyp"%>
<%@page import="baza.DaneZasobyTyp"%>
<%@page import="java.util.List"%>
<%@page import="baza.Tytuly"%>
<%@page import="baza.DaneTytul"%>
<%@page import="baza.DaneOsoby"%>
<%@page import="baza.Osoby"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<!doctype html>

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
            function wyslijDoAkcji(){
                $.ajax({
                    url:"<portlet:renderURL><portlet:param name="jspPage" value="/newProsbyAkcja.jsp" /></portlet:renderURL>",
                    type:'post',
                    data:'wybranaProsba='+$('#wybranaProsba').val(),
                    success:function(odpowiedz){
                        //odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
                        //$("#ostrzezenie1Komunikat").empty();
                        //$("#ostrzezenie1Komunikat").append(odp);
                        $("#ostrzezenie").dialog("open");
                        setTimeout(function(){
                            $("#ostrzezenie").dialog("close");
                        }, 700);
                        window.location.reload(true);
                    }
                });
            }
            function zmienWartosc(numer,wartosc){
                $('#wybranaProsba').val(wartosc+":"+numer);
                wyslijDoAkcji();
            }
        </script>

        <style>
            table#users{
                height: 480px;
                overflow-y: auto;
            }
            
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
</head>
 
<div id="zawartosc_strony">       
       
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
		<li><a href="#tabs-1">Akceptacja/odrzucanie próśb</a></li>
                
	</ul>

<div id="tabs-1">

<div id="accordion">
    
    <input type="text" value="none:00" id="wybranaProsba" hidden/>
<div id="tabela">
        <table class="prosby">
                <tr class="naglowek">
                    <td>Zasób</td>
                    <td>Okres</td>
                    <td>Właściciel</td>
                    <td>Tytułem</td>
                    <td>Typ</td>
                    <td>Operacja</td>
                </tr>
                <% 
                    baza.DaneRezerwacja dR = new baza.DaneRezerwacja();
                    Format sdfGodzina = new SimpleDateFormat("HH:mm");
                    Format sdfDzien = new SimpleDateFormat("dd-MM");
                    List<Prosba> lP = DaneProsba.selectProsba();
                    String start="";
                    String koniec="";
                    String dzien="";
                    for (Prosba prosba: lP){
                        start=sdfGodzina.format(prosba.getStart());
                        koniec=sdfGodzina.format(prosba.getKoniec());
                        dzien=sdfDzien.format(prosba.getStart());
                %>
                
                 <tr>
                    <td><%= prosba.getId_zasob().getNazwa() %></td>
                    <td><%= dzien %> <%= start %>-<%= koniec %></td>
                    <td><%= prosba.getWlasciciel().getNazwisko() %> <%= prosba.getWlasciciel().getImie() %></td>
                    <td><div id="opisProsby"><%= prosba.getPowod() %></div></td>
                    <td><%= prosba.getTyp().getOpis() %></td>
                    <td>
                        <%
                            if (dR.sprwadzDostepnasc(prosba.getStart(),prosba.getKoniec(),prosba.getId_zasob(),prosba.getWlasciciel())){
                        %>
                        <button type='submit' onclick="zmienWartosc(<%=prosba.getId()%>,'akc')"><img src="http://icons.iconarchive.com/icons/led24.de/led/16/accept-icon.png"/></button>
                        <% } %>
                        <button type='submit' onclick="zmienWartosc(<%=prosba.getId()%>,'odr')"><img src="http://3.bp.blogspot.com/_fa3UixqoaSg/TE2kQpcVWLI/AAAAAAAAAmA/wDH1fNtPXnw/s320/rejected.gif"/></button>
                    </td>
                </tr>
                

                <%
                    }
                %>
            </table>
</div>

</div>
</div>

</div>
            
          <div id="ostrzezenie" title="Powiadomienie" align="center">
               <p><b>Operacja zakończona pomyślnie</b></p>
 </div> 
        
</div>

<script src="/srsz/panel_adm/pages/external/jquery/jquery.min.js"></script>
<script src="/srsz/panel_adm/pages/jquery-ui.min.js"></script>
<script src="/srsz/panel_adm/pages/Osoby.min.js"></script>
<script>
$("#zawartosc_strony").addClass("load");​

$(function() {
            $( "#menu-2" ).menu({
               icons: { submenu: "ui-icon-circle-triangle-e"},
               position: { my: "right top", at: "right-10 top+5" }
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
				$("#wybranaProsba").hide();
				$("#srsz_lewy_maly").hover(pokaz_lewy,ukryj_lewy);
				$("#menu-2").show();
				
				var w=$("#menu-2").width();
				$("#menu-2").hide();
				$("#menu-2").css("margin-left",-w);
		});
                
                $( "#ostrzezenie" ).dialog({
                 autoOpen:false,
                 height:130,
                 show:{effect:"fade", duration:100},
                 hide:{effect:"fade", duration:100}
             });
</script>




</html>
