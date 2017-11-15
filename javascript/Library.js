// JavaScript Document
//跨浏览器的event对象
var EventUtil = {
    addHandler: function(element, type, handler) {
        if (element.addEventListener) {
            element.addEventListener(type, handler, false)
        } else if (element.attachEvent) {
            element.attachEvent("on" + type, handler)
        } else {
            element["on" + type] = handler;
        }
    },
    getEvent: function(event) {
        return event ? event : window.event;
    },
    getTarget: function(event) {
        return event.target || event.srcElement;
    },
    preventDefault: function(event) {
        if (event.preventDefault) {
            event.preventDefault();
        } else {
            event.returnValue = false;
        }
    },
    stopPropagation: function(event) {
        if (event.stopPropagation) {
            event.stopPropagation();
        } else {
            event.cancelBubble = true;
        }
    },
    removeHandler: function(element, type, handler) {
        if (element.removeEventListener) {
            element.removeEventListener(type, handler, false)
        } else if (element.detachEvent) {
            element.detachEvent("on" + type, handler)
        } else {
            element["on" + type] = null;
        }
    }
};
//跨浏览器的event对象结束
//判断浏览器
var Browser = { //定义Browser对象
    "iswhich": "",
    is: function() {
        var ua = navigator.userAgent.toLocaleLowerCase();
        if (ua.indexOf("msie") > -1) {
            this.iswhich = "ie";
        } else if (ua.indexOf("firefox") > -1) {
            this.iswhich = "firefox";
        } else if (ua.indexOf("chrome") > -1) {
            this.iswhich = "chrome";
        } else if (ua.indexOf("safari") > -1) {
            this.iswhich = "safari";
        }
    }
}
Browser.is();
//判断浏览器结束
//IE6支持透明图片
function iePNG() {
    for (var i = 0; i < document.images.length; i++) {
        var img = document.images[i]
        var imgName = img.src.toUpperCase();
        if (imgName.substring(imgName.length - 3, imgName.length) == "PNG") {
            var imgID = (img.id) ? "id='" + img.id + "' " : ""
            var imgClass = (img.className) ? "class='" + img.className + "' " : ""
            var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
            var imgStyle = "display:inline-block;" + img.style.cssText
            if (img.align == "left") imgStyle = "float:left;" + imgStyle
            if (img.align == "right") imgStyle = "float:right;" + imgStyle
            if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
            var strNewHTML = "<span " + imgID + imgClass + imgTitle
   + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
  + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
   + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>"
            img.outerHTML = strNewHTML
            i = i - 1
        }
    }
}
if (navigator.userAgent.indexOf("MSIE 6.0") != -1) {
    window.attachEvent("onload", iePNG);
}
//IE6支持透明图片
//弹出层以及拖动
var Popup = function() { //自定义拖动对象
    var dragging = null,
    diffX = 0,
    diffY = 0;
    function handler(event) { //事件句柄
        event = EventUtil.getEvent(event); //获取事件
        var target = EventUtil.getTarget(event); //触发事件对象
        switch (event.type) {
            case "mousedown":
                if (target.className.indexOf("drag") > -1) {
                    dragging = target;
                    diffX = event.clientX - target.offsetLeft;
                    diffY = event.clientY - target.offsetTop;
                }
                break;
            case "mousemove":
                if (dragging !== null) {
                    dragging.style.left = (event.clientX - diffX) + "px";
                    dragging.style.top = (event.clientY - diffY) + "px";
                }
                break;
            case "mouseup":
                dragging = null;
                break;
        }
    };
    return { //公共接口
        enable: function() {
            EventUtil.addHandler(document, "mousedown", handler);
            EventUtil.addHandler(document, "mousemove", handler);
            EventUtil.addHandler(document, "mouseup", handler);
        },
        disable: function() {
            EventUtil.removeHandler(document, "mousedown", handler);
            EventUtil.removeHandler(document, "mousemove", handler);
            EventUtil.removeHandler(document, "mouseup", handler);
        },
        popping: function(id, boolean) {
            var pop_obj = document.getElementById(id);
            pop_obj.style.display = "block";
            var pop_obj_h = pop_obj.offsetHeight,
            pop_obj_w = pop_obj.offsetWidth;
            if (Browser.iswhich == 'chrome') {
                pop_obj.style.top = ((document.body.clientHeight - pop_obj_h) / 2) + document.documentElement.scrollTop + "px";
            } else {
                pop_obj.style.top = ((document.documentElement.clientHeight - pop_obj_h) / 2) + document.documentElement.scrollTop + "px";
            }
            pop_obj.style.left = (document.documentElement.clientWidth - pop_obj_w) / 2 + "px";
            if (boolean) { //设置遮罩
                mask = document.createElement("div");
                mask.id = "mask";
                mask.style.position = "absolute";
                mask.style.top = 0 + "px";
                mask.style.zIndex = 500;
                mask.style.width = "100%";
                mask.style.height = document.body.clientHeight + document.body.scrollTop + "px";
                mask.style.opacity = 0.3;
                mask.style.filter = "alpha(opacity:30)";
                mask.style.display = "block";
                document.body.appendChild(mask);
            }
        },
        closed: function(id) { //关闭方法
            tar = document.getElementById(id);
            tar.style.display = "none";
            if (typeof mask != 'undefined') {
                mask.style.display = "none";
            }
        }
    }
} ();
//弹出层以及拖动结束
//获取下一个节点
var Node = {
    nextNode: function(id) {
        var nod = document.getElementById(id);
        if (nod.nextSibling.nodeType == 1) {
            return nod.nextSibling;
        } else {
            return nod.nextSibling.nextSibling;
        }
    }
}
//获取下一个节点
//标签切换
function tag(ulid, conid, a) { //ulid为ul的ID，conid为要显示模块的ID，a为数字
    var lis = document.getElementById(ulid).getElementsByTagName("li");
    for (var i = 0; i < lis.length; i++) {
        lis[i].className = (i == a) ? "current" : "";
        document.getElementById(conid + i).style.display = (i == a) ? "block" : "none";
    }
}
//标签切换结束
//表单美化
var Form = {
    formBeautify: function(ID, cls) { //ID为form表单Id,cls得到焦点时应用的class
        var form = document.getElementById(ID);
        for (i = 0; i < form.elements.length; i++) {
            (function(num) {
                if (form.elements[num].type == "text" || form.elements[num].type == "password") {
                    form.elements[num].onfocus = function() { //得到焦点处理方法
                        clas = form.elements[num].className;
                        form.elements[num].className += (" " + cls);
                        if (form.elements[num].value == form.elements[num].defaultValue) {
                            form.elements[num].value = "";
                        };
                    };
                    form.elements[num].onblur = function() { //失去焦点处理方法
                        if (form.elements[num].value == "") {
                            form.elements[num].value = form.elements[num].defaultValue;
                            form.elements[num].className = clas;
                        } else {
                            form.elements[num].className += (" " + cls);
                        }
                    };
                }
            })(i);
        }
    }
}
/*input 字符串输入最大值(maxheight)限制，默认(input的placeholder)输入框的值设置；使用，将要处理的input传人方法中，按需要设置input的placeholder属性，maxheight属性；*/
var funInputAttr = function(element) {
    var placeholder = '';
    var maxheight = 0;
    if (element && !("placeholder" in document.createElement("input")) && (placeholder = element.getAttribute("placeholder"))) {
        element.onfocus = function() {
            if (this.value === placeholder) {
                this.value = "";
            }
            this.style.color = '';
        };
        element.onblur = function() {
            if (this.value === "") {
                this.value = placeholder;
                this.style.color = '#666';
            }
        };
        //样式初始化
        if (element.value === "") {
            element.value = placeholder;
            element.style.color = 'black';
        }
    }
    if (element && (maxheight = element.getAttribute("maxheight"))) {
        element.onblur = function() {
            var end = Number(maxheight);
            var str = this.value;
            if (str.length > end) {
                this.value = str.substr(0, end);
            }
        };
    }
};

