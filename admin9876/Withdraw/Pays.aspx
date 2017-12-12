<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Withdraw.Pays" Codebehind="Pays.aspx.cs" %>

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
        付款管理
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
                <td colspan="2">
                    <table>
                        <tr height="30" >
                            <td colspan="2">
                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">商户ID</button></div>
                                <asp:TextBox ID="txtUserId" class="form-control" runat="server" Width="80px"></asp:TextBox></div>
                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">申请ID</button></div>
                                <asp:TextBox ID="txtItemInfoId" class="form-control" runat="server" Width="80px"></asp:TextBox></div>
                            <div class="input-group">
                            <asp:DropDownList class="form-control" ID="ddlbankName" runat="server">
                                <asp:ListItem value="">--收款银行--</asp:ListItem>
                                <asp:ListItem value="0002">支付宝</asp:ListItem>
                                <asp:ListItem value="0003">财付通</asp:ListItem>
                                <asp:ListItem value="1002">中国工商银行</asp:ListItem>
                                <asp:ListItem value="1005">中国农业银行</asp:ListItem>
                                <asp:ListItem value="1003">中国建设银行</asp:ListItem>
                                <asp:ListItem value="1026">中国银行</asp:ListItem>
                                <asp:ListItem value="1001">招商银行</asp:ListItem>
                                <asp:ListItem value="1006">民生银行</asp:ListItem>
                                <asp:ListItem value="1020">交通银行</asp:ListItem>
                                <asp:ListItem value="1025">华夏银行</asp:ListItem>
                                <asp:ListItem value="1009">兴业银行</asp:ListItem>
                                <asp:ListItem value="1027">广发银行</asp:ListItem>
                                <asp:ListItem value="1004">浦发银行</asp:ListItem>
                                <asp:ListItem value="1022">光大银行</asp:ListItem>
                                <asp:ListItem value="1021">中信银行</asp:ListItem>
                                <asp:ListItem value="1010">优奇支付银行</asp:ListItem>
                                <asp:ListItem value="1066">中国邮政储蓄银行</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                            </td>
                        </tr>
                        <tr height="30" >
                            <td colspan="2">
                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">收款账户</button></div>
                            <asp:TextBox ID="txtAccount" runat="server" class="form-control" ></asp:TextBox></div>
                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">收款人</button></div>
                            <asp:TextBox ID="txtpayeeName" runat="server" class="form-control"></asp:TextBox></div>
                            <div class="input-group">
                            <asp:DropDownList ID="ddlmode" class="form-control" runat="server">
                            </asp:DropDownList></div>
                            <div class="input-group">
                            <asp:DropDownList ID="ddlSupplier" class="form-control" runat="server">
                            </asp:DropDownList></div>
                            </td>
                        </tr>
                        <tr height="30" >
                            <td colspan="2">

                            <div class="input-group">
                            <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btnSearch_Click">
                            </asp:Button></div>

                            <div class="input-group">
                            <asp:RadioButtonList  ID="rbl_export_mode"  runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Selected="True" Value="1">excel</asp:ListItem>
                            <asp:ListItem Value="2">txt</asp:ListItem>
                            </asp:RadioButtonList></div>

                            <div class="input-group">
                            <asp:Button ID="btnExport" runat="server" CssClass="button btn  btn-danger" Text="导出" OnClick="btnExport_Click"></asp:Button></div>

                            <div class="input-group">
                            <div class="input-group-btn">
                            <button type="button" class="btn btn-primary">二级密码</button></div>
                            <asp:TextBox ID="txtPassWord" class="form-control" runat="server" TextMode="Password"></asp:TextBox></div>

                            <div class="input-group">
                            <asp:Button ID="btnAllSettle" runat="server" CssClass="button btn  btn-danger" Text="批量支付" onclick="btnAllSettle_Click" OnClientClick="return checkAll();">
                            </asp:Button></div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td bgcolor="#ffffff">
                    <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                        <asp:Repeater ID="rptList" runat="server">
                            <HeaderTemplate>
                                <tr height="30" style="background: #e8eaee">
                                    <td style="width: 5%">
                                        序号
                                    </td>
                                    <td style="width: 8%">
                                        商户名
                                    </td>
                                    <td style="width: 8%">
                                        收款信息
                                    </td>
                                    <td style="width: 8%">
                                        申请金额
                                    </td>
                                    <td style="width: 8%">
                                        手 续 费
                                    </td>
                                    <td style="width: 8%">
                                        实际支付金额
                                    </td>
                                    <td style="width: 8%">
                                        类型
                                    </td>
                                    <td style="width: 10%">
                                        申请时间
                                    </td>
                                    <td style="width: 15%">
                                        状态
                                    </td>
                                    <td>
                                        <input id="Checkboxall" type="checkbox" class="qx" onclick="checkall(this)" />
                                        全选
                                    </td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("ID")%>
                                    </td>
                                    <td>
                                        <a href="javascript:sendInfo('<%# Eval("userid")%>')">
                                            <%#Eval("UserName")%>
                                        </a>
                                    </td>
                                    <td>
                                        <%# Eval("payeeName")%> <br />
                                        <%# Eval("Account")%>
                                    </td>
                                    <td>
                                        <%# Eval("amount", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("Charges", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Convert.ToDecimal(Eval("amount")).ToString("f2") %>
                                    </td>
                                    <td>
                                        <%#Enum.GetName(typeof(OriginalStudio.Model.Settled.SettledModeEnum), Eval("settmode"))%>
                                    </td>
                                    <td>
                                        <%# Eval("AddTime","{0:yyyy-MM-dd HH:mm:ss}") %>
                                    </td>
                                    <td>
                                        <a class="button btn btn-xs  btn-info" href="javascript:showOrder(<%# Eval("ID") %>);">修改</a>
                                        <a class="button btn btn-xs  btn-info" href="javascript:showOrder(<%# Eval("ID") %>);">进行支付</a>
                                    </td>
                                    <td>
                                        <input id="<%# Eval("ID") %>" type="checkbox" name="ischecked" class="qx" value="<%# Eval("ID") %>" />
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
        function sendInfo(id) {
        //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
            layer.ready(function(){
                //自定页
                layer.open({
                    type: 2,
                    title: '用户信息',
                    skin: 'layui-layer-rim', //加上边框
                    //closeBtn: 0, //不显示关闭按钮
                    area: ['67%', '90%'], //宽高
                    content: "../User/UserEdit.aspx?id=" + id,
                });
            });
        }
    </script>
    <script type="text/javascript">
        function showOrder(id) {
        //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
            layer.ready(function(){
                //自定页
                layer.open({
                    type: 2,
                    title: '提现管理',
                    skin: 'layui-layer-rim', //加上边框
                    //closeBtn: 0, //不显示关闭按钮
                    area: ['67%', '90%'], //宽高
                    content: "Pay.aspx?action=modi&ID" + id,
                });
            });
        }
    </script>
    <script type="text/javascript" language="javascript">
        function Setchkall(obj) {
            var objs = document.getElementsByName("chk");
            for (i = 0; i < objs.length; i++) {
                objs[i].checked = obj.checked;
            }
        }
        function checkall(obj) {
            var check = document.getElementsByName("ischecked");
            for (i = 0; i < check.length; i++) {
                check[i].checked = obj.checked;
            }
        }
    </script>