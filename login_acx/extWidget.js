(function($) {
	if (!window['x$']) { window['x$'] = {}; }
	x$.widget = extWidget = {};
	
	extWidget.SearchPanel = function (options) {
		options = $.extend({}, extWidget.SearchPanel.defaults, options);
		if ($('.jq_search_panel_class').length > 0) {
			$('.jq_search_panel_class').remove();
		}
		var template = _.template('<div id="jq_openDataGridDialog_<%=targetId%>" class="jq_search_panel_class" data-options="closed:true" style="width:<%=searchPanelWidth%>px;height:<%=searchPanelHeight%>px;padding:<%=padding%>px">\
				<div id="jq_openGrid_layout_<%=targetId%>" class="jq_search_panel_class" data-options="closed:true,fit:true,border:false">\
					<div data-options="region:\'north\',border:false" style="padding:10px 10px 0px 10px;background:#fff;border:1px solid #ccc;border-bottom:0px;height:52px;">\
						<input id="jq_searchbox_<%=targetId%>" data-options="prompt:\'输入查询条件\',menu:\'#jq_searchbox_div_<%=targetId%>\'" style="width:calc(100% - 100px);"></input>\
		        <button class="newSearchIcon" style="background-color: #2288cc;color: white;box-shadow: none;border: none;height: 30px;border-radius: 5px;cursor: pointer;width:68px;">搜索</button>\
						<div id="jq_searchbox_div_<%=targetId%>" class="jq_search_panel_class">\
							<%\
								for(var i=0; i < searchFields.length; i++) {\
									var field = searchFields[i];\
							%>\
									<div data-options="name:\'<%=field.name%>\'"><%=field.label%></div>\
							<%\
								}\
							%>\
						</div>\
					</div>\
					<div data-options="region:\'center\',border:false,fit:false" style="padding:0px 10px 10px 10px;background:#fff;border:1px solid #ccc;border-top:0px;height:300px;">\
						<table id="jq_openDataGrid_<%=targetId%>" data-options="fit:true,border:true" style="border: #b3d1f4 solid 1px;height:300px;"></table>\
					</div>\
				</div>\
			</div>');
		$('body').append($(template(options)));

		$('#jq_openGrid_layout_' + options.targetId).layout();
		
		$('#jq_searchbox_' + options.targetId).searchbox({ 
			searcher : function(value, name){
				var params = {};
				if(options.queryBtnClickCallback && $.isFunction(options.queryBtnClickCallback)) {
					params = options.queryBtnClickCallback.call(this);
				}
				if ($.trim(value) != '') {
					//var params = '{"' + name + '":"' + $.trim(value) + '"}';
					
					$('#jq_searchbox_' + options.targetId).val('');
		        	//dg.datagrid('load', $.evalJSON(params));
					params[name] = $.trim(value);
		        	dg.datagrid('load', params);
		    	} else {
		    		dg.datagrid('load', params);
		    	}
			},
			/*icons: [{
				iconCls:'icon-clear',
				handler: function(e){
					$(e.data.target).textbox('clear');
				}
			}],*/
			prompt : '请输入值',
			height : 32
		});
		
		window.setTimeout(function() {
			if (options.hideSearchbox) {
				$('#jq_openGrid_layout_' + options.targetId).layout('remove', 'north');
			}
		  var theIcon = $('#jq_openGrid_layout_' + options.targetId).find('a.searchbox-button');
	    theIcon.css({visibility: "hidden"});
	    
	    $('#jq_openGrid_layout_' + options.targetId).on('click', '.newSearchIcon', function(e) {
	      theIcon.click();
	      return false;
	    });
		}, 10);
		
		var okBtnCallback = function(options, dialog, callbackFunc, row) {
			var flag = true;
			if (!row) {
				flag = false;
				if (options.gridType && options.gridType == 'datagrid') {
					row = dg.datagrid('getSelected');
				} else {
					row = dg.treegrid('getSelected');
				}
				//row = $('#jq_openDataGrid_' + options.targetId).datagrid('getSelected');
			}
			if (row) {
				if(callbackFunc && $.isFunction(callbackFunc)) {
					callbackFunc.call(this, row);
				} else {
					if (options.easyUiBoxId != '') {
						$('#' + options.easyUiBoxId).textbox('setValue', row[options.idField]);
						$('#' + options.easyUiBoxId).textbox('setText', row[options.showField]);
						$('#' + options.targetId).val(row[options.idField]);
					} else {
						$('#' + options.targetId).val(row[options.idField]);
						$('#' + options.showBoxId).val(row[options.showField]);
					}
				}
				
				dialog.close();
				//dialog.dialog('destroy');
				$('#jq_openDataGridDialog_' + options.targetId).remove();
				return true;
			} else {
				//top.$.messager.alert('提示', '请选择！', 'warning');
				//winTop.$.messager.show({title : '消息', msg : '请选择！', timeout : 3000, showType : 'slide'});
				winTop.$.dialog({
					title: '消息',
				    width: 150,
				    content: '请选择！',
				    icon: 'warning',
				    time: 3
				});
				return false;
			}
		};
		
		var searchPanelDialog = $.dialog({
			title : options.dialogTitle,
			lock: true,
			padding : 0,
			opacity: 0.1,
			left: '70%',
			width : options.searchPanelWidth,
			height : options.searchPanelHeight,
		    content : document.getElementById('jq_openDataGridDialog_' + options.targetId),
		    ok: function () {
		    	return okBtnCallback(options, searchPanelDialog, options.callbackFunc);
		    },
		    cancelVal: '关闭',
		    cancel: function () {
		    	$('#jq_openDataGridDialog_' + options.targetId).remove();
		    	return true;
		    }
		});
		
		options = $.extend({
			onDblClickRow : function(index, row) {
				okBtnCallback(options, searchPanelDialog, options.callbackFunc, row);
			}
		}, options);
		var dg = null;
		
		if(options.queryBtnClickCallback && $.isFunction(options.queryBtnClickCallback)) {
			options.queryParams = options.queryBtnClickCallback.call(this);
		}
		
		if (options.gridType && options.gridType == 'datagrid') {
			dg = $('#jq_openDataGrid_' + options.targetId).datagrid(options);
		} else {
			dg = $('#jq_openDataGrid_' + options.targetId).treegrid(options);
		}
		
	    var pager = dg.datagrid('getPager');
	    pager.pagination({
	    	displayMsg: '共 {total}条记录',
	    	layout:['first','links','last'],
	    	onSelectPage:function(pageNumber, pageSize){
	    		$(this).pagination('loading');
	    		var loadOptions = {};
				if(options.queryBtnClickCallback && $.isFunction(options.queryBtnClickCallback)) {
					loadOptions = options.queryBtnClickCallback.call(this);
				}
				var searchName = $('#jq_searchbox_' + options.targetId).searchbox('getName');
				var searchValue = $('#jq_searchbox_' + options.targetId).searchbox('getValue');
				if ($.trim(searchValue) != '') {
					//var params = '{"' + name + '":"' + $.trim(value) + '"}';
					
					$('#jq_searchbox_' + options.targetId).val('');
		        	//dg.datagrid('load', $.evalJSON(params));
					loadOptions[searchName] = $.trim(searchValue);
		    	}
	    		
	    		loadOptions.total = $(this).pagination('options').total;
	    		loadOptions.page = pageNumber;
	    		loadOptions.pageNumber = pageNumber;
	    		loadOptions.pageSize = pageSize;
	    		$(this).pagination('options').page = pageNumber;
	    		$(this).pagination('options').rows = pageSize;
	    		
	    		dg.datagrid('load', loadOptions);
	    		
	    		$(this).pagination('refresh',{
	    			total: loadOptions.total,
	    			pageNumber: pageNumber
	    		});
	    		
	    		$(this).pagination('loaded');
	    	}
	    });
		
	};

	extWidget.SearchPanel.defaults = {
		gridType : 'datagrid',  //datagrid 或 treegrid
		dialogTitle : '选择',
		easyUiBoxId : '', //easyUI文本框id
		targetId : '', //隐藏域文本框id
		showBoxId : '',  //显示文本框标签id
		showField : '', //显示在文本框中的字段
		url : '',
		searchPanelWidth : 350,
		searchPanelHeight : 365,
		padding : 5,
		searchFields : [
            { label : '模块名称', name : 'moduleName' },
            { label : '模块编号', name : 'moduleCode' }
		],
		loadFilter : function (data) {
			if (data.success != undefined && !data.success){
				 winTop.$.dialog({
						title: '消息',
					    width: 150,
					    content: data.msg,
					    icon: 'warning',
					    time: 3
					});
				 return {total : 0, rows : []};
			 } else {
				 return data;
			 }
		},
		
		fitColumns : true,  //自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动
		striped : false,  //是否显示斑马线效果
		nowrap : false,   //如果为true，则在同一行中显示数据
		pagination : true,  //如果为true，则在DataGrid控件底部显示分页工具栏
		pageNumber : 1,   //设置分页属性的时候初始化页码
		pageSize : 10,   //设置分页属性的时候初始化页面大小
		rownumbers : false,  //如果为true，则显示一个行号列
		singleSelect : true, //如果为true，则只允许选择一行
		ctrlSelect : true, //在启用多行选择的时候允许使用Ctrl键+鼠标点击的方式进行多选操作
		selectOnCheck : true,
		checkOnSelect : true,
		idField : 'moduleId',
		frozenColumns : [ [ {
			checkbox:true,
			field : 'moduleId'
		} ] ],
		columns : [ [ 
			{
				width : '100',
				title : '模块编号',
				field : 'moduleCode'
			},
			{
				width : '100',
				title : '模块名称',
				field : 'moduleName'
			}
		] ]
	};
	

    $.fn.searchPanel = function(options){
    	$(this).click(function () {
    		x$.widget.SearchPanel(options);
    	});
    	return this;
    };
    
    /**
     * EasyUI Textbox with Clear Icon
     * @param Object options 
     * {
     *   editable: false,
     *   prompt: '',
     *   searchIconHandler: function() {},
     * }
     */
    $.fn.TextBoxWithClearIcon = function(options) {
      var element = $(this);
      var elementId = element.attr('id');
      var hiddenInputId = elementId + '_ext';
      
      // Fixes a bug in EasyUI textbox
      element.after('<input type="hidden" id="' + hiddenInputId + '" name="' + element.attr('name') + '"/>');
      element.attr('name', element.attr('name') + '_tmp');
      
      var defaultOptions = {
        height: 32,
        iconWidth: 22,
        icons: [{
            iconCls: 'icon-clear',
            handler: function(e) {
              $(e.data.target).textbox('clear');
              $('#' + hiddenInputId).val('');
            }
          },{
            iconCls:' icon-search',
            handler: function() {}
          }
        ]
      };
      options = $.extend({}, defaultOptions, options);
      if (options.searchIconHandler) {
        options.icons[1].handler = options.searchIconHandler;
        delete options.searchIconHandler;
      }
      element.textbox(options);
      element.textbox('textbox').bind('click', function(e){
        element.textbox('getIcon', 1).click();
        return false;
      });
    };
    
    /**
     * 扩展easyUI的testBox控件
     * @param url 搜索面板的查询URL
     */
    $.fn.extTextbox = function(options){
      var element = $(this);
      var easyUiBoxId = $(this).attr('id');
      var hiddenInputId = easyUiBoxId + '_ext';
      $(this).after('<input type="hidden" id="' + hiddenInputId + '" name="' + $(this).attr('name') + '"/>');
      $(this).attr('name', $(this).attr('name') + '_tmp');
      
      var iconSearchHandler = function(e){
        var dialogFlag = true;
        if(options.beforeSearchCheck && $.isFunction(options.beforeSearchCheck)) {
          dialogFlag = options.beforeSearchCheck.call(this);
        }
        if (dialogFlag) {
          x$.widget.SearchPanel($.extend({
            dialogTitle:'选择机构',
            url: (jsCtx ||'') + '/cms/base/orgRelation/datagrid.json',
            easyUiBoxId:easyUiBoxId,
            targetId : hiddenInputId,
            idField : 'orgId',
            showField : 'orgName',
            searchPanelWidth : 550,
            searchPanelHeight : 365,
            searchFields : [
              { label : '机构名称', name : 'orgName' },
              { label : '机构ID', name : 'orgId' }
            ],
            columns : [ [
                        {title:'机构ID', field:'orgId', width:100},    
                        {title:'机构名称', field:'orgName', width:100},    
                        {title:'机构类型', field:'orgType', width:100},    
                        {title:'所属机构', field:'parentOrg', width:100}
                        ] ]
          }, options));
        }
      };
      
      options = $.extend({
        editFlag: false,
        prompt: '请选择所属机构',
        editable: false,
        readonly: false,
        height:32,
        //width:200,
        iconWidth: 22,
        icons: [{
          iconCls:'icon-clear',
          handler: function(e){
            $(e.data.target).textbox('clear');
            $('#' + hiddenInputId).val('');
            if(options.clearBtnCallBack && $.isFunction(options.clearBtnCallBack)) {
              options.clearBtnCallBack.call(this);
            }
          }
        },{
          iconCls:'icon-search',
          handler: iconSearchHandler
        }]    
      }, options);
      var boxValue = $(this).attr('boxValue');
      if (options.editFlag) {
        options.readonly = true;
      }
      var $textbox = $(this).textbox(options);
      try{
        element.textbox('textbox').bind('click', function(e){
          iconSearchHandler();
          return false;
        });
      } catch (e){}
      
      if (boxValue && boxValue != '') {
        var boxText = $(this).attr('boxText');
        if (!boxText || boxValue == '') {
          var opstData = {};
          opstData[options.idField] = boxValue;
          $.ajax({
            url : options.url,
            data : opstData,
            async : false,
            dataType : 'json',
            task: function (data, textStatus, jqXHR) {
              if (data && data.rows && $.isArray(data.rows) && data.rows.length == 1) {
                var d = data.rows[0];
                $textbox.textbox('setValue', boxValue);
                $textbox.textbox('setText', d[options.showField]);
                $('#' + hiddenInputId).val(boxValue);
              }
            }
          });
        } else {
          $textbox.textbox('setValue', boxValue);
          $textbox.textbox('setText', boxText);
          $('#' + hiddenInputId).val(boxValue);
        }
      }
      return $textbox;
    };

})(jQuery);