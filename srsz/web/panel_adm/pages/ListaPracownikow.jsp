<%@page errorPage="/WEB-INF/error.jsp"%> 
<%@page import="java.util.List"%>
<%@page import="baza.DaneOsoby"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="baza.Osoby"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<!doctype html>
<html lang="pl">
<head>
	<meta charset="utf-8">
	<title>jQuery UI Example Page</title>
	<link href="/srsz/panel_adm/pages/jquery-ui.css" rel="stylesheet">
        <link href="/srsz/panel_adm/pages/Style.css" rel="stylesheet">
        <style>
            .tabelka{
                
            }
            .tabelka tr:nth-child(odd){
                background-color: #aed0ea;
            }
            .tabelka tr{
                border: 1px solid #aed0ea;
            }
            .tabelka tr:nth-child(even){
                background-color: #bce8f1;
                padding: 5px;
            }
            .tabelka td{
                width: 190px;
            }
        </style>
	
      
</head>

<zawartosc_strony>             
        <script>
            function ustawWidocznoscReszty(){
                if (document.getElementById('dodawanieOdkryj').className=="wcisniety"){
                    document.getElementById('zao').style.display="inline";
                    document.getElementById('stac').style.display="inline";
                    document.getElementById('opisZakres').style.display="inline";
                }
                else{
                    document.getElementById('zao').style.display="none";
                    document.getElementById('stac').style.display="none";
                    document.getElementById('opisZakres').style.display="none";
                }
                    
            }
            
            <%
                DaneOsoby daneOsoby = new DaneOsoby();
                List<Osoby> osobyLista = daneOsoby.selectOsoby();
            %>
                function pokazUkryj(id){
                    var przycisk =document.getElementById("pokazUkryjButton"+id);
                    if (przycisk.value=="Pokaż") przycisk.value="Ukryj ";
                        else przycisk.value="Pokaż";
                    var wiersz = document.getElementById("ukryty"+id+'L');
                    if (wiersz.style.display=='') ukryj(id);
                    else pokaz(id);
                }
                function pokaz(id) {
                    var wierszL = document.getElementById("ukryty"+id+'L');
                    var wierszE = document.getElementById("ukryty"+id+'E');
                    var wierszT = document.getElementById("ukryty"+id+'T');
                    wierszL.style.display = '';
                    wierszE.style.display = '';
                    wierszT.style.display = '';
                }

                function ukryj(id) {
                    var wierszL = document.getElementById("ukryty"+id+'L');
                    var wierszE = document.getElementById("ukryty"+id+'E');
                    var wierszT = document.getElementById("ukryty"+id+'T');
                    wierszL.style.display = 'none';
                    wierszE.style.display = 'none';
                    wierszT.style.display = 'none';
                }
                
                function usunOsoba(id){
                    $.ajax({
                        url:"<portlet:resourceURL><portlet:param name="jspPage" value="/usunOsobaAkcja.jsp" /></portlet:resourceURL>",
                        type:'post',
                        data:'osoba='+id,
                        success:function(){
                           alert("usunieto!");
                            window.location.reload(true);
                        }
                    });
                }
            </script>
       
<!--Menu gorne -->

            <nav id="mainNav" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
                <div class="menu-item">
                    <input type="radio" id="radio1" name="menu"/><label for="radio1"><a href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/ZarzadzajBaz.jsp" /></portlet:renderURL>">Zarządzaj<br>bazą</a></br></a></label>
                </div>
               <div class="menu-item">
                   <input type="radio" id="radio2" name="menu" checked /><label for="radio2"><a href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Zarzadzaj.jsp" /></portlet:renderURL>">Uprawnienia</a></label>
                </div>
                <div class="menu-item">
                    <input type="radio" id="radio3" name="menu" /><label for="radio3"><a href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Semestry.jsp" /></portlet:renderURL>">Semestry</a></label>
                </div>
                <div class="menu-item">
                    <input type="radio" id="radio4" name="menu" /><label for="radio4">Ustawienia</label>
                </div>
               
        </nav>



<!-- Menu boczne -->

<ul style="width:200px;float:left;"id="menu">
<li class="ui-widget-header" style="vertical-align:middle;" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSzybki Dostęp</li>

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

<div id="tabs" style="width:625px;height:450px;display:inline-block; margin-left:10px; box-shadow: 10px 10px 5px #888888;">
    <ul>
        <li><a href="#tabs-1">Lista pracowników</a></li>
    </ul>
    <div id="tabs-1">
        <div id="tabela">
            <table class="tabelka">
                
            <%
                    for (Osoby osoba: osobyLista){
            %>
                <tr>
                    <td><%=osoba.getTytul().getTytul()%> <%=osoba.getImie()%> <%=osoba.getNazwisko()%></td>
                    <td><input type="button" id="pokazUkryjButton<%=osoba.getId()%>" onClick="pokazUkryj('<%=osoba.getId()%>'); return false;" value="Pokaż"></input>
                    <button onClick="pokazUkryj('ukryty<%=osoba.getId()%>'); return false;">Edytuj</button>
                    <input type="button" onClick="usunOsoba(<%=osoba.getId()%>)" value="Usuń"></input></td>
                    <td></td>
                </tr>
                <tr> <td><label id="ukryty<%=osoba.getId()%>L" style="display: none;">login: <%=osoba.getLogin()%></label></td>
                    <td><label id="ukryty<%=osoba.getId()%>E" style="display: none;">email: <%=osoba.getEmail()%></label></td>
                    <td><label id="ukryty<%=osoba.getId()%>T" style="display: none;">telefon: <%=osoba.getTelefon()%></label></td>
                </tr>
            <% } %>
            </table> 
        </div>
    </div>
</div>



<script src="/srsz/panel_adm/pages/external/jquery/jquery.js"></script>
<script src="/srsz/panel_adm/pages/jquery-ui.js"></script>
<script src="/srsz/panel_adm/pages/Zarzadzaj.js"></script>
</zawartosc_strony>

</html>
