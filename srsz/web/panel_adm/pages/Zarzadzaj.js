
$("#button1,#button2,#button3,#button4,#button5,#button6,#button7,#button8").submit();

$( "#button1,#button2,#button3,#button4,#button5,#button6,#button7,#button8" ).button();
$( "#accordion,#accordion1,#accordion2" ).accordion({animated:"bounceslide",active:false, heightStyle: "content"});

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
	
});

function przeladuj(){

/*$.ajax({
    
    dataType:"html",       
    url: "ZarzadzajBaza.html",

success: function(result){
        $("body").html(result);
    }
});
*/
}

$("#button6").click(function() {

});

$( "#opener" ).click(function() {
$( "#dialog-form" ).dialog( "open" );
$( "#mainNav" ).addClass( "blur" );
$( "#menu" ).addClass( "blur" );
$( "#tabs").addClass( "blur" );

});


  
 
$( "#button1" ).click(function( event ) {
	$( "#dialoguzytkownik" ).dialog( "open" );
	event.preventDefault();
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




$( "#button1,#button2,#button3,#button4,#opener,#button5,#button6,#button7" ).button();
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

$(function() {
var tooltips = $( "[title]" ).tooltip({
position: {
my: "left top",
at: "right+5 top-5"
}
});
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
    dateFormat: "yy-mm-dd",
	inline: true
});



$( "#slider" ).slider({
	range: true,
	values: [ 17, 67 ]
});

$( "#ostrzezenie" ).dialog({
                 autoOpen:false,
                 height:130,
                 show:{effect:"fade", duration:100},
                 hide:{effect:"fade", duration:100}
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

$('#dodajuprawnienie').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajUprawnienieAkcja,
        type:'post',
        data:$('#dodajuprawnienie').serialize(),
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

$('#usunuprawnieniezas').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:usunUprawnienieZasobAkcja,
        type:'post',
        data:$('#usunuprawnieniezas').serialize(),
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

$('#usunuprawnienieos').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:usunUprawnienieOsobaAkcja,
        type:'post',
        data:$('#usunuprawnienieos').serialize(),
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

$('#usunuprawnienie').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:usunUprawnieniaAkcja,
        type:'post',
        data:$('#usunuprawnienie').serialize(),
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

$('#dodajuprawnienieos').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajUprawnienieOsobaAkcja,
        type:'post',
        data:$('#dodajuprawnienieos').serialize(),
        success:function(odpowiedz){
            odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie1Komunikat").append(odp);
           $("#ostrzezenie").dialog("open");
            setTimeout(function(){
    $("#ostrzezenie").dialog("close");
     }, 700);
      window.location.reload(true);
     
     // $("#usunuprawnienieosse").load(location.href + "#usunuprawnienieosse");
     
    
        }
    });
});


$('#dodajuprawnieniezas').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajUprawnienieZasobAkcja,
        type:'post',
        data:$('#dodajuprawnieniezas').serialize(),
        success:function(odpowiedz){
            odp = odpowiedz.replace(/(\r\n|\n|\r)/gm,"");
            $("#ostrzezenie1Komunikat").append(odp);
           $("#ostrzezenie").dialog("open");
            setTimeout(function(){
    $("#ostrzezenie").dialog("close");
     }, 700);
      window.location.reload(true);
     // $("#usunuprawnienieosse").load(location.href + "#usunuprawnienieosse");
     
    
        }
    });
});





$( "#tooltip" ).tooltip();

$(function() {
var tooltips = $( "[title]" ).tooltip({
position: {
my: "left top",
at: "right+5 top-5"
}
});
});





$( "#dialog-link, #icons li" ).hover(
	function() {
		$( this ).addClass( "ui-state-hover" );
	},
	function() {
		$( this ).removeClass( "ui-state-hover" );
	}
);