<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="OriginalStudio.WebUI.User.userrate.index" Title="商家费率" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h5 class="page-title">商家费率</h5>
    <div class="block-area" id="tableHover">
        <div class="table-responsive overflow">
            <table class="table table-bordered table-hover tile">
                <thead>
                    <tr class="tr-list-head">
                        <th width="10"></th>
                        <th>通道ID</th>
                        <th>通道类型</th>
                        <th>提成比例</th>
                        <th>通道状态</th>
                        <th>启用状态</th>
                    </tr>
                </thead>
                <asp:Repeater ID="rpt_paymode" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td align="center"></td>
                            <td><%#Eval("typeId")%></td>
                            <td><%#Eval("modetypename")%></td>
                            <td><%#Eval("payrate","{0:p2}")%></td>
                            <td><span class="<%#Eval("plmodestatus")%>" title="通道正常">通道正常</span></td>
                            <td><span class="<%#Eval("usermodestatus")%>" title="通道启用">通道启用</span></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
</asp:Content>
