<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="OriginalStudio.WebUI.User.realname.index" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h5 class="page-title">实名认证</h5>
    <div class="block-area" id="tableHover">
        <div class="table-responsive overflow">
            <table class="table table-bordered table-hover tile view-table">
                <tr>
                    <th class="view-title">会员ID</th>
                    <td><%=id%></td>
                </tr>
                <tr>
                    <th>个人姓名</th>
                    <td><%=name%></td>
                </tr>
                <tr>
                    <th>身份证号码</th>
                    <td><%=shenfenzhenghao%></td>
                </tr>
                <tr>
                    <th>身份证扫描件</th>
                    <td>
                        <div style="width:120px; height:90px; float:left; border:solid 1px #dddddd; margin:20px 25px 20px 5px;">
							<a id="img1" runat="server" target="_blank"><img src='<%=zhengmian %>' width="118" height="88" style="margin-left:1px;margin-top:1px;"/></a>
						</div>
						
						<div style="width:120px; height:90px; float:left; border:solid 1px #dddddd; margin:20px 25px 20px 5px;">
							<a id="img2" runat="server" target="_blank"><img src='<%=fanmian %>' width="118" height="88" style="margin-left:1px;margin-top:1px;"/></a>
						</div>
                    </td>
                </tr>
                <tr>
                    <th>状态</th>
                    <td>
                        <asp:Label ID="img" runat="server"></asp:Label><%=zhuangtai%>
                        <asp:Label ID="Labeladd" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>提交时间</th>
                    <td><%=shijan%></td>
                </tr>
            </table>            
        </div>
    </div>
</asp:Content>
