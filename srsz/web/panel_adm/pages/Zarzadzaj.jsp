<%@page errorPage="/WEB-INF/error.jsp"%> <%@page import="baza.DaneSemestr"%>
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
            User u1 = null;
                String userId1;
                try {
                    userId1=request.getRemoteUser();
                    u1= UserLocalServiceUtil.getUserById(Long.parseLong(userId1));
                    if(dOsoby.znajdzPoLoginie(u1.getScreenName().toString()) != null)
                        bO = dOsoby.znajdzPoLoginie(u1.getScreenName().toString());
                    else
                        bO = dOsoby.znajdzPoLoginie("student");
                    usr = bO.getId();
                    
                } catch (Exception e) {
                    usr = null;
                }
               

            boolean x1 = upraOs.czyAdmin(dOsoby.znajdzPoLoginie(u1.getScreenName().toString()));
            if (!x1) return;
            

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
         List<Zasob> zasobyList = DaneZasob.selectZasoby();
         List<Uprawnienie> uprawnieniaList = DaneUprawnienie.selectUprawnienia();
         List<Osoby> osobyList = DaneOsoby.selectOsoby();
         List<UprawnienieZasob> uprawnieniaZasobList = DaneUprawnienieZasob.selectUprawnienieZasob();
         List<UprawnienieOsoba> uprawnieniaOsobaList = DaneUprawnienieOsoba.selectUprawnienieOsoba();
         
            int uzSize = uprawnieniaZasobList.size();
            UprawnienieZasob uzWyb = new UprawnienieZasob();
            String uz[] = new String[uzSize];
            String tryb = "";
            for (int i=0; i<uzSize; i++){
                uzWyb = uprawnieniaZasobList.get(i);
                if (uzWyb.getTryb()==1) tryb="Operacje";
                else if (uzWyb.getTryb()==11) tryb="Operacje-Zaoczne";
                else if (uzWyb.getTryb()==12) tryb="Operacje-Stacjonarne";
                 else if (uzWyb.getTryb()==2) tryb="Specjalne";
                uz[i] = uzWyb.getId_zasob().getNazwa() +" - "+ uzWyb.getId_uprawnienie().getOpis()+" - " + tryb;
            }
        
             
            
        %>
        
        <script>
            function ustawWidocznoscReszty(){
                if (document.getElementById('dodawanieOdkryj').className=="wcisniety"){
                    document.getElementById('zao').style.display="inline";
                    document.getElementById('stac').style.display="inline";
                    document.getElementById('opisZakres').style.display="inline";
                    $("#opisZakres").show();
                }
                else{
                    document.getElementById('zao').style.display="none";
                    document.getElementById('stac').style.display="none";
                    document.getElementById('opisZakres').style.display="none";
                    $("#opisZakres").hide();
                }
                    
            }
            </script>
       
        <div class='srsz_space'></div>
			<div id='srsz_lewy_maly'>
				<ul id='menu-2' class='ui-menu__close' style="opacity:0.7;">
				
       <li><span class="ui-icon  ui-icon-calendar"></span><a href='<portlet:renderURL><portlet:param name="jspPage" value="/kalendar.jsp" /></portlet:renderURL>' style="text-decoration: none">Do kalendarza</a></li>
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
                    <input type="radio" id="radio2" name="menu" checked/><label for="radio2" style="vertical-align: bottom;"><a href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Zarzadzaj.jsp" /></portlet:renderURL>">Uprawnienia</a></label>
                </div>
                <div class="menu-item">
                    <input type="radio" id="radio3" name="menu" /><label for="radio3"><a href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Semestry.jsp" /></portlet:renderURL>">Semestry</a></label>
                </div>
               
               
        </nav>





<!-- Accordion -->

<div id="tabs" style="height:450px;display:inline-block; margin-left:40px; box-shadow: 10px 10px 5px #888888;">
	<ul>
		<li><a href="#tabs-1">Dodawanie uprawnień</a></li>
                <li><a href="#tabs-2">Usuwanie uprawnień</a></li> 
                
	</ul>

