<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.WithdrawChannels" Codebehind="WithdrawChannels.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
<style>
#tab tr th{text-align: center;}
#tab tr td{vertical-align:middle;}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        结算通道
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="Form1" runat="server">
        <table width="100%" border="0" cellpadding="1" cellspacing="1" id="table_zyads" class="table table-bordered">

            <tr>             
                <td align="center">
                    <table width="100%" id="tab" border="0" align="center" cellpadding="2" cellspacing="1" class="table table-bordered table-hover dataTable">
                    <asp:Repeater ID="rptChnls" runat="server" onitemcommand="rptChnls_ItemCommand" 
                            onitemdatabound="rptChnls_ItemDataBound" >
                        <HeaderTemplate>
                            <tr height="30"  style="background: #e8eaee">
                                <td>
                                    结算银行
                                </td>  
                                <td>
                                    银行代码
                                </td>
                                <td>
                                    简写
                                </td>                                
                                <td style="    width: 15%;">
                                    通道
                                </td>
                                <td>
                                    操作
                                </td>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr >
                                <td>
                                    <%# Eval("bankName")%>
                                </td>                              
                                <td>
                                    <%# Eval("bankCode")%>
                                </td>
                                <td>
                                    <%# Eval("bankEnName")%>
                                </td>								
                                <td >
                                <div class="input-group" style="text-align: center">
                                    <asp:DropDownList class="form-control" ID="ddlsupp" runat="server"></asp:DropDownList>
                                    </div>
                                </td>                                          
                                <td>
                                    <asp:Button ID="btnUpdate" class="button btn btn-xs  btn-info" runat="server" Text="保存" CommandName="update" CommandArgument='<%#Eval("id")%>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr >
                                <td>
                                    <%# Eval("bankName")%>
                                </td>                              
                                <td>
                                    <%# Eval("bankCode")%>
                                </td>
                                <td>
                                    <%# Eval("bankEnName")%>
                                </td>								
                                <td>
                                <div class="input-group">
                                    <asp:DropDownList class="form-control" ID="ddlsupp" runat="server"></asp:DropDownList>
                                    </div>
                                </td>                                          
                                <td>
                                    <asp:Button ID="btnUpdate" class="button btn btn-xs  btn-info" runat="server" Text="保存" CommandName="update" CommandArgument='<%#Eval("id")%>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </table>
                </td>
            </tr>
        </table>
    </form>
</section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>