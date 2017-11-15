var jsfileversion = "1.0";
var scriptOptions = {};
var source = [];
var jsCtx = "";// 上下文路径
// parse arguments
var parseJsArgument = function() {
	var scripts = document.getElementsByTagName("script");
	for ( var i = 0; i < scripts.length; i++) {
		var src = scripts[i].src;
		if (src && src.match(/include_js\.js/)) {
			if (src.indexOf('?') != -1) {
				var srcOptions = src.split('?')[1].replace(
						new RegExp("%22", "gm"), "\"").replace(
						new RegExp("%27", "gm"), "\'");
				try {
					scriptOptions = eval("(" + srcOptions + ")");
				} catch (err) {
					if (typeof (JSON) == 'object' && JSON.parse) {
						scriptOptions = JSON.parse(srcOptions);
					}
				}
			}
		}
	}
}

//document.domain = 'swiftpass.cn';

parseJsArgument();
jsCtx = scriptOptions.ctx || ""; // 赋值上下文路径

source[source.length] = "/js/jquery-1.11.1.min.js";
source[source.length] = "/js/jquery-migrate-1.2.1.min.js";
source[source.length] = "/js/plugins/backbone/underscore.js";
source[source.length] = "/js/plugins/backbone/backbone.js";
source[source.length] = "/js/plugins/artDialog/jquery.artDialog.js";
source[source.length] = "/js/plugins/artDialog/plugins/iframeTools.js";
source[source.length] = "/js/plugins/json/jquery.json-2.2.min.js";
source[source.length] = "/js/common/x$.js";
source[source.length] = "/js/common/extWidget.js";
source[source.length] = "/js/common/base.js";
source[source.length] = "/js/plugins/validform/js/Validform_v5.3.2.js?v=20161009";
source[source.length] = "/js/plugins/validform/js/Validform_Datatype.js";
source[source.length] = "/js/plugins/Highcharts-4.2.1/js/highcharts.js";
source[source.length] = "/js/plugins/Highcharts-4.2.1/js/modules/exporting.js";

//source[source.length] = "/js/datepicker/jquery.datetimepicker.js";//日期控件

source[source.length] = "/js/laydate/laydate.js";//日期控件

if (typeof scriptOptions.ztree != 'undefined') {
	source[source.length] = "/js/plugins/zTree/js/jquery.ztree.all-3.5.min.js";
}

if (typeof scriptOptions.easyui != 'undefined') {
	source[source.length] = "/js/jquery-easyui-1.4.4/jquery.easyui.min.js";
	source[source.length] = "/js/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js";
	source[source.length] = "/js/common/extEasyui.js";
	source[source.length] = "/js/common/base.myeasyui.js";
	source[source.length] = "/js/common/base.mydatagrid.js";
	
}

source[source.length] = "/js/plugins/image-upload/image-upload.js";

if (typeof scriptOptions.cookie != 'undefined') {
	source[source.length] = "/js/plugins/cookie/jquery.cookie.js";
}

var write = function(src, encode) {
	document.write('<script type="text/javascript" src="' + jsCtx + src
			+ '" charset="' + (encode || "UTF-8") + '"></script>');
}

if (typeof scriptOptions.jsfileversion != 'undefined'
		&& scriptOptions.jsfileversion != jsfileversion) {}
document.write('<meta http-equiv="pragma" content="no-cache">');
document.write('<meta http-equiv="cache-control" content="no-cache">');
document.write('<meta http-equiv="expires" content="0">');

for ( var index = 0; index < source.length; index++) {
	this.write(source[index]);
}