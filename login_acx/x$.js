/**
 * js工具方法库
 */
var winTop = $.dialog.top;
(function($) {
	if (!window['x$']) { window['x$'] = {}; }
	x$.stringUtil = coreString = {};
	x$.dateUtil = coreDate = {};
	x$.numberUtil = coreNumber = {};
	x$.arrayUtil = coreArray = {};
	x$.booleanUtil = coreBoolean = {};

	//*******************公共工具方法定义  begin********************
	
	/** 测试对象是否是布尔（Boolean）类型值 */
	x$.isBoolean = function (obj) { return $.type(obj) == "boolean"; };

	/** 测试对象是否是字符串（String）类型值 */
	x$.isString = function (obj) { return $.type(obj) == "string"; };
	
    /** 测试对象是否是日期（Date）类型值 */
	x$.isDate = function (obj) { return $.type(obj) == "date"; };

    /** 测试对象是否是正则表达式（RegExp） */
	x$.isRegExp = function (obj) { return $.type(obj) == "regexp"; };

    /** 测试传入的参数是否是一个 javscript 对象 */
	x$.isObject = function (obj) { return $.type(obj) == "object"; };
	
	/** 判断对象是否是数值类型 */
	x$.isNumber = function (obj) { return $.type(obj) == "number"; };
	
	/**
	 * 增加命名空间功能 
	 * 使用方法：x$.ns('jQuery.bbb.ccc','jQuery.eee.fff');
	 */
	x$.ns = function() {
		var o = {}, d;
		for (var i = 0; i < arguments.length; i++) {
			d = arguments[i].split(".");
			o = window[d[0]] = window[d[0]] || {};
			for (var k = 0; k < d.slice(1).length; k++) {
				o = o[d[k + 1]] = o[d[k + 1]] || {};
			}
		}
		return o;
	}
	
	/**
	 * 将form表单元素的值序列化成对象 
	 * 使用方法： x$.serializeForm($('#formId'))
	 * @returns 格式化后的字符串
	 */
	x$.serializeForm = function(form) {
		var o = {};
		$.each(form.serializeArray(), function(index) {
			if (this['value'] != undefined && this['value'].length > 0) {// 如果表单项的值非空，才进行序列化操作
				if (o[this['name']]) {
					o[this['name']] = o[this['name']] + "," + this['value'];
				} else {
					o[this['name']] = this['value'];
				}
			}
		});
		return o;
	}
	
	/**
	 * 
	 * x$.createwindow.handler 这个handler代表弹出的dialog句柄
	 * 
	 * @returns x$.createwindow.xxx 这个xxx是可以自己定义名称，主要用在弹窗关闭时，刷新某些对象的操作，可以将xxx这个对象预定义好
	 */
	x$.createWindow = function(options) {
		if (x$.createWindow.handler == undefined) {// 避免重复弹出
			var opts = $.extend({
				//zIndex : 1,
				lock : true,
				padding : 0,
				title : '提示信息',
				width : 600,
				height : 480,
				opacity : 0.3,
				cache : false,
				cancelVal : '关闭',
				cancel : function() {
					if ($('.jq_search_panel_class').length > 0) {
						$('.jq_search_panel_class').remove();
					}
					x$.createWindow.handler = undefined;
					x$.createWindow.openner_dataGrid = undefined;
					x$.createWindow.validForm = undefined;
				},
				close : function() {
          try {
            $('.easyui-datetimebox,.easyui-combobox,.easyui-combotree,.easyui-combogrid,.easyui-datebox', $('#jq_through_box_' + options.className)).each(function() {
              $(this).combo('destroy');
            });
          } catch(e) {}					
				}
			}, options);
			var throughBox = $.dialog.through(opts);

			if (opts.href) {
				$.ajax({
					url: opts.href + (opts.href.indexOf('?') == -1 ? '?' : '&') + 'menuFlag=true',
					dataType : 'html',
					task: function (data, textStatus, jqXHR) {
						throughBox.content('<div style="padding-top:10px;" id="jq_through_box_' + opts.className + '">' + data + '</div>');
						$.parser.parse('#jq_through_box_' + opts.className);
					},
					cache: false
				});
			}
			
			return x$.createWindow.handler = throughBox;
		}
	}
  x$.myDialog = function(options) {
    var defaultId = 'myDialog' + ((new Date()).valueOf());
    var defaultOpts = {
      id: defaultId,
      lock: true,
      opacity: 0.3,
      padding: 0
    };
    var opts = $.extend({}, defaultOpts, options);
    var dialog = art.dialog(opts);
    if (typeof options.url === "string") {
      $.ajax({
        type: 'get',
        url: options.url,
        dataType: 'html',
        cache: false
      }).done(function(data){
          try {
            var responseJSON = JSON.parse(data);
            if (responseJSON.success != undefined && !responseJSON.success && responseJSON.status == 100){
              winTop.$.dialog({
                title: '消息',
                width: 150,
                content: responseJSON.msg,
                icon: 'warning',
                time: 3
              });
            } else if (responseJSON.success != undefined && !responseJSON.success && responseJSON.status == 200) {
              winTop.$.dialog({
                title: '消息',
                width: 150,
                content: responseJSON.msg,
                icon: 'warning',
                ok: function () {
                  window.location.href = (jsCtx || '') + '/loginUI';
                }
              });
            }
          } catch (e) { // Normal
            dialog.content(data);
          }
          
      });
    }
    return dialog;
  };
	
	/**
	 * 获取当前页面 url 参数。
	 * 返回值：该方法返回一个数组，数组中的每个元素都是一个 JSON 对象，该 JSON 对象包含如下属性：
	 * name: 表示 url 参数的名称；
	 * value: 表示 url 参数的值；
	 * 也可以通过数组访问器快速访问某个特定名称的参数值，方法如：x$.getRequest()["id"]。
	 */
	x$.getRequest = function() {
		var search = location.search;
		if (search.substr(0, 1) == "?") {
			search = search.substr(1, search.length - 1);
		}
		var result = [];
		if (search.length > 0) {
			var params = search.split("&");
			for (var i = 0; i < params.length; i++) {
				var param = params[i];
				var pos = param.indexOf("=");
				var name = param.substring(0, pos);
				var value = param.substr(pos + 1);
				result.push({
					name : name,
					value : value
				});
				result[name] = value;
			}
		}
		return result;
	};
	
	/**
	 * 将普通数据构建成树格式化数据
	 * @param data
	 * @param options
	 * @returns
	 */
	x$.buildTreeData = function(data, options) {
		var opt = $.extend({idFiled : 'id', textFiled : 'text', parentField : 'pid'},options);
		var idFiled = opt.idFiled || 'id';
		var textFiled = opt.textFiled || 'text';
		var parentField = opt.parentField || 'pid';
		var i, l, treeData = [], tmpMap = [];
		for (i = 0, l = data.length; i < l; i++) {
			tmpMap[data[i][idFiled]] = data[i];
		}
		for (i = 0, l = data.length; i < l; i++) {
			if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
				if (!tmpMap[data[i][parentField]]['children'])
					tmpMap[data[i][parentField]]['children'] = [];
				data[i]['text'] = data[i][textFiled];
				tmpMap[data[i][parentField]]['children'].push(data[i]);
			} else {
				data[i]['text'] = data[i][textFiled];
				treeData.push(data[i]);
			}
		}
		return treeData;
	};
	//*******************公共工具方法定义  end********************
	
	//*******************String工具方法定义  begin********************
	/**
	 * 增加formatString功能 
	 * 使用方法：  x$.stringUtil.formatString('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
	 */
	coreString.formatString = function(str) {
		for (var i = 0; i < arguments.length - 1; i++) {
			str = str.replace("{" + i + "}", arguments[i + 1]);
		}
		return str;
	}
	
	/**
	 * 用新字符串替换与给定字符串匹配的所有子串；
	 * 该方法将返回源字符串处理后的一个副本，而不会改变源字符串的值。
	 */
	coreString.replaceAll = function(str, substr, replacement, ignoreCase) {
        if (!substr || substr == replacement) { return str; }
        //var regexp = coreString.isRegExp(substr) ? substr : new RegExp(String(substr), ignoreCase ? "gm" : "igm");
        //return str.replace(regexp, replacement);
        //str = String(str);
        var length = str.length, i = 0;
        while (str.indexOf(substr) > -1 && i++ < length) { str = str.replace(substr, replacement); }
        return str;
    };
	//*******************String工具方法定义  end********************
    
    coreDate.addDays = function(d, n) {
        var t = new Date(d);
        t.setDate(t.getDate() + n);
        return t;
    };
    
    coreDate.addMonths = function(d, n) {//日期+月。日对日，若目标月份不存在该日期，则置为最后一日
        var t = new Date(d);
        t.setMonth(t.getMonth() + n);
        if (t.getDate() != d.getDate()) { t.setDate(0); }
        return t;
    };
    
    coreDate.currentDateString = function(date) {
    	if (!date)
    		date = new Date();
    	var y = date.getFullYear();
    	var m = date.getMonth()+1;
    	var d = date.getDate();
    	return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
    };
    
    coreDate.currentDateTimeString = function(date) {
    	if (!date)
    		date = new Date();
    	var y = date.getFullYear();
    	var m = date.getMonth()+1;
    	var d = date.getDate();
    	var hh = date.getHours();
    	var mi = date.getMinutes();
    	var ss = date.getSeconds();
    	return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d) + '  ' +  (hh<10?('0'+hh):hh) +':' +(mi<10?('0'+mi):mi) +':' + (ss<10?('0'+ss):ss) ;
    };
	
})(jQuery);