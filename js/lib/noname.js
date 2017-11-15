function loadDatetimeStart(obj) {
    if (obj == null) {
        obj = $("#startTime");
    }
    datetimeformat(obj);
    var d = new Date();
    obj.val(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
			+ ' 00:00:00');
}
function loadDatetimeEnd(obj) {
    if (obj == null) {
        obj = $("#endTime");
    }
    datetimeformat(obj);
    var d = new Date();
    obj.val(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
			+ ' 23:59:59');
}

function datetimeformat(obj) {
    obj.focus(function () {
        WdatePicker({
            dateFmt: 'yyyy-MM-dd HH:mm:ss'
        });
    });
}
function timebuttonbind(start, end, today, yesterday, week, month) {
    if (today == null) {
        today = $("#date_today");
    }
    if (yesterday == null) {
        yesterday = $("#date_yesterday");
    }
    if (week == null) {
        week = $('#date_inWeek');
    }
    if (month == null) {
        month = $('#date_inMonth');
    }
    if (start == null) {
        start = $('#startTime');
    }
    if (end == null) {
        end = $('#endTime');
    }
    today.click(function (e) {
        e.preventDefault();
        var d = new Date();
        start.val(d.getFullYear() + "-" + (d.getMonth() + 1) + "-"
				+ d.getDate() + ' 00:00:00');
        end.val(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 23:59:59');
        month.attr('style', 'color:#2261A0');
        yesterday.attr('style', 'color:#2261A0');
        week.attr('style', 'color:#2261A0');
        today.attr('style', 'color:#F60');
    });
    yesterday.click(function (e) {
        e.preventDefault();
        var d = new Date();
        d.setDate(d.getDate() - 1);
        var sd = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 00:00:00';
        var ed = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 23:59:59';
        start.val(sd);
        end.val(ed);
        today.attr('style', 'color:#2261A0');
        month.attr('style', 'color:#2261A0');
        week.attr('style', 'color:#2261A0');
        yesterday.attr('style', 'color:#F60');
    });
    week.click(function (e) {
        e.preventDefault();
        var d = new Date();
        var ed = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 23:59:59';
        d.setDate(d.getDate() - 6);
        var sd = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 00:00:00';
        start.val(sd);
        end.val(ed);
        today.attr('style', 'color:#2261A0');
        yesterday.attr('style', 'color:#2261A0');
        month.attr('style', 'color:#2261A0');
        week.attr('style', 'color:#F60');
    });
    month.click(function (e) {
        e.preventDefault();
        var d = new Date();
        var ed = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 23:59:59';
        d.setDate(d.getDate() - 30);
        var sd = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 00:00:00';
        start.val(sd);
        end.val(ed);
        today.attr('style', 'color:#2261A0;');
        yesterday.attr('style', 'color:#2261A0;');
        week.attr('style', 'color:#2261A0;');
        month.attr('style', 'color:#F60;');
    });
}
function loadDateWithSecond2(start, end) {
    loadDatetimeStart(start);
    loadDatetimeEnd(end);
    timebuttonbind(start, end);
}
function loadDateWithSecond3(start, end) {
    loadDatetimeStart(start);
    loadDatetimeEnd(end);
}
function loadDateWithSecond(init) {
    var today = $("#date_today");
    var yesterday = $("#date_yesterday");
    var week = $('#date_inWeek');
    var month = $('#date_inMonth');
    loadDatetimeStart();
    loadDatetimeEnd();

    today.click(function (e) {
        e.preventDefault();
        var d = new Date();
        $('#startTime').val(
				d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
						+ ' 00:00:00');
        $('#endTime').val(
				d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
						+ ' 23:59:59');
        month.attr('style', 'color:#2261A0');
        yesterday.attr('style', 'color:#2261A0');
        week.attr('style', 'color:#2261A0');
        today.attr('style', 'color:#F60');
    });
    yesterday.click(function (e) {
        e.preventDefault();
        var d = new Date();
        d.setDate(d.getDate() - 1);
        var sd = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 00:00:00';
        var ed = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 23:59:59';
        $('#startTime').val(sd);
        $('#endTime').val(ed);
        today.attr('style', 'color:#2261A0');
        month.attr('style', 'color:#2261A0');
        week.attr('style', 'color:#2261A0');
        yesterday.attr('style', 'color:#F60');
    });
    week.click(function (e) {
        e.preventDefault();
        var d = new Date();
        var ed = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 23:59:59';
        d.setDate(d.getDate() - 6);
        var sd = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 00:00:00';
        $('#startTime').val(sd);
        $('#endTime').val(ed);
        today.attr('style', 'color:#2261A0');
        yesterday.attr('style', 'color:#2261A0');
        month.attr('style', 'color:#2261A0');
        week.attr('style', 'color:#F60');
    });
    month.click(function (e) {
        e.preventDefault();
        var d = new Date();
        var ed = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 23:59:59';
        d.setDate(d.getDate() - 30);
        var sd = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
				+ ' 00:00:00';
        $('#startTime').val(sd);
        $('#endTime').val(ed);
        today.attr('style', 'color:#2261A0;');
        yesterday.attr('style', 'color:#2261A0;');
        week.attr('style', 'color:#2261A0;');
        month.attr('style', 'color:#F60;');
    });
};

function ajaxreq(options) {
    // $('[name="queryBtn"]').attr('class','disabled');
    var defaults = {
        type: "post",
        dataType: "json",
        timeout: 60000,
        cache: false,
        url: "",
        complete: function () {
            var process = $("#dataTable_processing");
            if (process) {
                $(process).css({
                    'visibility': 'hidden'
                });
            }
        }
    }
    options = $.extend(defaults, options);
    $.ajax(options);
}

/**
 * 弹出框，基本文字版
 * 
 * div#dialog_simple
 * 
 * 调用方法： dialog_simple() dialog_simple({width:200}) dialog_simple({html:'添加成功',
 * top: '20px', hide: true, time: 2000}) dialog_simple({html:'修改成功', time:
 * 2000})
 * 
 * 参数传入map {} content 提示内容，支持html标签 top 弹出层居上高度，默认136px hide 是否自动隐藏，默认true,隐藏
 * status 状态,默认成功：success，颜色为绿色，否则为红色 time 隐藏延迟时间，默认5秒=5000毫秒
 */
var dialog_simple = function (opts) {
    opts = $.extend({
        content: "恭喜，操作成功！",
        top: '136px',
        hide: true,
        status: 'success', // error
        time: 5000,
        isParent: true
    }, opts || {});
    var className = 'msg';
    if (opts.status == 'error') {
        className = 'errmsg';
    }
    var parent = window;
    if (opts.isParent) {
        parent = window.parent;
    }
    parent.$("#dialog_simple").remove();
    var s = '';
    s += '<div id="dialog_simple" style="position: absolute; width: 100%; padding-top: 2px; height: 24px; top: '
			+ opts.top + '; text-align: center;">';
    s += '<span class="' + className + '">' + opts.content + '</span>';
    s += '</div>';
    parent.$("body").prepend(s);
    if (opts.hide) {
        parent.$("#dialog_simple").delay(opts.time).fadeOut();
    }
};

/**
 * 简化提示，操作成功 c 内容 p 窗体默认true
 */
var dialog_simple_ok = function (c, p, top) {
    if (typeof (c) == "undefined") {
        c = "恭喜，操作成功！";
    }
    var isParent = true;
    if (typeof (p) != "undefined") {
        isParent = p;
    }
    var t = '136px';
    if (typeof (top) != "undefined") {
        t = top
    }
    if (isParent == false && t == '136px') {
        t = '0px';
    }
    dialog_simple({
        status: 'success',
        content: c,
        isParent: p,
        top: t
    });
}

/**
 * 简化提示，操作失败
 * 
 * c 内容 p 窗体默认true
 */
var dialog_simple_fail = function (c, p, top) {
    if (typeof (c) == "undefined") {
        c = "抱歉，操作失败！";
    }
    var isParent = true;
    if (typeof (p) != "undefined") {
        isParent = p;
    }
    var t = '136px';
    if (typeof (top) != "undefined") {
        t = top
    }
    if (isParent == false && t == '136px') {
        t = '0px';
    }
    dialog_simple({
        status: 'error',
        content: c,
        isParent: p,
        top: t
    });
}

/**
 * 弹出框，动态页面
 * 
 * 调用方式： dialog_iframe({url:$(this).attr("href"), title:"导航设置",
 * isParent:false}); dialog_iframe({url:'http://127.0.0.1:8080/security',
 * title:"安全设置", width:700, height:600});
 * 
 * 参数传入：map {} url 请求url，将返回页面至对话框内 title 弹出框标题，页面名称 width 弹出框宽度 height 弹出框高度
 * isParent 遮盖父窗体，默认遮盖父窗体。
 * 
 */
var dialog_iframe = function (opts) {
    opts = $.extend({
        url: "/404.jsp",
        title: "标题",
        width: 650,
        height: 500,
        isParent: true,
        closeOnEscape: true,
        resizable: true,
        draggable: true,
        scroll: false
        // 窗体内容翻屏
    }, opts || {});
    var parent = window;
    if (opts.isParent) {
        parent = window.parent;
    }
    var openfun = function (event, ui) {
    };
    if (!opts.closeOnEscape) {
        openfun = function (event, ui) {
            parent.$(".ui-dialog-titlebar-close").hide();
        }
    }

    parent.$("#dialog").remove();
    parent.$("body").prepend('<div id="dialog"></div>');
    var scollAttr = '';
    if (!opts.scroll) {
        scollAttr = ' frameborder="0" scrolling="no" ';
    }
    parent.$("#dialog").html(
			'<iframe ' + scollAttr + 'style="border: 0px; " src="' + opts.url
					+ '" width="100%" height="100%"></iframe>').dialog({
					    modal: true,
					    height: opts.height,
					    closeText: '关闭',
					    closeOnEscape: opts.closeOnEscape,
					    open: openfun,
					    resizable: opts.resizable,
					    draggable: opts.draggable,
					    width: opts.width,
					    title: opts.title
					});
}

/**
 * 弹出框，动态html
 * 
 * 调用方式： dialog_html({title:"导航设置", html:"<div>test</div>", isParent:false});
 * dialog_html({title:"安全设置", html:"<div>
 * <p>
 * test
 * </p>
 * </div>", width:700, height:600});
 * 
 * 参数传入：map {} title 弹出框标题 html 弹出框内容 width 弹出框宽度 height 弹出框高度 isParent
 * 遮盖父窗体，默认遮盖父窗体。
 * 
 */
var dialog_html = function (opts) {
    opts = $.extend({
        title: "标题",
        html: "",
        width: 500,
        height: 400,
        isParent: true
    }, opts || {});

    var parent = window;
    if (opts.isParent) {
        parent = window.parent;
    }
    parent.$("#dialog").remove();
    parent.$("body").prepend('<div id="dialog"></div>');
    parent.$("#dialog").html(opts.html).dialog({
        modal: true,
        height: opts.height,
        width: opts.width,
        title: opts.title
    });
}

/**
 * 关闭iframe页面弹出框 调用方式： dialog_close({callBack:function(){ // operating },
 * isParent:true})
 * 
 * 传入参数：map{} callBack 回调方法 isParent 参考dialog_iframe.isParent
 */
var dialog_close = function (opts) {
    opts = $.extend({
        callBack: function () {
        },
        isParent: true
    }, opts || {});

    var parent = window;
    if (opts.isParent) {
        parent = window.parent;
    }
    parent.$('#dialog').dialog('close');
    opts.callBack();
}

/**
 * 彈出框，確認對話框
 * 
 * 調用方式： dialog_confirm({yes:function(){alert(1)}});
 * 
 * 傳入參數：map{} title 对话框标题 content 对话框内容 width 弹出框宽度 height 弹出框高度 yes 确认 回调方法 no
 * 取消 回调方法 isParent 遮盖父窗体，默认不遮盖父窗体。
 * 
 */
var dialog_confirm = function (opts) {
    opts = $.extend({
        title: "操作确认",
        content: "真的要这么做？",
        width: 300,
        height: 140,
        yes: function () {
        },
        no: function () {
        },
        isParent: false
    }, opts || {});

    var parent = window;
    if (opts.isParent) {
        parent = this.parent;
    }
    parent.$("#dialog_confirm").remove();
    parent.$("body").prepend('<div id="dialog_confirm"></div>');
    parent.$("#dialog_confirm").html(opts.content).dialog({
        title: opts.title,
        height: opts.height,
        width: opts.width,
        modal: true,
        buttons: {
            "确认": function () {
                parent.$(this).dialog("close");
                opts.yes();
            },
            "取消": function () {
                parent.$(this).dialog("close");
                opts.no();
            }
        }
    });
};

/**
 * 弹出对话框，用于消息提示
 * 
 * 调用方式： dialog_prompt({title:'测试标题',content:'测试内容'})
 * dialog_prompt({title:'测试',yes:function(){alert(1)}});
 * 
 * 传入参数：map{} title 消息标题 content 消息内容 width 对话框宽度 height 对话框高度 yes 确认 回调方法
 * isParent 遮盖父窗体，默认不遮盖父窗体。
 * 
 */
var dialog_prompt = function (opts) {
    opts = $.extend({
        title: "消息",
        content: "内容",
        width: 320,
        height: 140,
        yes: function () {
        },
        isParent: false
    }, opts || {});

    var parent = window;
    if (opts.isParent) {
        parent = this.parent;
    }
    parent.$("#dialog_prompt").remove();
    parent.$("body").prepend('<div id="dialog_prompt"></div>');
    parent.$("#dialog_prompt").html(opts.content).dialog({
        title: opts.title,
        height: opts.height,
        width: opts.width,
        modal: true,
        buttons: {
            "确定": function () {
                parent.$(this).dialog("close");
                opts.yes();
            }
        }
    });
};

/**
 * 封装消息对话框,使其调用更简单
 * 
 * 调用方式： dialog_msg("没有选择商品！", 'warning'); dialog_msg("事情就这样简单");
 * 
 * 传入参数： content 提示框内容 type 提示类型，支持
 * 成功：succeed，警告：warning，提示：prompt，错误：error和默认消息：msg title 提示框标题
 * 
 */
var dialog_msg = function (content, type, title) {
    type = type || 'msg';
    switch (type) {
        case 'succeed':
            title = title || "成功";
            break;
        case 'warning':
            title = title || "警示";
            break;
        case 'prompt':
            title = title || "提示";
            break;
        case 'error':
            title = title || "错误";
            break;
        default:
            title = title || "消息";
            break;
    }
    content = '<div class="' + type + '">' + content + '</div>';

    dialog_prompt({
        title: title,
        content: content,
        width: 320,
        height: 140
    });
};

// 删除字符串俩端的空格
String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
// 删除字符串左端的空格
String.prototype.ltrim = function () {
    return this.replace(/(^\s*)/g, "");
}
// 删除字符串右端的空格
String.prototype.rtrim = function () {
    return this.replace(/(\s*$)/g, "");
}
function isEmpty(s) {
    s = s.trim();
    return s.length == 0;
}

function isNullOrEmpty(s) {
    if (s == null)
        return true
    return isEmpty(s);
}
function isEmail(s) {
    s = s.trim();
    var p = /^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.){1,4}[a-z]{2,3}$/i;
    return p.test(s);
}
function isNumber(s) {
    return !isNaN(s);
}
function isMobile(s) {
    s = s.trim();
    var regx = /^(((14[0-9]{1})|(13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    if (regx.test(s)) {
        return true;
    }
    return false;
}
function isURL(s) {
    s = s.trim().toLowerCase();
    var p = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
    return p.test(s);
}
function isPhone(s) {
    s = s.trim();
    var p = /^\d{3,4}-\d{7,8}$/;
    return p.test(s);
}
function isZip(s) {
    s = s.trim();
    var p = /^[1-9]\d{5}$/;
    return p.test(s);
}
function isDouble(s) {
    s = s.trim();
    var p = /^[-\+]?\d+(\.\d+)?$/;
    return p.test(s);
}
function isInteger(s) {
    s = s.trim();
    var p = /^[-\+]?\d+$/;
    return p.test(s);
}
function isEnglish(s) {
    s = s.trim();
    var p = /^[A-Za-z]+$/;
    return p.test(s);
}
function isChinese(s) {
    s = s.trim();
    var p = /^[\u0391-\uFFE5]+$/;
    return p.test(s);
}
function isIdNo(s) {
    s = s.trim();
    var p = /(^(\d{15}|\d{17}[\dxX])$)/;
    return p.test(s);
}
function isShortIp(s) {
    s = s.trim();
    var p = /(25[0-5])|(2[0-4]\d)|((1\d{2})|([1-9]?\d))/;
    return p.test(s);
}
function isMac(s) {
    s = s.trim();
    var p = /[A-F\d]{12}/;
    return p.test(s);
}

/**
 * 设置一类box全选，取消
 * 
 * 使用方法： setCheckboxAll('ids', true); 选中 setCheckboxAll('ids', false); 取消
 * setCheckboxAll('ids'); 取消
 * 
 * 传入参数： name 要选择的复选框名称 checked 设置选中：true，设置取消：false
 */
function setCheckboxAll(name, checked) {
    name = "input[name='" + name + "']";
    if (checked) {
        $(name).each(function () {
            $(this).prop("checked", true);
        });
    } else {
        $(name).each(function () {
            $(this).prop("checked", false);
        });
    }
}
/**
 * 获取选中box集合值
 * 
 * 使用方法： getCheckboxValues('ids', true); 选中值 getCheckboxValues('ids', false);
 * 未选中值 getCheckboxValues('ids'); 全部值
 * 
 * 传入参数： name 要获取的复选框名称 checked 选中值：true，未选中值：false，全部值（不传入或者其他）：empty
 * 
 * 返回值： "123,999,000"
 */
function getCheckboxValues(name, checked) {
    var values = new Array();
    if (checked == true) {
        name = "input[name='" + name + "']:checked";
    } else if (checked == false) {
        name = "input[name='" + name + "']:not(:checked)";
    } else {
        name = "input[name='" + name + "']";
    }
    $(name).each(function () {
        values.push($(this).val());
    });
    return values.join(",");
}
/**
 * 判定身份证开始
 */
var vcity = {
    11: "北京",
    12: "天津",
    13: "河北",
    14: "山西",
    15: "内蒙古",
    21: "辽宁",
    22: "吉林",
    23: "黑龙江",
    31: "上海",
    32: "江苏",
    33: "浙江",
    34: "安徽",
    35: "福建",
    36: "江西",
    37: "山东",
    41: "河南",
    42: "湖北",
    43: "湖南",
    44: "广东",
    45: "广西",
    46: "海南",
    50: "重庆",
    51: "四川",
    52: "贵州",
    53: "云南",
    54: "西藏",
    61: "陕西",
    62: "甘肃",
    63: "青海",
    64: "宁夏",
    65: "新疆",
    71: "台湾",
    81: "香港",
    82: "澳门",
    91: "国外"
};
isIDCardNo = function (card) {
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
    var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
    if (!reg.test(card)) {
        return false;
    }
    if (!checkProvince(card)) {
        return false;
    }
    if (!checkBirthday(card)) {
        return false;
    }
    if (!checkParity(card)) {
        return false;
    }
    return true;
};
// 取身份证前两位,校验省份
checkProvince = function (card) {
    var province = card.substr(0, 2);
    if (vcity[province] == undefined) {
        return false;
    }
    return true;
};
// 检查生日是否正确
checkBirthday = function (card) {
    var len = card.length;
    // 身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字
    if (len == '15') {
        var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;
        var arr_data = card.match(re_fifteen);
        var year = arr_data[2];
        var month = arr_data[3];
        var day = arr_data[4];
        var birthday = new Date('19' + year + '/' + month + '/' + day);
        return verifyBirthday('19' + year, month, day, birthday);
    }
    // 身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X
    if (len == '18') {
        var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
        var arr_data = card.match(re_eighteen);
        var year = arr_data[2];
        var month = arr_data[3];
        var day = arr_data[4];
        var birthday = new Date(year + '/' + month + '/' + day);
        return verifyBirthday(year, month, day, birthday);
    }
    return false;
};
// 校验日期
verifyBirthday = function (year, month, day, birthday) {
    var now = new Date();
    var now_year = now.getFullYear();
    // 年月日是否合理
    if (birthday.getFullYear() == year && (birthday.getMonth() + 1) == month
			&& birthday.getDate() == day) {
        // 判断年份的范围（3岁到100岁之间)
        var time = now_year - year;
        if (time >= 3 && time <= 100) {
            return true;
        }
        return false;
    }
    return false;
};
// 校验位的检测
checkParity = function (card) {
    // 15位转18位
    card = changeFivteenToEighteen(card);
    var len = card.length;
    if (len == '18') {
        var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8,
				4, 2);
        var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3',
				'2');
        var cardTemp = 0, i, valnum;
        for (i = 0; i < 17; i++) {
            cardTemp += card.substr(i, 1) * arrInt[i];
        }
        valnum = arrCh[cardTemp % 11];
        if (valnum == card.substr(17, 1)) {
            return true;
        }
        return false;
    }
    return false;
};
// 15位转18位身份证号
changeFivteenToEighteen = function (card) {
    if (card.length == '15') {
        var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8,
				4, 2);
        var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3',
				'2');
        var cardTemp = 0, i;
        card = card.substr(0, 6) + '19' + card.substr(6, card.length - 6);
        for (i = 0; i < 17; i++) {
            cardTemp += card.substr(i, 1) * arrInt[i];
        }
        card += arrCh[cardTemp % 11];
        return card;
    }
    return card;
};
/**
 * 判定身份证结束
 */
