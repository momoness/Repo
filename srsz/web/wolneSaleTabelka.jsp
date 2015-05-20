<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="baza.DaneRezerwacja"%>
<%@page import="baza.Rezerwacja"%>
<%@page import="baza.DaneOsoby"%>
<%@page import="baza.Osoby"%>
<%@page import="baza.DaneRezerwacjaTyp"%>
<%@page import="baza.RezerwacjaTyp"%>
<%@page import="baza.DaneProsba"%>
<%@page import="baza.Prosba"%>
<%@page import="baza.DaneZasobyTyp"%>
<%@page import="baza.ZasobyTyp"%>
<%@page import="baza.DaneZasob"%>
<%@page import="baza.Zasob"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneSalaTyp"%>
<%@page import="baza.SalaTyp"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="/WEB-INF/error.jsp"%> 
<%@page import="com.liferay.portal.service.persistence.PortletUtil"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@page import="com.liferay.portal.service.UserServiceUtil"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8' />

        <link rel='stylesheet' href='/srsz/js/cupertino/jquery-ui.min.css' />     
        <link href='/srsz/css/fullcalendar.css' rel='stylesheet' />
        <link href='/srsz/css/fullcalendar.print.css' rel='stylesheet' media='print' />
       
        <script src='/srsz/js/moment.min.js'></script>
        <script src='/srsz/js/jquery.min.js'></script>
         <script src="/srsz/js/jQuery.print.js"></script>
        <script src='/srsz/js/fullcalendar.min.js'></script>
        <script src='/srsz/jquery.simple-dtpicker.min.js'></script>
        <link href='/srsz/jquery.simple-dtpicker.css' rel='stylesheet' />
        <script src="/srsz/js/jquery.qtip.min.js"></script>
        <link href='/srsz/js/jquery.qtip.min.css' rel='stylesheet' />
        <script src="/srsz/js/jquery.ui.touch.min.js"></script>

        <script src='/srsz/js/pl.js'></script>
        <script src='/srsz/js/date.format.js'></script>
        <script src="/srsz/panel_adm/pages/jquery-ui.min.js"></script> 
         <script src="/srsz/panel_adm/pages/pace.min.js"></script>
         <link href='/srsz/panel_adm/pages/pace-theme-loading-bar.css' rel='stylesheet'/>
         <script src="/srsz/js/datepicker.js"></script>

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
                width: 85px;
            }
        </style>
        <style>
		#lista_sal{
			width: 800px;
			}
		.lista_sal_nazwa, .lista_sal_nazwa_header{
			width: 76px;
			display: inline-block;
			text-align: center;
			line-height: 40px;
			float: left;
		}
		.lista_sal_nazwa{
			height: 40px;
			}
		.lista_sal_nazwa_header{
			height: 20px;
                        line-height: 20px;
		}
		
		
		.lista_sal_row, lista_sal_header{
			border-bottom: 1px solid #e0e0e0;
		}
		.lista_sal_row{
			height: 40px;
		}
		.lista_sal_header{
			height: 20px;
		}
		
		.lista_sal_elementy{
                        opacity: 0.8;
			width: 720px;
			height: 40px;
			display: inline-block;
			position:relative;
			float: left;
			background-image: url('/srsz/pliki/sale_maska.jpg');
		}
		.lista_sal_elementy_header{
			width: 720px;
			height: 20px;
			display: inline-block;
			position:relative;
			float: left;
		
		}
		.lista_sal_elementy_header> div{
			float: left;
			width: 59px;
			height: 20px;
			text-align:center;
			border-left: 1px solid #808080;
		}
		.lista_sal_elementy_header> div:last-of-type{
			border-right: 1px solid #808080;
			width: 58px;
		}
		
		.lista_sal_rezw{
			position:absolute;
			top: 0px;
                        overflow: hidden;
                        line-height: 13px;
			left: 0px;
			height: 40px;
			display: none;
                        color: #f0f0f0;
                        font-family: Verdana;
                        letter-spacing: 1px;
		}
		
		.lista_sal_rezw > div{
			font-size: 8px;
			line-height: 13px;
		}
		
		.backgr10{
			background-color: #e17878;
		}
		.backgr9{
			background-color: #9cbf8b;
		}
		.backgr8{
			background-color: #a08bbf;
		}
		.backgr7{
			background-color: #bfbaa8;
		}
		.backgr6{
			background-color: #99b5d1;
		}
		.backgr5{
			background-color: #FF0000;
		}
		
		
	</style>
         <style>
             table.tabelaDodawnieRezerwacji tr{
                 line-height:30px;
             }
              table.tabelaDodawnieRezerwacji td{
                 width: 175px;
             }
             </style>
             <script>
                 <%
    Integer zasobId=1;
                Integer usr;
            baza.DaneOsoby dOsoby = new baza.DaneOsoby();
            baza.Osoby bO = new baza.Osoby() ;
            baza.DaneUprawnienie dUprawnienie = new baza.DaneUprawnienie();
            baza.DaneUprawnienie du = new baza.DaneUprawnienie();
            baza.DaneUprawnienieOsoba upraOs = new baza.DaneUprawnienieOsoba();
            baza.DaneRezerwacjaTyp drt = new baza.DaneRezerwacjaTyp();
            List<baza.RezerwacjaTyp> rezerwacjaTypLista = drt.selectRezTyp();
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
                    System.out.println("Zalogowany jako: "+usr);
                } catch (Exception e) {
                    usr = null;
                }
               

            boolean x = upraOs.czyAdmin(dOsoby.znajdzPoLoginie(u.getScreenName().toString()));%>
             </script>


        <script>
            
            $('#niestandardowaProsba').on('click', function (e) {
                e.preventDefault();
                //npClick();
            });
            
            

            function print_calendar()
            {
                window.print();
                if (window.close()) {
                }
            }

        </script>
            <style>
                 #kalendarz{
                    opacity: 0;
    font-size: 21px;
    

    -webkit-transition: opacity 0.5s ease-in;
       -moz-transition: opacity 0.5s ease-in;
        -ms-transition: opacity 0.5s ease-in;
         -o-transition: opacity 0.5s ease-in;
            transition: opacity 0.5s ease-in;
                margin: 10px 10px;
                    padding: 0;
                    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
                    font-size: 12px;
                }

                
                @media print{
                #calendar {
                    max-width: 893px;
                    max-height: 893px	
                }
                }
                
                .blur {
    text-shadow: 0px 0px 20px #000000;
    opacity: 0.4;
}


