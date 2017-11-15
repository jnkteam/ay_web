<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.User.password.index" Title="修改密码" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">修改密码</h1>
    </div>
    <div class="main m-form tabular-form">
        <div class="form-group">
            <label class="control-label">商户ID</label>
            <div class="form-static"><%=id%></div>
        </div>
        <div class="form-group">
            <label class="control-label">原密码</label>
            <input type="password" name="oldpassword"  class="form-control" placeholder="请输入原密码" />
        </div>
        <div class="form-group">
            <label class="control-label">新密码</label>
            <input  type="password" name="password" class="form-control" placeholder="请输入新密码" />
        </div>
        <div class="form-group">
            <label class="control-label">确认密码</label>
            <input type="password" name="password2"  class="form-control" placeholder="请再次输入新密码" />
        </div>
        <div class="btn-group">
            <button type="submit" class="btn btn-primary" onclick="cleanup();">提交修改</button>
        </div>
    </div>
<script language="javascript" type="text/javascript">
    function cleanup() {
        var oldpassword = $("input[name='oldpassword']").val();
        var password = $("input[name='password']").val();
        var password2 = $("input[name='password2']").val();
        if ((oldpassword == "") || (password == "") || (password2 == "")) {
            alert("内容填写不全！");
            return;
        }
        var sSource = '/user/Service/password.ashx?t=' + Math.random();
        var postData = 'oldpassword=' + oldpassword + '&password=' + password + '&password2=' + password2;
        $.ajax({
            type: "post",
            dataType: "json",
            timeout: 10000,
            url: sSource,
            data: postData,

            success: function (json) {
                if (json.result == 'ok') {
                    alert(json.text);
                    window.location.href = "/user/";
                } else {
                    alert(json.text);
                }
            }
        })
    }   
</script>
</asp:Content>
