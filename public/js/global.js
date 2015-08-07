$(document).ready(function(){
	/* ------------------------------------------------ menu-mobile */
	var widthWindow = $(window).width();
	var widthHeight = $(window).height();

	if(widthWindow < 883){
		$('body > header > section').addClass('menu-m');
	}else{
		$('body > header > section').removeClass('menu-m');
	}
	/* when resize */
	$(window).resize(function(){
		widthWindow = $(window).width();
		if(widthWindow < 883){
			$('body > header > section').addClass('menu-m');
			if(toggle == 0){
				$('.menu-m').css({left:'-100%'});
			}
		}else{
			$('body > header > section').removeClass('menu-m');
			$('#dropmenu').hide();
			$('.menu-m').css({left:0});
			$('body > header').css({'height':60});
			ulToggle = 0;
			toggle = 0;
		}
	});

	/* buttonmenu */
	var toggle = 0;
	$('#navbar-toggle').click(function(){
		if(toggle == 0){
			$('.menu-m').css({overflow:'auto'}).animate({left:0},600,function(){
				$('html,body').css({overflow:'hidden', height:widthHeight});
			});
			$('body > header').css({'height':'100%'});
			toggle = 1;
		}else{
			$('.menu-m').animate({left:'-100%'},600,function(){$('body > header').css({'height':60});});
			$('html,body').css({overflow:'auto', height:'auto'});
			toggle = 0;
		}
	});

	/* dropmenu */
	var ulToggle = 0;
	$('#mainMenu>ul>li:nth-child(2)').children('a').click(function(){
		if((ulToggle == 0) && (widthWindow < 883)){
			$(this).addClass('active');
			$(this).next('#dropmenu').stop(true,true).slideDown(600,function(){ulToggle = 1;});
			return false;
		}
		if((ulToggle == 1) && (widthWindow < 883)){
			$(this).removeClass('active');
			$(this).next('#dropmenu').stop(true,true).slideUp(600,function(){ulToggle = 0;});
			return false;
		}
		
	});

	
	/* ------------------------------------------------ link-mobile */
	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
		$('body>footer .tel, #stage-1 .tel, #office a').click(function(){
			return true;
		});
	}
	else{
		$('body>footer .tel, #stage-1 .tel, #office a').click(function(){
			return false;
		});
	}


	/* ------------------------------------------------ ie8 */
	$('#noChange').click(function(){
		$('#hintBg').fadeOut(600);
	});
});