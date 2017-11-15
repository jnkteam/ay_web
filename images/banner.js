/**
 * 首页:banner 图片切换
 */
function Slide(container, options, callback, obj) {
		this.container = $(container);
		this.list = $(container + ' .J_slide_list');
		this.handle = $(container + ' .J_slide_trigger li');
		this.item = $(container + ' .J_slide_item');
		this.itemWH = 0;
		this.count = this.handle.length;
		this.timer = null;
		this.eTime = null;
		this.options = $.extend({
			auto : true,
			delay : 5,
			duration : 500,
			effect : 'fade',
			event : 'mouseover',
			firstDelay : null,
			index : 1,
			vertical : true
		}, options);
		this.init();
		if (callback) {
			callback.call(this, obj);
		}
	}

Slide.prototype = {
	init : function() {
		var slideClip, itemW, itemH, itemWH,
		that = this,
		list = this.list, item = this.item, count = this.count,
		op = this.options, auto = !!op.auto, vertical = !!op.vertical;
		if (op.effect === 'fade') {
			list.css({
				position : 'relative'
			});
			item.css({
				position : 'absolute'
			});
		}
		if (op.effect === 'slide') {
			list.css({
				position : 'absolute'
			});
			if (!list.parent().hasClass('J_slide_clip')) {
				list.wrap('<div class="J_slide_clip"></div>');
			}
			itemW = item.outerWidth(true);
			itemH = item.outerHeight(true);
			this.container.find('.J_slide_clip').css({
				position : 'relative',
				overflow : 'hidden',
				height : itemH,
				width : itemW
			});
			this.itemWH = vertical ? itemH : itemW;
		}
		this.handle.bind(op.event, function() {
			that._trigger(this);
		});
		if (op.index === 'r') {
			op.index = this._random(count);
		}
		if (op.index > count || op.index < 1) {
			op.index = 1;
		}
		this._showFirst(op.index);
		if (auto) {
			this._auto(op.firstDelay);
			this.container.hover(function() {
				that._stop();
			}, function() {
				that._auto();
			});
		}
	},

	_random : function(max) {
		return parseInt(Math.random() * max + 1);
	},

	_trigger : function(o) {
		var index, op = this.options, handle = this.handle;
		if (op.index === (handle.index(o) + 1)) {
			return;
		}
		index = op.index = handle.index(o) + 1;
		this._show(index);
	},

	_show : function(i) {
		var that = this, op = this.options, vertical = !!op.vertical;
		this.handle.removeClass('curr').eq(i - 1).addClass('curr');
		if (op.effect === 'fade') {
			clearTimeout(this.eTime);
			this.eTime = setTimeout(function() {
				that.item.not(that).css({
					zIndex : 1
				}).eq(i - 1).css({
					zIndex : 9
				}).animate({
					opacity : 1
				}, that.options.duration, function() {
					that.item.not(this).css({
						opacity : 0
					});
				});
			}, 150);
		}
		if (op.effect === 'slide') {
			itemWH = this.itemWH;
			this.list.stop().animate({
				top : -itemWH * (i - 1)
			}, this.options.duration);
		}
	},

	_showFirst : function(i) {
		var op = this.options, vertical = !!op.vertical;
		this.handle.removeClass('curr').eq(i - 1).addClass('curr');
		if (op.effect === 'fade') {
			this.item.not(this).css({
				zIndex : 1,
				opacity : 0
			}).eq(i - 1).css({
				zIndex : 9,
				opacity : 1
			});
		}
		if (op.effect === 'slide') {
			itemWH = this.itemWH;
			this.list.css({
				top : -itemWH * (i - 1)
			});
		}
	},

	_auto : function(delay) {
		var that = this,
		op = that.options;
		this.timer = setTimeout(function() {
			op.index = op.index < that.count ? ++op.index : 1;
			that._show(op.index);
			that._auto();
		}, delay ? delay * 1000 : op.delay * 1000);
	},

	_stop : function() {
		clearTimeout(this.timer);
	}
};


$(function(){
	//banner 图片切换
	new Slide('.slide', {
		index : 1,
		firstDelay : 10,
		auto : true
	});
	
	//首页:公告滚动
	var slideX = {
			thisUl : $('.slideTxt'),
			btnLeft : $('.arr_prev'),
			btnRight : $('.arr_next'),
			thisLi : $('.slideTxt li'),
			slideWidth : 600, //滑动的长度，一般和层的宽一致
			init : function() {
				slideX.thisUl.width(slideX.thisLi.length * slideX.slideWidth);
				slideX.slideAuto();
				slideX.btnLeft.click(slideX.slideLeft).hover(slideX.slideStop,slideX.slideAuto);
				slideX.btnRight.click(slideX.slideRight).hover(slideX.slideStop,slideX.slideAuto);
				slideX.thisUl.hover(slideX.slideStop, slideX.slideAuto);
			},
			slideLeft : function() {
				slideX.btnLeft.unbind('click', slideX.slideLeft);
				slideX.thisUl.find('li:last').prependTo(slideX.thisUl);
				slideX.thisUl.css('marginLeft', -1 * slideX.slideWidth);
				slideX.thisUl.animate({
					'marginLeft' : 0
				}, 750, function() {
					slideX.btnLeft.bind('click', slideX.slideLeft);
				});
				return false;
			},
			slideRight : function() {
				slideX.btnRight.unbind('click', slideX.slideRight);
				slideX.thisUl.animate({
					'marginLeft' : -1 * slideX.slideWidth
				}, 750, function() {
					slideX.thisUl.css('marginLeft', '0');
					slideX.thisUl.find('li:first').appendTo(slideX.thisUl);
					slideX.btnRight.bind('click', slideX.slideRight);
				});
				return false;
			},
			slideAuto : function() {
				slideX.intervalId = window.setInterval(slideX.slideRight, 6000);
			},
			slideStop : function() {
				window.clearInterval(slideX.intervalId);
			}
	};
	//公告滚动初始化
	slideX.init();
});