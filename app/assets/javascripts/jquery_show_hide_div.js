//<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js" type="text/javascript"></script>
//<script type="text/javascript">

$(document).ready(function(){

        $(".slidingDiv").hide();
        $(".show_hide").show();

	$('.show_hide').click(function(){
       $(this).next(".slidingDiv").slideToggle();
	});
});



//</script>