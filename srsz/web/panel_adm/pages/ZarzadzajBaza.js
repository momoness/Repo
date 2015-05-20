
 $( "#button" ).button();
$( "#accordion,#accordion1" ).accordion({active:false});

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
	$( "#dialog" ).dialog( "open" );
        $( "#dialog-form" ).dialog( "close" );
	event.preventDefault();
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



$( "#tabs,#tabs-1,#tabs-2,#tabs-3,#tabs-4,#tabs-5,#tabs-6" ).tabs({


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



$( "#datepicker" ).datepicker({
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

$( "#selectmenu" ).selectmenu({
    change: function() {
        if($(this).val() != '') {
            window.location = $(this).val();
        }
    }
});


$(function() {
    $( "#menu" ).menu({
      items: "> :not(.ui-widget-header)"
    });
});


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