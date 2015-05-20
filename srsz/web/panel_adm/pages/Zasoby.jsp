<%@page errorPage="/WEB-INF/error.jsp"%> 
<%@page import="baza.DaneOsoby"%>
<%@page import="baza.Osoby"%>
<%@page import="baza.DaneTytul"%>
<%@page import="baza.Tytuly"%>
<%@page import="baza.DaneZasobOpis"%>
<%@page import="baza.ZasobOpis"%>
<%@page import="baza.ZasobOpis"%>
<%@page import="baza.DaneSalaTyp"%>
<%@page import="baza.SalaTyp"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneZasobyTyp"%>
<%@page import="baza.ZasobyTyp"%>
<%@page import="baza.DaneZasobyTyp"%>
<%@page import="java.util.List"%>
<%@page import="baza.ZasobyTyp"%>
<%@page import="baza.Zasob"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="baza.DaneZasob"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
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
               

            boolean admin = upraOs.czyAdmin(dOsoby.znajdzPoLoginie(u.getScreenName().toString()));
            if (!admin) return;
            

%>
    <% 
        List<Zasob> zasobyList = DaneZasob.selectZasoby();
        List<ZasobyTyp> zasobyTypList = DaneZasobyTyp.selectTypy();
        List<SalaTyp> saleList = DaneSalaTyp.selectSala();
        List<SalaTyp> saleNDList = DaneSalaTyp.selectbezND(); 
        List<ZasobOpis> zasobOpisList = DaneZasobOpis.selectZasobOpis();
        baza.DaneSalaTyp st = new baza.DaneSalaTyp();
        int x =0 ;
        int zasobOpisSize = zasobOpisList.size();
        int zasobySize = zasobyList.size();
        int saleSize = saleList.size();
        int zasobyTypSize = zasobyTypList.size();
        String zasobOpis[] = new String[zasobOpisSize];
        String typyZasobow[] = new String[zasobyTypSize];
        String sale[] = new String[saleSize];
        String zasoby[] = new String[zasobySize];
        
        for (int i=0; i<zasobOpisSize; i++)
                zasobOpis[i] = zasobOpisList.get(i).getId_zasob().getNazwa()+" - "+zasobOpisList.get(i).getOpis();       
        
        for (int i=0; i<saleSize; i++)
                sale[i] = saleList.get(i).getOpis();
        for (int i=0; i<zasobyTypSize; i++)
                typyZasobow[i] = zasobyTypList.get(i).getOpis();
        for (int i=0; i<zasobySize; i++)
                zasoby[i] = zasobyList.get(i).getNazwa();
    %>
                
        var nazwaZasobu= new Array();
        var salaOpis= new Array();
        var zasobOpis= new Array();
          
        <%
            for (int i=0; i<zasobySize; i++)
            {
        %> 
                nazwaZasobu[<%=zasobyList.get(i).getId()%>]="<%=zasobyList.get(i).getNazwa()%>";
                salaOpis[<%=zasobyList.get(i).getId()%>]="<%=zasobyList.get(i).getId_sala().getOpis()%>";
                zasobOpis[<%=zasobyList.get(i).getId()%>]="<%=zasobyList.get(i).getId_typ().getOpis()%>";
        <%  
            } 
        %>
        var zasobyTypOpis= new Array();     
        <%
            for (int i=0; i<zasobyTypSize; i++)
            {
        %> 
                zasobyTypOpis[<%=zasobyTypList.get(i).getId()%>]="<%=zasobyTypList.get(i).getOpis()%>";
        <%  
            } 
        %>
function opisowka(){
        var a = $("#wybranyzasob").val();
                $("#nazwa").val(nazwaZasobu[a]);
                $("#zasob_select").val(zasobOpis[a]);
                $("#sala_select").val(salaOpis[a]);
         
}
        
