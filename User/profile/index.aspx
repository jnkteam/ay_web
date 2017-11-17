<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="OriginalStudio.WebUI.User.profile.index" Title="资料维护" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h5 class="page-title">资料维护</h5>
	<input name="m" type="hidden" value="user" />
	<input name="c" type="hidden" value="profile" />
	<input name="a" type="hidden" value="save" />
    <div class="block-area" id="tableHover">
        <div class="table-responsive overflow">
            <table class="table table-bordered table-hover tile view-table">
                <tr>
                    <th class="view-title"><font style="color:#F00">*</font>用户ID</th>
                    <td><asp:Literal ID="userid" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                    <th class="view-title"><font style="color:#F00">*</font>邮箱</th>
                    <td><asp:Literal ID="litUserEmail" runat="server"></asp:Literal><span style="padding-left:20px"><a style = "color: #0a8dca;" href="/user/email/">[<%=littextmai%>]</a></span></td>
                </tr>
                <tr>
                    <th class="view-title"><font style="color:#F00">*</font>手机</th>
                    <td><asp:Literal ID="litphone" runat="server"></asp:Literal><%-- <span style="padding-left:20px"><a  style = "color: #0a8dca;" href="/user/mobile/">[<%=littext%>]</a></span>--%></td>
                </tr>
                <tr>
                    <th class="view-title"><font style="color:#F00">*</font>姓名</th>
                    <td><%=litFullName %></td>
                </tr>
                <tr>
                    <th class="view-title"><font style="color:#F00">*</font>QQ号</th>
                    <td><%=litqq %></td>
                </tr>
    <%--  <tr>
        <th></th>
        <td><a  href="javascript:" onclick="cleanup();" class="V_btn4 submit ajaxSubmit" >提交修改</a></td>
      </tr>--%>
            </table>
        </div>
    </div>
<script type="text/javascript" language="javascript">
    function cleanup() {
        var m = "user";
        var c = "profile";
        var a = "save";
        var name = $("#name").val();
        var qq = $("#qq").val();
        var sSource = '/user/Service/UserAgent.ashx?t=' + Math.random();
        var postData = 'm=' + m + '&c=' + c + '&a=' + a + '&name=' + name + '&qq=' + qq;
        var loading = $.dialog.tips("提交中，请稍后……", 60, "loading");
        loading.close();
        $.ajax({
            type: "post",
            dataType: "json",
            timeout: 10000,
            url: sSource,
            data: postData,

            success: function (json) {
                if (json.result == 'ok') {
                    $.dialog({
                        title: '信息提示',
                        content: json.msg,
                        icon: json.ico,
                        time: '2',

                        ok: true
                    });
                } else {
                    $.dialog({
                        title: '信息提示',
                        content: json.msg,
                        icon: json.ico,
                        time: '2',
                        ok: true
                    });
                }
            }
        })
    }        
</script>
</asp:Content>
