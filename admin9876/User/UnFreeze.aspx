<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UnFreeze" Codebehind="UnFreeze.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>

<style>

td{text-align: center}
th{text-align: center}
</style>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ���ַ���
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <div id="modelPanel" style="background-color: #F2F2F2">
    </div>
    <input id="selectedUsers" runat="server" type="hidden" />
    <table width="100%" border="0" cellspacing="1" cellpadding="1" class="table1" class="table table-bordered">

        <tr>
            <td>
               <div class="input-group">
                                  <div class="input-group-btn">
                                     <button type="button" class="btn btn-primary">�û���</button>
                                  </div>
                <asp:TextBox class="form-control" ID="txtMerchantName" runat="server"></asp:TextBox>
                </div>
                <div class="input-group">
                <asp:Button ID="btnSearch" CssClass="button btn  btn-danger" runat="server"  Text=" �� ѯ " OnClick="btnSearch_Click">
                </asp:Button>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center" >
                <table width="100%" id="tab" border="0" align="center" cellpadding="2" cellspacing="1" class="table table-bordered table-hover dataTable" style="background: #fff">
                    <asp:Repeater ID="rptData" runat="server" 
                        OnItemDataBound="rptUsersItemDataBound" onitemcommand="rptUsers_ItemCommand">
                        <HeaderTemplate>
                            <tr  height="30"  style="background: #e8eaee">

                                <td>
                                    �̻���
                                </td> 
                                 <td>
                                    �û���
                                </td>   
                                 <td>
                                    ��ʵ����
                                </td>                                     
                                <td>
                                    �������
                                </td>
                                <td>
                                    ����ԭ��
                                </td>
                                <td>
                                    �Ƿ�ⶳ
                                </td>
                                <td>
                                    �ⶳ��ʽ
                                </td>
                                <td>
                                    ����ʱ��
                                </td>
                                <td>
                                    ����
                                </td>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr >

                                <td>
                                     <%# Eval("userid")%>
                                </td>  
                                  <td>
                                    <%# Eval("merchantname")%>
                                </td>  
                                <td>
                                    <%# Eval("MerchantName")%>
                                </td>                                
                                <td>
                                     <%# Eval("freezeAmt", "{0:f2}")%>
                                </td>
                                <td>
                                     <%# Eval("why")%>
                                </td>
                                <td>
                                     <%#Enum.GetName(typeof(OriginalStudio.Model.Settled.AmtFreezeInfoStatus),Eval("status"))%>
                                </td>
                                <td>
                                    <%#Enum.GetName(typeof(OriginalStudio.Model.Settled.AmtunFreezeMode), Eval("unfreezemode"))%>                                     
                                </td>
                                <td>
                                     <%# Eval("addtime","{0:yyyy-MM-dd HH:mm:ss}")%>
                                </td>
                                <td>
                                    <asp:Button class="button btn btn-xs btn-info" ID="btn_unfreeze1" runat="server" CommandName="unfreeze1" CommandArgument='<%#Eval("id")%>' Text="�ⶳ�����" />
                                    <asp:Button class="button btn btn-xs btn-info" ID="btn_unfreeze2" runat="server" CommandName="unfreeze2" CommandArgument='<%#Eval("id")%>' Text="�ⶳ���۳�" />
                                </td>
                            </tr>
                        </ItemTemplate>

                    </asp:Repeater>
                </table>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <!---------------------pager------------------>
                                       <!-- #include file="../Pager.aspx" -->
                                       <!---------------------pager------------------>
                    <tr>
                    <td></td>
                    <td style="text-align: left !important;">
                    <br>
                        ˵����
                        �ⶳ�����(�Ѷ���Ŀ�����̻��������)
                        �ⶳ���۳�(�Ѷ���Ŀ�������Ϊ�ѽⶳ������������̻�)
                    </td>
                    </tr>
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
