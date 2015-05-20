
function otworz(){
    $( "#dialog-form" ).dialog( "open" );
$( "#mainNav" ).addClass( "blur" );
$( "#menu" ).addClass( "blur" );
$( "#tabs").addClass( "blur" );
}
 $("#zawartosc_strony").addClass("load");
function edytujosobe(){
    $( "#dialog-form5" ).dialog( "open" );
$( "#mainNav" ).addClass( "blur" );
$( "#menu" ).addClass( "blur" );
$( "#tabs").addClass( "blur" );
}

  function usunpracownika(){
    $( "#dialog-form4" ).dialog( "open" );
$( "#mainNav" ).addClass( "blur" );
$( "#menu" ).addClass( "blur" );
$( "#tabs").addClass( "blur" );
}

$('#typ').change(function() {
    var val = $("#typ option:selected").text();
    //alert(val);
    if(val!="Sala"){
     //   document.getElementById("salatyp").val("Wyk");
         document.getElementById("salat").disabled = true;
    }
    
    if(val=="Sala"){
     //   document.getElementById("salatyp").val("Wyk");
         document.getElementById("salat").disabled = false;
    }
});

$("#typ").trigger("chosen:updated");

 $( "#radio1" ).buttonset();
 
$( "#radiosy" ).buttonset();
$( "#button" ).button();
$( "#accordion,#accordion1" ).accordion({active:false, heightStyle: "content"});

 $( "#dialog-form,#dialog-form1,#dialog-form2,#dialog-form3,#dialog-form4,#dialog-form5" ).dialog({
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
	
});


$("#button6").click(function() {

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

$( "#button1,#button2,#button3,#button4,#opener,#button5,#button6,#button7,#buttons,#button8" ).button();
$("#mainNav").buttonset();

$( "#radioset" ).buttonset();
$("#buttons").submit();

function dodajzasob(){
    $( "#dialog-form2" ).dialog( "open" );
$( "#mainNav" ).addClass( "blur" );
$( "#menu" ).addClass( "blur" );
$( "#tabs").addClass( "blur" );
}

function usunzasob(){
    $( "#dialog-form3" ).dialog( "open" );
$( "#mainNav" ).addClass( "blur" );
$( "#menu" ).addClass( "blur" );
$( "#tabs").addClass( "blur" );
}





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

 $( "#check" ).button();


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


$( "#selectmenu" ).selectmenu();



$(function() {
    $( "#menu" ).menu({
      items: "> :not(.ui-widget-header)"
    });
});



$( "#tooltip" ).tooltip();



$("#button1,#button2,#button3,#button4,#button5,#button6,#button7,#button8").submit();

$( "#button1,#button2,#button3,#button4,#button5,#button6,#button7,#button8" ).button();



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
      window.location.reload(true);
        }
    });
});

$('#dodajopiszas').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajZasobOpisAkcja,
        type:'post',
        data:$('#dodajopiszas').serialize(),
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


$('#usunzastyp').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:usunZasobTypAkcja,
        type:'post',
        data:$('#usunzastyp').serialize(),
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




$('#dodajopiszastyp').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajZasobTypAkcja,
        type:'post',
        data:$('#dodajopiszastyp').serialize(),
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

$('#usunzas').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:usunZasobAkcja,
        type:'post',
        data:$('#usunzas').serialize(),
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

$('#usunopiszas').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:usunZasobOpisAkcja,
        type:'post',
        data:$('#usunopiszas').serialize(),
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






$('#formularz_zasoby_typ').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:updateZasobyTypAkcja,
        type:'post',
        data:$('#formularz_zasoby_typ').serialize(),
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


$('#formularz_zasob').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:updateZasobAkcja,
        type:'post',
        data:$('#formularz_zasob').serialize(),
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