#kalendarz.load {
    opacity: 1;
}

.przyciskii a{
  margin: 10px;
  }




            </style>
        </head>
        <div id="kalendarz">     


           <div id='przyciskii' style="line-height: 30px;">
                 <a id="button12" href="<portlet:renderURL><portlet:param name="jspPage" value="/kalendar.jsp" /></portlet:renderURL>">Rezerwacja</a>

            <!--<input type="checkbox" name="prosba" id="check" onclick="ukrywanie()"><label for="check" id="prosbaLabel">Prośba</label></input>
            <button id="niestandardowaProsba"  onclick="npClick()" style="display:none">Niestandardowa prośba</button>-->
            <a id="button2" href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/ZarzadzajBaz.jsp" /></portlet:renderURL>">Panel administracyjny</a>
            <a id="button9" href="<portlet:renderURL><portlet:param name="jspPage" value="/kalendarwla.jsp" /></portlet:renderURL>">Pracownicy</a>
            <a id="button10" href="<portlet:renderURL><portlet:param name="jspPage" value="/kalendarpla.jsp" /></portlet:renderURL>">Plany</a>
            <!--<a id="button11" href="<portlet:renderURL><portlet:param name="jspPage" value="/wolneSaleTabelka.jsp" /></portlet:renderURL>">Wolne sale</a>-->
            
            
    
            <%if (usr!=194){%> <a id="button14" href="<portlet:renderURL><portlet:param name="jspPage" value="/kalendarrez.jsp" /></portlet:renderURL>">Moje rezerwacje/prosby</a><%}%>
              <a id="button15" href="<portlet:renderURL><portlet:param name="jspPage" value="/kalendarrezspec.jsp" /></portlet:renderURL>">Rezerwacje specjalne</a>
                <!-- <a id="button3"  href="index.jsp">Strona główna</a> -->
           <!--<a id="button1" onclick="drukuj()">Drukuj</a>-->
           </div>
                
                
                <br>
                <center> DATA: <input type="text" name="poczatek" id="datepicker" align="left" class="ui-corner-all" /> </center>
                <br>
   <div id="lista_sal">
