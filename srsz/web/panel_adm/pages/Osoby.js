function otworz(){
    $( "#dialog-form" ).dialog( "open" );
    $( "#mainNav" ).addClass( "blur" );
    $( "#menu" ).addClass( "blur" );
    $( "#tabs").addClass( "blur" );
}

function dodajzasob(){
    $( "#dialog-form2" ).dialog( "open" );
    $( "#mainNav" ).addClass( "blur" );
    $( "#menu" ).addClass( "blur" );
    $( "#tabs").addClass( "blur" );
}

$( "#radio1" ).buttonset();
$( "#button" ).button();
$("#button1,#button2,#button3,#button4,#button5,#button6,#button7,#button8,#button9").submit();
$( "#accordion,#accordion1" ).accordion({active:false,heightStyle: "content"});

$( "#dialog-form,#dialog-form1,#dialog-form2" ).dialog({
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

$('#dodajpracownika').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajOsobaAkcja,
        type:'post',
        data:$('#dodajpracownika').serialize(),
        success:function(odpowiedz){
            alert(odpowiedz);
           
        },
        error:function(){
            alert("JUUSS");
        }
    });
});

$('#dodajzas').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajZasobAkcja,
        type:'post',
        data:$('#dodajzas').serialize(),
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

$( "#button1,#button2,#button3,#button4,#opener,#button5,#button6,#button7,#button8,#button9" ).button();
$("#mainNav").buttonset();
$( "#radioset" ).buttonset();
$( "#tabs,#tabs-1,#tabs-2" ).tabs({
    hide: {
        effect: "slide",
        duration: 400    
    },
    show:{
        effect:"slide",
        duration:400
    }
    
});

$( "#tabs" ).tabs( "option", "active", 3 );
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



$( "#spinner" ).spinner();

$( "#selectmenu" ).selectmenu();


$(function() {
    $( "#menu" ).menu({
      items: "> :not(.ui-widget-header)"
    });
});


$( "#tooltip" ).tooltip();

$('#dodajtytul').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajTytulAkcja,
        type:'post',
        data:$('#dodajtytul').serialize(),
        success:function(odpowiedz){
            odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie1Komunikat").append(odp);
               $("#ustytul").trigger("chosen:updated");
           $("#ostrzezenie").dialog("open");
            setTimeout(function(){
    $("#ostrzezenie").dialog("close");
     }, 700);
      window.location.reload(true);
  
        }
    });
});

//var dodajOsobaAkcja="<portlet:resourceURL><portlet:param name="jspPage" value="/dodajOsobaAkcja.jsp" /></portlet:resourceURL>";
$('#dodajosobe').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajOsobaAkcja,
        type:'post',
        data:$('#dodajosobe').serialize(),
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



$('#usuntytul').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:usunTytulAkcja,
        type:'post',
        data:$('#usuntytul').serialize(),
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

$('#usunosobe').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:usunOsobaAkcja,
        type:'post',
        data:$('#usunosobe').serialize(),
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

$('#formularz_tytul').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:updateTytulAkcja,
        type:'post',
        data:$('#formularz_tytul').serialize(),
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



$('#formularz').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:updateOsobaAkcja,
        type:'post',
        data:$('#formularz').serialize(),
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


$( "#ostrzezenie" ).dialog({
                 autoOpen:false,
                 height:130,
                 show:{effect:"fade", duration:100},
                 hide:{effect:"fade", duration:100}
             });




