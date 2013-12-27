$(function() {
    $.fn.parallax = function(options){
        var $$ = $(this);
        var parent = $$.parent("div");
        offset = $$.offset();
        var defaults = {
            "start": parent.offset().top,
            "stop": parent.offset().top + parent.height() - $$.height(),
            "top": $$.position().top,
            "stop_point": 0
        };
        var opts = $.extend(defaults, options);
        var move_diff = opts.stop_point - opts.top
        var scroll_diff = opts.stop - opts.start

        cal_top_position();

        return this.each(function(){
            $(window).bind('scroll', function() {
                cal_top_position();
            });
        });

        function cal_top_position(){
            windowTop = $(window).scrollTop();
            if((windowTop >= opts.start) && (windowTop <= opts.stop)) {
                var newCoord = move_diff * (windowTop - opts.start) / scroll_diff;
                $$.stop().animate({top: String((opts.top || 0) + newCoord)
                },1000,'easeOutCubic');
            }
            else if(windowTop > opts.stop){
                $$.stop().animate({top: String((opts.stop_point || 0))
                },1000,'easeOutCubic');
            }
        }
    };

    $.fn.wheel = function (callback) {
        return this.each(function () {
            $(this).on('mousewheel DOMMouseScroll', function (e) {
                e.delta = null;
                if (e.originalEvent) {
                    if (e.originalEvent.deltaY) {e.delta = e.originalEvent.deltaY * -1;} //Chrome
                    else if (e.originalEvent.wheelDelta) {e.delta = e.originalEvent.wheelDelta;} //IE
                    else if (e.originalEvent.detail) {e.delta = e.originalEvent.detail * -60;} //Firefox
                }

                if (typeof callback == 'function') {
                    callback.call(this, e);
                }
            });
        });
    };

    //調整滾軸速度
    $('body').wheel(function (e) {
        e.preventDefault();
        var get_scroll_postion = getScrollOffsets();
        window.scrollTo(get_scroll_postion.x, get_scroll_postion.y - e.delta/5);
    });

    // Return the current scrollbar offsets as the x and y properties of an object
    function getScrollOffsets(w) {
        // Use the specified window or the current window if no argument
        w = w || window;

        // This works for all browsers except IE versions 8 and before
        if (w.pageXOffset != null) return {
            x: w.pageXOffset,
            y:w.pageYOffset
        };

        // For IE (or any browser) in Standards mode
        var d = w.document;
        if (document.compatMode == "CSS1Compat") {
            return {
                x:d.documentElement.scrollLeft,
                y:d.documentElement.scrollTop
            };
        }

        // For browsers in Quirks mode
        return { 
            x: d.body.scrollLeft,
            y: d.body.scrollTop
        }; 
    }

    //視差
    $('div#stage-1 .level-1').parallax({ "start": 0, "stop":430, "stop_point": 230 });
    $('div#stage-1 .level-3').parallax({ "start": 0, "stop":350, "stop_point": -200 });

    $('div#stage-2 .level-3').parallax({ "start": 300, "stop": 450 });

    $('div#stage-3 #item-5').parallax({ "start": $("div#news").offset().top - 350, "stop": $("div#stage-3").offset().top - 480, "stop_point": 250});
    $('div#stage-3 #item-4').parallax({ "start": $("div#news").offset().top - 300, "stop": $("div#stage-3").offset().top - 430, "stop_point": 250});
    $('div#stage-3 #item-3').parallax({ "start": $("div#news").offset().top - 250, "stop": $("div#stage-3").offset().top - 380, "stop_point": 250});
    $('div#stage-3 #item-2').parallax({ "start": $("div#news").offset().top - 200, "stop": $("div#stage-3").offset().top - 330, "stop_point": 250});
    $('div#stage-3 #item-1').parallax({ "start": $("div#news").offset().top - 150, "stop": $("div#stage-3").offset().top - 280, "stop_point": 250});

    $('div#stage-4 .level-1').parallax({ "start": 1800, "stop":2000, "stop_point": 190 });
    $('div#stage-4 .level-3').parallax({ "start": 1950, "stop":2290, "stop_point": 405 });
    $('div#stage-4 .level-2').parallax({ "start": 1950, "stop":2290, "stop_point": 528 });

    //$('div#service').parallax({ "start": 2350, "stop":2850, "stop_point": 0 });
    //$('div#stage-5').parallax({ "start": 2500, "stop":2945, "stop_point": 0 });
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

    //$('div#stage-10 .level-2').parallax({ "start": 6700, "stop":7080, "stop_point": 70 });
    $('div#stage-10 .level-3').parallax({ "start": 6700, "stop":7080, "stop_point": 24 });
});

