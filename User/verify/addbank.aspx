<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="addbank.aspx.cs" Inherits="OriginalStudio.WebUI.User.verify.addbank" Title="添加收款帐号" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">添加收款账户</h1>
    </div>
    <input name="Typebank" id= "Typebank" type="hidden" value="bank" />
    <input name="bankid" id="bankid" value="" type="hidden" />
    <div class="main m-form tabular-form">
        <div class="form-group">
            <label class="control-label">账户类型</label>
            <label class="radio"><input type="radio" checked="checked" />银行卡</label>
        </div>
        <div class="form-group">
            <label class="control-label">开户行</label>
            <div class="choose-bank">
                <ul class="cashier-banks">
                    <li class="cashier-bank"><label><input type="radio" value="1002" name="bankName"/><img class="bank" src="/images/bank-1002.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1005" name="bankName"/><img class="bank" src="/images/bank-1005.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1026" name="bankName"/><img class="bank" src="/images/bank-1026.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1003" name="bankName"/><img class="bank" src="/images/bank-1003.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1001" name="bankName"/><img class="bank" src="/images/bank-1001.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1010" name="bankName"/><img class="bank" src="/images/bank-1010.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1020" name="bankName"/><img class="bank" src="/images/bank-1020.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1025" name="bankName"/><img class="bank" src="/images/bank-1025.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1022" name="bankName"/><img class="bank" src="/images/bank-1022.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1021" name="bankName"/><img class="bank" src="/images/bank-1021.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1006" name="bankName"/><img class="bank" src="/images/bank-1006.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1009" name="bankName"/><img class="bank" src="/images/bank-1009.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1004" name="bankName"/><img class="bank" src="/images/bank-1004.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1035" name="bankName"/><img class="bank" src="/images/bank-1035.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1066" name="bankName"/><img class="bank" src="/images/bank-1066.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1032" name="bankName"/><img class="bank" src="/images/bank-1032.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1029" name="bankName"/><img class="bank" src="/images/bank-1029.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1028" name="bankName"/><img class="bank" src="/images/bank-1028.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1027" name="bankName"/><img class="bank" src="/images/bank-1027.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1033" name="bankName"/><img class="bank" src="/images/bank-1033.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1020" name="bankName"/><img class="bank" src="/images/bank-1020.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1031" name="bankName"/><img class="bank" src="/images/bank-1031.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1034" name="bankName"/><img class="bank" src="/images/bank-1034.png" alt="" /></label></li>
                    <li class="cashier-bank"><label><input type="radio" value="1027" name="bankName"/><img class="bank" src="/images/bank-1027.png" alt="" /></label></li>
                </ul>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">开户行所在地</label>
            <div class="location-control">
                <select name="Province" id="s1"  class="form-control input-sm"></select>
                <select name="City" id="s2" class="form-control input-sm"></select>
                <select name="Area" id="s3" class="form-control input-sm"></select>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">支行名称</label>
            <input type="text" name="bankfullname" class="form-control input-lg" />
            <div class="form-tips">（如：科技园支行）</div>
        </div>
        <div class="form-group">
            <label class="control-label">收款人姓名</label>
            <input type="text" name="accountName"  class="form-control input-lg" />
        </div>
        <div class="form-group">
            <label class="control-label">银行账号</label>
            <input type="text" name="accountID"  class="form-control input-lg" />
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-primary" onclick="ajaxSubmit();">保 &nbsp; 存</button>
        </div>
        <div class="handy-tips">
            <h4><i class="icon icon-warn"></i>温馨提示：</h4>
            <p>1、开户名必须与认证的个人姓名/企业名称一致！</p>
            <p>2、填写的帐号必须与开户名对应，否则可能会因此而造成无法成功收到提现、退款及PUSH所得钱款！</p>
        </div>    
    </div>
    <script type="text/javascript" src="/static/js/geo.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            //开户行所在地初始化
            setup();
        });
        function ajaxSubmit() {
            var bankCode = $('input[name="bankName"]:checked').val();
            var typeBank = $("#Typebank").val();
            var Province = $("#s1").val();
            var City = $("#s2").val();
            var Area = $("#s3").val();
            var bankfullname = $("input[name='bankfullname']").val();
            var accountName = $("input[name='accountName']").val();
            var accountID = $("input[name='accountID']").val();
            var alipayID = ""; // $("input[name='alipayID']").val();
            if ((bankCode == "undefined") || (typeBank == "") || (Province == "") || (City == "") || (Area == "") || (bankfullname == "") || (accountName == "") || (accountID == "")) {
                alert("内容填写不全！");
                return;
            }
            var sSource = '/user/Service/thebank.ashx?t=' + Math.random();
            var postData = 'bankCode=' + bankCode + '&typeBank=' + typeBank + '&Province=' + Province + '&City=' + City + '&Area=' + Area + '&bankfullname=' + bankfullname + '&accountName=' + accountName + '&accountID=' + accountID + '&alipayID=' + alipayID;
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: sSource,
                data: postData,
                success: function (json) {
                    if (json.result == 'ok') {
                        alert(json.msg);
                        window.location.href = '/user/verify/';
                    } else {
                        alert(json.msg);
                    }
                }
            });
        }
    </script>
</asp:Content>
