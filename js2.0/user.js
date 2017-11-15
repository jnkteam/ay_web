/*
    用户余额刷新
*/
function getamt() {
    var sSource = '/user/Service/amt.ashx?t=' + Math.random();
    var postData = '';
    //var loading = $.dialog.tips("更新中...", 2, "loading");
    $.ajax({
        type: "post",
        dataType: "json",
        timeout: 10000,
        url: sSource,
        data: postData,
        success: function (json) {
            if (json.result == 'ok') {
                $("#money").html(json.amt);
            } else {
                $.dialog({
                    title: '信息提示',
                    content: '错误',
                    icon: json.ico,
                    time: '2',
                    ok: true
                });
            }
        }
    })
}

/*
    用户订单页面
*/
function replenish(orderid) {
    $.get("/Merchant/ajax/replenish.ashx", { type: "1", order: orderid },
        function (data, textStatus) {
            if (data == "true") {
                $.dialog({ title: lktitle, resize: false, content: '操作成功', ok: function () { }, close: function () { }, icon: 'succeed', width: '250px', height: '90px', time: 30000 });
            } else {
                $.dialog({ title: lktitle, resize: false, content: '操作失败', ok: function () { }, close: function () { }, icon: 'wrong', width: '250px', height: '90px', time: 30000 });
            }
        })
}