//提现
function ajaxSubmit() {
    var min = parseInt($("#min").val());
    var multiple = parseInt($("#multiple").val());
    var money = parseInt($("#withdrawMoney").val());
    var paypwd = $("#paypwd").val();
    var accountID = parseInt($("#accountID").val());
    if (accountID > 0) {
    } else {
        alert('请选择收款账户！');
        return;
    }
    if (paypwd == "") {
        alert('请输入提现密码！');
        return;
    }
    if (money > 0) {
        if (money < min) {
            alert('最小提现金额为 ' + min + '元！');
            return;
        }
        if (money % multiple != 0) {
            alert('提现金额必须为 ' + multiple + '元 的倍数！');
            return;
        }
    } else {
        alert('请填写提现金额！');
        return;
    }

    var sSource = '/user/Service/withdrawalzft.ashx?t=' + Math.random();
    var postData = 'money=' + money + '&accountid=' + accountID + '&paypwd=' + paypwd;
    $.ajax({
        type: "post",
        dataType: "json",
        timeout: 10000,
        url: sSource,
        data: postData,
        success: function (json) {
            if (json.result == 'ok') {
                alert(json.msg);
                self.location = "/user/withdrawal/";
            } else {
                alert(json.msg);
            }
        }
    })
}

//绑定银行列表
function bindBankList() {
    for (var i = 1; i <= 10; i++) {
        if ($("#bank" + i).length == 0) continue; 

        $("#bank" + i).append("<option value='0'>请选择</option>");
        $("#bank" + i).append("<option value='1002'>工商银行</option>");
        $("#bank" + i).append("<option value='1005'>农业银行</option>");
        $("#bank" + i).append("<option value='1003'>建设银行</option>");
        $("#bank" + i).append("<option value='1026'>中国银行</option>");
        $("#bank" + i).append("<option value='1020'>中国交通银行</option>");
        $("#bank" + i).append("<option value='1022'>中国光大银行</option>");
        $("#bank" + i).append("<option value='1004'>上海浦东发展银行</option>");
        $("#bank" + i).append("<option value='1025'>华夏银行</option>");
        $("#bank" + i).append("<option value='1021'>中信银行</option>");
        $("#bank" + i).append("<option value='1001'>招商银行</option>");
        $("#bank" + i).append("<option value='1010'>平安银行</option>");
        $("#bank" + i).append("<option value='1006'>中国民生银行</option>");
        $("#bank" + i).append("<option value='1066'>中国邮政储蓄银行</option>");
        $("#bank" + i).append("<option value='1027'>广发银行</option>");
        $("#bank" + i).append("<option value='1009'>兴业银行</option>");
        $("#bank" + i).append("<option value='1032'>浙商银行</option>");
        $("#bank" + i).append("<option value='1035'>汇丰银行</option>");
        $("#bank" + i).append("<option value='1033'>深圳发展银行</option>");
        $("#bank" + i).append("<option value='1034'>盛京银行</option>");
        $("#bank" + i).append("<option value='1024'>杭州银行</option>");
        $("#bank" + i).append("<option value='1028'>上海银行</option>");
        $("#bank" + i).append("<option value='1029'>宁波银行</option>");

        //文本变化事件，计算金额
//        $("#money" + i).on('input', function (e) {
//            calmoney(this);
//        });  
        $("#money" + i).on('change', function (e) {
            calmoney();
        });  
    }
}

var itemCnt = 1;


function addbankitem() {
    for (var i = 1; i <= 10; i++) {
        if ($("#item" + i).length == 0) continue; 
        if ($("#item" + i).is(":hidden")) {
            $("#item" + i).show();    //如果元素为隐藏,则将它显现
            break;
        }
    }

    if (itemCnt == 10) return;
    itemCnt = itemCnt + 1;
    $("#itemCount").text(itemCnt);
}

function delbankitem(i) {
    //以下两种方式都能设置索引
    //$("#bank" + i + " option:first").prop("selected", "selected");
    $("#bank" + i).get(0).selectedIndex = 0;    //index为索引值
    $("#accname" + i).val("");        //把内容清空
    $("#acccard" + i).val("");
    $("#money" + i).val("");
    $("#item" + i).hide();

    if (itemCnt == 1) return;
    itemCnt = itemCnt - 1;
    $("#itemCount").text(itemCnt);
    calmoney();     //必须重新计算金额
}