(function() {
    $(".close_notice").click(function() {
        $(".notice").slideUp(400);
    })
})();
//表单美化结束
$(document).ready(function() {
    /*通栏导航*/
    $(".nav_list li").hover(function() { //鼠标进入显示
        if (!$(this).children("a").hasClass('current')) {
            bgImageUrl = $(this).next().css("backgroundImage");
            var boxWidth = $(".nav_item_box").outerWidth(true),
            boxHeight = $(this).find(".nav_item_box").outerHeight(true);
            $(".nav_transparent,.navFrame").width(boxWidth);
            $(".nav_transparent,.navFrame").height(boxHeight + 2);
            $(this).find(".nav_transparent,.nav_item_box,.navFrame").show();
            $(this).children("a").addClass("hover");
        }
    },
    function() { //鼠标离开隐藏
        if (!$(this).children("a").hasClass('current')) {
            $(this).find(".nav_transparent,.nav_item_box,.navFrame").hide();
            $(this).children("a").removeClass("hover");
        }
    });
    $(".nav_list li").click(function() {
        $(this).children("a").blur()
    }); try {
        $(".nav_list a.current").parent().next().css("background", "none");
    } catch (e) {
        ///
    }
    /*通栏导航 end*/

    /*安全指南 手风琴效果*/
    $(".sfqEffect dt").click(function() { //鼠标第一次点击显示下拉
        $(this).next("dd").slideToggle(100);
        $(".sfqEffect dt").not(this).next("dd").slideUp(100)
    })
    /*安全指南 手风琴效果 end*/
});
/*点击图片左右滚动*/
function Slide(id, range, event) {//id要滚动元素的id值，range一次滚动步值，event直接直接传入event对象即可
    var event = EventUtil.getEvent(event),
    target = EventUtil.getTarget(event),
    cood = target.getAttribute("cood");
    var mainBox = $("#" + id),
    liWidth = $("#" + id + " li:first").outerWidth(true);
    var lis = mainBox.children("li").size(), //获取要滚动的容器及子元素宽度
	mainBoxLeft = Math.abs(mainBox.position().left);
    mainBox.width(lis * liWidth);
    var mainBoxWidth = mainBox.width();
    mainBoxLeft += range;
    var speed = 200; //滚动速度
    if (cood == 'next') {
        if (mainBoxWidth - mainBoxLeft > 0) {
            mainBox.animate({
                left: "-=" + range
            },
            speed)
        }
    } else if (cood == 'prev') {
        var left = mainBox.css('left').substr(0, mainBox.css('left').length - 2);
        if (left >= 0) {
            return;
        }
        mainBox.animate({
            left: "+=" + range
        },
            speed)
    }
};
/*点击图片左右滚动*/
/*焦点图*/
function Keyimage(boxCls, cls, range) { //boxCls滚动的容器，cls按钮class,range滚动范围
    var h = $("." + boxCls).children().size();
    var e = $("." + boxCls).children(":first").outerWidth(true);
    var d = $("." + boxCls);
    var c = 500; //滚动速度
    // d.width(h * e);
    $("." + cls + " li").click(function() {
        $(this).addClass("current");
        $("." + cls + " li").not(this).removeClass("current");
        var j = $("." + cls + " .current").index();
        switch (j) {
            case 0:
                d.animate({
                    marginLeft:
                -(range * j)
                },
            c);
                break;
            case 1:
                d.animate({
                    marginLeft:
                -(range * j)
                },
            c);
                break;
            case 2:
                d.animate({
                    marginLeft:
                -(range * j)
                },
            c);
                break;
            case 3:
                d.animate({
                    marginLeft:
                -(range * j)
                },
            c);
                break;
            case 4:
                d.animate({
                    marginLeft:
                -(range * j)
                },
            c);
                break;
            case 5:
                d.animate({
                    marginLeft:
                -(range * j)
                },
            c);
                break;
        };
    });
};
function subAutoRun() {
    t = setTimeout(function() {//banner自动轮播
        var curLi = $(".sub_banner_btn li.current"); //获取class为current的li;
        curLi.removeClass("current");
        curLi.next("li").addClass("current");
        var index = curLi.next("li").index();
        if (index == -1) {
            $(".sub_banner_list").animate({ marginLeft: "0" }, 300);
            $(".sub_banner_btn li:first").addClass("current");
        } else {
            $(".sub_banner_list").animate({ marginLeft: -index * 990 }, 500);
        }
        t = setTimeout(arguments.callee, 7000);
    }, 7000);
};
subAutoRun();
$(".sub_banner_list,.sub_banner_btn li").hover(function() {
    clearTimeout(t);
}, function() {
    subAutoRun();
});
(function() {//设置首页banner按钮个数
    var childs = $(".banner_list").find("img").size();
    if (childs <= 1) {
        $(".banner_btn").hide();
    } else {
        var cirl = document.createElement("span"), cirr = document.createElement("span");
        cirl.className = "circularl";
        cirr.className = "circular";
        var btnUl = $(".banner_btn")[0], itemsHTML = "";
        for (var i = 0; i < childs; i++) {
            itemsHTML += "<li></li>";
        };
        btnUl.innerHTML = itemsHTML;
        btnUl.firstChild.className = "current";
        btnUl.appendChild(cirl);
        btnUl.appendChild(cirr);
    }
})();
(function() {//设置二级页banner按钮个数
    var childs = $(".sub_banner_list").find("img").size();
    if (childs <= 1) {
        $(".sub_banner_btn").hide();
    } else {
        var btnUl = $(".sub_banner_btn")[0], itemsHTML = "";
        for (var i = 0; i < childs; i++) {
            itemsHTML += "<li>" + (i + 1) + "</li>";
        };
        btnUl.innerHTML = itemsHTML;
        btnUl.firstChild.className = "current";
    }
})();
/*焦点图*/
/*返回顶部*/
(function() {
    var maxh = $('body').height();
    var maxW = document.documentElement.clientWidth;
    if (maxW > 1024) {
        if (maxh > 1400) {
            var maxw = $('body').width();
            var t_left = maxw / 2 + 505;
            var $Idea = $('<a id="idea2" alt="意见建议" title="意见建议" href="http:\/\/www.yeepay.com\/category\/contact_service?suggestion=7" target="_blank">&nbsp;</a>').appendTo($("body"));
            var $backToTopEle = $('<a id="backToTop" alt="返回顶部" title="返回顶部" href="javascript:void(0);">&nbsp;</a>').appendTo($("body")).click(function() {
                $(this).blur();
                $("html, body").animate({
                    scrollTop: 0
                },
            50, function() {
                $('#idea').attr('id', 'idea2');
            });
            }),
        $backToTopFun = function() {
            var st = $(document).scrollTop(),
            winh = $(window).height(); (st > 0) ? $backToTopEle.show() : $backToTopEle.hide();
            if (st == 0) {
                if ($('#idea')[0]) {
                    $('#idea')[0].id = "idea2"
                } 
            };
            if ($('#idea2')[0]) {
                $('#idea2')[0].id = (st > 0) ? "idea" : "idea2";
            }
            //IE6下的定位
            if (!window.XMLHttpRequest) {
                $backToTopEle.css("top", st + winh - 195);
                $Idea.css("top", st + winh - 195 + 37);
            }
        };
            $backToTopEle.css("left", t_left);
            $Idea.css("left", t_left);
            $(window).bind("scroll", $backToTopFun);
            $(function() {
                $backToTopFun();
            });
        } else {
            var maxw = $('body').width();
            var t_left = maxw / 2 + 505;
            var $Idea2 = $('<a id="idea2" alt="意见建议" title="意见建议" href="http:\/\/www.yeepay.com\/category\/contact_service?suggestion=7" target="_blank">&nbsp;</a>').appendTo($("body"));
            $backToTopFun = function() {
                var st = $(document).scrollTop();
                winh = $(window).height();
                //IE6下的定位
                if (!window.XMLHttpRequest) {
                    $Idea2.css("top", st + winh - 195);
                }
            };
            $Idea2.css("left", t_left);
            $(window).bind("scroll", $backToTopFun);
            $(function() {
                $backToTopFun();
            });
        };
        $("#idea").mouseenter(function() { window.status = "ff" });
    };
})();

function autoNotice() {//公告自动滚动
    var maxTop = ($(".noticeBox a").size() - 1) * (-28), curTop = parseInt($(".noticeBox").css("marginTop"));
    if (curTop <= maxTop) {
        $(".notice .noticeBox").animate({ marginTop: "0" }, 100);
    } else {
        $(".notice .noticeBox").animate({ marginTop: "-=28" }, 500);
    };
    notTime = setTimeout(arguments.callee, 3500);
};
autoNotice();
$(".noticeBox a").hover(function() {
    window.clearTimeout(notTime);
}, function() {
    autoNotice()
});

/*返回顶部*/
$('a,input[type="button"],input[type="submit"]').bind('focus', function() {
    if (this.blur) {
        this.blur();
    }
});
