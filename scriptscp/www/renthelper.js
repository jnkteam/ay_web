var RentHelperJS = {
    bindPayRentListEvent: function () {
        $("a[name=linkCancelRent]").click(function () {
            RentHelperJS.cancelPayRent($(this).attr("rentId"))
        });
        $(".detail_list .moneybg").hover(function () {
            $(this).find(">div").show()
        }, function () {
            $(this).find(">div").hide()
        });
        $(".detail_list .ibg").hover(function () {
            $(this).find(">div").show()
        }, function () {
            $(this).find(">div").hide()
        });
        $(".detail_list .nicon").hover(function () {
            if (!$(this).hasClass("on")) {
                $(this).addClass("on")
            }
        }, function () {
            $(this).removeClass("on")
        });
        $(".detail_list .nicon").hover(function () {
            if (!$(this).hasClass("on")) {
                $(this).addClass("on")
            }
        }, function () {
            $(this).removeClass("on")
        });
        $(".detail_list .paytext,.detail_list .itext").hover(function () {
            $(this).find(">div").show()
        }, function () {
            $(this).find(">div").hide()
        })
    },
    getChargeRentListHtml: function (e) {
        var d = "";
        for (var b = 0; b < e.length; b++) {
            var c = e[b];
            var a = Date.fromJson(c.createTime);
            d += OriginalStringJS.chargeRentListItem.format(a.format("yyyy-MM-dd HH:mm"), c.houseDesc, c.renterCount, c.payedCount, c.houseId, b % 2 == 0 ? 'class="bgcol"' : "")
        }
        return d
    },
    getEarnestListHtml: function (e) {
        var g = "";
        for (var d = 0; d < e.length; d++) {
            var f = e[d];
            var b = Date.fromJson(f.createTime);
            var a = EnumJS.fromValue(EnumJS.EarnestOperateType, f.earnestType);
            var c = EnumJS.fromValue(EnumJS.EarnestStatus, f.earnestStatus);
            g += OriginalStringJS.earnestListItem.format(f.orderNo, b.format("yyyy-MM-dd HH:mm"), a.desc, f.amountMoney.format("#,##0.##"), c.desc, f.payRecordNo, d % 2 == 0 ? 'class="bgcol"' : "")
        }
        return g
    },
    cancelPayRent: function (f) {
        var e = $.postJsonSync("/Payrent/Index/getrentcanclecommentlist.htm", {orderId:f},'json');
        if (e.resultCode == 1) {
		 $.showMsgBox("订单取消成功");
		 $.reloadUrl();
		 return true;
            var b = new Array();
            b.push('<div class="order_box"><h3>我们想知道您为何取消，以便改进我们的服务：</h3><ul class="clearfix">');
            for (var d = 0, a = e.data.length; d < a; d++) {
                b.push('<li><span><input type="radio" name="rdCancelComment" id="rdCancelComment{0}" value="{1}"/><label for="rdCancelComment{0}">{1}</label></span></li>'.format(e.data[d].dicValue, $.HTMLEncode(e.data[d].dicTitle)))
            }
            b.push('<li class="clearfix tt"><span style="width:90px;"><input type="radio" name="rdCancelComment" id="rdOther"/><label for="rdOther">其他原因</label>：</span><div class="item clearfix fl"><div class="element"><input type="text" class="text" id="txtComment"/></div></div></li></ul>');
            var c = $(b.join(""));
            c.dialog({
                title: "取消订单",
                modal: true,
                width: 470,
                buttons: [{
                    text: "确认取消",
                    "class": "comm_dialog_btn_save",
                    click: function () {
                        RentHelperJS.doCancelPayRent(f)
                    }
                }, {
                    text: "取消",
                    "class": "comm_dialog_btn_cancel",
                    click: function () {
                        $(this).dialog("destroy")
                    }
                }]
            });
            c.find("input[type=radio]").change(function () {
                if (this.id != "rdOther") {
                    $("#txtComment").val("")
                }
            });
            return false
        }else{
			$.showMsgBox(e.resultMsg);
		}
        $.showConfirmBox("您确定要取消订单" + f + "吗？", function () {
            RentHelperJS.doCancelPayRent(f)
        })
    },
    isSubmitCancel: false,
    doCancelPayRent: function (e) {
        var c = $("input[name=rdCancelComment]:checked");
        var a = "";
        var d = $("#rdOther").length > 0;
        if (d && c.attr("id") == undefined) {
            $.showMsgBox("请选择取消订单的原因");
            return false
        }
        if (c.attr("id") != undefined) {
            var b = c.attr("id") == "rdOther";
            a = b ? $("#txtComment").val().trim() : c.val();
            if (String.isNullOrWhiteSpace(a)) {
                $.showMsgBox(b ? "请输入取消原因" : "请选择取消订单的原因");
                return false
            }
        }
        if (RentHelperJS.isSubmitCancel) {
            return false
        }
        RentHelperJS.isSubmitCancel = true;
        $.post("/payrent/cancelorder.htm", {
            id: e,
            cancelComment: a
        }, function (f) {
            RentHelperJS.isSubmitCancel = false;
            if (f.resultCode == 1) {
                return $.reloadUrl()
            } else {
                $.showMsgBox(f.resultMsg)
            }
        })
    },
    cancelChargeRent: function (a) {
        $.showConfirmBox("您确定要取消订单" + a + "吗？", function () {
            $.post("/Chargerent/Index/Cancelorder.htm", {
                id: a
            }, function (b) {
                if (b.resultCode == 1) {
                    return $.reloadUrl()
                } else {
                    $.showMsgBox(b.resultMsg)
                }
            },'json')
        })
    }
	,loginChangeNav:function(b){
		var d=$(".topbar_right ul");
		if(b==null||b==undefined){
			b=$.postJsonSync("/Member/Index/getloginuserinfo.htm",{})
		}
		if(b==null){
			return
		}
		d.find(".login_out, .login_in").remove();
		if(b.resultCode==1){
			var a=b.data;
			var c='<li class="line login_in"><a href="/Member/message/" target="_blank">消息</a>{0}<span>|</span></li>'.format(a.unreadMessageCount>0?'<span class="num_box" ><span class="num"><a href="/Member/message/" target="_blank">'+a.unreadMessageCount+"</a></span></span>":"");
			d.prepend('<li class="login_in">欢迎您，'+a.displayName+'&nbsp;&nbsp;<a href="/logout.htm">[退出]</a><span>|</span></li><li class="login_in"><a href="/Member/">我的租房宝</a><span>|</span></li>'+c)
		}
		else{
			d.prepend('<li class="login_out">欢迎您来到租房宝！<a href="/login.htm">[登录]</a>&nbsp;<a href="/register.htm" target="_blank">[免费注册]</a><span>|</span></li>')
		}
	}
	,toThirdPartyLogin:function(c,b){
		$.doUrlRedirt("/Api/Oauth/login/type/{0}".format(c),"_blank");
		var a=function(){
			var d=$.postJsonSync("/Member/Index/getloginuserinfo.htm",{});
			RentHelperJS.loginChangeNav(d);
			if(d.resultCode==1){
				if($.isFunction(b)){
					b()
				}
				if(String.isNullOrEmpty(d.data.mobile)){
					PayRentJS.BindMobileServlet.isMustValidMobile=true;
					$("#divNeedValidMobile, #divNeedValidMobile .iphdiv").show();
					$("#cancelValidMobile, #aTipValidMobile").hide()
				}
			}
		};
		$.showConfirmBox("第三方登录已成功？",a,a,a)
	}
};
var UserPayeeJS = {
    accountType: 1,
    orderType: 2,
    pageSize: 5,
    init: function (a, b) {
        if (b) {
            UserPayeeJS.chooseHandle = b.chooseHandle;
            if (b.orderType) {
                UserPayeeJS.orderType = b.orderType
            }
        }
        a.click(UserPayeeJS.showPayeePanel);
        $(".rentprofile_box .renttitle .close").click(function () {
            $(".rentprofile_box").hide()
        });
        $(".rentprofile_box .renttitle  ul li").click(function () {
            var c = $(this).attr("accountType");
            if (c == UserPayeeJS.accountType) {
                return false
            }
            UserPayeeJS.accountType = c;
            $(this).parents("ul").find("li").removeClass("on");
            $(this).addClass("on");
            UserPayeeJS.loadPayeeList(1)
        })
    },
    showPayeePanel: function () {
        if ($(".rentprofile_box").is(":visible")) {
            return false
        }
        UserPayeeJS.accountType = $(".rentprofile_box .renttitle ul li.on").attr("accountType");
        UserPayeeJS.loadPayeeList(1)
    },
    confirmDeletePayee: function (a) {
        $.showConfirmBox("您确定删除当前收租账号？", function () {
            $.post("/account/payee/deletepayee.htm", {
                autoId: a
            }, function (b) {
                if (b.resultCode == 1) {
                    UserPayeeJS.loadPayeeList(1);
                    return false
                } else {
                    $.showMsgBox(b.resultMsg)
                }
            })
        })
    },
    loadPayeeList: function (a) {
        var b = $("#divAccountType{0}".format(UserPayeeJS.accountType));
        b.find("ul").html('<li class="clearfix">数据加载中...</li>');
        $("div[name=accountType]").hide();
        b.show();
        $(".rentprofile_box").show();
        $.post("/account/payee/getuserpayeelist.htm", {
            accountType: UserPayeeJS.accountType,
            orderType: UserPayeeJS.orderType,
            pageSize: UserPayeeJS.pageSize,
            pageIndex: a
        }, function (e) {
            if (e.resultCode != 1) {
                $.showMsgBox(e.resultMsg)
            } else {
                var c = new Array();
                UserPayeeJS.objPayeeData = e.data.data;
                if (UserPayeeJS.objPayeeData != null) {
                    for (var d = 0; d < UserPayeeJS.objPayeeData.length; d++) {
                        var f = UserPayeeJS.objPayeeData[d];
                        c.push('<li class="clearfix"{0}><span class="name">{1}</span><span class="rbank">{2}...{3}</span><span class="address">{4}</span>{5}</li>'.format(UserPayeeJS.accountType == 2 ? ' dataId="{0}"'.format(f.autoId) : "", f.payeeName, f.payeeBankName, f.payeeCardNoFormat, f.cityName, UserPayeeJS.accountType == 2 ? '<span class="delete"><a href="###"></a></span>'.format() : ""))
                    }
                }
                b.find("ul").html(c.join(""));
                b.find(".rentpage").html(e.data.pager);
                UserPayeeJS.bindPanelEvent()
            }
        })
    },
    bindPanelEvent: function () {
        var a = $("#divAccountType{0}".format(UserPayeeJS.accountType));
        a.find("ul li").bind("click", function () {
            if (UserPayeeJS.objPayeeData != null && $.isFunction(UserPayeeJS.chooseHandle)) {
                UserPayeeJS.chooseHandle(UserPayeeJS.objPayeeData[$(this).index()])
            }
            $(".rentprofile_box").hide()
        }).hover(function () {
            $(this).addClass("on")
        }, function () {
            $(this).removeClass("on")
        });
        a.find(".page a").bind("click", function () {
            var b = Number($(this).text());
            UserPayeeJS.loadPayeeList(b)
        });
        $("#divAccountType2 ul li .delete").click(function (b) {
            UserPayeeJS.confirmDeletePayee($(this).parents("li").attr("dataId"));
            b.stopPropagation()
        })
    }
};