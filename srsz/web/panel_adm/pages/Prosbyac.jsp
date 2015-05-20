<%@page errorPage="/WEB-INF/error.jsp"%> <%@page import="java.text.Format"%>
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
<div id="zawartosc_strony">
    

    <%
            DaneZasob dZ = new DaneZasob();
            List<String> zasList = dZ.zczytajZasobNazwa();
            int zasSize = zasList.size();
            String zas[] = new String[zasSize];
            for (int i=0; i<zasSize; i++)
                zas[i] = zasList.get(i);
      
            DaneProsba dP = new DaneProsba();
            List<String> proList = dP.selectProsbaPowod();
            int proSize = proList.size();
            String pro[] = new String[proSize];
            for (int i=0; i<proSize; i++)
                pro[i] = proList.get(i);
            
            DaneOsoby dO = new DaneOsoby();
            List<Osoby> osobyList = dO.selectOsoby();
            int osSize = osobyList.size();
            String osoby[] = new String[osSize];
            for (int i=0; i<osSize; i++)
                osoby[i] = osobyList.get(i).getImie()+" "+osobyList.get(i).getNazwisko();
        
        %>
        
         <%
            String wyjscie="";
            List<Prosba> lP = DaneProsba.selectProsba();
           
            Boolean akceptacja=false;
            Integer numer = null;
            Integer rezer = (Integer)request.getSession().getAttribute("id");
            
            for (int i=0; i<lP.size(); i++){
                if (request.getParameter("akc:"+lP.get(i).getId())!=null){
                    akceptacja=true;
                    numer=i;
                }
                if (request.getParameter("odrz:"+lP.get(i).getId())!=null){
                    akceptacja=false;
                    numer=lP.get(i).getId();
                }            
            }
            
            if (akceptacja){
                baza.DaneOsoby dOs = new baza.DaneOsoby();
                baza.Osoby rezerwujacy = dOs.zczytajOsoba(rezer);
                baza.DaneRezerwacja dRez = new baza.DaneRezerwacja();
                dRez.dodajRezerwacja(lP.get(numer).getStart(), 
                        lP.get(numer).getKoniec(), 
                        lP.get(numer).getPowod(), 
                        lP.get(numer).getTyp(), 
                        lP.get(numer).getWlasciciel(), 
                        rezerwujacy, 
                        lP.get(numer).getId_zasob(), 
                        null);
              //  wyjscie ="Pomyślnie dodano!";          
                dP.usunProsba(lP.get(numer).getId());
            }
            else {
                dP.usunProsba(numer);
              //  wyjscie="Pomyślnie usunięto!";
            }
            
        %>
       
<!--Menu gorne -->

            <nav id="mainNav" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
                <div class="menu-item">
                    <input type="radio" id="radio1" name="menu" checked /><label for="radio1"><a href ="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/ZarzadzajBaz.jsp" /></portlet:renderURL>">Zarzadzaj<br>baza</br></a></label>
                </div>
               <div class="menu-item">
                    <input type="radio" id="radio2" name="menu"/><label for="radio2" style="vertical-align: bottom;"><a href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Zarzadzaj.jsp" /></portlet:renderURL>">Uprawnienia</a></label>
                </div>
                <div class="menu-item">
                    <input type="radio" id="radio3" name="menu"  /><label for="radio3"><a href="Semestry.html">Semestry</a></label>
                </div>
                <div class="menu-item">
                    <input type="radio" id="radio4" name="menu" /><label for="radio4">Ustawienia</label>
                </div>
               
        </nav>



<!-- Menu boczne -->

<ul id="menu">
<li class="ui-widget-header" style="vertical-align:middle;" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSzybki Dostep</li>

 <li class="ui-widget-header">Pracownicy</li>
  <li><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Osoby.jsp" /></portlet:renderURL>#tabs-1' style="text-decoration: none">Dodaj pracownika</a></li>
  <li><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Osoby.jsp" /></portlet:renderURL>#tabs-3' style="text-decoration: none">Edytuj pracownika</a></li>
  <li><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Osoby.jsp" /></portlet:renderURL>#tabs-2' style="text-decoration: none">Usun pracownika</a></li>
  <li class="ui-widget-header">Zasoby</li>    
  <li><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Zasoby.jsp" /></portlet:renderURL>#tabs-1' style="text-decoration: none">Dodaj zasób</a></li>
  <li><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Zasoby.jsp" /></portlet:renderURL>#tabs-3' style="text-decoration: none">Edytuj zasób</a></li>
  <li><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Zasoby.jsp" /></portlet:renderURL>#tabs-2' style="text-decoration: none">Usuń zasób</a></li>
  <li class="ui-widget-header">Rezerwacje Sal</li>    
  <li><a href="../..<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages//kalendar.jsp" /></portlet:renderURL>" style="text-decoration: none">Rezerwacje</a></li>
  <li><a href='<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Prosby.jsp" /></portlet:renderURL>' style="text-decoration: none">Prośby</a></li>