function opisowkazasob(){
    var zasobyTypOpis= new Array();     
        <%
            for (int i=0; i<zasobyTypSize; i++)
            {
        %> 
                zasobyTypOpis[<%=zasobyTypList.get(i).getId()%>]="<%=zasobyTypList.get(i).getOpis()%>";
        <%  
            } 
        %>
                
        var a = $("#opistyp").val();
                $("#zasob_typ").val(zasobyTypOpis[a]);
            
}
function sprawdzOpisZasobu(){
                document.getElementById('czyWolne').src = "http://icons.iconarchive.com/icons/led24.de/led/16/accept-icon.png";
                $("#czyEdytowalny").val("ok");
                $("#opis").val($("#zasobopis").val());
                <% 
                    
                    for (int i=0; i<zasobOpisList.size() ; i++){
                    %>
                            
                        if ($("#zasobopis").val()=="<%=zasobOpisList.get(i).getId_zasob().getId()%>"){
                            $("#czyEdytowalny").val("err");
                            document.getElementById('czyWolne').src = "http://3.bp.blogspot.com/_fa3UixqoaSg/TE2kQpcVWLI/AAAAAAAAAmA/wDH1fNtPXnw/s320/rejected.gif";
                        }
                <%  }
                %>
                        czyMoznaDodac();
            }
            
            
 function czyMoznaDodac(){
                if ($("#czyEdytowalny").val()=="err")
                    document.getElementById('button2').disabled = true;
                else
                    document.getElementById('button2').disabled = false;
            }
        function ukrywanie() {

                if (!$("#typ").val()=="Sala") {
                    <%= x=0 %>
                    $("#salat").val(<%=st.selectPoNazwieID("Nie dotyczy")%>);
                    document.getElementById('salat').disabled = true;                               
                                
                }
                else
                {
                    document.getElementById('salat').disabled = false; 
                    <%= x=1%>
                }
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
<h3>Dodaj zasób</h3>
<div>

<form id="dodajzas" method="">
    <table class="odstepy">
        <tr>
            <td>Typ:</td>
            <td><select name="typ" id="typ" class="ui-corner-all" style="width:162px; " onchange="ukrywanie()">
                    <option value=""/>    
                    <c:forEach items="<%=typyZasobow%>" var="typ">
                        <option><c:out value="${typ}"/></option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>Typ sali:</td>
<%
//         if(x==1){
 %>            
            
            <td>
                <select name="salatyp" id="salat" class="ui-corner-all" style="width:162px;">
                    <option value=""/>        
                    <% for (SalaTyp s: saleNDList){
                            %> 
                        <option value="<%=s.getId()%>"><%=s.getOpis()%></option>
                        <%
                        }%>    
                </select>
            </td>
<% //} else { %>
            <td>
              <input name="salatyp" type="hidden" value="<%=st.selectPoNazwieID("Nie dotyczy")%>"/>
     </td>
            
            
            <% //} %>
        </tr>
        <tr>
            <td>Nazwa:</td> 
            <td>
                <input type="text" name="nazwa" class="ui-corner-all"/>
            </td>
        </tr>
        <tr>
            
        </tr>
    </table>
        <br></br>
        <input id="button1" type="submit" value="Dodaj"/>
</form>
</div>
<h3>Dodaj opis zasobu</h3>
<div>
    <form id="dodajopiszas" method="">
        <table class="odstepySrednie">
            <tr>
                <td>Zasób:</td>
                <td>
                    <select name="zasobopis" id="zasobopis" class="ui-corner-all" style="width:162px;" onchange="sprawdzOpisZasobu()">
                        <option value=""/>
                            <%
                            for(Zasob z: zasobyList){
                            %>
                            <option value="<%=z.getId()%>"><%=z.getNazwa()%></option>
                            <%
                            }
                            %>
                    </select>
                    <image id="czyWolne" src=""/>
                </td>
            </tr>
            <tr>
                <td>Ilosc miejsc:</td>
                <td>
                    <input type="number" name="ilosc" class="ui-corner-all"/>
                    <input type="hidden" id="czyEdytowalny" name="czyEdytowalny" class="ui-corner-all"/>
                    
                </td>
            </tr>
            <tr>
                <td>Opis:</td>
                <td>
                    <input type="text" name="opis" class="ui-corner-all"/>
                </td>
            </tr>
            <tr>
                
            </tr>
        </table>
                    <br></br>
                    <input id="button2" type="submit" value="Dodaj"/>
    </form>
</div>

<h3>Dodaj typ zasobu</h3>
<div>
    <form id="dodajopiszastyp" method="">
      <table class="odstepy">
          <tr>
              <td>Opis:</td>
              <td>
                  <input type="text" name="opis" class="ui-corner-all"/>
              </td>
          </tr>
          <tr>
            
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
<h3>Usuń zasób</h3>
<div>
 <form id="usunzas" method="">
     <table class="odstepy">
         <tr>
             <td>Zasób:</td>
             <td>
                <select name="zasob" class="ui-corner-all" style="width:162px;">
                            <option value=""/>
                            <%
                            for(Zasob z: zasobyList){
                            %>
                            <option value="<%=z.getId()%>"><%=z.getNazwa()%></option>
                            <%
                            }
                            %>
                </select>
             </td>
         </tr>
         <tr>
           
         </tr>
    </table>
                <br></br>
                <input id="button4" type="submit" value="Usuń"/>
</form>
</div>
<h3>Usuń opis zasobu</h3>
<div>
 <form id="usunopiszas" method="">
     <table class="odstepySrednie">
         <tr>
             <td>Typ zasobu:</td>
             <td>
                <select name="zasopis" class="ui-corner-all" style="width:162px;">
                            <option value=""/>
                            <%
                            for(ZasobOpis z: zasobOpisList){
                            %>
                            <option value="<%=z.getId()%>"><%=z.getOpis()%></option>
                            <%
                            }
                            %>
                </select>
             </td>
         </tr>
         <tr>
             
         </tr>
     </table>
                <br></br>
                <input id="button5" type="submit" value="Usuń"/>
</form>
</div>

<h3>Usuń typ zasobu</h3>
<div>
<form id="usunzastyp" method="">
    <table class="odstepy">
            <tr>
                    <td>Typ:</td>
                    <td><select id="opis" name="zastyp" class="ui-corner-all" style="width:162px;">
                            <option value=""/>
                            <%
                            for(ZasobyTyp z: zasobyTypList){
                            %>
                            <option value="<%=z.getId()%>"><%=z.getOpis()%></option>
                            <%
                            }
                            %>
                        </select>
                   </td>   
            </tr>
            <tr>
                
            </tr>
    </table>
                        <br></br>
                        <input id="button6" type="submit" value="Usuń"/>
</form>
</div>

</div>
</div>



<div id="tabs-3">
<div id="accordion1">
<h3>Edytuj zasób</h3>
<div>
    <form  ID="formularz_zasob" >
        <table class="odstepySrednie">
                <tr>
                    <td>Zasób:</td>
                    <td><select id="wybranyzasob" name="wybranyzasob" onchange="opisowka();" class="ui-corner-all" style="width:162px;">
                            <option value=""/>
                            <% for (Zasob t: zasobyList){
                            %> 
                        <option value="<%=t.getId()%>"><%=t.getNazwa()%></option>
                        <%
                        }%>
                        </select>
                   </td>
                </tr>
                <tr>
                    <td>Typ zasobu:</td>
                    <td><select id="zasob_select" name="zasob_select" class="ui-corner-all" style="width:162px;" >
                            <c:forEach items="<%=typyZasobow%>" var="zt">
                                <option value="${zt}">${zt}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Typ sali:</td>
                    <td>
                        <select id="sala_select" name="sala_select" class="ui-corner-all" style="width:162px;">
                            <c:forEach items="<%=sale%>" var="sala">
                                    <option value="${sala}" >${sala}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Nazwa:</td>
                    <td><input id="nazwa" name="nazwa" value="" class="ui-corner-all" type="text"/></td>
                </tr>
                 <tr>
                  
                </tr>
        </table>
                        <br></br>
                        <input id="button7" type="submit" value="Zapisz"/>
    </form>
        
</div>



<h3>Edytuj typ zasobu</h3>
<div>
   <form ID="formularz_zasoby_typ">
            
            <table class="odstepy">
                <tr>
                    <td>Typ:</td>
                    <td><select id="opistyp" name="opistyp" onchange="opisowkazasob();" class="ui-corner-all" style="width:162px;">
                            <option value=""/>
                                    <% for (ZasobyTyp t: zasobyTypList){
                                    %> 
                                <option value="<%=t.getId()%>"><%=t.getOpis()%></option>
                                <%
                                }%>
                        </select>
                   </td>
                </tr>
                <tr>
                    <td>Opis:</td>
                    <td><input id="zasob_typ" name="zasob_typ" value="" type="text" class="ui-corner-all"/></td>
                </tr>
                <tr>
                    
                </tr>
            </table>
                        <br></br>
                        <input id="button8" type="submit" value="Zapisz"/>
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
<script src="/srsz/panel_adm/pages/Zasoby.js"></script>
<script>
    
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
var dodajZasobAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajZasobAkcja.jsp" /></portlet:resourceURL>";
var dodajZasobOpisAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajZasobOpisAkcja.jsp" /></portlet:resourceURL>";
var usunZasobTypAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/usunZasobTypAkcja.jsp" /></portlet:resourceURL>";
var dodajZasobTypAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajZasobTypAkcja.jsp" /></portlet:resourceURL>";
var usunZasobAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/usunZasobAkcja.jsp" /></portlet:resourceURL>";
var usunZasobOpisAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/usunZasobOpisAkcja.jsp" /></portlet:resourceURL>";
var updateZasobyTypAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/updateZasobyTypAkcja.jsp" /></portlet:resourceURL>";
var updateZasobAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/updateZasobAkcja.jsp" /></portlet:resourceURL>";
    
</script>





</html>
