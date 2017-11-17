<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="OriginalStudio.WebUI.User.awalpassword.index" Title="修改提现密码" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:HiddenField ID="hidMode" runat="server" />
    <div class="titlebar">
        <h1 class="title">修改支付密码</h1>
    </div>
    <div class="main m-form tabular-form">
        <div class="form-group">
            <label class="control-label">商户ID</label>
            <div class="form-static"><%= gUserID %></div>
        </div>
        <% if (gUpdateMode) { %>
        <div class="form-group">
            <label class="control-label">原密码</label>
            <input type="password" id="oldpassword" class="form-control" placeholder="请输入原密码">
        </div>
        <% }%>
        <div class="form-group">
            <label class="control-label">新密码</label>
            <input type="password" id="password" class="form-control" placeholder="请输入新密码">
        </div>
        <div class="form-group">
            <label class="control-label">确认密码</label>
            <input type="password" id="password2" class="form-control" placeholder="请再次输入新密码">
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-primary" onclick="ajaxSubmit()">提交修改</button>
        </div>
    </div>
    <script type="text/javascript" language="javascript">
        function ajaxSubmit() {
            var oldpassword = "";
            <% if (gUpdateMode) { %>
                oldpassword = $("#oldpassword").val();
            <% }%>
            var password = $("#password").val();
            var password2 = $("#password2").val();
            <% if (gUpdateMode) { %>
                if ((oldpassword == "") || (password == "") || (password2 == "")) {
                    alert("内容填写不全！");
                    return;
                }
                if (password  == oldpassword)
                {
                    alert("新密码和旧密码不能相同！");
                    return;
                }
            <% } else {%>
                if ((password == "") || (password2 == "")) {
                    alert("内容填写不全！");
                    return;
                }
            <% }%>
            if (password  != password2)
            {
                alert("两遍密码不同！");
                return;
            }
            var sSource = '/user/Service/password2.ashx?t=' + Math.random();
            <% if (gUpdateMode) { %>
                var postData = 'oldpassword=' + oldpassword + '&password=' + password + '&password2=' + password2;
            <% } else {%>
                var postData = 'password=' + password + '&password2=' + password2;
            <% }%>
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: sSource,
                data: postData,
                success: function (json) {
                    if (json.result == 'ok') {
                        alert(json.msg);
                        window.location.href = "/user/";
                    } else {
                        alert(json.msg);
                    }
                }
            });
        }        
    </script>
</asp:Content>
