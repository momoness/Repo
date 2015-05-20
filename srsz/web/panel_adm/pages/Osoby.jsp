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
<%@page import="com.liferay.portal.service.persistence.PortletUtil"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@page import="com.liferay.portal.service.UserServiceUtil"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.model.User"%>
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
<% 
    
    baza.DaneOsoby daneOsoby = new baza.DaneOsoby(); 
    
    List<Osoby> osobyList = DaneOsoby.selectOsoby();
    List<Tytuly> tytList = DaneTytul.selectTytuly();
    List<String> osobyEmail = daneOsoby.selectEmail(); 
    
    List<String> zasobyTypList = DaneZasobyTyp.selectTypyOpis();
    List<String> salaTypList = DaneSalaTyp.selectSalaTypOpis();
    
    
            int zasobyTypListSize = zasobyTypList.size();
            String typy[] = new String[zasobyTypListSize];
            for (int i=0; i<zasobyTypListSize; i++)
                typy[i] = zasobyTypList.get(i);
             
            
            int salaTypListSize = salaTypList.size();
            String sTyp[] = new String[salaTypListSize];
            for (int i=0; i<salaTypListSize; i++)
                sTyp[i] = salaTypList.get(i);
            int idSize = osobyList.size();
            int tytsSize = tytList.size();
            
            String wyjsciea[] = new String[tytsSize];
            String osoby[] = new String[idSize];
            String wyjscie_tytul[] = new String[tytsSize];
            
            for (int i=0; i<tytsSize; i++)
                wyjsciea[i] = tytList.get(i).getTytul();
               
    
