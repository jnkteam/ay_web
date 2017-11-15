<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.User.UserLoginLog" Codebehind="UserLoginLog.aspx.cs" %>
 <%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
 <!-----------------header---------------->
  <!-- #include file="../Top.aspx" -->
 <!-----------------header---------------->
 <!-----------------left------------------>
  <!-- #include file="../Left.aspx" -->
 <!-----------------left------------------>


  <!-- Content Wrapper. Contains page content -->
   <div class="content-wrapper">
     <!-- Content Header (Page header) -->
     <section class="content-header">
       <h1>
         ��¼��־
         <small>������֧��ƽ̨</small>
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
        <table width="100%" border="0" cellspacing="1" cellpadding="1" class="table1">

            <tr>
                <td>
                    <div class="input-group">
                    <asp:DropDownList ID="SeachType" class="form-control" runat="server" EnableViewState="false">
                        <asp:ListItem Value="">��������</asp:ListItem>
                        <asp:ListItem Value="UserName">�û���</asp:ListItem>
                        <asp:ListItem Value="UserId">�û�ID</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    <div class="input-group">
                    <asp:TextBox ID="KeyWordBox" class="form-control" runat="server" EnableViewState="false"></asp:TextBox>
                    </div>

                   <div class="input-group date">
                                                <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ʼ</div>
                                                   <asp:TextBox ID="StimeBox"  class="form-control"  runat="server" Width="65px"></asp:TextBox>
                                               </div>

                                                <div class="input-group date">
                                                  <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ֹ</div>
                                               <asp:TextBox ID="EtimeBox" runat="server" class="form-control" Width="65px"></asp:TextBox>
                                               </div>
                    <div class="input-group">
                    <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger"  Text=" �� ѯ " OnClick="btnSearch_Click">

                    </asp:Button>
                    </div>
                     <div class="input-group">
                    <asp:Button ID="btnDel" runat="server" CssClass="button btn  btn-danger" Text="ɾ ��" onclick="btnDel_Click" />
                    </div>
                    &nbsp; &nbsp;
                </td>
            </tr>           
            <tr>
                <td align="center">
                    <table width="100%" id="tab" border="0" align="center" cellpadding="2" class="table table-bordered table-hover dataTable" cellspacing="1" class="11">
                        <asp:Repeater ID="rptUsers" EnableViewState="false" runat="server">
                            <HeaderTemplate>
                                <tr height="30"  style="background: #e8eaee">
                                    <td style="width:5%">
                                        <input id="chkAll" type="checkbox">
                                    </td>
                                    <td>
                                        �̻�ID</td>
                                    <td>
                                        �û���</td>
                                    <td>
                                        ����</td>
                                    <td>
                                        ��¼ʱ��</td>
                                    <td>
                                        ��¼IP</td>
                                    <td>
                                        ��¼�ص�</td>
                                    <td>
                                        ��ע</td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr >
                                    <td>
                                        <input id="chkItem" type="checkbox" value='<%#Eval("id")%>' name="chkItem"/>
                                    </td>
                                    <td>
                                        <%# Eval("userID")%>
                                    </td>
                                    <td>
                                        <%# Eval("userName")%>
                                    </td>
                                    <td>
                                        <%# Eval("payeeName")%>
                                    </td>
                                     <td>
                                        <%# Eval("lastTime","{0:yyyy-MM-dd HH:mm:ss}")%>
                                    </td> 
                                    <td>
                                        <%# Eval("lastIP")%>
                                    </td>                                                                
                                    <td>
                                        <%# Eval("address")%>
                                    </td>
                                    <td>
                                        <%# Eval("remark")%>
                                    </td>                                    
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr >
                                   <td>
                                        <input id="chkItem" type="checkbox" value='<%#Eval("id")%>' name="chkItem"/>
                                    </td>
                                    <td>
                                        <%# Eval("userID")%>
                                    </td>
                                    <td>
                                        <%# Eval("userName")%>
                                    </td>
                                    <td>
                                        <%# Eval("payeeName")%>
                                    </td>
                                     <td>
                                        <%# Eval("lastTime","{0:yyyy-MM-dd HH:mm:ss}")%>
                                    </td> 
                                    <td>
                                        <%# Eval("lastIP")%>
                                    </td>                                                                
                                    <td>
                                        <%# Eval("address")%>
                                    </td>
                                    <td>
                                        <%# Eval("remark")%>
                                    </td>                   
                                </tr>
                            </AlternatingItemTemplate>
                        </asp:Repeater>
                    </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr >
                           <!---------------------pager------------------>
                                               <!-- #include file="../PagerIng.aspx" -->
                                               <!---------------------pager------------------>
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
   <script>
     $(function () {



        $("#StimeBox").jeDate({

               format: "YYYY-MM-DD hh:mm:ss",

           });
        $("#EtimeBox").jeDate({

                    format: "YYYY-MM-DD hh:mm:ss",

                });



     });
     </script>