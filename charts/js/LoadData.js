/**
* 时间格式化 返回格式化的时间
* @param date {object}  可选参数，要格式化的data对象，没有则为当前时间
* @param fomat {string} 格式化字符串，例如：'YYYY年MM月DD日 hh时mm分ss秒 星期' 'YYYY/MM/DD week' (中文为星期，英文为week)
* @return {string} 返回格式化的字符串
* 
* 例子:
* formatDate(new Date("january 01,2012"));
* formatDate(new Date());
* formatDate('YYYY年MM月DD日 hh时mm分ss秒 星期 YYYY-MM-DD week');
* formatDate(new Date("january 01,2012"),'YYYY年MM月DD日 hh时mm分ss秒 星期 YYYY/MM/DD week');
* 
* 格式：   
*    YYYY：4位年,如1993
*　　YY：2位年,如93
*　　MM：月份
*　　DD：日期
*hh：小时
*mm：分钟
*ss：秒钟
*星期：星期，返回如 星期二
*周：返回如 周二
*week：英文星期全称，返回如 Saturday
*www：三位英文星期，返回如 Sat
     */
function formatTen(num) {
    return num > 9 ? (num + "") : ("0" + num);
}

function formatDate(date, format) {
    if (arguments.length < 2 && !date.getTime) {
        format = date;
        date = new Date();
    }
    typeof format != 'string' && (format = 'YYYY年MM月DD日 hh时mm分ss秒');
    var week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', '日', '一', '二', '三', '四', '五', '六'];
    return format.replace(/YYYY|YY|MM|DD|hh|mm|ss|星期|周|www|week/g, function(a) {
        switch (a) {
        case "YYYY": return date.getFullYear();
        case "YY": return (date.getFullYear()+"").slice(2);
        case "MM": return formatTen(date.getMonth() + 1);
        case "DD": return formatTen(date.getDate());
        case "hh": return date.getHours();
        case "mm": return date.getMinutes();
        case "ss": return date.getSeconds();
        case "星期": return "星期" + week[date.getDay() + 7];
        case "周": return "周" +  week[date.getDay() + 7];
        case "week": return week[date.getDay()];
        case "www": return week[date.getDay()].slice(0,3);
        }
    });
}


//参考：http://www.cnblogs.com/carekee/articles/1678041.html
Date.prototype.DateAdd = function (strInterval, Number) {
    var dtTmp = this;
    switch (strInterval) {
        case 's': return new Date(Date.parse(dtTmp) + (1000 * Number));
        case 'n': return new Date(Date.parse(dtTmp) + (60000 * Number));
        case 'h': return new Date(Date.parse(dtTmp) + (3600000 * Number));
        case 'd': return new Date(Date.parse(dtTmp) + (86400000 * Number));
        case 'w': return new Date(Date.parse(dtTmp) + ((86400000 * 7) * Number));
        case 'q': return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number * 3, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
        case 'm': return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
        case 'y': return new Date((dtTmp.getFullYear() + Number), dtTmp.getMonth(), dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
    }
}

String.prototype.stringToDateTime = function () {
    var fullDate = this.split(" ")[0].split("-");
    var fullTime = this.split(" ")[1].split(":");
    return new Date(fullDate[0], fullDate[1] - 1, fullDate[2], (fullTime[0] != null ? fullTime[0] : 0), (fullTime[1] != null ? fullTime[1] : 0), (fullTime[2] != null ? fullTime[2] : 0));
}

String.prototype.stringToDate = function () {
    var fullDate = this.split("-");
    return new Date(fullDate[0], fullDate[1] - 1, fullDate[2]);
}

Date.prototype.format = function(format) {
    var date = {
            "Y+": this.getFullYear(),
            "M+": this.getMonth() + 1,
            "D+": this.getDate(),
            "h+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),
            "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
            if (new RegExp("(" + k + ")").test(format)) {
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1
                        ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
            }
    }
    return format;
}

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return "";
} 

function changeTwoDecimal(floatvar) {
    var f_x = parseFloat(floatvar);
    if (isNaN(f_x)) {
        return false;
    }
    var f_x = Math.round(floatvar * 100) / 100;
    return f_x;
}

function changeTwoInt(floatvar) {
    var f_x = parseFloat(floatvar);
    if (isNaN(f_x)) {
        return false;
    }
    var f_x = Math.ceil(floatvar);
    return f_x;
}

function ShowObject(e) {
    var ret = "Properties:\n";
    for (var prop in e) {
        var val = e[prop];
        if (typeof (val) === "function") {
            ret += (prop + "()");
        }
        else {
            ret += prop + ": " + val;
        }
        ret += ";\n";
    }
    alert(ret);
}

function DateDiff(sDate1, sDate2) {
    var aDate, oDate1, oDate2, iDays
    aDate = sDate1.split("-")
    oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0])
    aDate = sDate2.split("-")
    oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0])
    iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24)
    return iDays
} 

