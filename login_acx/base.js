(function($) {
 
	$.base = function(name, prototype, parentPrototype, parentDefaults) {
		//debugger;
		var parentPrototype = parentPrototype || $.base.prototype;
		var parentDefaults = parentDefaults || $.base.defaults;
		var namespace =  name.split(".").slice(0, name.split(".").length - 1);
		namespace = namespace.toString().replace(/,/g,'_');
		name = name.split(".")[name.split(".").length - 1];
		
		$.fn[name] = function(options) {
			var isMethodCall = (typeof options == 'string'), args = Array.prototype.slice.call(arguments, 1);

			if (isMethodCall && options.substring(0, 1) == '_') {
				return this;
			}

			if (isMethodCall/* && getter(namespace, name, options, args)*/) {
				var instance = $.data(this[0], name);
				return (instance ? instance[options].apply(instance, args) : undefined);
			}

			return this.each(function() {
				var instance = $.data(this, name);
				(!instance && !isMethodCall && $.data(this, name, new $[namespace][name](this, options))/*._init()*/);
				(instance && isMethodCall && $.isFunction(instance[options]) && instance[options].apply(instance, args));
			});
		};

		$[namespace] = $[namespace] || {};
		$[namespace][name] = function(element, options) {
			var self = this;
			this.namespace = namespace;
			this.name = name;
			this.eventPrefix = $[namespace][name].eventPrefix || name;
			this.baseClass = namespace + '-' + name;
			
			//debugger;
			var parentClass = namespace.split("_");
			parentClass.length = parentClass.length - 1;
			if(parentClass.length == 2){ //处理3级继承，3级以上的继承暂时不支持
				//顶层父类的方法引用名
				var _parentTop = parentClass[1];   
				var _parentNamespace = parentClass.toString().replace(/,/g,'.');
				//顶层父类的方法
				var _parentTopPrototype = eval('$.'+_parentNamespace).prototype;
				//this[_parentTop] = _parentTopPrototype;
				//调用顶级父类中的方法
				$[namespace][name].prototype._topSuper = function(funcName, options) {
					_parentTopPrototype[funcName].call(this, options);			
				};
				parentDefaults = $.extend({}, _parentTopPrototype, parentDefaults);
				
				parentDefaults = $.extend({}, eval('$.'+_parentNamespace).defaults, parentDefaults);
			}

			this.options = $.extend({}, parentDefaults,
					$[namespace][name].defaults, $.metadata && $.metadata.get(element)[name], options);

			this.element = $(element).bind('setData.' + name,
					function(event, key, value) {
						if (event.target == element) {
							return self._setData(key, value);
						}
					}).bind('getData.' + name, function(event, key) {
						if (event.target == element) {
							return self._getData(key);
						}
					}).bind('remove', function() {
						return self.destroy();
					});
		};
		$[namespace][name].prototype = $.extend({}, parentPrototype, prototype);

		//调用二级父类中的方法
		$[namespace][name].prototype._super = function(funcName, options) {
			parentPrototype[funcName].call(this, options);			
		},
		
		$[namespace][name].getterSetter = 'option';

	};
	
	$.base.prototype = {
		
		_init : function() {
		},
		
		destroy : function() {
		},
		
		option : function(key, value) {
			var options = key, self = this;

			if (typeof key == "string") {
				if (value === undefined) {
					return this._getData(key);
				}
				options = {};
				options[key] = value;
			}
			
			$.each(options, function(key, value) {
						self._setData(key, value);
					});
		},
		_getData : function(key) {
			return this.options[key];
		},
		_setData : function(key, value) {
			this.options[key] = value;
		},
		enable : function() {
			this._setData('disabled', false);
		},
		disable : function() {
			this._setData('disabled', true);
		},

		_trigger : function(type, event, data) {
			var callback = this.options[type], eventName = (type == this.eventPrefix
					? type
					: this.eventPrefix + type);

			event = $.Event(event);
			event.type = eventName;

			if (event.originalEvent) {
				for (var i = $.event.props.length, prop; i;) {
					prop = $.event.props[--i];
					event[prop] = event.originalEvent[prop];
				}
			}

			this.element.trigger(event, data);

			return !($.isFunction(callback)
					&& callback.call(this.element[0], event, data) === false || event
					.isDefaultPrevented());
		}
		
	};

	$.base.defaults = {
		disabled : false
	};
	
})(jQuery);