//限制输入数字+小数点
function keyPress(ob) {
    if (!ob.value.match(/^[\+\-]?\d*?\.?\d*?$/)) ob.value = ob.t_value; else ob.t_value = ob.value; if (ob.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/)) ob.o_value = ob.value;
}
function keyUp(ob) {
    if (!ob.value.match(/^[\+\-]?\d*?\.?\d*?$/)) ob.value = ob.t_value; else ob.t_value = ob.value; if (ob.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/)) ob.o_value = ob.value;
}
function onBlur(ob) {
    if (!ob.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?|\.\d*?)?$/)) ob.value = ob.o_value; else { if (ob.value.match(/^\.\d+$/)) ob.value = 0 + ob.value; if (ob.value.match(/^\.$/)) ob.value = 0; ob.o_value = ob.value };
}

function calmoney() {
    var itemMoney = 0.00;
    for (var i = 1; i <= 10; i++) {
        var obj = $("#item" + i);
        if (obj.length == 0) continue;
        if (obj.is(":hidden")) continue;
        var mobj = $("#money" + i);
        if (mobj.val() == "")
            itemMoney = itemMoney + 0;
        else
            itemMoney = itemMoney + parseFloat(mobj.val());       
    }
    $("#itemMoney").text(itemMoney.toFixed(2)); //保留2位小数
}

function ajaxBatchSubmit() {
    //alert("批量提交");
    var item;       //对象
    var bank;       //值
    var bankname;       //值
    var accname;
    var acccard;
    var money;

    var lstbank = "";       //值组合串
    var lstbankname = "";       //值组合串
    var lstaccname = "";
    var lstacccard = "";
    var lstmoney = "";
    var succ = true;
    for (var i = 1; i <= 10; i++) {
        item = $("#item" + i);
        if (item.length == 0) continue;     //空继续
        if (item.is(":hidden")) continue;   //不可见继续

        //检查提交内容都不能为空
        bank = $("#bank" + i).val();
        bankname = $("#bank" + i + " option:selected").text();
        accname = $("#accname" + i).val();
        acccard = $("#acccard" + i).val();
        money = $("#money" + i).val();

//        alert(bank);
//        alert(accname);
//        alert(acccard);
//        alert(money);

        if (bank == 0 || accname == "" || acccard == "" || money == "") {
            succ = false;
            alert("第" + i + "条内容填写不全！");
            break;
        }

        //组合在一起
        lstbank = lstbank + "," + bank;
        lstbankname = lstbankname + "," + bankname;
        lstaccname = lstaccname + "," + accname;
        lstacccard = lstacccard + "," + acccard;
        lstmoney = lstmoney + "," + money;
    }

    if (succ == false) return;

    lstbank = lstbank.substr(1, 1000);
    lstbankname = lstbankname.substr(1, 1000);
    lstaccname = lstaccname.substr(1, 1000);
    lstacccard = lstacccard.substr(1, 1000);
    lstmoney = lstmoney.substr(1, 1000);

    //ajax提交
    //alert(lstbankname);
    //return;
    var imgcode = $("#imgcode").val();
    var msgcode = $("#msgcode").val();
    var paypwd = $("#paypwd").val();
    var sSource = '/user/Service/withdrawalbatch.ashx?t=' + Math.random();
    var postData = 'moneys=' + lstmoney + '&acccards=' + lstacccard + '&accnames=' + lstaccname + '&bankcodes=' + lstbank + '&banknames=' + lstbankname + '&msgcode=' + msgcode + '&imgcode=' + imgcode + '&paypwd=' + paypwd;
    $.ajax({
        type: "post",
        dataType: "json",
        timeout: 10000,
        url: sSource,
        data: postData,
        success: function (json) {
            if (json.result == 'ok') {
                alert(json.msg);
                self.location = "/user/withdrawal/batch.aspx";
            } else {
                alert(json.msg);
            }
        }
    })
}