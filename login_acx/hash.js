/**
 * 对用户密码进行hash
 */
(function($) {
	var key1 = "3b7bd52387baff9fb4dd8433cce4961c";
	$.hashPwd = function(username, password) {
		return $.md5(username + password + key1);
	};
})(jQuery);