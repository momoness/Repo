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

         <style>
             table.tabelaDodawnieRezerwacji tr{
                 line-height:30px;
             }
              table.tabelaDodawnieRezerwacji td{
                 width: 175px;
             }
             ul.ui-menu {max-height: 200px !important;}
             
             </style>
        
        <script>
            $(document).ready(function () {
                zczytajUprawnienia();
            });
 
           <%
            Integer usr;
            baza.DaneOsoby dOsoby = new baza.DaneOsoby();
            baza.Osoby bO = new baza.Osoby() ;
            baza.DaneUprawnienie dUprawnienie = new baza.DaneUprawnienie();
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
               

            boolean x = upraOs.czyAdmin(dOsoby.znajdzPoLoginie(u.getScreenName().toString()));
               
        %>
            
            
             var pobierz;
             pobierz = 1;
            
        </script>



        <script>
            <% 
                baza.DaneKierunek dK = new baza.DaneKierunek();
                List<baza.Kierunek> kList = dK.selectKierunek();
                List<baza.Kierunek> kListND = dK.selectbezND();
            
            Integer zasobId=13;

            %>
                function zczytajUprawnienia(){
                    $.ajax({
                        url: '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/sprawdzCzyPosiadaUprawnienie.jsp" /></portlet:resourceURL>',
                        data:"user="+<%=usr%>+"&zasob="+$('#selectzasoby').val(),
                        method:'post',
                        success:function (msg){
                            var dane=$.parseJSON(msg); 
                            $('#uprawnienieZaoczne').val(dane.zaoczne);
                            $('#uprawnienieStacjonarne').val(dane.stacjonarne);
                           if (dane.specjalne=="false" && !<%=x%>) $("#button15").hide();
                           if ((dane.zaoczne=="true" && dane.stacjonarne=="true")|| <%=x%>) $("#niestandardowaProsba").hide();

                        }
                    });
                    if (!<%=x%>) $("#button2").hide();
                }
            function sprawdzCzyMozeDodac(dzien){
                //var odp;
                if (dzien=='N' || dzien=='So')
                     if ($('#uprawnienieZaoczne').val()=="true") return true;
                    else return false;
                else
                    if ( $('#uprawnienieStacjonarne').val()=="true") return true;
                    else  return false;
            }

            function czyJestWlascicielem(idOsoby) {
                if (idOsoby == <%=usr%>)
                    return true;
                else
                    return false;
            }

            $('#niestandardowaProsba').on('click', function (e) {
                e.preventDefault();
                npClick();
            });
            function ukrywanie() {

                if (document.getElementById("check").checked == true) {
                    document.getElementById("pows").style.display = 'none';
                    document.getElementById("pow").style.display = 'none';
                    document.getElementById("niestandardowaProsba").style.display = 'inline';
                }
                else {
                    document.getElementById("pow").style.display = 'inline';
                    document.getElementById("powOpis").style.display = 'inline';
                    document.getElementById("niestandardowaProsba").style.display = 'none';
                }
            }
            function npClick() {
                $("#dialog2").dialog("open");
                 $("#calendar").addClass("blur");
                  $("#przyciskii").addClass("blur");
                $('#button-P').on('click', function (e) {
                    e.preventDefault();
                    wyslijProsbe();
                });
            }
            function wyslijProsbe() {
                var start = document.getElementById("start2").value;
                var end = document.getElementById("end2").value;
                var title = document.getElementById("title2").value;
                //var id_zasob = document.getElementById("id_zasob2").value;
                var typ = document.getElementById("typ2").value;
                var id;

                start = start + ":00";
                end = end + ":00";
                    //alert('title=' + $("#title2").val() + '&start=' + start + '&end=' + end + '&id_zasob=' + $('#selectzasoby').val() + '&typ=' + $('#typ2').val() + '&wlasc=' + <%=usr%>);
                    $.ajax({
                        url: '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/dodajprosba.jsp" /></portlet:resourceURL>',
                        data: 'title=' + $("#title2").val() + '&start=' + start + '&end=' + end + '&id_zasob=' + $('#selectzasoby').val() + '&typ=' + $('#typ2').val() + '&wlasc=' + <%=usr%>,
                        type: "GET",
                        success: function () {
                            $("#ostrzezenie4").dialog("open");
                            
                            setTimeout(function () {
                                $("#ostrzezenie4").dialog("close");
                            }, 700);
                            $("#dialog2").dialog("close");
                            $('#start').handleDtpicker('destroy');
                            $('#koniec').handleDtpicker('destroy');
                        }
                    });

                //}
            }

            var started;
            var stopped;

            function print_calendar()
            {
                window.print();
                if (window.close()) {
                }
            }

            <%
                List<Zasob> zasList = DaneZasob.selectZasoby();
                List<ZasobyTyp> zastList = DaneZasobyTyp.selectTypy();
                List<SalaTyp> salaList = DaneSalaTyp.selectSala();
                List<Osoby> osobyList = DaneOsoby.selectOsoby();
                List<Osoby> osobyListbezUsera = DaneOsoby.selectOsobyBezUsera(u.getScreenName().toString());
                baza.DaneOsoby osob = new baza.DaneOsoby();
                List<RezerwacjaTyp> rezTList = DaneRezerwacjaTyp.selectRezTyp();
                baza.DaneZasobyTyp ZT = new baza.DaneZasobyTyp();
                baza.DaneRezerwacjaTyp rezerwacjaTyp = new baza.DaneRezerwacjaTyp();
                
                int tytSize = zasList.size();
                int rezTSize = rezTList.size();
                int salSize = salaList.size();
                int zasSize = zastList.size();
                int osSize = osobyList.size();

                String osoby[] = new String[osSize];
                baza.Zasob wyjscie[] = new baza.Zasob[tytSize];
                String wyjsciezt[] = new String[zasSize];
                String salaa[] = new String[salSize];
                String rezT[] = new String[rezTSize];

                /* for (int i=0; i<tytSize; i++)
                 wyjscie[i] = zasList.get(i);*/
                for (int i = 0; i < rezTSize; i++) {
                    rezT[i] = rezTList.get(i).getOpis();
                }

                for (int i = 0; i < salSize; i++) {
                    salaa[i] = salaList.get(i).getOpis();
                }
                for (int i = 0; i < zasSize; i++) {
                    wyjsciezt[i] = zastList.get(i).getOpis();
                }

                for (int i = 0; i < osSize; i++) {
                    osoby[i] = osobyList.get(i).getTytul().getTytul() + " ".concat(osobyList.get(i).getNazwisko() + " ".concat(osobyList.get(i).getImie()));
                }
            %>

            var nazwa = new Array();
            var zas = new Array();
            var sal = new Array();

            <%
                for (int i = 0; i < tytSize; i++) {
            %>

            nazwa[<%=zasList.get(i).getId()%>] = "<%=zasList.get(i).getNazwa()%>";
            sal[<%=zasList.get(i).getId()%>] = "<%=zasList.get(i).getId_sala().getOpis()%>";
            zas[<%=zasList.get(i).getId()%>] = "<%=zasList.get(i).getId_typ().getOpis()%>";

            <% } %>


            function sprawdz_wlasc()
            {
            <%
                List<Rezerwacja> rezList = DaneRezerwacja.selectRezerwacja();
                int rezSize = rezList.size();
                String reprezentant[] = new String[rezSize];
                int tenId;
                Format sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
                for (int i = 0; i < rezSize; i++) {
                    tenId = rezList.get(i).getWlasciciel().getId();
                    reprezentant[i] = Integer.toString(tenId);
                }

            %>

                var wlasc;
                var temp;
                var b = $("#wlasc1").val();
                var c;
                var firstDateStart = started;
                var firstDateEnd = stopped;
            <%                   for (int i = 0; i < osSize; i++) {
            %>
                c = "<%=osobyList.get(i).getTytul().getTytul() + " ".concat(osobyList.get(i).getNazwisko() + " ".concat(osobyList.get(i).getImie()))%>";
                if (c == b)
                {
                    wlasc =<%=osobyList.get(i).getId()%>;
                }
            <% } %>
                var d = "t";
            <%

                for (int i = 0; i < rezSize; i++) {
            %>

                if (d == "t") {
                    temp = "<%=reprezentant[i]%>";
                    var secDateStart = "<%=sdf.format(rezList.get(i).getStart())%>";
                    var secDateEnd = "<%=sdf.format(rezList.get(i).getKoniec())%>";

                    if (temp == wlasc) {
                        if (firstDateStart < secDateStart) {
                            if (firstDateEnd > secDateStart)
                                d = "n";
                        }
                        else
                        if (firstDateStart < secDateEnd)
                            d = "n";

                    }
                }
            <%
                }

            %>
                if (d == "t") {
                    $("#uwaga").val("wolny");
                }
                else
                    $("#uwaga").val("zajÄ™ty");




            }

            function sprawdz_zas()
            {
            <%                  for (int i = 0; i < rezSize; i++) {
                    tenId = rezList.get(i).getId_zasob().getId();
                    reprezentant[i] = Integer.toString(tenId);
                }

            %>
                var zasobik;
                var temp;
                var b = $("#id_zasob1").val();
                var c;
                var firstDateStart = started;
                var firstDateEnd = stopped;
            <%                   for (int i = 0; i < rezSize; i++) {
            %>
                c = "<%=rezList.get(i).getId_zasob().getNazwa()%>";
                if (c == b)
                {
                    zasobik ="<%=rezList.get(i).getId_zasob().getId()%>";

                }
            <% } %>
                var z = "t";
            <%

                for (int i = 0; i < rezSize; i++) {
            %>

                if (z == "t") {
                    temp = "<%=reprezentant[i]%>";
                    var secDateStart = "<%=sdf.format(rezList.get(i).getStart())%>";
                    var secDateEnd = "<%=sdf.format(rezList.get(i).getKoniec())%>";

                    if (temp == zasobik) {
                        if (firstDateStart < secDateStart) {
                            if (firstDateEnd > secDateStart)
                                z = "n";
                        }
                        else
                        if (firstDateStart < secDateEnd)
                            z = "n";

                    }
                }
            <%
                }

            %>
                if (z == "t") {
                    $("#uwagazas").val("wolny");
                }
                else
                    $("#uwagazas").val("zajÄ™ty");




            }


            function opisowka()
            {
                var a = $("#wybranyzasob").val();
                var b;
            <%                    for (int i = 0; i < tytSize; i++) {
            %>

                b = "<%=zasList.get(i).getNazwa()%>";
                if (a == b) {
                    b =<%=zasList.get(i).getId()%>;
                    //wyslijzasob(b);
                    $("#nazwa").val(nazwa[b]);
                    $("#ktoryID").val(b);
                    $("#zasob_select").val(zas[b]);
                    $("#sala_select").val(sal[b]);
                }
            <% } %>

            }

            function getid(id) {
                return id;
            }

            function wyswietl(id) {

                $('#calendar').fullCalendar('addEventSource', "<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/events.jsp" /></portlet:resourceURL>&zasob=" + id);
            }

            <%

                List<Prosba> proList = DaneProsba.selectProsba();
                int proSize = proList.size();
                String pro[] = new String[proSize];
                for (int i = 0; i < proSize; i++) {
                    pro[i] = proList.get(i).getPowod();
                }

                List<RezerwacjaTyp> rezTypList = DaneRezerwacjaTyp.selectRezTyp();
                List<RezerwacjaTyp> rezTypListInne = DaneRezerwacjaTyp.selectRezTypbezInne();
                
                int rezTypSize = rezTypList.size();
                String typy[] = new String[rezTypSize];
                for (int i = 0; i < rezTypSize; i++) {
                    typy[i] = rezTypList.get(i).getOpis();
                }
            %>






        </script>
        <script>
            function wyslij(start, end) {
                var title = document.getElementById("title1").value;
                var id_zasob = pobierz;
                var typ = document.getElementById("typ1").value;
                var wlasc = document.getElementById("wlasc1").value;
                var powiazany = document.getElementById("pow").value;
                var id;
                 var los = document.getElementById("los").value;


                if (title == "" ||  typ == "") {
                    $("#ostrzezenie1").dialog("open");
                    setTimeout(function () {
                        $("#ostrzezenie1").dialog("close");
                    }, 700);
                }
                else
                {

                    var c, wlasciciel, zasob, typ_id;
            <%
                        for (int i = 0; i < osSize; i++) {

            %>
                    c = "<%=osobyList.get(i).getTytul().getTytul() + " ".concat(osobyList.get(i).getNazwisko() + " ".concat(osobyList.get(i).getImie()))%>";
                    if (c == wlasc)
                    {
                        wlasciciel = "<%=osobyList.get(i).getId()%>";
                    }
            <% }
                      for (int i = 0; i < tytSize; i++) {
            %>
                    c = "<%=zasList.get(i).getNazwa()%>";
                    if (c == id_zasob)
                    {
                        zasob = "<%=zasList.get(i).getId()%>";
                    }
            <%}

                        for (int i = 0; i < rezTSize; i++) {
            %>
                    c = "<%=rezTList.get(i).getOpis()%>";
                    if (c == typ)
                    {
                        typ_id = "<%=rezTList.get(i).getId()%>";
                    }
            <%}
            %>
                        var start2 = moment(start).format("dd");
                        
                        //if (!(($('#uprawnienieStacjonarne').val()=="true") && $('#uprawnienieZaoczne').val()=="true")){
                    //if (document.getElementById("check").checked == false) {
                        $.ajax({
                            url: '<portlet:resourceURL><portlet:param name="jspPage" value="/czyPlangotowy.jsp" /></portlet:resourceURL>',
                            data: '&start=' + start+ '&end=' + end,
                            type:"GET",
                            async: false,
                            success: function(wyjscie){
                                var dane=$.parseJSON(wyjscie);
                                if (dane && ((start2=='N' || start2=='So') && $('#uprawnienieZaoczne').val()=="true") ||
                                            (start2!='N' && start2!='So' && $('#uprawnienieStacjonarne').val()=="true")){
                                        $.ajax({
                                            url: '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/dodajrezer.jsp" /></portlet:resourceURL>',
                                            data: 'title= '+ title + '&start=' + start+ '&end=' + end + '&id_zasob=' 
                                                  + $("#selectzasoby").val() +'&typ=' + $('#typ1').val() + '&wlasc=' + $('#wlasc1').val()+'&los='+$('#los').val()+'&kierunek='+$('#kierunek').val(),
                                            type:"GET",
                                            success: function (json) {
                                                
                                                     $( "#calendar" ).removeClass( "blur" );
                                                       $( "#przyciskii" ).removeClass( "blur" );
                                                       
                                                      $("#calendar").fullCalendar('refetchEvents');
                                                      $("#title1").val("");
                                                      $("#wlasc1").val("");
                                                      $("#typ1").val("");
                                                      $("#id_zasob1").val($('#selectzasoby').val());
                                                      $("#wlasc1").val("");
                                                      $("#pow").val("");
                                                      $("#dialog1").dialog("close");
                                                        }
                                        });
                                } else {
                                        $.ajax({
                                            url: '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/dodajprosba.jsp" /></portlet:resourceURL>',
                                            data: 'title=' + title + '&start=' + start + '&end=' + end + '&id_zasob=' + $('#selectzasoby').val() + '&typ=' + $('#typ1').val() + '&wlasc=' + <%=usr%>,
                                            type: "GET",
                                            success: function () {
                                                $("#ostrzezenie4").dialog("open");
                                                setTimeout(function () {
                                                    $("#ostrzezenie4").dialog("close");
                                                }, 700);

                                                $("#dialog1").dialog("close");
                                                 $( "#przyciskii" ).removeClass( "blur" );
                                                 $( "#calendar" ).removeClass( "blur" );
                                                }
                                            });
                                    }
                                }
                        });
                        
                        
                        
                        
                        
                    

                        /*} else {
                        $.ajax({
                            url: '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/dodajprosba.jsp" /></portlet:resourceURL>',
                            data: 'title=' + title + '&start=' + start + '&end=' + end + '&id_zasob=' + $('#id_zasob1').val() + '&typ=' + typ_id + '&wlasc=' + $('#wlasc1').val(),
                            type: "GET",
                            success: function () {
                                $("#ostrzezenie4").dialog("open");
                                setTimeout(function () {
                                    $("#ostrzezenie4").dialog("close");
                                }, 700);

                                $("#dialog1").dialog("close");
                            }
                        });
                    }*/
                }
            }



            </script>



            <script>
               /* var czyDodaje = %= dUprawnienie.czyPosiadaUprawnienie(usr, zasobId, 1)%>;
                var czyEdytuje = %= dUprawnienie.czyPosiadaUprawnienie(usr, zasobId, 2)%>;
                var czyUsuwa = %= dUprawnienie.czyPosiadaUprawnienie(usr, zasobId, 3)%>;
                //   document.getElementById('#dodawanie').innerHTML = czyDodaje;*/



                //alert("Twoje uprawnienia: dodawanie: "+czyDodaje+", edycja: "+czyEdytuje+", usuwanie: "+czyUsuwa);

                $(document).ready(function () {
                    


                    var calendar = $('#calendar').fullCalendar({
                        
                          monthNamesShort: ['stycznia', 'lutego', 'marca', 'kwietnia', 'maja', 'czerwca', 'lipca','sierpnia','września','października','listopada','grudnia'],

                        lang: 'pl',
                        theme: true,
                        header: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'month,agendaWeek'
                        },
                        allDaySlot: false,
                        editable: true,
                        eventLimit: true,
                        axisFormat: 'H : mm',
                        defaultView: 'agendaWeek',
                        height:'auto',
                        events: "<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/events.jsp" /></portlet:resourceURL>&zasob=13",
                        type: "resource",
                        timeFormat: 'H(:mm)',
                        selectOverlap: false,
                        eventOverlap: false,
                        selectable: true,
                        selectHelper: true,
                        // deletable:true,


                        // weekends:true

                        select: function (start, end) {
                            
                            var ntoday = new Date().getTime();
                            var prosba;

                            var title = document.getElementById("title1").value;
                            var id_zasob = document.getElementById("id_zasob1").value;
                            var typ = document.getElementById("typ1").value;
                            var wlasc = document.getElementById("wlasc1").value;
                            var powiazany = document.getElementById("pow").value;
                            var kierunek;
                            var typString;
                            var wlascicielString;
                            var id;
                            // var eventEnd = moment( event.end ).valueOf();
                            var eventStart = moment(start).valueOf();
                            var eventEnd = moment(end).valueOf();

                            var n = new Date().getTime();

                            var ntoday = new Date().getTime();
                            var start = moment(start).format("YYYY-MM-DD HH:mm:ss");
                            started = moment(start).format("YYYY-MM-DD HH:mm:ss");
                            var end = moment(end).format("YYYY-MM-DD HH:mm:ss");
                            stopped = moment(end).format("YYYY-MM-DD HH:mm:ss");
                            var today = $("#calendar").fullCalendar('getDate').format("YYYY-MM-DD HH:mm:ss");
                            var today2 = $("#calendar").fullCalendar('getDate').format("dd");
                            var start2 = moment(start).format("dd");
                            var end2 = moment(end).format("dd");
                            var wlasciciel;

                            if (eventEnd < ntoday) {
                                $("#ostrzezenie").dialog("open");
                                setTimeout(function () {
                                    $("#ostrzezenie").dialog("close");
                                }, 700);
                                $("#calendar").fullCalendar("unselect");
                            }

                            else
                            {
                                if (((start2=='So' || start2=='N') && $('#uprawnienieZaoczne').val()=="false") ||
                                        ((start2!='So' && start2!='N')&& $('#uprawnienieStacjonarne').val()=="false")){
                                    $('#pows ').css("display","none");
                                    $('#pow').css("display","none");
                                        } else {
                                            $('#pows ').css("display","");
                                            $('#pow').css("display",""); 
                                        }
                                
                            $( "#calendar" ).addClass( "blur" );
                            $("#przyciskii").addClass("blur");
                                $("#dialog1").dialog("open");
                                $('#button-1').off('click');
                                $('#button-1').on('click', function (e) {
                                    e.preventDefault();
                                    wyslij(start, end);
                                });
                                calendar.fullCalendar('renderEvent',
                                        {
                                            title: title,
                                            start: start,
                                            end: end,
                                            id_zasob: id_zasob,
                                            id: id,
                                            typ: typ,
                                            wlasciciel: wlasciciel,
                                            prosba:prosba,
                                            kierunek:kierunek,
                                            typString: typString,
                                            wlascicielString: wlascicielString
                                        

                                        },
                                false
                                        );
                                calendar.fullCalendar("unselect");
                            }
                        },
                        //editable: czyEdytuje,
                                eventDrop: function (event, delta) {
                                    var start = moment(event.start).format('YYYY-MM-DD HH:mm:ss');
                                    var endtemp = moment(event.end).valueOf();
                                    var wlasciciel = event.wlasciciel;
                                    var id_zasob;
                                    var typ;
                                    var end = moment(event.end).format('YYYY-MM-DD HH:mm:ss');
                                    var ntoday = new Date().getTime();
                                    var id;
                                    // var ntoday =$("#calendar").fullCalendar('getDate').format('YYYY-MM-DD HH:mm:ss');
                                    var today2 = $("#calendar").fullCalendar('getDate').format("dd");
                                    var start2 = moment(start).format("dd");
                                    var end2 = moment(endtemp).format("dd");
                                    
                                    if (endtemp < ntoday) {
                                        $("#ostrzezenie6").dialog("open");
                                        setTimeout(function () {
                                            $("#ostrzezenie6").dialog("close");
                                        }, 700);
                                        $("#calendar").fullCalendar('refetchEvents');
                                    } else if (!(sprawdzCzyMozeDodac(start2) || sprawdzCzyMozeDodac(end2) || czyJestWlascicielem(event.wlasciciel) || <%=x%>)) {
                                        $("#ostrzezenieUpr").dialog("open");
                                        setTimeout(function () {
                                            $("#ostrzezenieUpr").dialog("close");
                                        }, 700);
                                        $("#calendar").fullCalendar("refetchEvents");
                                    } else
                                    {
                                        $.ajax({
                                            url: "<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/updatejsp.jsp" /></portlet:resourceURL>",
                                            data: 'id='+event.id+'&title='+event.title+'&start='+start+'&end='+end+'&zasob='+event.id_zasob+'&typ='+event.typ+'&powiazany='
                                            +event.powiazany+'&kierunek='+event.kierunek+'&wlasciciel='+event.wlasciciel,
                                            type: "GET",
                                            success:function(odpowiedz){
                        $("#dialog5").dialog("close");
            var odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie2Komunikat").empty();
            $("#ostrzezenie2Komunikat").append(odp);
            $("#calendar").fullCalendar('refetchEvents');
            
                        $("#ostrzezenie2").dialog("open");
                        setTimeout(function () {
                            $("#ostrzezenie2").dialog("close");
                             $("#calendar").removeClass("blur");
                        }, 700);
                    }
                                        });
                                    }
                                },
                        eventResize: function (event) {
                            var start1 = moment(event.start).format('YYYY-MM-DD HH:mm:ss');
                            var id_zasob;
                            var typ;
                            var end1 = moment(event.end).format('YYYY-MM-DD HH:mm:ss');
                            var id;

                            var today2 = $("#calendar").fullCalendar('getDate').format("dd");
                            var start2 = moment(start1).format("dd");
                            var end2 = moment(end1).format("dd");
                            //console.log(event.wlasciciel);
                            //alert(sprawdzCzyMozeDodac(start2)+" "+sprawdzCzyMozeDodac(end2)+" "+czyJestWlascicielem(event.wlasciciel));
                            if (!(sprawdzCzyMozeDodac(start2) || sprawdzCzyMozeDodac(end2) || czyJestWlascicielem(event.wlasciciel) || <%=x%>)) {
                            //if (($("#uprawnienieZaoczne").val()=="false" || $("#uprawnienieStacjonarne").val()=="false") && !czyJestWlascicielem(event.wlasciciel)){
                                
                                $("#ostrzezenieUpr").dialog("open");
                                setTimeout(function () {
                                    $("#ostrzezenieUpr").dialog("close");
                                }, 700);
                                $("#calendar").fullCalendar("refetchEvents");
                            } else {
                                
                                $.ajax({
                                    url: '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/updatejsp.jsp" /></portlet:resourceURL>',
                                    data: 'id='+event.id+'&title='+event.title+'&start='+start1+'&end='+end1+'&zasob='+event.id_zasob+'&typ='+event.typ+'&powiazany='
                                            +event.powiazany+'&kierunek='+event.kierunek+'&wlasciciel='+event.wlasciciel,
                                    type: "GET",
                                    success:function(odpowiedz){
                        $("#dialog5").dialog("close");
            var odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie2Komunikat").empty();
            $("#ostrzezenie2Komunikat").append(odp);
            $("#calendar").fullCalendar('refetchEvents');
            
                        $("#ostrzezenie2").dialog("open");
                        setTimeout(function () {
                            $("#ostrzezenie2").dialog("close");
                             $("#calendar").removeClass("blur");
                        }, 700);
                    }
                                });
                            }
                        },
                        eventRender: function (event, element) {
                            //  element.selectable();
                           
                            var ntoday = new Date().getTime();
                            var eventEnd = moment(event.end).valueOf();
                            var eventStart = moment(event.start).valueOf();
                            if (!event.end) {
                                if (eventStart < ntoday) {
                                    element.css('background-color', '#A9A9A9');
                                    element.css('border-color', '#A9A9A9');
                                    event.editable = false;
                                    event.droppable = false
                                    if (<%=usr%> == 2) {
                                        element.bind('mousedown', function (e) {
                                            if (e.which == 3) {
                                                return false;
                                            }
                                        });
                                    }
                                    //  event.selectable=false;
                                    $(element).click(function () {
                                        return false;
                                    });
                                    element.bind('mousedown', function (e) {
                                        if (e.which == 3) {
                                            return false;
                                        }
                                    });

                                }

                            }
                            else {
                                if (eventEnd < ntoday) {
                                    element.css('background-color', '#A9A9A9');
                                    element.css('border-color', '#A9A9A9');
                                    event.editable = false;
                                    event.droppable = false;
                                    // event.selectable=false;
                                    $(element).click(function () {
                                        return false;
                                    });
                                    element.bind('mousedown', function (e) {
                                        if (e.which == 3) {
                                            return false;
                                        }
                                    });

                                }
                            }

                            if (eventStart >= ntoday && eventEnd >= ntoday) {

                                //Edytowanie 
                                if (event.typ != 5) {
                                    element.bind('mousedown', function (e) {
                                    });
                                }

                                //   var mm = $('#calendar').fullCalendar('clientEvents', event.id);

                                var idd = event.id;
                                var startup = event.start;
                                var endup = event.end;
                                //var opisup=event.title;
                                var wlasc = event.wlasciciel;
                                var idz = event.id_zasob;
                                var typup = event.typ;
                                var powup = event.powiazany;
                                var today2 = $("#calendar").fullCalendar('getDate').format("dd");
                                var start2 = moment(startup).format("dd");
                                var end2 = moment(endup).format("dd");
                                var kier = event.kierunek;
                                //   var opisup=event.title;

                                // var opis = opisup.toString();
                                // var opis;

                                //  opis+=opisup;
                                //    var opisup=JSON.stringify(event.title);

                                var opisup = event.title;
                                //  opisup = event.title.toString();
                                if (sprawdzCzyMozeDodac(start2) || sprawdzCzyMozeDodac(end2) || czyJestWlascicielem(event.wlasciciel) || <%=x%>) {
                                    element.find("div.fc-title").after($("<span class=\"fc-icons\"></span>").html("<img src=\"/srsz/ikona.png\" onclick=\"usunrezer(" + event.id + ");\"/>"));
                                    // element.find("div.fc-title").after($("<span class=\"fc-icons1\"></span>").html("<img src=\"/srsz/edytuj.png\" onclick=\"edytujrezer("+startup+','+endup + ',' + titleup + ',' + wlasc +',' + idz +',' + typup + ',' + powup+");\"/>"));
                                    element.find("div.fc-title").after($("<span class=\"fc-icons1\"></span>").html("<img src=\"/srsz/edytuj.png\" onclick=\"edytujrezer('" + opisup + "'" + ',' + typup +  ',' + startup + ',' + endup + ',' + idz + ","+ wlasc+","+kier+","+idd+");\"/>"));
                                    //','+endup+','+titleup+','+idz+','+typup+
                                }

                                if (!(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) && event.title!=null) {
                                    element.qtip({
                                        content: {
                                            title: {text: event.title},
                                            text: '<span class="title">Start: </span>' + moment(event.start).format('YYYY-MM-DD HH:mm:ss') + '<br><span class="title">Opis: </span>' + event.title + '<br><span class="title">Typ: </span>' + event.typString + '<br><span class="title">Właściciel: </span>'+ event.wlascicielString
                                        },
                                        show: {solo: true},
                                        //hide: { when: 'inactive', delay: 3000 }, 
                                        style: {
                                            width: 200,
                                            widget: true,
                                            def: false,
                                            padding: 5,
                                            color: 'black',
                                            textAlign: 'left',
                                            border: {
                                                width: 1,
                                                radius: 3
                               },
                                            classes: {
                                                tooltip: 'ui-widget',
                                                tip: 'ui-widget',
                                                title: 'ui-widget-header',
                                                content: 'ui-widget-content'
                                            }
                                        }
                                    });
                                }
                                if (event.typ == 5) {
                                    element.css('background-color', '#FF0000');
                                    element.css('border-color', '#FF0000');
                                    event.editable = false;
                                    event.droppable = false;
                                    event.overlap = false;
                                    disableDragging:false;
                                    element.css('opacity', '.3');
                                    $(element).click(function () {
                                        return false;
                                    });
                                }
                                if (event.typ == 10) {
                                    element.css('background-color', '#cc6600');
                                    element.css('border-color', '#aa3300');
                                }
                                if (event.typ == 9) {
                                    element.css('background-color', '#996666');
                                    element.css('border-color', '#663333');
                                }
                                if (event.typ == 8) {
                                    element.css('background-color', '#a08bbf');
                                    element.css('border-color', '#7c679d');
                                }
                                if (event.typ == 7) {
                                    element.css('background-color', '#999900');
                                    element.css('border-color', '#666600');
                                }
                                if (event.typ == 6) {
                                    element.css('background-color', '#99b5d1');
                                    element.css('border-color', '#6689ad');
                                }



                            }

                        },
                        selectOverlap: function (event) {

                            $("#ostrzezenie5").dialog("open");
                            setTimeout(function () {
                                $("#ostrzezenie5").dialog("close");
                            }, 700);

                        },
                                eventOverlap: function (event) {

                                    
                                },
                                eventMouseover: function (event, element) {
                                    //    element.find("div.fc-title").after($("<span class=\"fc-icons\"></span>").html("<img src=\"/srsz/ikona.png\" onclick=\"usunrezer("+event.id+");\"/>"));

                                },
                        eventDragStart: function (event) {
                            var start = moment(event.start).format('YYYY-MM-DD HH:mm:ss');
                            var start2 = moment(start).format("dd");
                            var end = moment(event.end).format('YYYY-MM-DD HH:mm:ss');
                            var end2 = moment(start).format("dd");
                            if (!(sprawdzCzyMozeDodac(start2) || sprawdzCzyMozeDodac(end2) || czyJestWlascicielem(event.wlasciciel) || <%=x%>)) {
                                $("#ostrzezenieUpr").dialog("open");
                                setTimeout(function () {
                                    $("#ostrzezenieUpr").dialog("close");
                                }, 700);
                                $("#calendar").fullCalendar("refetchEvents");
                            }

                        },
                        
                        eventAfterRender: function (event, element, view) {



                            element.addTouch();
                             /*$.ajax({
                                    url: '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/zczytajInformacjeRezerwacja.jsp" /></portlet:resourceURL>',
                                    data:"id_rez="+event.id+"&czyProsba="+event.prosba,
                                    method:'post',
                                    success:function (msg){
                                        var dane=$.parseJSON(msg); 
                                       element.find("div.fc-title").after($("<span class=\"fc-napis\"></span>").html("<br/>" + dane.zasob+"<br/><b>"+dane.rezTyp+"<br/><b>"+dane.wlasciciel+"<br/>"));
                                    }
                                });
*/
                        }
                    });
                });

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