<%@include file="wolneSaleAJAX.jsp" %>
   </div>         
        <script>
            function napraw_sale(){
                     $(".lista_sal_rezw").each (function (){
                        var start=$(this).attr("start");
                        var koniec=$(this).attr("koniec");
                       
                        var ts=start.split(":");
                       
                        var sx=parseInt(ts[0]-8)*60+parseInt(ts[1]);
                       
                        ts=koniec.split(":");
                        var ex=parseInt(ts[0]-8)*60+parseInt(ts[1]);
                       
                        $(this).css("width",ex-sx);
                        $(this).css("left",sx);
                        $(this).show();
                });
            }
        $(document).ready(function (){
            $("#datepicker").val(new Date().format("yyyy-mm-dd"));
            napraw_sale();
                
                $( "#datepicker" ).datepicker({
              dateFormat: "yy-mm-dd",
            inline: true
        
        });
            $("#datepicker").change(
                    function (){
                       var dane=$(this).val();
                       $.ajax({
                           url:"<portlet:resourceURL><portlet:param name="jspPage" value="/wolneSaleAJAX.jsp"/></portlet:resourceURL>",
                           method:'post',
                           data: "&data="+dane,
                           success: function (msg){
                               $("#lista_sal").hide();
                               $("#lista_sal").html(msg);
                               napraw_sale();
                               $("#lista_sal").show('fade');
                           }
                       });
            })
        });
        
        </script>

        <script src="/srsz/pliki/sale_maska.jpg"></script> 
              
        </div>
                  
                  
<%@include file="wyborTygodnia.jsp" %>
    <script>

        
        

$(document).ready(function(){
    $.ajax({
                        url: '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/sprawdzCzyPosiadaUprawnienie.jsp" /></portlet:resourceURL>',
                        data:"user="+<%=usr%>+"&zasob="+13,
                        method:'post',
                        success:function (msg){
                            var dane=$.parseJSON(msg); 
                           if (dane.specjalne=="false" && !<%=x%>) $("#button15").hide();
                        }
                    });
                    if (!<%=x%>) $("#button2").hide();
$("#kalendarz").addClass("load");​
});

$( "#group" ).buttonset();

       function drukuj(){
                $("#calendar").print({
                   
                    globalStyles:true,

                    mediaPrint: false,

                    
                    iframe: false,

                  

                   

                    manuallyCopyFormValues: true,

                    deferred: $.Deferred()
                });
            }

        $("#check").button();

        $(document).ready(function () {
            

            $("#fc-content").on('click', 'img', function (event) {
                alert("KlikniÄ™to");
            });


            $("#button1").button({
                icons: {
                    primary: "ui-icon-print"
                }
            });

            $("#button2").button({
                icons: {
                    primary: "ui-icon-gear"
                }
            });

            $("#button3").button({
                icons: {
                    primary: "ui-icon-home"
                }
            });

            $("#button9").button({
                icons: {
                    primary: "ui-icon-person"
                }
            });

            $("#button10").button({
                icons: {
                    primary: "ui-icon-clock"
                }
            });


            $("#button11").button({
                icons: {
                    primary: "ui-icon-circle-zoomout"
                }
            });

            $("#button12").button({
                icons: {
                    primary: "ui-icon-bookmark"
                }
            });
            
            $("#button14").button({
                icons: {
                    primary: "ui-icon-bookmark"
                }
            });
            
             $("#button15").button({
                icons: {
                    primary: "ui-icon-star"
                }
            });
            
    });
    </script>