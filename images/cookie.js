(function($){
	
	if(! $.login){
		$.login = {};
	}
	
	$.login.cookie = {
		set: function(name, value, options){
			if(typeof name == 'undefined' || typeof value == 'undefined'){
				return ;
			}
			var settings = {
					path : "/",
					domain : "",
					unit : 24 * 60 * 60 * 1000,//一天的毫秒数
					day : 30
			};
			
			options = options || {};
			$.extend(settings,options);
			
			var date = new Date();
			date.setTime(date.getTime() + (settings.day * settings.unit));
			var expires = '; expires=' + date.toUTCString();
			
			 var path = settings.path ? '; path=' + (settings.path) : '';
		     var domain = settings.domain ? '; domain=' + (settings.domain) : '';
		     var secure = settings.secure ? '; secure' : '';
		     document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
			
		},
		get: function(name){
			var cookieValue = "";
			if (document.cookie && document.cookie != '') {
			    var cookies = document.cookie.split(';');
			    for (var i = 0; i < cookies.length; i++) {
			        var cookie = jQuery.trim(cookies[i]);
			        if (cookie.substring(0, name.length + 1) == (name + '=')) {
			            cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
			            break;
			        }
			    }
			}
			return cookieValue;
		},
		del: function(name){
			this.set(name, "", {unit:-1,day:1});
		}
	};
})(jQuery);