<div id="tabs-1">

<div id="accordion">
    
<h3>Dodaj uprawnienie</h3>
<div>
<form id="dodajuprawnienie">
    <table class="odstepy">
        <tr>
        <td>Opis:</td>
        <td><input type="text" name="opis" title="Podaj opis uprawnienia" class="ui-corner-all"/></td>
        </tr>
        <tr>
            <td>Od:</td>
            <td><input type="text" name="od" id="datepicker1" class="ui-corner-all" title="Data aktywacji uprawnienia" /></td>
        </tr>
        <tr>
            <td>Do:</td>
            <td><input type="text" name="do" id="datepicker2" class="ui-corner-all" title="Data dezaktywacji uprawnienia" /></td>
        </tr>
        <tr>
           
        </tr>
    </table>
    <br></br>
     <input type="submit" value="Dodaj" id="button5"/>
</form>
</div>    
    
<h3>Dodaj uprawnienie do zasobu</h3>
<div>

<form id="dodajuprawnieniezas">
    <table class="odstepySrednie">
        <tr>
            <td>Zasób: </td>
            <td>
                <select name="zasob" class="ui-corner-all">
                            <option value=""/>        
                            <% for (Zasob z: zasobyList){
                                    %> 
                                <option value="<%=z.getId()%>"><%=z.getNazwa()%></option>
                                <%
                                }%>
                </select>
            </td>
        </tr>
        <tr>
                <td>Uprawnienie:</td>
                <td>
                    <select name="uprawnienie" class="ui-corner-all">
                            <option value=""/>        
                            <% for (Uprawnienie u: uprawnieniaList){
                                    %> 
                                <option value="<%=u.getId()%>"><%=u.getOpis()%></option>
                                <%
                                }%>
                       </select>
                </td>
        </tr>
        <tr>
            <td>Tryb:</td>
            <td>
                
                
                <button id="dodawanieOdkryj" class="zwykly" onclick="this.className=(this.className=='zwykly')?'wcisniety':'zwykly'; 
                    trDod.value=(this.className=='zwykly')?'0':'1'; 
                    ustawWidocznoscReszty();
                    return false;">Operacje</button>
                
                <button class="zwykly" onclick="this.className=(this.className=='zwykly')?'wcisniety':'zwykly'; trPr.value=(this.className=='zwykly')?'0':'1'; return false;">Specjalne</button>
                <input type="hidden" id="trDod" name="trDod" value="0"/>
                <input type="hidden" id="trDodZao" name="trDodZao" value="0"/>
                <input type="hidden" id="trDodStac" name="trDodStac" value="0"/>
                 <input type="hidden" id="trPr" name="trPr" value="0"/>
                 <br>
                 
                
                
            </td>
        </tr>
        <tr>
            <td><label id="opisZakres" style="display: hidden">zakres:</label></td>
            <td> 
                <button class="zwykly" onclick="this.className=(this.className=='zwykly')?'wcisniety':'zwykly'; trDodZao.value=(this.className=='zwykly')?'0':'1'; return false;" id="zao" style="display: none;">Zaoczne</button>
                <button class="zwykly" onclick="this.className=(this.className=='zwykly')?'wcisniety':'zwykly'; trDodStac.value=(this.className=='zwykly')?'0':'1'; return false;" id="stac" style="display: none;">Stacjonarne</button>
            </td>
        </tr>
       
    </table>
                       <br></br>
                       <input id="button3" type="submit" value="Dodaj"/>
