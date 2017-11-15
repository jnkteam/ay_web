// JavaScript Document
$(document).ready(function() {
    /*登录*/
    (function() {
        var login_entrance = document.getElementById("login_entrance"), pasCopy = document.getElementById("pasCopy"), password = document.getElementById("password");
        var defaultValue = '';
        try {
            defaultValue = pasCopy.defaultValue;
        }
        catch (e) {
        }
        if (pasCopy) {
            pasCopy.onclick = function() {
                pasCopy.style.display = "none";
                password.focus();
            };

            $(password).blur(function() {
                if (password.value == defaultValue || password.value == "") {
                    pasCopy.blur();
                    $(password).removeClass("focus");
                    pasCopy.style.display = "block";
                }
            });
        }
    })();
    /*登录 end*/
    (function() {
        var news_list = $(".news_list"),
        lis = $(".news_list ul li");
        var fadeSpeed = 1000,
        showSpeed = 5000;
        function nextLi(cur, target) {
            if (target == undefined || target.className == "next_news") {
                if ($(cur).index() == $(".news_list ul li:last").index()) {
                    $(".news_list li:first").fadeIn(fadeSpeed).attr("news", "curNews");
                };
                $(cur).removeAttr("news").hide();
                $(cur).next().fadeIn(fadeSpeed).attr("news", "curNews");
            } else if (target.className == "prev_news") {
                if ($(cur).index() == $(".news_list ul li:first").index()) {
                    $(".news_list li:last").fadeIn(fadeSpeed).attr("news", "curNews");
                };
                $(cur).removeAttr("news").hide();
                $(cur).prev().fadeIn(fadeSpeed).attr("news", "curNews");
            };
        }
        function autoShow(event) {
            try {
                var target = EventUtil.getTarget(event);
                for (i = 0; i < lis.length; i++) {
                    if (lis[i].getAttribute("news") == "curNews") {
                        nextLi(lis[i], target);
                        break;
                    }
                }
            } catch (e) {
                for (i = 0; i < lis.length; i++) {
                    if (lis[i].getAttribute("news") == "curNews") {
                        nextLi(lis[i]);
                        break;
                    }
                }
            };
        }
        var timeId = setInterval(autoShow, showSpeed);
        $(".next_news,.prev_news").live("click",
        function(event) {
            autoShow(event);
        })
    })();

    $(".tradeGroup>.trade:nth-child(3n),.tradeGroup .trade:last").css("background", "none");
    $(".activity dl:first").children("dt").children("a").css({ "fontWeight": "bold" });
    $(".activity dl:first").css({ "border-top": "none", "padding-top": "0px" });
    $(".activity dl").mouseenter(function() {
        $(this).addClass("hover");
        $(".activity dl").not(this).removeClass("hover");
        $(".activity dl:first").css({ "border-top": "none" });
        $(".activity dl").not(this).children("dt").children("a").css({ "fontWeight": "normal" })
        $(this).children("dt").children("a").css({ "fontWeight": "bold" })
        var j = $(this).children("dt").text();
        $(".activ_img img").attr({
            title: j,
            alt: j
        })
    })

    if ($('.active_img')) {
        setTimeout(function() {
            $('.active_img').slideUp('slow');
        }, 5000);
    }

    $con1Fun = function() {
        var st = $(document).scrollTop(),
		winh = $(window).height();

        if (!window.XMLHttpRequest) {
            $("#con1").css("top", st + winh - 120);
        }
    };
    $(window).bind("scroll", $con1Fun);
    $(function() {
        $con1Fun();
    });

    $(".close1").click(function() {
        $("#con1").animate({ height: "0", opacity: "0" }, 1000);
    })
    setTimeout(Hidebox, 5000);

});
function Hidebox(){
		if($("#con1").height()<=0){
			return;
		}
		$("#con1").animate({height:"0",opacity:"0"},1000);
		
}

$(".hall_prev_group,.hall_next_group").click(function(event) {
    Slide('hall_list', 240, event)
});
Keyimage("tradeGroup","solutions_btn",687);
(function(){
var logForm=document.getElementById("login_form");
var busForm=document.getElementById("bus_login_form");
if(logForm && busForm){
Form.formBeautify("login_form");
Form.formBeautify("bus_login_form");
}
})();
/*banner*/
(function(){
var winW=$(window).width(true),picW=$(".banner_list img").width(),leftW=(winW-picW)/2;
var banner_list=$(".banner_list");
    $('.banner_list img').css({ "left":leftW+"px"});
})();
Keyimage("banner_list","banner_btn",2000);
function autoRun(){tim=setTimeout(function(){//banner�Զ��ֲ�
             var curLi=$(".banner_btn li.current");//��ȡclassΪcurrent��li;
			 curLi.removeClass("current");
			 curLi.next("li").addClass("current");
			 var index=curLi.next("li").index();
			 if(index==-1){
				 $(".banner_list").animate({marginLeft:"0"},30);
				 $(".banner_btn li:first").addClass("current");
				 }else{
			 $(".banner_list").animate({marginLeft:-index*2000},500);
				 }
	tim=setTimeout(arguments.callee,7000);
	},7000);
};
autoRun();
$(".banner_list,.banner_btn li").hover(function(){
	 clearTimeout(tim);
	},function(){
	 autoRun();
	});
/*banner end*/
(function(){
	var ua = navigator.userAgent.toLocaleLowerCase();
	if(ua.indexOf("msie 6.0")>-1){
		//$("#loginTr,#loginEntrance").hide();
		$("#loginTr3,#loginEntrance3").show();
		}else{
			//$("#loginTr,#loginEntrance").show();
			//$("#loginTr3,#loginEntrance3").hide();
			//$("#loginTr,#loginEntrance").hide();
			$("#loginTr3,#loginEntrance3").show();
			}
})();
