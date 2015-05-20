<%@page import="baza.DaneZasobyTyp"%>
<%@page import="baza.ZasobyTyp"%>
<%@page import="baza.DaneZasob"%>
<%@page import="baza.Zasob"%>
<%@page import="java.util.List"%>
<%@page import="baza.DaneSalaTyp"%>
<%@page import="baza.SalaTyp"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src='/srsz/js/fullcalendar.js'></script>
        <script src="/srsz/js/jquery.qtip.min.js"></script>
         <link href='/srsz/js/jquery.qtip.min.css' rel='stylesheet' />
        
        <script src='/srsz/js/pl.js'></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
      
        <style>
            #toolbar {
                padding: 4px;
                display: inline-block;
            }
            *+html #toolbar {
                display: inline;
            }
            .stare{
               color:#F0FFFF;
            }
            
            .ui-state-error {
	
	
	
}

        </style>
        
        <script>     
            function print_calendar() 
            {
                window.print();
                if(window.close()){ }
            }    

            <% 
                List<Zasob> zasList = DaneZasob.selectZasoby();
                List<ZasobyTyp> zastList = DaneZasobyTyp.selectTypy();
                List<SalaTyp> salaList = DaneSalaTyp.selectSala();
               
                int tytSize = zasList.size();
                int salSize = salaList.size();
                int zasSize = zastList.size();
                String wyjscie[] = new String[tytSize];
                String wyjsciezt[] = new String[zasSize];
                String salaa[] = new String[salSize];
            
                for (int i=0; i<tytSize; i++)
                    wyjscie[i] = zasList.get(i).getNazwa();        
                for (int i=0; i<salSize; i++)
                    salaa[i] = salaList.get(i).getOpis();           
                for (int i=0; i<zasSize; i++)
                    wyjsciezt[i] = zastList.get(i).getOpis();
            %>
                
            var nazwa= new Array();
            var zas= new Array();
            var sal= new Array();
               
            <%
                for (int i=0; i<tytSize; i++) {
            %> 
            
            nazwa[<%=zasList.get(i).getId()%>]="<%=zasList.get(i).getNazwa()%>";
            sal[<%=zasList.get(i).getId()%>]="<%=zasList.get(i).getId_sala().getOpis()%>";
            zas[<%=zasList.get(i).getId()%>]="<%=zasList.get(i).getId_typ().getOpis()%>";
            
            <% } %>        
        
            function opisowka()
            {
                var a = $("#wybranyzasob").val();
                var b ;
                <%
                    for ( int i=0; i<tytSize; i++){
                %>
                
                b="<%=zasList.get(i).getNazwa()%>";
                if(a == b) {    
                    b=<%=zasList.get(i).getId()%>;
                    //wyslijzasob(b);
                    $("#nazwa").val(nazwa[b]);
                    $("#ktoryID").val(b);
                    $("#zasob_select").val(zas[b]);
                    $("#sala_select").val(sal[b]);
                }
                <% } %>
                
            }
            
            function getid(id){
                return id;
            }
            
            function wyswietl(id){
               
        $('#calendar').fullCalendar('addEventSource', "pliki/events"+ id +".jsp");
            }
            
            
    
            
        </script>
        <script>
            function wyslij(start,end){
                var title = document.getElementById("title1").value;
                var id_zasob = document.getElementById("id_zasob1").value;
                var typ = document.getElementById("typ1").value;
                var wlasc = document.getElementById("wlasc1").value;
                var powiazany = document.getElementById("pow").value;
                var id;
                        
                if(title =="" || id_zasob=="" || typ =="" || wlasc==""){
                    $("#ostrzezenie1").dialog("open");
                    setTimeout(function(){
                        $("#ostrzezenie1").dialog("close");
                    }, 700);
                }
                else
                {
                    $.ajax({
                        url: '<portlet:resourceURL><portlet:param name="jspPage" value="/dodajrezer.jsp" /></portlet:resourceURL>',
                        data: 'title= '+ title + '&start=' + start+ '&end=' + end + '&id_zasob=' 
                              + id_zasob +'&typ=' + typ + '&wlasc=' + wlasc+'&powiazany='+powiazany,
                        type:"GET",
                        success:function(json){
                            $("#calendar").fullCalendar('refetchEvents');
                            $("#title1").val("");
                            $("#wlasc1").val("");
                             $("#typ1").val("");
                            $("#id_zasob1").val("");
                            $("#wlasc1").val("");
                            $("#pow").val("");
                            $("#dialog1").dialog("close");
                        }
                    });
                }
            }
        
            

        </script>
        <script>
            function sprawdzCzyWeekend(){
                alert("Hello!");
                return 1;
            }
            </script>
        
         <% 
            Integer usr = Integer.parseInt(request.getParameter("jakiUser"));
            //Integer usr = 1;
            baza.DaneUprawnienie du = new baza.DaneUprawnienie();
            Integer zasobId=1;
           // ${param['v']}
        %>
        
        <script>
           var czyDodaje = <%= du.czyPosiadaUprawnienie(usr,zasobId,1) %>;
            var czyEdytuje = <%= du.czyPosiadaUprawnienie(usr,zasobId,2) %>;
            var czyUsuwa = <%= du.czyPosiadaUprawnienie(usr,zasobId,3) %>;
         //   document.getElementById('#dodawanie').innerHTML = czyDodaje;
            
            
            
             $("#ostrzezenie4").dialog("open");
                            setTimeout(function(){
                                $("#ostrzezenie4").dialog("close");
                            }, 1000);
            //alert("Twoje uprawnienia: dodawanie: "+czyDodaje+", edycja: "+czyEdytuje+", usuwanie: "+czyUsuwa);
            
            $(document).ready(function() {
                
                
                
                var calendar = $('#calendar').fullCalendar({
                    lang:'pl',
                    theme: true,
                    header: {
                        left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
                    },  
                    allDaySlot:false,
                    editable: true,
                    eventLimit: true,
                    axisFormat: 'H : mm',
                    defaultView: 'agendaWeek', 
                    events: "",
                    type:"resource",
                    timeFormat: 'H(:mm)',
                    selectOverlap:false,
                    eventOverlap:false,
                    selectable:czyDodaje,
                    selectHelper:true,
                   // deletable:true,
                    
                    
                   // weekends:true

                    select:function(start,end){
                        var title = document.getElementById("title1").value;
                        var id_zasob = document.getElementById("id_zasob1").value;
                        var typ = document.getElementById("typ1").value;
                        var wlasc = document.getElementById("wlasc1").value;
                        var powiazany = document.getElementById("pow").value;
                        var id;
                      var n= new Date().getTime();
                        var start = moment(start).format("YYYY-MM-DD HH:mm:ss");
                        var end = moment(end).format("YYYY-MM-DD HH:mm:ss");
                        var today = $("#calendar").fullCalendar('getDate').format("YYYY-MM-DD HH:mm:ss");
                        
                        

                           
                        if(start < today || end<today || dzienTygodnia===1){
                            $("#ostrzezenie").dialog("open");
                            setTimeout(function(){
                                $("#ostrzezenie").dialog("close");
                            }, 700);
                           $("#calendar").fullCalendar("unselect");
                        }
                        
                        else
                        {
                            alert(dzienTygodnia);
                            $("#dialog1" ).dialog("open");      
                            $('#button-1').off('click');
                            $('#button-1').on('click',function(e){
                                e.preventDefault();
                                wyslij(start,end);
                            });
                            calendar.fullCalendar('renderEvent',
                                {
                                    title:title,
                                    start:start,
                                    end:end,
                                    id_zasob:id_zasob,
                                    id:id,
                                    typ:typ   
                                },
                                    false
                            );
                            calendar.fullCalendar("unselect");
                        }            
                    },
                editable: czyEdytuje,
                    eventDrop: function(event, delta) {
                        var start = moment(event.start).format('YYYY-MM-DD HH:mm:ss');
                        var id_zasob;
                        var typ;
                        var end = moment(event.end).format('YYYY-MM-DD HH:mm:ss');
                        var id;
                         var ntoday =$("#calendar").fullCalendar('getDate').format('YYYY-MM-DD HH:mm:ss');
                        if(end < ntoday || start < ntoday){
                           $("#ostrzezenie6").dialog("open");
                            setTimeout(function(){
                                $("#ostrzezenie6").dialog("close");
                            }, 700);
                          $("#calendar").fullCalendar('refetchEvents');
                        }else{

                        $.ajax({      
                            url: "<portlet:resourceURL><portlet:param name="jspPage" value="/updatejsp.jsp" /></portlet:resourceURL>",
                            data: 'title='+ event.title+'&start='+ start +'&end='+ end + '&id=' + event.id +
                                    '&id_zasob=' + event.id_zasob + '&typ=' + event.typ,  
                            type: "GET",
                            success: function(json) {
                                $("#ostrzezenie2").dialog("open");
                            setTimeout(function(){
                                $("#ostrzezenie2").dialog("close");
                            }, 700);
                            }
                        });
                    }
                    },
                    
                    eventResize: function(event) {
                        var start1 = moment(event.start).format('YYYY-MM-DD HH:mm:ss');
                        var id_zasob;
                        var typ;
                        var end1 = moment(event.end).format('YYYY-MM-DD HH:mm:ss');
                        var id;

                        $.ajax({
                            url: '<portlet:resourceURL><portlet:param name="jspPage" value="/updatejsp.jsp" /></portlet:resourceURL>',
                            data: 'title='+ event.title+'&start='+ start1 +'&end='+ end1 + '&id=' + event.id +
                                    '&id_zasob=' + event.id_zasob + '&typ=' + event.typ,  
                            type: "GET",
                            success: function(json) {
                               $("#ostrzezenie2").dialog("open");
                            setTimeout(function(){
                                $("#ostrzezenie2").dialog("close");
                            }, 700);
                            }
                        });
                    },
                    
                    eventRender: function(event, element) {
                        
                         var ntoday = new Date().getTime();
            var eventEnd = moment( event.end ).valueOf();
            var eventStart = moment( event.start ).valueOf();
            if (!event.end){
                if (eventStart < ntoday){
                    element.addClass("ui-state-error");
                    element.children().addClass("ui-state-error");
                    event.editable=false;
                    event.droppable=false;
                  //  event.selectable=false;
                     $(element).click(function() {return false;});
                      element.bind('mousedown', function (e) {
            if (e.which == 3) {
                return false;
            }
        });
                    
            }
                    
                }
             else {
                if (eventEnd < ntoday){
                    element.addClass("ui-state-error");
                    element.children().addClass("ui-state-error");
                    event.editable=false;
                    event.droppable=false;
                   // event.selectable=false;
                      $(element).click(function() {return false;});
                      element.bind('mousedown', function (e) {
            if (e.which == 3) {
                return false;
            }
        });
                   
                }
            }
                        
              if (eventStart >= ntoday &&eventEnd >=ntoday ){          
                  //Edytowanie 
                  if(event.typ !=5){
                        element.bind('mousedown', function (e) {
            if (e.which == 3) {
                alert('Edytuj okno');
            }
        });
                  }
              
        
                      
                         element.qtip({    
            content: {    
                title: { text: event.title },
                text: '<span class="title">Start: </span>' + moment(event.start).format('YYYY-MM-DD HH:mm:ss')+ '<br><span class="title">Opis: </span>' + event.title  + '<br><span class="title">Typ: </span>' + event.typ + '<br><span class="title">Naciśnij prawy przycisk myszy by edytować: </span>'    
            },
                        
                        show: { solo: true },
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
    
                        if(event.typ==5){
                            element.css('background-color', '#FF0000');
                            element.css('border-color', '#FF0000');
                            event.editable = false;
                            event.droppable = false;
                            event.overlap = false;
                            disableDragging:false;
                            element.css('opacity', '.3');
                            $(element).click(function() {return false;});
                        }
                        if(event.typ==2) {
                            element.css('background-color', '#77DD77');
                            element.css('border-color', '#77DD77');
                        }
                        
        }
                        
                    },
                    
                    
                    selectOverlap: function(event) {
                        
                         $("#ostrzezenie5").dialog("open");
                            setTimeout(function(){
                                $("#ostrzezenie5").dialog("close");
                            }, 700);
     
    },
    
    eventOverlap: function(event) {
                        
                         $("#ostrzezenie5").dialog("open");
                            setTimeout(function(){
                                $("#ostrzezenie5").dialog("close");
                            }, 700);
                        },
                        
                    eventClick: function(event) {
                        alert(event.weekends);
                        if (!czyUsuwa){ }                          
                        else 
                        {
                            $("#usunrez" ).dialog("open");
                             $('#button5').on('click',function(e){
                                   e.preventDefault();
                                $("#usunrez").dialog("close");
                             });
                             
                              $("#button4").on('click',function(e){
                            e.preventDefault();
                                    $.ajax({
                                    url:'<portlet:resourceURL><portlet:param name="jspPage" value="/usunrezer.jsp" /></portlet:resourceURL>',
                                    type: "GET",
                                    data: "&id=" + event.id,
                                    success:function(json){
                                        $("#usunrez").dialog("close");
                                        $("#ostrzezenie3").dialog("open");
                            setTimeout(function(){
                                $("#ostrzezenie3").dialog("close");
                            }, 700);
                            
                         
                                    }
                                });
                                $('#calendar').fullCalendar('removeEvents', event.id);
                            }); 
                        }
                    },
                    eventMouseover:function(event, element){
                         
                  
                    }
                });
            });
	</script>
        <style>
            body {
                margin: 10px 10px;
                padding: 0;
                font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
                font-size: 12px;
            }
            #calendar {
                max-width: 893px;
                max-height: 893px	
            }   
        </style>
    </head>
    <body>        
    
        <button id="button1" onclick="print_calendar()">Drukuj</button>
        <button id="button2"><a href="panel_adm/index.html">Panel administracyjny</a></button>
        <button id="button3">Strona główna</button>
        <br></br>
        
        <form id="selecty">
            <select id="selectzasoby" name="zasob" onclick="">
                <c:forEach items="<%=wyjscie%>" var="zasob" varStatus="petla">
                    <option>
                     
                    <c:out value="${zasob}"/>
                       
                    </option>
                    
                </c:forEach>
                    
                   
            </select>
           
        </form>
        
        <button id="button6" onclick="
             var pobierz = $('#selectzasoby option:selected').index();
         // index = pobierz.selectedIndex;
       /*if(pobierz==0){
             $('#calendar').fullCalendar( 'removeEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/events.jsp" /></portlet:resourceURL>');
         }
         $('#calendar').fullCalendar( 'removeEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/events2.jsp" /></portlet:resourceURL>');
         
             $('#calendar').fullCalendar( 'removeEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/events.jsp" /></portlet:resourceURL>');
              $('#calendar').fullCalendar( 'removeEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/events1.jsp" /></portlet:resourceURL>');
               $('#calendar').fullCalendar( 'removeEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/events2.jsp" /></portlet:resourceURL>');
         $('#calendar').fullCalendar( 'removeEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/events3.jsp" /></portlet:resourceURL>');
         // $('#calendar').fullCalendar( 'removeEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/events4.jsp" /></portlet:resourceURL>');
           $('#calendar').fullCalendar( 'removeEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/events5.jsp" /></portlet:resourceURL>');
           */
          
            
             var zasSize = <%=tytSize%>; 
              var i;
               for (i=1; i<zasSize+1; i++){
                 $('#calendar').fullCalendar( 'removeEventSource','pliki/events' + i + '.jsp');  
               
               }
               if($('#calendar').fullCalendar( 'clientEvents') == ''){
                // document.forms[0].zmienna.value =  pobierz+1;
               

                 
               $('#calendar').fullCalendar('addEventSource', 'pliki/events'+(pobierz+1)+'.jsp');
                          $('#calendar').fullCalendar('refetchEvents');}"
                                            >Wyswietl</button>
               
        <script> 
       
          
        
      </script>
     <!--  <button onclick="$('#calendar').fullCalendar( 'removeEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/events.jsp" /></portlet:resourceURL>');
           $('#calendar').fullCalendar( 'removeEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/events1.jsp" /></portlet:resourceURL>');
   $('#calendar').fullCalendar('addEventSource', '<portlet:resourceURL><portlet:param name="jspPage" value="/events1.jsp" /></portlet:resourceURL>');">L2</button>
        -->
        <!--<button onclick="$('#calendar').fullCalendar( 'removeEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/events1.jsp" /></portlet:resourceURL>');
   $('#calendar').fullCalendar('addEventSource', '<portlet:resourceURL><portlet:param name="jspPage" value="/events.jsp" /></portlet:resourceURL>');">AULA</button>
        -->
    <!--    <button><a href='pliki/dodajzasob_1.jsp'>Generator jsp</a></button> -->
        
        
        <br></br>
        <form type="hidden">
       <input type="hidden" id="zmienna"/>
        </form>
       
        
        <div id='calendar'></div>
           <form id="dodawanierez">     
        <div id="dialog1" title="Dodaj" >
            <br></br>
            <table>
                <tr>
                    <td>Opis : </td>
                    <td><input type="text" id="title1" value=""></td>
                </tr>
                <tr>
                    <td>Id_zasobu : </td>
                    <td><input type="number" id="id_zasob1" value=""></td>
                </tr>
                <tr>
                    <td>Typ: </td>
                    <td><input type="number" id="typ1" value=""></td>
                </tr>
                <tr>
                    <td>Wlasciciel: </td>
                    <td><input type="number" id="wlasc1" value=""></td>
                </tr>
                <tr>
                    <td>Powiazany: </td>    
                    <td><input type="number" id="pow" value=""></td>
                </tr>
            </table>
            <br></br>
            <button id="button-1" >Dodaj</button>
        </div>
           </form>
        
        <script src="/srsz/js/jquery.sidr.min.js"></script>

        <div id="ostrzezenie1" title="Błąd" align="center">
            <p><b>Wypelnij wszystkie dane !</b></p></div>
        
        <div id="ostrzezenie4" title="Informacja" align="center">
            
        </div>
         
        <div id="ostrzezenie" title="Błąd" align="center">
            <p><b>Nie mozna dokonac rezerwacji !</b></p></div>
        
        <div id="ostrzezenie2" title="Informacja" align="center">
            <p><b>Zaktualizowano!</b></p></div>
        <div id="ostrzezenie6" title="Informacja" align="center">
            <p><b>Data jest wcześniejsza niż obecna!!!</b></p></div>
        
        <div id="ostrzezenie3" title="Informacja" align="center">
            <p><b>Usunięto!</b></p></div>
        
         <div id="ostrzezenie5" title="Informacja" align="center">
            <p><b>W tym samym czasie odbywają się już inne zajęcia.</b></p></div>
        
         <div id="usunrez" title="Ostrzeżenie" align="center">
            <p><b>Czy chcesz usunąć rezerwacje?</b></p>
            <br></br>
            <button id="button4" >Tak</button> <button id="button5" >Anuluj</button>
        </div>
        <button onclick="$('#calendar').fullCalendar('addEventSource','<portlet:resourceURL><portlet:param name="jspPage" value="/wlasc1.jsp" /></portlet:resourceURL>');">dasdas</button>
       
    </body>
    
    <script>
        
        
        $(document).ready(function () {
            $(function() {
                $("#selectzasoby").selectmenu({
                    width:150,
                    icons:{
                    button: "ui-icon-info"
                }
                
                });
               
            });
            
           
            
            $( "#dialog1" ).dialog({
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
                    $("#calendar").fullCalendar('refetchEvents');
                    $("#title1").val("");
                            $("#wlasc1").val("");
                            $("#id_zasob1").val("");
                            $("#wlasc1").val("");
                            $("#pow").val("");
                            $("#typ1").val("");
                    
                }
            });
            $( "#button-1").button();
            $("#button-1").submit();
            $("#button1").button({
                icons:{
                    primary:"ui-icon-print"
                }
            });
             
            $("#button2").button({
                icons:{
                    primary:"ui-icon-gear"
                }
            });
             
            $("#button3").button({
                icons:{
                    primary:"ui-icon-home"
                }
            });
            
            $("#button4").button({
                icons:{
                    primary:"ui-icon-trash "
                }
            });
            
            $("#button5").button({
                icons:{
                    primary:"ui-icon-arrowreturn-1-w"
                }
            });
            
            
             $("#button6").button({
                icons:{
                    primary:"ui-icon-script"
                }
            });
            
        //    ui-icon-script
             
            $( "#ostrzezenie" ).dialog({
                autoOpen:false,
                height:100,
                show:{effect:"fade", duration:100},
                hide:{effect:"fade", duration:100}
            });
             
            $( "#ostrzezenie1,#ostrzezenie2,#ostrzezenie3,#ostrzezenie5" ).dialog({
                autoOpen:false,
                height:110,
                show:{effect:"fade", duration:100},
                hide:{effect:"fade", duration:100}
            });
            
             $( "#usunrez" ).dialog({
                autoOpen:false,
                height:180,
                show:{effect:"fade", duration:100},
                hide:{effect:"fade", duration:100}
            });
            
            
             $( "#ostrzezenie4" ).dialog({
                autoOpen:false,
                height:200,
                show:{effect:"fade", duration:100},
                hide:{effect:"fade", duration:100}
            });
            
            $( "#ostrzezenie6" ).dialog({
                autoOpen:false,
                height:110,
                show:{effect:"fade", duration:100},
                hide:{effect:"fade", duration:100}
            });
            

        });
    </script>
</html>
