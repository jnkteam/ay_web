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
         登录日志
         <small>第三方支付平台</small>
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
                        <asp:ListItem Value="">搜索条件</asp:ListItem>
                        <asp:ListItem Value="UserName">用户名</asp:ListItem>
                        <asp:ListItem Value="UserId">用户ID</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    <div class="input-group">
                    <asp:TextBox ID="KeyWordBox" class="form-control" runat="server" EnableViewState="false"></asp:TextBox>
                    </div>

                   <div class="input-group date">
                                                <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;开始</div>
                                                   <asp:TextBox ID="StimeBox"  class="form-control"  runat="server" Width="65px"></asp:TextBox>
                                               </div>

                                                <div class="input-group date">
                                                  <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;截止</div>
                                               <asp:TextBox ID="EtimeBox" runat="server" class="form-control" Width="65px"></asp:TextBox>
                                               </div>
                    <div class="input-group">
                    <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger"  Text=" 查 询 " OnClick="btnSearch_Click">

                    </asp:Button>
                    </div>
                     <div class="input-group">
                    <asp:Button ID="btnDel" runat="server" CssClass="button btn  btn-danger" Text="删 除" onclick="btnDel_Click" />
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
                                        商户ID</td>
                                    <td>
                                        用户名</td>
                                    <td>
                                        姓名</td>
                                    <td>
                                        登录时间</td>
                                    <td>
                                        登录IP</td>
                                    <td>
                                        登录地点</td>
                                    <td>
                                        备注</td>
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