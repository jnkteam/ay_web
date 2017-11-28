<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.Freeze" Codebehind="Freeze.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
<style>
td{
vertical-align: middle !important;
}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        冻结款项
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">

    <form id="form1" runat="server">
    <div>
        <table border="0" cellspacing="1" cellpadding="1" style="width: 100%; height: 100%;">
            <tr style="height: 30px">
                <td>
                    <table>
                        <tr>
                            <td>
                            <div class="input-group">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">用户ID</button></div>
                                    <asp:TextBox ID="txtuserId" class="form-control" runat="server"></asp:TextBox></div>
                                <div class="input-group">
                                    <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btnSearch_Click"></asp:Button></div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        <tr>
            <td bgcolor="#ffffff">
                <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered">
                    <tr>
                        <td align="center" bgcolor="#ffffff">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                        <asp:Repeater ID="rptUsers" runat="server" OnItemDataBound="rptUsersItemDataBound" onitemcommand="rptUsers_ItemCommand">
                        <HeaderTemplate>
                            <tr style="background: #e8eaee">
                                <td style="display: none">
                                    <input id="chkAll" type="checkbox">
                                </td>
                                <td>
                                    商户ID
                                </td>
                                <td>
                                    用户名
                                </td>
                                 <td>
                                    真实姓名
                                </td>
                                <td>
                                    商户余额
                                </td>
                                <td>
                                    已冻结金额
                                </td>
                                <td>
                                    提现金额
                                </td>
                                <td>
                                    冻结金额
                                </td>
                                <td>
                                    冻结原因
                                </td>
                                <td>
                                    操作
                                </td>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="display: none">
                                    <input id="chkItem" type="checkbox" runat="server" value='<%#Eval("userid")%>' name="chkItem" />
                                </td>
                                <td>
                                    <%# Eval("userid")%>
                                </td>
                                <td>
                                    <%# Eval("userName")%>
                                </td>
                                <td>
                                    <%# Eval("ContactName")%>
                                </td>
                                <td>
                                    <%# Eval("balance", "{0:f2}")%>
                                </td>
                                <td>
                                    <%# Eval("Freeze", "{0:f2}")%>
                                </td>
                                <td>
                                    <%# Eval("unpayment", "{0:f2}")%>
                                </td>
                                <td><div>
                                    <asp:TextBox ID="txtFreezeMoney" class="form-control" runat="server" Width="80px"></asp:TextBox></div>
                                </td>
                                <td><div>
                                    <asp:TextBox ID="txtWhy" runat="server" class="form-control" Text="用户投诉" MaxLength="25"></asp:TextBox></div>
                                </td>
                                <td>
                                    <asp:Button ID="btn_freeze" runat="server" class="button btn btn-xs  btn-info" CommandName="freeze" CommandArgument='<%#GetParm(Eval("userid"),Eval("balance"),Eval("Freeze"),Eval("unpayment"))%>' Text="冻结" />
                                </td>
                            </tr>
                        </ItemTemplate>

                    </asp:Repeater>
                            </table>
                        </td>
                    </tr>
                            <!---------------------pager------------------>
                            <!-- #include file="../PagerIng.aspx" -->
                            <!---------------------pager------------------>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff" style="color: red;font-weight: 600;padding-bottom: 15px;">
                说明：冻结的金额可以到解冻款项去解冻
            </td>
        </tr>
        </table>
    </div>
    </form>

</section>
</div>

<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>

<script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>

    <script type="text/javascript">
        $().ready(function() {
            $("#chkAll").click(function() {
                $("input[type='checkbox']").each(function() {
                    if ($("#chkAll").attr('checked') == true) {
                        $(this).attr("checked", true);
                    }
                    else
                        $(this).attr("checked", false);
                });
            });
        })
        function sendMsg(uid) {
            window.showModelessDialog("SendMsg.aspx?uid=" + uid, window, "dialogWidth=800px;dialogHeight=500px;");
        }

    </script>

    <script type="text/javascript">
        function sendInfo(id) {
            window.open("../User/UserEdit.aspx?id=" + id, "查看用户信息", "'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=n o, status=no");
        }
    </script>

    <script type="text/javascript">
        function handler(tp) {
        }

        var mytr = document.getElementById("tab").getElementsByTagName("tr");
        for (var i = 1; i < mytr.length; i++) {
            mytr[i].onmouseover = function() {
                var rows = this.childNodes.length;
                for (var row = 0; row < rows; row++) {
                    this.childNodes[row].style.backgroundColor = '#E6EEFF';
                }
            };
            mytr[i].onmouseout = function() {
                var rows = this.childNodes.length;
                for (var row = 0; row < rows; row++) {
                    this.childNodes[row].style.backgroundColor = '';
                }
            };
        }

    </script>


