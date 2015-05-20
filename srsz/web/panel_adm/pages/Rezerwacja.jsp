<%@page errorPage="/WEB-INF/error.jsp"%> <%@page import="baza.DaneRezerwacjaTyp"%>
<%@page import="baza.RezerwacjaTyp"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="baza.DaneZasob"%>
<%@page import="baza.Zasob"%>
<%@page import="baza.DaneProsba"%>
<%@page import="baza.Prosba"%>
<%@page import="baza.DaneOsoby"%>
<%@page import="baza.Prosba"%>
<%@page import="baza.DaneProsba"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@page import="baza.DaneZasob"%>
<%@page import="baza.Zasob"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="baza.Osoby"%>
<%@page import="baza.DaneRezerwacja"%>
<%@page import="baza.Rezerwacja"%>
<%@page import="baza.DaneProsba"%>
<%@page import="baza.Prosba"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
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

   <%
        List<RezerwacjaTyp> rezerwacjaTypList = DaneRezerwacjaTyp.selectRezTyp();
   %>
        var tabRezTyp = new Array();
                
            <%
                for(int i=0; i<rezerwacjaTypList.size(); i++)
                {
                    %>
                        tabRezTyp[<%=rezerwacjaTypList.get(i).getId()%>]="<%=rezerwacjaTypList.get(i).getOpis()%>";
                <% } %>
                    
    function uzupelnianie(){
        var a = $("#pobranytyp").val();
                $("#poletekstowe").val(tabRezTyp[a]);
    }
            
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
<!--Menu gorne -->
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

<div id="tabs" style="height:450px; display:inline-block; margin-left:40px; box-shadow: 10px 10px 5px #888888;">
	<ul>
		
                <li><a href="#tabs-3">Rezerwacja</a></li>
                
                
	</ul>

    <div id="tabs-3">
  <div id="accordion1">  
   <h3>Dodaj typ rezerwacji</h3>
   
   <div>
       <form id="rezerwacjatyp">
            <table class="odstepy">
               <tr>
                   <td>Opis:</td>
                   <td>
                       <input type="text" name="opis" class="ui-corner-all"/>
                   </td>
               </tr>
               
            </table>
           <br></br>
            <input type="submit" id="button1" value="Dodaj"/>
       </form>
   </div>
   
   <h3>Edytuj typ rezerwacji</h3>
   <div>
       <form id="edytujrezerwacjatyp">
       <table class="odstepy">
                <tr>
                    <td>Typ:</td>
                    <td>
                        <select id="pobranytyp" name="pobranytyp" onchange="uzupelnianie();" class="ui-corner-all">
                            <option value=""/>        
                            <% for (RezerwacjaTyp rez: rezerwacjaTypList){
                                    %> 
                                <option value="<%=rez.getId()%>"><%=rez.getOpis()%></option>
                                <%
                                }%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Typ:</td>
                    <td><input type="text" value="" ID="poletekstowe" name="poletekstowe" class="ui-corner-all"></td>
                </tr>
               
            </table>
           <br></br>
             <input type="submit" id="button2" value="Zapisz" class="ui-corner-all">
   </form>
   </div>
   
   <h3>Usuń typ rezerwacji</h3>
   <div>
       <form id="usunrezerwacjatyp">
       <table class="odstepy">
           <tr>
               <td>Typ:</td>
               <td>
                    <select name="rezTyp" class="ui-corner-all">
                            <option value=""/>        
                            <% for (RezerwacjaTyp rez: rezerwacjaTypList){
                                    %> 
                                <option value="<%=rez.getId()%>"><%=rez.getOpis()%></option>
                                <%
                                }%>
                    </select>
               </td>
           </tr>
           
       </table>
                    <br></br>
                     <input type="submit" id="button3" value="Usuń">
       
       </form>
   </div>
           
  </div>
</div>
            
</div>        




	
    



<div id="ostrzezenie" title="Powiadomienie" align="center">
               <p><b><label id="ostrzezenie1Komunikat"></label></b></p>
 </div> 
                            
<div id="dialog" title="Basic dialog">
<p>Dodano pomyslnie</p>
</div>
    </div>





<script src="/srsz/panel_adm/pages/external/jquery/jquery.js"></script>
<script src="/srsz/panel_adm/pages/jquery-ui.js"></script>
<script>
    
 var rezerwacjatyp = "<portlet:resourceURL><portlet:param name="jspPage" value="/dodajRezerwacjaTypAkcja.jsp" /></portlet:resourceURL>";

 var edytujrezerwacjat = "<portlet:resourceURL><portlet:param name="jspPage" value="/updateRezerwacjaTypAkcja.jsp" /></portlet:resourceURL>";
 
 var usunrezerwacjat = "<portlet:resourceURL><portlet:param name="jspPage" value="/usunRezerwacjaTypAkcja.jsp" /></portlet:resourceURL>";

 $("#zawartosc_strony").addClass("load");
 $('#rezerwacjatyp').submit(function(e){
    e.preventDefault();
   
    $.ajax({
        url:rezerwacjatyp,
        type:'post',
        data:$('#rezerwacjatyp').serialize(),
        success:function(odpowiedz){
            odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie1Komunikat").append(odp);
           $("#ostrzezenie").dialog("open");
            setTimeout(function(){
    $("#ostrzezenie").dialog("close");
     }, 700);
      window.location.reload(true);
        }
    });
});

