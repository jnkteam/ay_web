<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Audits" CodeBehind="Audits.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>提现审核</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../style/union.css" type="text/css" rel="stylesheet" />
    
    <script type="text/javascript">
        function sendInfo(id) {
            window.open("../User/UserEdit.aspx?id=" + id, "查看用户信息", "Width=800px;Height=350px;");
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

    <style type="text/css">
        table
        {
            font-weight: normal;
            font-size: 12px;
            line-height: 170%;
            font-family: Arial;
        }
        td
        {
            height: 11px;
        }
        A:link
        {
            color: #02418a;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellspacing="1" cellpadding="1" style="width: 100%; height: 100%;">
            <tr>
                <td align="center" class="headtitle">
                    提现审核
                </td>
            </tr>
            <tr style="height: 30px">
                <td>
                    商户ID：<asp:TextBox ID="txtUserId" runat="server" Width="80px"></asp:TextBox>
                    申请ID：<asp:TextBox ID="txtItemInfoId" runat="server" Width="80px"></asp:TextBox>
                    <asp:DropDownList ID="ddlbankName" runat="server">                        
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
                    收款账户：<asp:TextBox ID="txtAccount" runat="server" Width="80px"></asp:TextBox>
                    收款人：<asp:TextBox ID="txtpayeeName" runat="server" Width="80px"></asp:TextBox>                    
                    <asp:DropDownList ID="ddlmode" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlSupplier" runat="server">
                    </asp:DropDownList>
                    <asp:Button ID="btnSearch" runat="server" CssClass="button" Text=" 查 询 " OnClick="btnSearch_Click">
                    </asp:Button>
                    <asp:Button ID="btnPass" runat="server" CssClass="button" Width="90px" Text="批量通过审核"
                        OnClick="btnPass_Click"></asp:Button>
                    <asp:Button ID="btnAllPass" runat="server" CssClass="button" Width="90px" Text="全部通过审核"
                        OnClick="btnAllPass_Click"></asp:Button>
                    <asp:Button ID="btnallfail" runat="server" CssClass="button" Width="90px" Text="全部拒绝"
                        OnClick="btnallfail_Click"></asp:Button>
                     <asp:Button ID="btnExport" runat="server" CssClass="button" Text="导出" OnClick="btnExport_Click">
                </asp:Button>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2">
                        <asp:Repeater ID="rptApply" runat="server" 
                            onitemdatabound="rptApply_ItemDataBound" 
                            onitemcommand="rptApply_ItemCommand">
                            <HeaderTemplate>
                                <tr style="background-color: #507CD1; color: #fff; height:22px">
                                    <td style="width: 5%">
                                        <input id="Checkboxall" type="checkbox" class="qx" onclick="checkall(this)" />   全选                                     
                                    </td>
                                    <td style="width: 5%">
                                        序号
                                    </td>
                                    <td style="width: 8%">
                                        商户名
                                    </td>
                                    <td style="width: 20%">
                                        收款信息
                                    </td>
                                    <td style="width: 8%">
                                        类型
                                    </td>
                                    <td style="width: 8%">
                                        申请金额
                                    </td>
                                    <td style="width: 10%">
                                        申请时间
                                    </td>
                                    <td style="width: 10%">
                                        支付到期
                                    </td>
                                    <td style="width: 8%">
                                        付款接口
                                    </td> 
                                    <td>
                                        操作
                                    </td>                                     
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr bgcolor="#EFF3FB">
                                    <td>
                                        <input id="<%# Eval("ID") %>" type="checkbox" name="ischecked" class="qx" value="<%# Eval("ID") %>" />
                                    </td>
                                    <td>
                                        <%# Eval("ID")%>
                                    </td>
                                    <td>
                                        <a href="javascript:sendInfo('<%# Eval("userid")%>')">
                                            <%#Eval("UserName")%>
                                        </a>
                                    </td>
                                    <td>
                                        <%# OriginalStudio.BLL.SettledFactory.GetSettleBankName(Eval("PayeeBank").ToString())%> <%# Eval("Payeeaddress")%> <br />
                                        <%# Eval("payeeName")%> <br />
                                        <%# Eval("account")%>
                                    </td>                                    
                                    <td style="text-align: right">
                                        <%#Enum.GetName(typeof(OriginalStudio.Model.SettledmodeEnum), Eval("settmode"))%>
                                    </td>
                                    <td style="text-align: right">
                                        <%# Eval("amount","{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("AddTime","{0:yyyy-MM-dd HH:mm:ss}") %>
                                    </td>
                                    <td>
                                        <%# Eval("required", "{0:yyyy-MM-dd}")%>
                                    </td>
                                    <td>
                                        <%# OriginalStudio.WebUI.WebUtility.GetsupplierName(Eval("tranapi"))%>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnAudit" runat="server" Text="通过" CommandName="Pass" CommandArgument='<%# Eval("ID") %>'  />
                                        <asp:Button ID="btnRefuse" runat="server" Text="拒绝" CommandName="Refuse" CommandArgument='<%# Eval("ID") %>'  />
                                    </td>                                    
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr bgcolor="#f9f9f9">                                    
                                   <td>
                                        <input id="<%# Eval("ID") %>" type="checkbox" name="ischecked" class="qx" value="<%# Eval("ID") %>" />
                                    </td>
                                    <td>
                                        <%# Eval("ID")%>
                                    </td>
                                    <td>
                                        <a href="javascript:sendInfo('<%# Eval("userid")%>')">
                                            <%#Eval("UserName")%>
                                        </a>
                                    </td>
                                    <td>
                                        <%# OriginalStudio.BLL.SettledFactory.GetSettleBankName(Eval("PayeeBank").ToString())%> <%# Eval("Payeeaddress")%> <br />
                                        <%# Eval("payeeName")%> <br />
                                        <%# Eval("account")%>
                                    </td>                                    
                                    <td style="text-align: right">
                                        <%#Enum.GetName(typeof(OriginalStudio.Model.SettledmodeEnum), Eval("settmode"))%>
                                    </td>
                                    <td style="text-align: right">
                                        <%# Eval("amount","{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("AddTime","{0:yyyy-MM-dd HH:mm:ss}") %>
                                    </td>
                                    <td>
                                        <%# Eval("required", "{0:yyyy-MM-dd}")%>
                                    </td>
                                    <td>
                                         <%# OriginalStudio.WebUI.WebUtility.GetsupplierName(Eval("tranapi"))%>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnAudit" runat="server" Text="通过" CommandName="Pass" CommandArgument='<%# Eval("ID") %>'  />
                                        <asp:Button ID="btnRefuse" runat="server" Text="拒绝" CommandName="Refuse" CommandArgument='<%# Eval("ID") %>'  />
                                    </td>    
                                </tr>
                            </AlternatingItemTemplate>
                        </asp:Repeater>
                        <tr>
                            <td colspan="10">
                                <aspxc:AspNetPager ID="Pager1" runat="server" AlwaysShow="True" CustomInfoHTML="总记录数：%RecordCount%&nbsp;总页数：%PageCount%&nbsp;当前页：%CurrentPageIndex%&nbsp;"
                                    CustomInfoTextAlign="Left" FirstPageText="首页" HorizontalAlign="Right" LastPageText="末页"
                                    NavigationToolTipTextFormatString="跳转{0}页" NextPageText="下一页" PageIndexBoxType="DropDownList"
                                    PageSize="20" PrevPageText="上一页" ShowBoxThreshold="50" ShowCustomInfoSection="Left"
                                    ShowPageIndex="False" ShowPageIndexBox="Always" SubmitButtonText="GO&gt;&gt;"
                                    TextAfterPageIndexBox="页" TextBeforePageIndexBox="跳到" Width="100%" Height="30px"
                                    OnPageChanged="Pager1_PageChanged">
                                </aspxc:AspNetPager>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

<script type="text/javascript" language="JavaScript">
    var table = document.getElementById("table_zyads"); if (table) { for (i = 0; i < table.rows.length; i++) { if (i % 2 == 0) { table.rows[i].bgColor = "ffffff"; } else { table.rows[i].bgColor = "f3f9fe" } } } var mytr = document.getElementById("table2").getElementsByTagName("tr"); for (var i = 1; i < mytr.length; i++) { mytr[i].onmouseover = function() { var rows = this.childNodes.length; for (var row = 0; row < rows; row++) { this.childNodes[row].style.backgroundColor = '#DFE8F6'; } }; mytr[i].onmouseout = function() { var rows = this.childNodes.length; for (var row = 0; row < rows; row++) { this.childNodes[row].style.backgroundColor = ''; } }; }</script>

