$(function () {
    //收款方式点击切换
    $(".payment-choices").click(function () {
        $(this).addClass("methods-chosen").siblings().removeClass("methods-chosen");
        $("#accountID").val($(this).data("id"));
    });

    $(".ajaxSubmit_apply").click(function () {
        var button = $(this);
        var min = parseInt($("#min").val());
        var multiple = parseInt($("#multiple").val());

        var money = parseInt($("[name='money']").val());

        var accountID = parseInt($("[name='accountID']").val());

        if (accountID > 0) {

        } else {
            core.error('请选择收款账户');
            return false;
        }

        if (money > 0) {
            if (money < min) {
                core.error('最小提现金额为 ' + min + '元');
                return false;
            }
            if (money % multiple != 0) {
                core.error('提现金额必须为 ' + multiple + '元 的倍数');
                return false;
            }
        } else {
            core.error('请填写提现金额');
            return false;
        }

        if ($("#Password2").val() == "") {
            core.error('请输入提现密码！');
            return false;
        }

        user.validate({
            items: ['protection'],
            button: button
        });
    });

    $("#withdrawMoney2").keyup(function (e, isMulti) {
        var withdraw = parseInt($(this).val());

        if (!withdraw) {
            withdraw = MIN_MONEY;
        }
        if (isMulti) {
            if (withdraw < MIN_MONEY) {
                withdraw = MIN_MONEY;
            }

            var remainder = withdraw % MULTI;
            if (remainder != 0) {
                withdraw = withdraw - remainder;
                // 下句取消注释则向上一个梯度取整
                // withdraw += MULTI;
            }
        }

        var poundageInit = withdraw * POUNDAGE_RATE;

        if (poundageInit < MIN_POUNDAGE && poundageInit != 0) {
            poundageInit = MIN_POUNDAGE;
        }
        if (poundageInit > MIN_POUND) {
            poundageInit = MIN_POUND;
        }
        var poundageMoney = (Math.round(poundageInit * 100) / 100).toFixed(2);

        if (e.which != 37 && e.which != 39 && e.which != 8) {
            $(this).val(withdraw);
        }

        $("#userPoundage").html(poundageMoney);
        var actualMoney = (withdraw - poundageMoney).toFixed(2);
        if (actualMoney < 0) {
            actualMoney = 0;
        }

        $("#actualToAccount").html(actualMoney);
    });
});


$(function () {
    $("button.ajaxSubmit,input.ajaxSubmit").live("click", function () {
        var button = $(this);
        var form = $(this).parents("form");
        if (!button.attr("disabled")) {
            if (form.length > 0) {
                var confirm = form.attr("confirm");
                if (confirm) {
                    $.dialog({
                        title: "确认？",
                        content: confirm,
                        icon: 'confirm',
                        ok: function () {
                            if (form.attr("validate") && form.attr("validate").length > 0) {
                                user.validate({ items: form.attr("validate"), button: button });
                            } else {
                                form.ajaxform({
                                    "button": button
                                });
                            }
                        },
                        cancel: true
                    });
                } else {
                    if (form.attr("validate") && form.attr("validate").length > 0) {
                        user.validate({ items: form.attr("validate"), button: button });
                    } else {
                        form.ajaxform({
                            "button": button
                        });
                    }
                }
            }
        }
    });
});

var user = {
    validate: function (opts) {
        var form = opts.form;
        var button = opts.button;
        var url = opts.url;
        var data = opts.data;
        var items = opts.items;
        var callback = opts.callback;
        var okVal = opts.okVal;

        okVal = okVal ? okVal : '验证并提交';

        if (items instanceof Array) {
            items = items.join(",");
        } else if (!items) {
            items = '';
        }

        return $.dialog.open('/user/validate/frame.aspx?items=' + items, {
            title: '操作保护',
            width: 400,
            height: 215,
            okVal: okVal,
            ok: function () {
                var iframe = this.iframe.contentWindow;
                var verifytype = $(iframe.document.body).find("input[name='verifytype']").val();
                var verifycode = '';
                switch (verifytype) {
                    case 'email':
                        verifycode = $(iframe.document.body).find("input[name='email_code']").val();
                        break;
                    case 'mobile':
                        verifycode = $(iframe.document.body).find("input[name='sms_code']").val();
                        break;
                    case 'protection':
                        verifycode = $(iframe.document.body).find("input[name='answer_code']").val();
                        break;
                    default:
                        break;
                }
                if (button) {
                    form = button.parents("form");
                }
                if (url) {
                    data = $.extend({}, data, {
                        verifytype: verifytype,
                        verifycode: verifycode
                    });

                    core.ajaxload({
                        type: 'POST',
                        url: url,
                        data: data,
                        success: callback
                    });
                } else {
                    if (form && form.length > 0) {
                        var newverifytype = form.find("input[name='verifytype']");
                        if (newverifytype.length == 0) {
                            form.append('<input type="hidden" name="verifytype" value="' + verifytype + '" />');
                        } else {
                            newverifytype.val(verifytype);
                        }
                        var newverifycode = form.find("input[name='verifycode']");
                        if (newverifycode.length == 0) {
                            form.append('<input type="hidden" name="verifycode" value="' + verifycode + '" />');
                        } else {
                            newverifycode.val(verifycode);
                        }
                        //form.submit();
                        //return false;
                        form.ajaxform({
                            button: button,
                            success: callback
                        });
                    }
                }
                return false;
            },
            cancel: true
        });
    }
};