$('#edytujrezerwacjatyp').submit(function(e){
    e.preventDefault();
   
    $.ajax({
        url:edytujrezerwacjat,
        type:'post',
        data:$('#edytujrezerwacjatyp').serialize(),
        success:function(odpowiedz){
            odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie1Komunikat").append(odp);
           $("#ostrzezenie").dialog("open");
            setTimeout(function(){
    $("#ostrzezenie").dialog("close");
     }, 700);
      window.location.reload(true);
        }
    });
});

$('#usunrezerwacjatyp').submit(function(e){
    e.preventDefault();
   
    $.ajax({
        url: usunrezerwacjat,
        type:'post',
        data:$('#usunrezerwacjatyp').serialize(),
        success:function(odpowiedz){
            odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie1Komunikat").append(odp);
           $("#ostrzezenie").dialog("open");
            setTimeout(function(){
    $("#ostrzezenie").dialog("close");
     }, 700);
      window.location.reload(true);
        }
    });
});

    function akceptuj_prosbe(nr){
        $("#prosba_operacja").val("akceptuj");
        $("#prosba_id").val(nr);
        
        $("#tabela").submit();
        
    
    }


 $( "#radio1" ).buttonset();
// $("#button2").submit();
$("#button2").button();


$( "#accordion,#accordion1" ).accordion({active:false});

 $( "#dialog-form" ).dialog({
width: 300,
height:350,
autoOpen: false,
show: {
effect: "blind",
duration: 1000
},
hide: {
effect: "explode",
duration: 1000
},

close:function(){

$( "#mainNav" ).removeClass( "blur" );
$( "#menu" ).removeClass( "blur" );
$( "#tabs").removeClass( "blur" );

},


 resize: function( event, ui ) {
                  $( this ).dialog( "option", "title",
	         ui.size.height + " x " + ui.size.width );
               }


});




$( "#button5" ).click(function( event ) {
	$( "#dialog" ).dialog( "open" );
        $( "#dialog-form" ).dialog( "close" );
	event.preventDefault();
});


$("#button6").click(function() {
$( "#dialog-form" ).parent().effect( "shake", {times:3},80 );
 return false;
});

$( "#opener" ).click(function() {
$( "#dialog-form" ).dialog( "open" );
$( "#mainNav" ).addClass( "blur" );
$( "#menu" ).addClass( "blur" );
$( "#tabs").addClass( "blur" );

});


$( "#button1" ).click(function( event ) {
	
});

$( "#dialoguzytkownik" ).dialog({
	autoOpen: false,
	width: 400,
	buttons: [
		{
			text: "Ok",
			click: function() {
				$( this ).dialog( "close" );
			}
		},
		{
			text: "Cancel",
			click: function() {
				$( this ).dialog( "close" );
			}
		}
	]
});

$("#button13").button();
$("#button13").submit();





$( "#button1,#button2,#button3,#button4,#opener,#button5,#button6" ).button();
$("#mainNav").buttonset();

$( "#radioset" ).buttonset();



$( "#tabs,#tabs-1,#tabs-2" ).tabs({


});




$( "#dialog" ).dialog({
	autoOpen: false,
	width: 400,
	buttons: [
		{
			text: "Ok",
			click: function() {
				$( this ).dialog( "close" );
			}
		},
		{
			text: "Cancel",
			click: function() {
				$( this ).dialog( "close" );
			}
		}
	]
});

// Link to open the dialog
$( "#dialog-link" ).click(function( event ) {
	$( "#dialog" ).dialog( "open" );
	event.preventDefault();
});



$( "#datepicker,#datepicker1,#datepicker2" ).datepicker({
	inline: true
});



$(function() {
    $( "#menu" ).menu({
      items: "> :not(.ui-widget-header)"
    });
});

$( "#spinner" ).spinner();

$( "#selectmenu" ).selectmenu();






$( "#tooltip" ).tooltip();


$( "#ostrzezenie" ).dialog({
                 autoOpen:false,
                 height:130,
                 show:{effect:"fade", duration:100},
                 hide:{effect:"fade", duration:100}
             });
             
             
             
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
				
				$("#srsz_lewy_maly").hover(pokaz_lewy,ukryj_lewy);
				$("#menu-2").show();
				
				var w=$("#menu-2").width();
				$("#menu-2").hide();
				$("#menu-2").css("margin-left",-w);
		});





</script>
</div>


</html>
