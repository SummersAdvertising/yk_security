$(window).ready(function(){
	$('html,body').css({height:'100%',overflow:'hidden'});
});
$(window).load(function(){
	/* ------------------------------------------------ loading */
	$('#waiting').remove();
	$('html,body').css({height:'auto',overflow:'auto'});


	/* ------------------------------------------------ bxSlider */
	$('#news .bxslider').bxSlider({
		pager:true,
		auto:true
	});
	$('#honor .bxslider').bxSlider({
		pager:true,
		auto:true
	});


	/* ------------------------------------------------ parallax */
	parallax_PC();
	function parallax_PC(){
	  $('div#stage-1 .level-1').parallax({ "start": 0, "stop":430, "stop_point": 230 });
	  $('div#stage-1 .level-3').parallax({ "start": 0, "stop":350, "stop_point": -200 });

	  $('div#stage-2 .level-3').parallax({ "start": 300, "stop": 450 });

	  $('div#stage-3 #item-5').parallax({ "start": $("div#news").offset().top - 350, "stop": $("div#stage-3").offset().top - 480, "stop_point": 10});
	  $('div#stage-3 #item-4').parallax({ "start": $("div#news").offset().top - 300, "stop": $("div#stage-3").offset().top - 430, "stop_point": 10});
	  $('div#stage-3 #item-3').parallax({ "start": $("div#news").offset().top - 250, "stop": $("div#stage-3").offset().top - 380, "stop_point": 10});
	  $('div#stage-3 #item-2').parallax({ "start": $("div#news").offset().top - 200, "stop": $("div#stage-3").offset().top - 330, "stop_point": 10});
	  $('div#stage-3 #item-1').parallax({ "start": $("div#news").offset().top - 150, "stop": $("div#stage-3").offset().top - 280, "stop_point": 10});

	  $('div#stage-4 .level-1').parallax({ "start": 1800, "stop":2000, "stop_point": 190 });
	  $('div#stage-4 .level-3').parallax({ "start": 1950, "stop":2290, "stop_point": 405 });
	  $('div#stage-4 .level-2').parallax({ "start": 1950, "stop":2290, "stop_point": 528 });

	  $('div#stage-5 .level-2').parallax({ "start": 2500, "stop":3400, "stop_point": 120 });
	  $('div#stage-5 .level-3').parallax({ "start": 2700, "stop":3400, "stop_point": 240 });

	  $('div#stage-6 .level-2').parallax({ "start": 3900, "stop":4000, "stop_point": 60 });
	  $('div#stage-6 .level-3').parallax({ "start": 3900, "stop":4000, "stop_point": 135 });

	  $('div#stage-7 .level-1').parallax({ "start": 4500, "stop":5200, "stop_point": 105 });
	  $('div#stage-7 .level-2').parallax({ "start": 4500, "stop":5200, "stop_point": 195 });

	  $('div#stage-8 .level-2').parallax({ "start": 4600, "stop":5500, "stop_point": 10 });
	  $('div#stage-8 .level-3').parallax({ "start": 5400, "stop":5800, "stop_point": 30 });

	  $('div#stage-9 #item-3').parallax({ "start": 6000, "stop":6200, "stop_point": 195 });
	  $('div#stage-9 #item-2').parallax({ "start": 6100, "stop":6300, "stop_point": 195 });
	  $('div#stage-9 #item-1').parallax({ "start": 6200, "stop":6400, "stop_point": 195 });

	  $('div#stage-10 .level-3').parallax({ "start": 6700, "stop":7080, "stop_point": 24 });
	}


	/* ------------------------------------------------ menu */
	var $win = $(window),
		$ad = $('#menu').css('opacity', 0).show(),	// 讓區塊變透明且顯示出來
		_width = $ad.width(),
		_height = $ad.height(),
		_diffY = 200, _diffX = 0,	// 距離右及下方邊距
		_moveSpeed = 1200;	// 移動的速度
 
	// 先把 #menu 移動到定點
	function menu_PC(){
		$ad.css({
			top: $(document).height(),
			right: '0px',
			opacity: 1,
			'z-index':'999',
			display: 'block'
		});
	}
	function menu_mobile(){
		$ad.css({
			display: 'none'
		});
	}
 
	// 幫網頁加上 scroll 及 resize 事件
	$win.bind('scroll resize', function(){
		var $this = $(this);
		// 控制 #abgne_float_ad 的移動
		$ad.stop().animate({
			top: $this.scrollTop() + $this.height() - _height - _diffY,
			right: '0px'
		}, _moveSpeed);
	}).scroll();	// 觸發一次 scroll()


	/* ------------------------------------------------ all */
	var parallaxToggle = 0;
	var widthWindow = $(window).width();
	if(widthWindow < 883){
		menu_mobile();
	}else{
		parallax_PC();
		menu_PC();
	}

	/*when resize*/
	$(window).resize(function(){
		widthWindow = $(window).width();
		if(widthWindow < 883){
			menu_mobile();
		}else{
			menu_PC();
			if(parallaxToggle == 0){

				parallaxToggle = 1;
			}
		}
	});

});