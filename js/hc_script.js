/* Credit: /www.templatemo.com */
    
$(document).ready( function() {        

	// sidebar menu click
	$('.templatemo-sidebar-menu li.sub a').click(function(){
		$(this).parent().siblings().removeClass('open').removeClass('dropup');
		
		if($(this).parent().hasClass('open')) {
			$(this).parent().removeClass('open');
		} else {
			$(this).parent().addClass('open');
		}
		
		if ($(this).parent().hasClass('dropup')) {
			$(this).parent().removeClass('dropup');
		} else {
			$(this).parent().addClass('dropup');
		}
	});  // sidebar menu click

}); // document.ready

function ImgReSize(e, x, y)
{
     e.width=x;
     e.height=y;
}
