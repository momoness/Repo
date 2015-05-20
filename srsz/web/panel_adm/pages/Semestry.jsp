<%@page import="baza.RezerwacjaTyp"%>
<%@page errorPage="/WEB-INF/error.jsp"%> <%@page import="java.text.Format"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="baza.DaneSemestrZmiany"%>
<%@page import="baza.SemestrZmiany"%>
<%@page import="baza.SemestrWykluczenia"%>
<%@page import="baza.DaneSemestrWykluczenia"%>
<%@page import="baza.DaneRezerwacjaTyp"%>
<%@page import="baza.DaneSemestr"%>
<%@page import="baza.Semestr"%>
<%@page import="baza.Semestr"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="us">
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
        List<Semestr> semestrList = DaneSemestr.selectSemestr();
        List<SemestrWykluczenia> semestrWykluczeniaList = DaneSemestrWykluczenia.selectSemestrWykluczenia();
        List<SemestrZmiany> semestrZmianyList = DaneSemestrZmiany.selectSemestrZmiany();
        List<RezerwacjaTyp> rezerwacjaTypList = DaneRezerwacjaTyp.selectRezTyp();
    %>    
 
     
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
            
            
            
            
 function czyBylaZmiana(){
        $("#czyBylaZmianaVal").val("ok");
                document.getElementById('czyBylaZmianaImg').src = "http://icons.iconarchive.com/icons/led24.de/led/16/accept-icon.png";
                
                <% 
                    
                    for (int i=0; i<semestrZmianyList.size(); i++){
                    %>
                          $.ajax({
                            url: '<portlet:resourceURL><portlet:param name="jspPage" value="/czyBylaZmiana.jsp" /></portlet:resourceURL>',
                            data: '&start=' + $("#datepicker4").val(),
                            type:"GET",
                            async: false,
                            success: function(wyjscie){
                                var dane=$.parseJSON(wyjscie);
                                if (dane){
                                    $("#czyBylaZmianaVal").val("err");
                                    document.getElementById('czyBylaZmianaImg').src = "http://3.bp.blogspot.com/_fa3UixqoaSg/TE2kQpcVWLI/AAAAAAAAAmA/wDH1fNtPXnw/s320/rejected.gif";
                                }
                                }
                        });
                        
                <%  }
                %>
                        czyMoznaDodac();
            }           
            
            
 function czyMoznaDodac(){
                if ($("#czyBylaZmianaVal").val()=="err")
                    document.getElementById('button3').disabled = true;
                else
                    document.getElementById('button3').disabled = false;
            }           
            
  var typ = new Array();
         var rok = new Array();
         var datepicker1 = new Array();
         var datepicker2 = new Array();
         var plan_gotowy = new Array();
                
                <%
                    Format sdf = new SimpleDateFormat("yyyy-MM-dd");
                    for(int i=0;i<semestrList.size();i++){
                    %>
                       typ[<%=semestrList.get(i).getId()%>]="<%=semestrList.get(i).getTyp()%>"; 
                       rok[<%=semestrList.get(i).getId()%>]="<%=semestrList.get(i).getRok()%>"; 
                       datepicker1[<%=semestrList.get(i).getId()%>]="<%=sdf.format(semestrList.get(i).getPoczatek())%>"; 
                       datepicker2[<%=semestrList.get(i).getId()%>]="<%=sdf.format(semestrList.get(i).getKoniec())%>";  
                       plan_gotowy[<%=semestrList.get(i).getId()%>]="<%=semestrList.get(i).getPlan_gotowy()%>"; 
                <%
                
                }
                %>          
            
  function uzup()
                    {
                        var b= $("#formularz_semestr_wyk").val();
                               $("#typ").val(typ[b]);
                               $("#rok").val(rok[b]);
                               $("#datepicker6").val(datepicker1[b]);
                               $("#datepicker7").val(datepicker2[b]);
                               $("#plang").val(plan_gotowy[b]);
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
        
 <jsp:useBean id="obj" class="baza.DaneSemestrWykluczenia" type="baza.DaneSemestrWykluczenia"/>
<!--Menu gorne -->       
<div class='srsz_space'></div>
			<div id='srsz_lewy_maly'>
				<ul id='menu-2' class='ui-menu__close' style="opacity:0.7;">
				
       <li><span class="ui-icon ui-icon-carat-1-w"></span><a href='<portlet:renderURL><portlet:param name="jspPage" value="/kalendar.jsp" /></portlet:renderURL>' style="text-decoration: none">Do kalendarza</a></li>
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
                    <input type="radio" id="radio3" name="menu" checked /><label for="radio3"><a href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Semestry.jsp" /></portlet:renderURL>">Semestry</a></label>
                </div>
               
               
        </nav>



<!-- Menu boczne -->



<!-- Accordion -->

<div id="tabs" style="height:450px;display:inline-block; margin-left:40px; box-shadow: 10px 10px 5px #888888;">
	<ul>
		<li><a href="#tabs-1">Dodawanie</a></li>
                <li><a href="#tabs-2">Usuwanie</a></li> 
                <li><a href="#tabs-3">Edytowanie</a></li>
                
	</ul>

<div id="tabs-1">

<div id="accordion">
<h3>Dodaj semestr</h3>
<div>
<form id="dodajsemestr">
    <table class="odstepySrednie">
        <tr>
        <td>Typ: </td>
                <td><select name="typ" class="ui-corner-all" title="Podaj typ semestru Z-zimowy L-letni">
                        <option value="Z">Zimowy</option>
                        <option value="L">Letni</option>
            </select>
            
    </tr>
    <tr>
        <td>Rok: </td>
        <td><input type="number" name="rok" align="left" class="ui-corner-all"/><i></i></td>
    </tr>
    <tr>
        <td>Początek: </td>
        <td><input type="text" name="poczatek" id="datepicker1" align="left" class="ui-corner-all"/><i></i></td>
    </tr>
    <tr>
        <td>Koniec: </td>
        <td><input type="text" name="koniec" id="datepicker2" align="left" class="ui-corner-all"/><i></i></td>
    </tr>
    <tr>
        <td>Plan gotowy: </td>
        <td><select name="plan_gotowy" class="ui-corner-all">
                        <option value="1">Tak</option>
                        <option value="0">Nie</option>
            </select>
     </tr>
    
    </table>
    <br></br>
    <input id="button1" type="submit" value="Dodaj"/>
</form>
</div>
<h3>Dodaj wykluczenie w semestrze</h3>
<div>
<form id="dodajsemestrwy">
    <table class="odstepy"e>
        <tr>
        <td> Semestr: </td>
        <td><select name="semestr" class="ui-corner-all">
                 <option value=""/>        
                    <% for (Semestr s: semestrList){
                            %> 
                        <option value="<%=s.getId()%>"><%=s.getTyp()+" "+s.getRok()%></option>
                        <%
                        }%>       
                      </select></br></td>
        </tr>
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
        <tr>
            <td>Dzień: </td>
            <td><input type="text" name="dzien" id="datepicker3" class="ui-corner-all" title="Podaj dzień"/><i></i></td>
        </tr>
        <tr>
            <td>Początek: </td>
            <td><input type="text" name="poczatek" class="ui-corner-all" title="Podaj godzinę"/><i></i></td>
        </tr>
        <tr>
            <td>Koniec: </td>
            <td><input type="text" name="koniec" id="timepicker1" class="ui-corner-all" title="Podaj godzinę"/><i></i></td>
        </tr>
        <tr>
            <td>Opis: </td>
            <td><input type="text" name="opis" class="ui-corner-all"/><i></i></td>
        </tr>
        <tr>
            <td>
               
            </td>
        </tr>
    </table>
                    <br></br>
                         <input id="button2" type="submit" value="Dodaj"/>
</form>
</div>
<h3>Dodaj zmianę w semestrze</h3>
<div>
    
<form id="zmianawsem">
     <table class="odstepySzersze">
            <tr>
                <td>Dzień do zmiany: </td>
                <td><input type="text" id="datepicker4" name="dzien" class="ui-corner-all" onchange="czyBylaZmiana()" title="Podaj dzień, który ma być zmieniony"/>
                <image id="czyBylaZmianaImg" src=""/>
                <input type="hidden" id="czyBylaZmianaVal" value=""/>
            </tr>
           
            <tr>
                <td>Dzień zamieniany:</td>
                <td><input type="text" id="datepicker5" name="dzientygg" class="ui-corner-all" title="Podaj dzień tygodnia, na który ma być zamieniony"/><i></i></td>
            </tr>
            <tr>
                <td>
                    
                </td>
            </tr>
     </table>
    <br></br>
    <input id="button3" type="submit" value="Dodaj"/>
</form>

</div>
</div>
</div>

<div id="tabs-2">
<div id="accordion1">
<h3>Usuń semestr</h3>
<div>
    
<form id="usunsemestr">
    <table class="odstepy">
        <tr>
            <td>Semestr:</td>
            <td>
                <select name="semestr" class="ui-corner-all" style="width:162px;">
                            <option value=""/>        
                            <% for (Semestr s: semestrList){
                                    %> 
                                <option value="<%=s.getId()%>"><%=s.getTyp()+" "+s.getRok()%></option>
                                <%
                                }%>    
                </select>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
        </tr>
    </table>
                <br></br>
                <input id="button4" type="submit" value="Usuń"/>
</form>
      
  </div>
<h3>Usuń semestr-wykluczenia</h3>
<div>
  <form id="usunsemestrwy">
      <table class="odstepySrednie">
          <tr>
              <td>Wykluczenie:</td>
              <td>
                  <select name="wykluczenie" class="ui-corner-all" style="width:162px;">
                            <option value=""/>        
                            <% for (SemestrWykluczenia s: semestrWykluczeniaList){
                                    %> 
                                <option value="<%=s.getId()%>"><%=s.getOpis()%></option>
                                <%
                                }%> 
                </select>
              </td>
          </tr>
          <tr>
              <td>
                 
              </td>
          </tr>
      </table>
                <br></br> <input id="button5" type="submit" value="Usuń"/>
   </form>
</div>
</div>




	


</div>
    
    <div id="tabs-3">
        <div id="accordion1">
            <h3>Edytuj wykluczenie w semestrze</h3>
            <div>
         <form id="updatesem" >
             <table class="odstepySrednie"><tr>
                 <td>Semestr:  </td>
                 <td><select id="formularz_semestr_wyk" name="formularz_semestr_wyk" onchange="uzup();" class="ui-corner-all">
                        <option value=""/>        
                                   <% for (Semestr s: semestrList){
                                           %> 
                                       <option value="<%=s.getId()%>"><%=s.getTyp()+" "+s.getRok()%></option>
                                       <%
                                       }%>    
            </select>
                 </td>
                 </tr>
                 
               <tr>
                    <td>Typ: </td>
                    <td><select name="typ" id="typ" class="ui-corner-all" title="Podaj typ semestru Z-zimowy L-letni">
                           <option value="Z">Zimowy</option>
                           <option value="L">Letni</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Rok: </td>
                    <td><input type="number" id="rok" name="rok" align="left" class="ui-corner-all"/><i></i></td>
                </tr>
                <tr>
                    <td>Początek: </td>
                    <td><input type="text"  name="poczatek" id="datepicker6" align="left" class="ui-corner-all"/><i></i></td>
                </tr>
                <tr>
                    <td>Koniec: </td>
                    <td><input type="text"  name="koniec" id="datepicker7" align="left" class="ui-corner-all"/><i></i></td>
                </tr>
                <tr>
                    <td>Plan gotowy: </td>
                    <td><select name="plang" id="plang" class="ui-corner-all">
                                    <option value="1">Tak</option>
                                    <option value="0">Nie</option>
                        </select>
                 </tr>
               
            </table>
             <br></br>
             <input id="button6" type="submit" value="Edytuj"/>
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

</div>


<script src="/srsz/panel_adm/pages/external/jquery/jquery.min.js"></script>
<script src="/srsz/panel_adm/pages/jquery-ui.min.js"></script>
<script src="/srsz/panel_adm/pages/semestry.js"></script>
<script src="/srsz/js/datepicker.js"></script>
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
				
				$("#srsz_lewy_maly").hover(pokaz_lewy,ukryj_lewy);
				$("#menu-2").show();
				
				var w=$("#menu-2").width();
				$("#menu-2").hide();
				$("#menu-2").css("margin-left",-w);
		});

</script>
<script>
var dodajSemestrAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajSemestrAkcja.jsp" /></portlet:resourceURL>";
var usunSemestrAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/usunSemestrAkcja.jsp" /></portlet:resourceURL>";
var dodajSemestrWykluczeniaAkcka="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajSemestrWykluczeniaAkcja.jsp" /></portlet:resourceURL>";
var dodajSemestrZmianyAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajSemestrZmianyAkcja.jsp" /></portlet:resourceURL>";
var updateSemestrAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/updateSemestrAkcja.jsp" /></portlet:resourceURL>";
var updateSemestrZmianyAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/updateSemestrZmianyAkcja.jsp" /></portlet:resourceURL>";
var usunSemestrWykluczeniaAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/usunSemestrWykluczeniaAkcja.jsp" /></portlet:resourceURL>";
var usunSemestrZmianyAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/usunSemestrZmianyAkcja.jsp" /></portlet:resourceURL>";
</script>



</html>
