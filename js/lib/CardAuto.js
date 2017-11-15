var context_path = "";

$(function () {
    // 去除非法字符
    $("#clearchar").click(function () {
        var $cardcontent = $("#batchForm #cardcontent");
        var $customchar = $("#batchForm #customchar");
        var str = $cardcontent.val();
        str = str.replace(eval('/' + $customchar.val() + '/g'), '');
        $cardcontent.val(str);
        $customchar.val('');
    });

    // 整理卡密
    $("#cleanup").click(function () {
        var cardcontent = $("#batchForm #cardcontent").val();
        if (cardcontent == '') {
            alert('请输入卡号和密码');
            $('#batchForm #cardcontent').focus();
            return false;
        }
        var postData = 'cardcontent=' + encodeURIComponent(cardcontent);
        ajaxreq({
        url: context_path + '/User/card/cleanupcardcontent.ashx',
            data: postData,
            success: function (json) {
                if (json.result == 'ok') {
                    $('#batchForm #cardcontent').val(json.msg);
                } else {
                    dialog_simple_fail(json.msg);
                    alert(json.msg);
                }
            },
            error: function () {
            }
        });
        return false;
    });

    // 智能提交
   

    // 获取当前选中的面值
    $(".autofacevaluelist").on("click", "ul li", function () {
        $('#batchForm #autoCardFaceValue').html($(this).text());
    });

    // 计算提交卡张数（不检查卡是否非法，仅作为参考）
    $('#batchForm #cardcontent').keydown(function (event) {
        if (event.keyCode == "13" || event.keyCode == "8") {
            calAutoCardNum($(this).val());
        }
    });
    $('#batchForm #cardcontent').on("blur focus", function () {
        calAutoCardNum($(this).val());
    });
});

function calAutoCardNum(val) {
    var counter = 0;
    var shuzu = val.split("\n");
    for (var i = 0; i < shuzu.length; i++) {
        if ($.trim(shuzu[i]) != "")
            counter += 1;
    }
    $("#autoCardNum").html(counter + "张");
}