</ul>


<!-- Accordion -->

<div id="tabs" style="width:625px;height:450px;float:left; margin-left:10px; box-shadow: 10px 10px 5px #888888;">
	<ul>
		
                <li><a href="#tabs-3">Akceptacja/odrzucanie próśb</a></li>
                
                
	</ul>


    
   
        <div id="users-contain" class="ui-widget">
    
     <form action="../..<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages//testProsbyAkcja.jsp" /></portlet:renderURL>">
                  <div id="tabela">
            <table id="users" class="ui-widget ui-widget-content">
                <tr class="ui-widget-header ">
                    <td>Zasób</td>
                    <td>Dzień</td>
                    <td>Początek</td>
                    <td>Koniec</td>
                    <td>Właściciel</td>
                    <td>Tytułem</td>
                    <td>Typ</td>
                    <td>Operacja</td>
                </tr>
                <% 
                    baza.DaneRezerwacja dR = new baza.DaneRezerwacja();
                    Format sdfGodzina = new SimpleDateFormat("HH:mm");
                    Format sdfDzien = new SimpleDateFormat("dd-MM-yyy");
                   // List<Prosba> lP = DaneProsba.selectProsba();
                    baza.Prosba prosba = new baza.Prosba();
                    String start="";
                    String koniec="";
                    String dzien="";
                    for (int i=0; i<lP.size(); i++){
                        prosba = lP.get(i);
                        start=sdfGodzina.format(prosba.getStart());
                        koniec=sdfGodzina.format(prosba.getKoniec());
                        dzien=sdfDzien.format(prosba.getStart());
                %>
                
                 <tr>
                    <td><%= prosba.getId_zasob().getNazwa() %></td>
                    <td><%= dzien %></td>
                    <td><%= start %></td>
                    <td><%= koniec %></td>
                    <td><%= prosba.getWlasciciel().getNazwisko() %> <%= prosba.getWlasciciel().getImie() %></td>
                    <td><%= prosba.getPowod() %></td>
                    <td><%= prosba.getTyp().getOpis() %></td>
                    <td>
                        <%
                            if (dR.sprwadzDostepnasc(prosba.getStart(),prosba.getKoniec(),prosba.getId_zasob(),prosba.getWlasciciel())){
                        %>
                        <button type='submit' name="akc:<%=prosba.getId()%>"><img src="http://icons.iconarchive.com/icons/led24.de/led/16/accept-icon.png"/></button>
                        <% } %>
                        <button type='submit' name="odrz:<%=prosba.getId()%>"><img src="http://3.bp.blogspot.com/_fa3UixqoaSg/TE2kQpcVWLI/AAAAAAAAAmA/wDH1fNtPXnw/s320/rejected.gif"/></button>
                    </td>
                </tr>

                <%
                    }
                %>
            </table>
                  </div>
        </form>
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
    
   
        
        $('#tabela').submit(function(e){
    e.preventDefault();
    alert($('#tabela').serialize());
    $.ajax({
        url:"../..<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages//testProsbyAkcja.jsp" /></portlet:renderURL>",
        type:'post',
        data:$('#tabela').serialize(),
        success:function(odpowiedz){
            odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie1Komunikat").append(odp);
           $("#ostrzezenie").dialog("open");
            setTimeout(function(){
    $("#ostrzezenie").dialog("close");
     }, 700);
        }
    });
});

    function akceptuj_prosbe(nr){
        $("#prosba_operacja").val("akceptuj");
        $("#prosba_id").val(nr);
        
        $("#tabela").submit();
        
    
    }


 $( "#radio1" ).buttonset();
$("#button2").button();
$("#button2").submit();

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





$( "#button1,#button2,#button3,#button4,#opener,#button5,#button6,#button7" ).button();
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



$( "#slider" ).slider({
	range: true,
	values: [ 17, 67 ]
});



$( "#progressbar" ).progressbar({
	value: 20
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

$('#dodajprosbe').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:"../..<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages//dodajProsbaAkcja.jsp" /></portlet:renderURL>",
        type:'post',
        data:$('#dodajprosbe').serialize(),
        success:function(odpowiedz){
            odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie1Komunikat").append(odp);
           $("#ostrzezenie").dialog("open");
            setTimeout(function(){
    $("#ostrzezenie").dialog("close");
     }, 700);
        },
        error:function(){
            alert("JUUSS");
        }
    });
});

$('#dodajprosbezas').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:"../..<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages//dodajProsbaZasobAkcja.jsp" /></portlet:renderURL>",
        type:'post',
        data:$('#dodajprosbezas').serialize(),
        success:function(odpowiedz){
            odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie1Komunikat").append(odp);
           $("#ostrzezenie").dialog("open");
            setTimeout(function(){
    $("#ostrzezenie").dialog("close");
     }, 700);
  
        }
    });
});



</script>
</zawartosc_strony>


</html>