</form>
</div>
<h3>Dodaj uprawnienie osobie</h3>
<div>
<form id="dodajuprawnienieos">
    <table class="odstepySrednie">
        <tr>
        <td>Pracownik: </td>
        <td><select name="pracownik" id="selectpracownik" class="ui-corner-all">
                            <option value=""/>        
                             <% for (Osoby o: osobyList){
                                    %> 
                                <option value="<%=o.getId()%>"><%=o.getNazwisko()+" "+o.getImie()%></option>
                                <%
                                }%>
            </select></td>
        </tr>
        <tr>
            
            <td>Uprawnienie: </td>
            <td><select name="uprawnienie" class="ui-corner-all">
                            <option value=""/>        
                            <% for (Uprawnienie u: uprawnieniaList){
                                    %> 
                                <option value="<%=u.getId()%>"><%=u.getOpis()%></option>
                                <%
                                }%>
                </select></td>
        </tr>
        
       
    </table>
                <br></br>
                <input id="button4" type="submit" value="Dodaj"/>
</form>
</div>

</div>
</div>


<div id="tabs-2">
<div id="accordion1">
<h3>Usuń uprawnienie do zasobu</h3>
<div>
    <form id="usunuprawnieniezas" class="ui-corner-all">
    <table class="odstepySzersze">
        <tr>
            <td>Zasób - uprawnienie:</td>
            <td>
                <select name="uprzas" class="ui-corner-all" style="width:322px;">
                            <option value=""/>        
                            <% for (UprawnienieZasob u: uprawnieniaZasobList){
                                    %> 
                                    <option value="<%=u.getId()%>"><%=u.getId_zasob().getNazwa() +" - "+ u.getId_uprawnienie().getOpis()+" - "+u.podajTryb(u.getTryb())%> </option>
                                <%
                                }%>
                </select>
            </td>
        </tr>
        
    </table>
                <br></br>
                  <input id="button6" type="submit" value="Usuń"/>
    </form>
</div>
<h3>Usuń uprawnienie osobie</h3>
<div>
<form id="usunuprawnienieos">
    <table class="odstepySzersze">
        <tr>
            <td>Uprawnienie - osoba:</td>
            <td>
                <select name="upros" id="usunuprawnienieosse" class="ui-corner-all" style="width:272px;">
                            <option value=""/>        
                            <% for (UprawnienieOsoba u: uprawnieniaOsobaList){
                                    %> 
                              <option value="<%=u.getId()%>"><%=u.getId_uprawnienie().getOpis()+" - "+u.getId_prac().getImie()+" "+u.getId_prac().getNazwisko()%></option>
                                 <%
                                }%>
                </select>
            </td>
        </tr>
        
    </table>
                <br></br>
                <input id="button7" type="submit" value="Usuń"/>
</form>
</div>
<h3>Usuń uprawnienie</h3>
<div>
    <form id="usunuprawnienie" >
     <table class="odstepySzersze">
         <tr>
             <td>Uprawnienie:</td>
             <td>
                 <select name="uprawnienie" class="ui-corner-all">
                            <option value=""/>        
                            <% for (Uprawnienie u: uprawnieniaList){
                                    %> 
                                <option value="<%=u.getId()%>"><%=u.getOpis()%></option>
                                <%
                                }%>
                       </select>
             </td>
         </tr>
        
     </table>
                       <br></br>
                       <input id="button8" type="submit" value="Usuń"/>
    </form>

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
				$("#opisZakres").hide();
				$("#srsz_lewy_maly").hover(pokaz_lewy,ukryj_lewy);
				$("#menu-2").show();
				
				var w=$("#menu-2").width();
				$("#menu-2").hide();
				$("#menu-2").css("margin-left",-w);
		});
    </script>

 <script>
    
var dodajUprawnienieAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajUprawnienieAkcja.jsp" /></portlet:resourceURL>";
var usunUprawnienieZasobAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/usunUprawnienieZasobAkcja.jsp" /></portlet:resourceURL>";
var usunUprawnienieOsobaAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/usunUprawnienieOsobaAkcja.jsp" /></portlet:resourceURL>";
var usunUprawnieniaAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/usunUprawnieniaAkcja.jsp" /></portlet:resourceURL>";
var dodajUprawnienieOsobaAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajUprawnienieOsobaAkcja.jsp" /></portlet:resourceURL>";
var dodajUprawnienieZasobAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajUprawnienieZasobAkcja.jsp" /></portlet:resourceURL>";
</script>

</html>
