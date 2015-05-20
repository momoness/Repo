$( "#radio1" ).buttonset();
$("#button1,#button2,#button3,#button4,#button5,#button6,#button7").submit();

$( "#button1,#button2,#button3,#button4,#button5,#button6,#button7" ).button();
$( "#button" ).button();
$( "#accordion,#accordion1,#accordion2" ).accordion({active:false, heightStyle: "content"});

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

$(function() {
var tooltips = $( "[title]" ).tooltip({
position: {
my: "left top",
at: "right+5 top-5"
}
});
});


$("#button1").submit();

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

$(function() {
    $( "#menu" ).menu({
      items: "> :not(.ui-widget-header)"
    });
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

$( "#radio" ).buttonset();



$( "#datepicker,#datepicker1,#datepicker2,#datepicker3,#datepicker4,#datepicker5,#datepicker6,#datepicker7" ).datepicker({
    dateFormat: "yy-mm-dd",
	inline: true
});



$( "#slider" ).slider({
	range: true,
	values: [ 17, 67 ]
});


$(function() {
var tooltips = $( "[title]" ).tooltip({
position: {
my: "left top",
at: "right+5 top-5"
}
});
});



$( "#progressbar" ).progressbar({
	value: 20
});

$( "#ostrzezenie" ).dialog({
                 autoOpen:false,
                 height:130,
                 show:{effect:"fade", duration:100},
                 hide:{effect:"fade", duration:100}
             });
             
$('#dodajsemestr').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajSemestrAkcja,
        type:'post',
        data:$('#dodajsemestr').serialize(),
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


$('#usunsemestr').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:usunSemestrAkcja,
        type:'post',
        data:$('#usunsemestr').serialize(),
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


$('#dodajsemestrwy').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajSemestrWykluczeniaAkcja,
        type:'post',
        data:$('#dodajsemestrwy').serialize(),
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

$('#zmianawsem').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:dodajSemestrZmianyAkcja,
        type:'post',
        data:$('#zmianawsem').serialize(),
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



$('#updatesem').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:updateSemestrAkcja,
        type:'post',
        data:$('#updatesem').serialize(),
        success:function(){
           $("#ostrzezenie").dialog("open");
            setTimeout(function(){
    $("#ostrzezenie").dialog("close");
     }, 700);
      window.location.reload(true);
        }
    });
    
    
});

$('#zmsemestr').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:updateSemestrZmianyAkcja,
        type:'post',
        data:$('#zmsemestr').serialize(),
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






$('#usunsemestrwy').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:usunSemestrWykluczeniaAkcja,
        type:'post',
        data:$('#usunsemestrwy').serialize(),
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


$('#usunsemestrzm').submit(function(e){
    e.preventDefault();
    $.ajax({
        url:usunSemestrZmianyAkcja,
        type:'post',
        data:$('#usunsemestrzm').serialize(),
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

$( "#spinner" ).spinner();

$( "#selectmenu" ).selectmenu();





$( "#tooltip" ).tooltip();

// Hover states on the static widgets
$( "#dialog-link, #icons li" ).hover(
	function() {
		$( this ).addClass( "ui-state-hover" );
	},
	function() {
		$( this ).removeClass( "ui-state-hover" );
	}
);