%>
    function zmienEmail(){
        if ($('#mailPracSprawdz').val()=="@mat.umk.pl"|| $('#mailPracSprawdz').val()=="")
            $('#mailPracSprawdz').val($('#login').val()+"@mat.umk.pl");
        sprawdzLogin();
        sprawdzEmailPracownika();
    }
         
            function sprawdzEmailPracownika(){
                $("#czyWolnyMailPracownika").val("ok");
                document.getElementById('czyWolnyMailImg').src = "http://icons.iconarchive.com/icons/led24.de/led/16/accept-icon.png";
                
                <% 
                    
                    for (int i=0; i<osobyEmail.size(); i++){
                    %>
                            
                        if ($("#mailPracSprawdz").val()=="<%=osobyEmail.get(i)%>"){
                            $("#czyWolnyMailPracownika").val("err");
                            document.getElementById('czyWolnyMailImg').src = "http://3.bp.blogspot.com/_fa3UixqoaSg/TE2kQpcVWLI/AAAAAAAAAmA/wDH1fNtPXnw/s320/rejected.gif";
                        }
                <%  }
                %>
                        czyMoznaDodac();
            }
            
            function sprawdzLogin(){
                $('#czyWolnyLoginPracownika').val("ok");
                document.getElementById('czyWolnyLoginImg').src = "http://icons.iconarchive.com/icons/led24.de/led/16/accept-icon.png";
                
                <% 
                    
                    for (int i=0; i<osobyList.size(); i++){
                    %>
                            
                        if ($("#login").val()=="<%=osobyList.get(i).getLogin()%>"){
                            $("#czyWolnyLoginPracownika").val("err");
                            document.getElementById('czyWolnyLoginImg').src = "http://3.bp.blogspot.com/_fa3UixqoaSg/TE2kQpcVWLI/AAAAAAAAAmA/wDH1fNtPXnw/s320/rejected.gif";
                        }
                <%  }
                %>
                        czyMoznaDodac();
            }
        
            function czyMoznaDodac(){
                if ($("#czyWolnyMailPracownika").val()=="err" || $("#czyWolnyLoginPracownika").val()=="err")
                    document.getElementById('button1').disabled = true;
                else
                    document.getElementById('button1').disabled = false;
            }
        
            
                        </script> <script>
                        
            <%
                    
          
                    
   
            %>
                var tabaTytuly = new Array();   
            <%
                 for (int i=0; i<tytsSize; i++)
                 {
            %> 
                tabaTytuly[<%=tytList.get(i).getId()%>]="<%=tytList.get(i).getTytul()%>";
            <% } %>
                     
            function uzupelnij(){
                var a = $("#pobranytyt").val();
                $("#poletytulu").val(tabaTytuly[a]);
                   
            }
                        </script><script>
        
            <%
               
            int wyjscie1[] = new int[idSize];    
            for (int i=0; i<idSize; i++)
                osoby[i] = osobyList.get(i).getImie() + " ".concat(osobyList.get(i).getNazwisko());
            
                %>
            var tab= new Array();
            var tabimie= new Array();
            var tabnazwisko= new Array();
            var Os = new Array();
            var tabemail= new Array();
            var tabtytul= new Array();
            var tablogin= new Array();
            var tabtelefon= new Array();
            
            <jsp:useBean id="obj" class="baza.DaneOsoby" type="baza.DaneOsoby"/>
           <%
            for (int i=0; i<idSize; i++)
           {
               
           %>
               
              tab[<%=osobyList.get(i).getId()%>]="<%=osobyList.get(i).getImie()%>";
              tabimie[<%=osobyList.get(i).getId()%>]="<%=osobyList.get(i).getImie()%>";
              tabnazwisko[<%=osobyList.get(i).getId()%>]="<%=osobyList.get(i).getNazwisko()%>";
              tabtytul[<%=osobyList.get(i).getId()%>]="<%=osobyList.get(i).getTytul().getTytul()%>";
              tabemail[<%=osobyList.get(i).getId()%>]="<%=osobyList.get(i).getEmail()%>";
              Os[<%=osobyList.get(i).getId()%>]="<%=osobyList.get(i).getImie()+" ".concat(osobyList.get(i).getNazwisko())%>";
              tabtelefon[<%=osobyList.get(i).getId()%>]="<%=osobyList.get(i).getTelefon()%>";
              tablogin[<%=osobyList.get(i).getId()%>]="<%=osobyList.get(i).getLogin()%>";
                 
                  <%
           }
            %>
                  
        function uzup(){   
            var b = $("#formul_selek").val();
                $("#imie").val(tabimie[b]);
                $("#nazwisko").val(tabnazwisko[b]);
                $("#tytul_select").val(tabtytul[b]);
                $("#login1").val(tablogin[b]);
                $("#email").val(tabemail[b]);
                $("#telefon").val(tabtelefon[b]);

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
		<li><a href="#tabs-1">Dodawanie</a></li>
                <li><a href="#tabs-2">Usuwanie</a></li> 
                 <li><a href="#tabs-3">Edytowanie</a></li> 
                
	</ul>

<div id="tabs-1">

<div id="accordion">
    
    <h3>Dodaj osobę</h3>
<div>
<form id="dodajosobe" method="">
    <table class="odstepy">
        <tr>
            <td>Imię:</td>
            <td><input type="text" name="imie" class="ui-corner-all" required/><i></i></td>
        </tr>
        <tr>
            <td>Nazwisko:</td>
            <td><input type="text" name="nazwisko" class="ui-corner-all" required/><i></i></td>
        </tr>
        <tr>
            <td>Tytuł:</td>
            <td>
                
                <select name="tytul" class="ui-corner-all" style="width:162px;" required> 
                    <option value=""/>        
                    <% for (Tytuly t: tytList){
                    %> 
                <option value="<%=t.getId()%>"><%=t.getTytul()%></option>
                <%

                }%>
                </select></td>
        </tr>

        <tr>
            <td>Login: </td>
            <td><input id="login" type="text" name="login" class="ui-corner-all" onchange="zmienEmail()" required/> 
                <input type="hidden" id="czyWolnyLogin" value=""/>
                <image id="czyWolnyLoginImg" src=""/>
            </td>
        </tr>
        <tr>
        <td>Email:</td> 
        <td><input type="text" id="mailPracSprawdz" name="email" class="ui-corner-all" onchange="sprawdzEmailPracownika()" required value="@mat.umk.pl"/>
            <input type="hidden" id="czyWolnyMailPracownika" value="" required/>
            <image id="czyWolnyMailImg" src=""/>
        
        </td>
        </tr>
        <tr>
            <td>Telefon: </td>
            <td><input type="text" name="telefon" class="ui-corner-all" /><i></i></td>
        </tr>
      
        <tr></td></td>
            <td></td>
        </tr>
    </table>
        <br></br>
        <input id="button1" type="submit" value="Dodaj"/>
        </form>


</div>
<h3>Dodaj tytuł</h3>
<div>
    <form id="dodajtytul" method="">
        <table class="odstepy">
            <tr>
                <td>Tytuł:</td>
                <td>
                    <input type="text" name="tytul" class="ui-corner-all"/>
                </td>
            </tr>
            
        </table> 
        <br></br>
        <input id="button" type="submit" value="Dodaj"/>
    </form>
</div>

</div>
</div>
<div id="tabs-2">
<div id="accordion1">
<h3>Usuń tytuł</h3>
<div>
    
<form id="usuntytul" method="">
    <table class="odstepy">
        <tr>
            <td>Tytuł:</td>
            <td>
                <select name="tytul" id="ustytul" class="ui-corner-all" style="width:162px;">
                        <option value=""/>
                        
                        <% for (Tytuly t: tytList){
                            %> 
                        <option value="<%=t.getId()%>"><%=t.getTytul()%></option>
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


 <h3>Usuń osobę</h3>
<div>
   
<form id="usunosobe" method="">
            Osoba: <select name="osoba" class="ui-corner-all" style="width:162px;">
                        <option value=""/>
                        <% for (Osoby oso: osobyList){
                            %> 
                        <option value="<%=oso.getId()%>"><%=oso.getNazwisko()+" "+oso.getImie()%></option>
                        <%
                        }%>
                </select></br>
                <br></br>
                            <input id="button9" type="submit" value="Usuń"/>
        </form>
</div>
</div>
</div>


<div id="tabs-3">
<div id="accordion1">
<h3>Edytuj tytuł</h3>
<div>
<form ID="formularz_tytul">
        <table class="odstepy">
            <tr>
                <td>Tytuł:</td>
                <td><select id="pobranytyt" name="pobranytyt" onchange="uzupelnij();" class="ui-corner-all" style="width:162px;">
                            <option value=""/>
                             <% for (Tytuly t: tytList){
                            %> 
                        <option value="<%=t.getId()%>"><%=t.getTytul()%></option>
                        <%
                        }%>
                        </select>
                </td>
            </tr>
            <tr>
                <td>Tytuł:</td>
                <td><input id="poletytulu" name="poletytulu" value="" type="text" class="ui-corner-all"></td>
            </tr>
                    
        </table>
                        <br></br>
                        <input id="button4" type="submit" value="Zapisz" class="ui-corner-all">
    </form>
</div>
<h3>Edytuj osobę</h3>
<div>
<form id="formularz" >
            
    <table class="odstepy">
        <tr>
            <td>Osoba: </td>
            <td><select id="formul_selek" name="formul_selek" onchange="uzup();" class="ui-corner-all">
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
                    <td>Imie:</td>
                    <td><input id="imie" value="" name="imie" type="text" class="ui-corner-all"/></td>
                    <td><i></i></td>
                </tr>
                <tr>
                    <td>Nazwisko:</td>
                    <td><input id="nazwisko" name="nazwisko" value="" type="text" class="ui-corner-all"/></td>
                    <td><i></i></td>
                </tr>
                <tr>
                    <td>Tytuł:</td>
                  <td> <select name="tytul_sel" id="tytul_select" class="ui-corner-all" style="width:162px;">
                          <option value=""/>  
                          <c:forEach items="<%=wyjsciea%>" var="tyt">
                                <option value="${tyt}">${tyt}</option>
                            </c:forEach>
                   </select>
                </td>
                    <td><i></i></td>
                </tr>
                <tr>
                    <td>Login:</td>
                    <td><input id="login1" name="login" value="" type="text" class="ui-corner-all" class="ui-corner-all"/></td>
                    <td><i></i></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input id="email" name="email" value="" type="text" class="ui-corner-all"/></td>
                    <td><i></i></td>
                </tr>
                <tr>
                    <td>Telefon:</td>
                    <td><input id="telefon" name="telefon" value="" type="text" class="ui-corner-all"/></td>
                    <td><i></i></td>
                </tr>
               
            </table>
            <br></br>
   
    <input id="button7" type="submit" value="Zapisz" class="ui-corner-all"/>
        </form>
</div>






	


</div>
</div>
</div>
        
<!--Dodawanie pracownika-->




         
            
           
            
           <div id="ostrzezenie" title="Powiadomienie" align="center">
               <p><b><label id="ostrzezenie1Komunikat"></label></b></p>
 </div> 
            


<div id="dialog" title="Basic dialog">
<p>Dodano pomyslnie</p>
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
                   // $("#radio3").removeClass("");
			//	$("#radio3").addClass("ui-button ui-widget ui-state-default ui-button-text-only ui-corner-right");
				$("#srsz_lewy_maly").hover(pokaz_lewy,ukryj_lewy);
				$("#menu-2").show();
				
				var w=$("#menu-2").width();
				$("#menu-2").hide();
				$("#menu-2").css("margin-left",-w);
		});
</script>



<script>
    var dodajOsobaAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajOsobaAkcja.jsp" /></portlet:resourceURL>";
    var dodajZasobAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajZasobAkcja.jsp" /></portlet:resourceURL>";
    var dodajTytulAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajTytulAkcja.jsp" /></portlet:resourceURL>";
    var usunTytulAkcja ="<portlet:resourceURL><portlet:param name="jspPage" value="/usunTytulAkcja.jsp" /></portlet:resourceURL>";
    var usunOsobaAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/usunOsobaAkcja.jsp" /></portlet:resourceURL>";
    var updateTytulAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/updateTytulAkcja.jsp" /></portlet:resourceURL>";
    var updateOsobaAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/updateOsobaAkcja.jsp" /></portlet:resourceURL>";
</script>




</html>
