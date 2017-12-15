<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Withdraw.PayingByApi" Codebehind="PayingByApi.aspx.cs" %>

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
        付款中（通过接口）
        <small><%=PlatformName%></small>
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
                        <tr height="30" >
                            <td>
                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">商户号</button></div>
                                    <asp:TextBox ID="txtMerchantName" runat="server" class="form-control"></asp:TextBox></div>

                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">申请ID</button></div>
                                    <asp:TextBox ID="txtItemInfoId" runat="server" class="form-control"></asp:TextBox></div>

                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">收款账户</button></div>
                                    <asp:TextBox ID="txtAccount" class="form-control" runat="server" Width="80px"></asp:TextBox></div>

                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">收款人</button></div>
                                    <asp:TextBox ID="txtpayeeName" class="form-control" runat="server" Width="80px"></asp:TextBox></div>


                            </td>
                        </tr>
						<tr>
							<td>
                                <div class="input-group">
                                    <asp:DropDownList class="form-control" ID="ddlbankName" runat="server">
                                     </asp:DropDownList>
                                </div>							
                               <div class="input-group">
                                    <asp:DropDownList ID="ddlmode" class="form-control" runat="server">
                                    </asp:DropDownList></div>

                               <div class="input-group">
                                    <asp:DropDownList ID="ddlSupplier" class="form-control" runat="server">
                                    </asp:DropDownList></div>

                               <div class="input-group">
                                    <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btnSearch_Click">
                                    </asp:Button></div>

                               <div class="input-group">
									<asp:Button ID="btnExport" runat="server" CssClass="button btn  btn-danger" Text="导出" OnClick="btnExport_Click"></asp:Button></div>								
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
                        <asp:Repeater ID="rptList" runat="server" onitemcommand="rptList_ItemCommand">
                            <HeaderTemplate>
                                <tr height="22" style="background: #e8eaee">
                                    <td style="width: 5%">
                                        <input id="Checkboxall" type="checkbox" class="qx" onclick="checkall(this)" />
                                    </td>
                                    <td style="width: 5%">
                                        序号
                                    </td>
                                    <td style="width: 8%">
                                        商户号
                                    </td>
                                    <td style="width: 8%">
                                        姓名
                                    </td>
                                    <td style="width: 12%">
                                        卡号
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
                                        
                                    </td>                                    
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <input id="<%# Eval("ID") %>" type="checkbox" name="ischecked" class="qx" value="<%# Eval("ID") %>" />
                                    </td>
                                    <td>
                                        <%# Eval("ID")%>
                                    </td>
                                    <td>
                                        <a href="javascript:sendInfo('<%# Eval("userid")%>')">
                                            <%#Eval("MerchantName")%>
                                        </a>
                                    </td>
                                    <td>
                                        <%# Eval("PayeeName")%>
                                    </td>
                                    <td >
                                        <%# Eval("Account","{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("amount", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("Charges", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("realpay", "{0:f2}") %>
                                    </td>
                                    <td>
                                        <%#Enum.GetName(typeof(OriginalStudio.Model.Settled.SettledModeEnum), Eval("settmode"))%>
                                    </td>
                                    <td>
                                        <%# Eval("AddTime","{0:yyyy-MM-dd HH:mm:ss}") %>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnCancel" runat="server" class="button btn btn-xs  btn-info" Text="取消" CommandArgument='<%# Eval("ID") %>'  CommandName="Cancel" />
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