#przyciskii a{
  //margin: 10px;
  line-height: 30px;
  }




            </style>
        </head>
        <div id="kalendarz">     
                <input type="hidden" id="uprawnienieZaoczne" value="false" />
                <input type="hidden" id="uprawnienieStacjonarne" value="false" />
                <input type="hidden" id="uprawnienieProsby" value="false" />


           <div id='przyciskii' style="line-height: 30px;">
                 

            <!--<input type="checkbox" name="prosba" id="check" onclick="ukrywanie()" hidden><label for="check" id="prosbaLabel" hidden>Prośba</label></input>-->
            <button id="niestandardowaProsba"  onclick="npClick()">Niestandardowa prośba</button>
            <a id="button2" href="<portlet:renderURL><portlet:param name="jspPage" value="/panel_adm/pages/Prosby.jsp" /></portlet:renderURL>">Panel administracyjny</a>
            <a id="button9" href="<portlet:renderURL><portlet:param name="jspPage" value="/kalendarwla.jsp" /></portlet:renderURL>">Pracownicy</a>
            <a id="button10" href="<portlet:renderURL><portlet:param name="jspPage" value="/kalendarpla.jsp" /></portlet:renderURL>">Plany</a>
            <a id="button11" href="<portlet:renderURL><portlet:param name="jspPage" value="/wolneSaleTabelka.jsp" /></portlet:renderURL>">Wolne sale</a>
            <!--<a id="button12" href="<portlet:renderURL><portlet:param name="jspPage" value="/kalendar.jsp" /></portlet:renderURL>">Rezerwacja</a>-->
            
    
             <%if (usr!=194){%><a id="button14" href="<portlet:renderURL><portlet:param name="jspPage" value="/kalendarrez.jsp" /></portlet:renderURL>">Moje rezerwacje/prosby</a><%}%>
              <a id="button15" href="<portlet:renderURL><portlet:param name="jspPage" value="/kalendarrezspec.jsp" /></portlet:renderURL>">Rezerwacje specjalne</a>
                <!-- <a id="button3"  href="index.jsp">Strona główna</a> -->
                <a id="button1" onclick="drukuj()">Drukuj</a>
           </div>
              <form id="prosbaNiestandardowa">    
                    <div id="dialog2" title="Dodaj prośbę" >
                        <table class="tabelaDodawnieRezerwacji">
 
                            <tr>
                                <td>Początek: </td>
                                <td><input type="datetime" id="start2" name="start" value=""/></td>
                            </tr>
                            <tr>
                                <td>Koniec: </td>
                                <td><input type="datetime" id="end2" name="koniec" value=""/></td>
                            </tr>
                            <tr>
                                <td>Opis : </td>
                                <td><input type="text" id="title2" value=""></td>
                            </tr>
                           
                            <td><input type="hidden" id="id_zasob1" name="id_zasob1"></td>
                           
                            <tr>
                                <td>Typ: </td>
                                <td><select name="typ2" id="typ2" >
                            <option value="<%=rezerwacjaTyp.selectPoNazwieID("Inne")%>">Inne</option>
                            <%
                            for(RezerwacjaTyp z: rezTypListInne){
                            %>
                            <option value="<%=z.getId()%>"><%=z.getOpis()%></option>
                            <%
                            }
                            %>
                </select>
                    </td>
                            </tr>
                        </table>
                        <br>
                        <button id="button-P" >Dodaj</button>
                        </br>
                    </div>



                
        <br></br>

                <form id="selecty">
                    <select id="selectzasoby" name="zasob" onclick="">
                    <%
                        List<Zasob> listaSal = DaneZasob.selectSale();
                        List<Zasob> listaZasobow = DaneZasob.selectNieSale();
                    %>
                    <optgroup label="Sale"> <%
                        for (Zasob z : listaSal) {
                    %>
                    <option value="<%=z.getId()%>">&nbsp;&nbsp;<%=z.getNazwa()%></option>
                    
                    <%
                        }
                    %>
                    </optgroup>
                    <optgroup label="Zasoby"> <%for (Zasob z : listaZasobow) {
                    %>
                    <option value="<%=z.getId()%>">&nbsp;&nbsp;<%=z.getNazwa()%></option>
                    
                    <%
                        }
                    %>
                    </optgroup>


                </select>



            </form>

           

                    <script>



                    </script>


                    <br></br>
                    <form type="hidden">
                        <input type="hidden" id="zmienna"/>
                    </form>


                    <div id='calendar'></div>
                    <form id="dodawanierez">    
                        <div id="dialog1" title="Dodaj" >
                            
                            <table class="tabelaDodawnieRezerwacji">
                <tr>
                    <td>Opis : </td>
                    <td><input type="text" id="title1" value=""></td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="id_zasob1" id="id_zasob1" value="1"/>
                    </td>
                </tr>
                <tr>
                    <td>Typ: </td>
                    <td><select name="typ1" id="typ1" >
                            <option value="<%=rezerwacjaTyp.selectPoNazwieID("Inne")%>">Inne</option>
                            <%
                            for(RezerwacjaTyp z: rezTypListInne){
                            %>
                            <option value="<%=z.getId()%>"><%=z.getOpis()%></option>
                            <%
                            }
                            %>
                </select>
                    </td>
                </tr>
                <%
         
         
         if(x){
 %>
                <tr>
                    <td>Wlaściciel: </td>
                    <td><select name="wlasc1" id="wlasc1" onchange="sprawdz_wlasc();">
                            <option value="<%=osob.selectIDUzytkownika(u.getScreenName().toString())%>"><%=dOsoby.znajdzPoLoginie(u.getScreenName().toString()).getNazwisko()+" "+dOsoby.znajdzPoLoginie(u.getScreenName().toString()).getImie()%></option>
                            <% for (Osoby o: osobyListbezUsera){
                            %>
                            
                            <option value="<%=o.getId()%>"><%=o.getNazwisko()%> <%=o.getImie()%></option>
                            <%

                            }%>
                </select>
    
                    </td> <% } else {%>
                         <td> <input type="hidden" id="wlasc1" value="<%=dOsoby.znajdzPoLoginie(u.getScreenName().toString()).getId()%>"> </td>
                    
                    <%} %>
                    
                </tr>
    <%if(x){
 %>                 
                 <tr>
                    <td>Czy wolny właściciel:</td>
                    <td><input type="text" id="uwaga" value="" readonly="true"></td>
                </tr>
                <%}%>
                <tr>
                    <td><label id="pows">Cały semestr: </label></td>    
                    <td><input type="checkbox" id="pow" value="0" onclick="funkcja_pow();"></td>
                </tr>
                <tr>
                    <td><label id="pows"></label></td>    
                    <td><input type="hidden" id="los" value="0"></td>
                </tr>

                <tr>
                    <td>Kierunek:</td>
                            <td><select name="kierunek" id="kierunek">
                                    <option value="<%=dK.selectPoNazwieID("Nie dotyczy")%>">Nie dotyczy</option>
                                    <% for (baza.Kierunek k: kListND){ %>
                                    <option value="<%=k.getId()%>"><%=k.getNazwa()%></option>
                                    <% } %>
                        </select></td>
                </tr>
            </table>
                        <br>
                        <button id="button-1" >Dodaj</button>
                        </br>
                    </div>
            </form>


            <form id="edytujrez">    
                <input type='hidden' id='datapocz' value=""/>
                <input type='hidden' id='datakon' value=""/>
                <div id="dialog5" title="Edytuj" >
                    
                    <table class="tabelaDodawnieRezerwacji">
                        <tr><td><input type="hidden" value="" id="idEventu"/></td></tr>
                        <tr>
                            <td>Opis: </td>
                            <td><input type="text" id="titleup" value=""></td>
                        </tr>
                        <tr>
                            <td>Zasób: </td>
                            <td><select name="id_zasob1" id="id_zasobup" onchange="sprawdz_zas();">
                                    <%
                                        for (Zasob z : zasList) {
                                    %>
                                    <option value="<%=z.getId()%>"><%=z.getNazwa()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>

                        <!--<tr>
                            <td>Start</td>
                            <td><input type='datetime' id='datapocz' name="startEdycja"></td>
                        </tr>
                        <tr>
                            <td>Koniec</td>
                            <td><input type='datetime' id='datakon' name="koniecEdycja"></td>
                        </tr>-->

                        <tr>
                            <td>Typ: </td>
                            <td>
                                <select name="typup" id="typup">
                                    <%
                                        for (baza.RezerwacjaTyp rt: rezerwacjaTypLista){
                                    %>
                                    <option value="<%=rt.getId()%>"><%=rt.getOpis()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Wlaściciel: </td>
                            <td><select name="wlasc1" id="wlasc1ed" onchange="sprawdz_wlasc();">
                            <% for (Osoby o: osobyList){
                            %>
                            <option value="<%=o.getId()%>"><%=o.getTytul().getTytul()%> <%=o.getNazwisko()%> <%=o.getImie()%></option>
                            <%

                            }%>
                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Kierunek: </td>
                            <td>
                                <select name="kierEd" id="kierId">
                                    <% for (baza.Kierunek k: kList){
                                    %>
                                    <option value="<%=k.getId()%>"><%=k.getNazwa()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <button id="buttoned" >Dodaj</button>
                    </br>
                </div>
            </form>







            <div id="ostrzezenie1" title="Błąd" align="center">
                <p><b>Wypelnij wszystkie dane !</b></p></div>

            <div id="ostrzezenie4" title="Informacja" align="center">
                <p><b>Dodano pomyślnie</b></p>
            </div>

            <div id="ostrzezenie" title="Błąd" align="center">
                <p><b>Nie mozna dokonac rezerwacji !</b></p></div>

            <div id="ostrzezenie2" title="Informacja" align="center">
                <p><b><label id="ostrzezenie2Komunikat"/></b></p></div>
            <div id="ostrzezenie6" title="Informacja" align="center">
                <p><b>Data jest wcześniejsza niż obecna!!!</b></p></div>

            <div id="ostrzezenieUpr" title="Informacja" align="center">
                <p><b>Nie masz uprawnień do tej operacji!</b></p></div>

            <div id="ostrzezenie3" title="Informacja" align="center">
                <p><b>Usunięto!</b></p></div>

            <div id="ostrzezenie5" title="Informacja" align="center">
                <p><b>W tym samym czasie odbywają się już inne zajęcia.</b></p></div>

            <div id="usunrez" title="Ostrzeżenie" align="center">
                <p><b>Czy chcesz usunąć rezerwacje?</b></p>
                <button id="button4" >Tak</button> <button id="button5" >Anuluj</button>
            </div>


                

                
        </div>
<%@include file="wyborTygodnia.jsp" %>
    <script>

        function pokazzasob(){
            pobierz = $('#selectzasoby').val();
            
                    $('#id_zasob1').val(pobierz);

                    var zasSize = <%=tytSize%>;
                    var i;
                    for (i = 1; i < zasSize + 1; i++) {
                        $('#calendar').fullCalendar('removeEventSource', '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/events.jsp" /></portlet:resourceURL>&zasob=' + i);
                        $('#calendar').fullCalendar('removeEventSource', '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/events.jsp" /></portlet:resourceURL>');
                    }
                    if ($('#calendar').fullCalendar('clientEvents') == '') {
                        // document.forms[0].zmienna.value =  pobierz+1;

                        $('#calendar').fullCalendar('removeEventSource', '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/events.jsp" /></portlet:resourceURL>');

                        $('#calendar').fullCalendar('addEventSource', '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/events.jsp" /></portlet:resourceURL>&zasob=' + pobierz);
                        $('#calendar').fullCalendar('refetchEvents');
                    }
        }
        
function funkcja_pow()
            {
                if (document.getElementById("pow").checked == true)
                {$("#los").val('1'); }
                else {$("#los").val('0');}
               // alert("abc "+$("#los").val());
                
            }
$(document).ready(function(){
    
    $("#selectzasoby").attr('size', '6');
    
$("#kalendarz").addClass("load");
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
        $(function () {
            $('*[name=start]').appendDtpicker({"closeOnSelected": true, "futureOnly": true, "locale":"pl"});
            $('*[name=koniec]').appendDtpicker({"closeOnSelected": true, "futureOnly": true, "locale":"pl"});
            $('*[name=startEdycja]').appendDtpicker({"closeOnSelected": true, "futureOnly": true, "locale":"pl"});
            $('*[name=koniecEdycja]').appendDtpicker({"closeOnSelected": true, "futureOnly": true, "locale":"pl"});
        });
        function usunrezer(idd) {

            $("#usunrez").dialog("open");
            $('#button5').on('click', function (e) {
                e.preventDefault();
                $("#usunrez").dialog("close");
            });
        $("#button4").unbind('click');
            $("#button4").on('click', function (e) {
                e.preventDefault();
                $.ajax({
                    url: '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/usunrezer.jsp" /></portlet:resourceURL>',
                    type: "GET",
                    data: "&id=" + idd,
                    success: function (json) {
                        $("#usunrez").dialog("close");
                        $("#ostrzezenie3").dialog("open");
                        setTimeout(function () {
                            $("#ostrzezenie3").dialog("close");
                        }, 700);
                        $("#calendar").fullCalendar('refetchEvents');

                    }
                });
                $('#calendar').fullCalendar('removeEvents', idd);
            });

        }



        function edytujrezer(opisup, typup, startup, endup, idz,wlasciciel,kierunek,id) {

            //var typupp = parseInt(typup);
            //alert(idz);
            var dataP = moment(startup).format('YYYY-MM-DD HH:mm:ss');
            //var datetimeP = dataP.format("yyyy-mm-dd HH:MM");
            var dataK = moment(endup).format('YYYY-MM-DD HH:mm:ss');
            //var datetimeK = dataK.format("yyyy-mm-dd HH:MM");
            var idzz = idz;
            $("#idEventu").val(id);
            $("#titleup").val(opisup);
            $("#typup").val(typup);
            $("#datapocz").val(dataP);
            $("#datakon").val(dataK);
            $("#id_zasobup").val(idzz);
            $("#wlasc1ed").val(wlasciciel);
            $("#kierId").val(kierunek);
             $("#calendar").addClass("blur");
              $("#przyciskii").addClass("blur");
            $("#dialog5").dialog("open");
            
            
            
            ///alert($('#typup').val());

            //edycja(id,typup, dataP, dataK, idzz);


        }

        function edycja(id,typupp, startupp, endupp, idzz,powiazany,kierunek) {

            console.log(opiss);
            var opiss = document.getElementById("titleup").value;
            var start11 = moment(startupp).format('YYYY-MM-DD HH:mm:ss');
            var end11 = moment(endupp).format('YYYY-MM-DD HH:mm:ss');

            /*$("#buttoned").on('click', function (e) {
                e.preventDefault();


                $.ajax({
                    url: 'portlet:resourceURL>portlet:param name="jspPage" value="/pliki/updatejsp.jsp" />/portlet:resourceURL>',
                    data: 'id='+id+'&title=' + $('#titleup').val() + '&start=' + $('#datapocz').val() + '&end=' + $('#datakon').val() + '&zasob=' + $('#id_zasobup').val() +
                            '&typ=' + $('#typup').val()+'&powiazany'+$('#powup').val()+'&kierunek'+$('#kierId').val(),
                    type: "GET",
                    success: function (json) {
                        $("#ostrzezenie2").dialog("open");
                        setTimeout(function () {
                            $("#ostrzezenie2").dialog("close");
                        }, 700);
                    }
                });
            });*/
        }

        $(document).ready(function () {
            
            
            

            $("#fc-content").on('click', 'img', function (event) {
                alert("KlikniÄ™to");
            });




             $(function () {
                $("#selectzasoby,#selectzasoby1").selectmenu({
                    width: 150,
                    icons: {
                        button: "ui-icon-info"
                    },
                    
                    change:function(event,ui){
                        zczytajUprawnienia();
                        pokazzasob();
                    }



                });
            });

            $("#buttoned").button();
            $("#button-P").button();
            $("#button-P").submit();

            $("#dialog1").dialog({
                width: 450,
                autoOpen: false,
                show: {
                    effect: "fade",
                    duration: 1000
                },
                hide: {
                    effect: 'fade', duration: 1000

                },
                close: function () {
                    
                    $("#calendar").removeClass("blur");
                     $( "#przyciskii" ).removeClass( "blur" );
                    $("#calendar").fullCalendar('refetchEvents');
                    $("#title1").val("");
                    $("#wlasc1").val("");
                    $("#id_zasob1").val("");
                    $("#wlasc1").val("");
                    $("#pow").val("");
                    $("#typ1").val("");

                }
            });

            $("#dialog2").dialog({
                autoOpen: false,
                show: {
                    effect: "fade",
                    duration: 1000
                },
                hide: {
                    effect: 'fade', duration: 1000

                },
                close: function () {
                     $("#calendar").removeClass("blur");
                      $("#przyciskii").removeClass("blur");

                    $('#start').handleDtpicker('destroy');
                    $('#koniec').handleDtpicker('destroy');
                }});

            $("#dialog3").dialog({
                autoOpen: false,
                height: 300,
               show: {
                    effect: "fade",
                    duration: 1000
                },
                hide: {
                    effect: 'fade', duration: 1000

                },
                close: function () {
                     $("#calendar").removeClass("blur");
                      $("#przyciskii").removeClass("blur");
                    $("#title1").val("");
                    $("#wlasc1").val("");
                    $("#id_zasob1").val("");
                    $("#wlasc1").val("");
                    $("#pow").val("");
                    $("#typ1").val("");

                }
            });


            $("#dialog5").dialog({
                autoOpen: false,
                width: 450,
                
                show: {
                    effect: "fade",
                    duration: 1000
                },
                hide: {
                    effect: 'fade', duration: 1000

                },
                close: function () {
                    $("#calendar").removeClass("blur");
                     $("#przyciskii").removeClass("blur");
                }
            });
            $("select option").filter(function () {

            }).prop('selected', true);

            $("#button-1").button();
            $("#button-1").submit();
            $("#niestandardowaProsba").button({
                width: 500,
                icons: {
                    primary: "ui-icon-arrowthick-1-e"
                }
            });
            $("#buttondoda").button();
            $("#buttondoda").submit();
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

            $("#button4").button({
                icons: {
                    primary: "ui-icon-trash "
                }
            });

            $("#button5").button({
                icons: {
                    primary: "ui-icon-arrowreturn-1-w"
                }
            });


            $("#button6").button({
                icons: {
                    primary: "ui-icon-bookmark"
                }
            });

            $("#button7").button({
                icons: {
                    primary: "ui-icon-person"
                }
            });


            $("#button8").button({
                icons: {
                    primary: "ui-icon-bookmark"
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

            $("#button13").button({
                icons: {
                    primary: "ui-icon-help"
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
            
             

	


            $("#ostrzezenie").dialog({
                autoOpen: false,
                height: 100,
                show: {effect: "fade", duration: 100},
                hide: {effect: "fade", duration: 100}
            });

            $("#ostrzezenie1,#ostrzezenie2,#ostrzezenie3,#ostrzezenie5").dialog({
                autoOpen: false,
                height: 110,
                show: {effect: "fade", duration: 100},
                hide: {effect: "fade", duration: 100}
            });

            $("#usunrez").dialog({
                autoOpen: false,
                show: {effect: "fade", duration: 100},
                hide: {effect: "fade", duration: 100}
            });


            $("#ostrzezenie4").dialog({
                autoOpen: false,
                height: 110,
                show: {effect: "fade", duration: 100},
                hide: {effect: "fade", duration: 100}
            });

            $("#ostrzezenie6").dialog({
                autoOpen: false,
                height: 110,
                show: {effect: "fade", duration: 100},
                hide: {effect: "fade", duration: 100}
            });
            $("#ostrzezenieUpr").dialog({
                autoOpen: false,
                height: 110,
                show: {effect: "fade", duration: 100},
                hide: {effect: "fade", duration: 100}
            });



            $('#dodajprosbe').submit(function (e) {
                e.preventDefault();
                $.ajax({
                    url: "./dodajProsbaAkcja.jsp",
                    type: 'post',
                    data: $('#dodajprosbe').serialize(),
                    success: function () {
                        $("#ostrzezenie").dialog("open");
                        setTimeout(function () {
                            $("#ostrzezenie").dialog("close");
                        }, 700);
                    }
                });
            });






        });
        $("#buttoned").on('click', function (e) {
                e.preventDefault();

                $.ajax({
                    url: '<portlet:resourceURL><portlet:param name="jspPage" value="/pliki/updatejsp2.jsp" /></portlet:resourceURL>',
                    data: 'id='+$('#idEventu').val()+'&title=' + $('#titleup').val() + '&zasob=' + $('#id_zasobup').val() +
                            '&typ=' + $('#typup').val()+'&kierunek='+$('#kierId').val()+'&wlasciciel='+$('#wlasc1ed').val(),
                    type: "GET",
                    success:function(odpowiedz){
                        $("#dialog5").dialog("close");
            var odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie2Komunikat").empty();
            $("#ostrzezenie2Komunikat").append(odp);
            $("#calendar").fullCalendar('refetchEvents');
            
                        $("#ostrzezenie2").dialog("open");
                        setTimeout(function () {
                            $("#ostrzezenie2").dialog("close");
                             $("#calendar").removeClass("blur");
                        }, 700);
                    }
                });
            });
    </script>
