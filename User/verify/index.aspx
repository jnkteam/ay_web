<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.User.verify.index" Title="收款帐号管理" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">收款账户管理　　<a href="addbank.aspx" class="link">添加</a></h1>
    </div>
    <div class="main">
        <ul class="receipt-accounts">
        <asp:Repeater ID="rptList" runat="server">
            <ItemTemplate>
                <li>
                <img src="/images/bank-<%# Eval("BankCode")%>.png" alt="" class="bank-logo">
                <div class="number-name">
                    <%# Eval("account").ToString() %> <br> <%# Eval("payeeName").ToString() %>
                </div>
                <div class="operate">
                    <%--<a href='javascript:editItem(<%# Eval("id").ToString() %>)' class="btn btn-primary btn-edit">编辑</a>--%>
                    <a href='javascript:deleteItem(<%# Eval("id").ToString() %>)' class="btn btn-primary btn-del">删除</a>
                </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
            <div class="query-extra">
                <div class="query-subtotal">
                    收款账户总数：<%= gTotalCount %>
                </div>
            </div>
    </div>
    <script type="text/javascript" language="javascript">
        function editItem(id) {
        }
        function deleteItem(id) {
            if (confirm("确定要删除该账户吗？") == false) {
                return;
            }
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: '/user/Service/delbank.ashx',
                data: "id=" + id,
                success: function (json) {
                    if (json.result) {
                        alert(json.text);
                        window.location.href = "/user/verify/";
                    } else {
                        alert(json.text);
                    }
                }
            });
        }
    </script>
</asp:Content>
