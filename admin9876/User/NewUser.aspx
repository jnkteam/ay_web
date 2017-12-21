<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserAdd" Codebehind="UserAdd.aspx.cs" %>

<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>

<style type="text/css">
table { FONT-WEIGHT:normal;line-height:170%;FONT-FAMILY:Arial}
A:link {COLOR:#237C04;TEXT-DECORATION: none;}
td {    padding: 8px;
        line-height: 1.42857143;

        border-top: 1px solid #ddd;
        font-size: 14px;
        overflow: hidden;
        word-break: break-all;
        word-wrap: break-word; }
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {    padding5px;
          color: #3e3e3e;
          width: 35%;
          text-align: left;
          }
.td2 {padding-right: 10px;
          padding-left: 8px;
          padding-top: 8px;
          color: #333;
          font-size: 14px;
          font-weight: 400;
          background: #e8eaee;
          text-align: right;
          width: 15%;}
.td3 {padding:1px 1px 0 0px;color:#083772;background:#EFF3FB;font-size:12px;text-align:center;}
.moban {padding-top:0px;border:0px}
input {
           padding: 6px 12px;
           font-size: 14px;
           line-height: 1.42857143;
           color: #555;
           background-color: #fff;
           background-image: none;
           border: 1px solid #ccc;
           }
label{font-weight: 400; margin-right: 10px;}
.lable { border:1px solid #999;padding:3px;font:12px tahoma;ling-height:16px;}
select { border:1px solid #999;padding:3px;margin-left:3px;font:12px tahoma;ling-height:16px}
.input4 {border:1px solid #999;padding:3px;margin-left:10px;font:11px tahoma;ling-height:16px;height:45px;}
.button {color: #135294; border:1px solid #666; height:21px; line-height:21px;}
.nrml{background-color:#eeeeee;font-weight: bold;}
.radio { border:none; }
.checkbox { border:none; }
.addnew {font-size: 12px;color: #FF0000;}
a.servername{height:470px;width: 527px;color:#E54202;cursor:hand;}
.current {border:#ff6600 1px solid;}

#nav LI A.noncurrent {/*border:#DC171E 3px solid;*/}
#nav UL {PADDING-BOTTOM: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 0px}
#nav LI {DISPLAY: inline; padding-left:10px;}
#nav LI a:hover {border:#B6E000 1px solid;}
#nav li A:visited {border:#ff0000 1px solid;}
img{border:#CCCCCC 1px solid;padding:0 5px}
#tplPreview {
position: absolute;
top:0px;
left:0px;
background:#ffffff;
border:1px solid #333;
font-size:12px;
color:#4B4B4B;
padding:12px 15px 15px 15px;}
.form-group input{
width: 13px;
height: 13px;
color:#0e76a8;
position:relative;
top:2px;
}
.td1 input{
position: relative;
top:2px;
}
.rbl-asp td{
border: none;
}
.btn-danger{
height: 40px;
color: #fff;
border: none;
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
        �����̻�
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">


     <form id="form1" runat="server">
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>

                    <td class="td2">
                        �û���</td>
                    <td class="td1">
                        <asp:TextBox ID="UserName" required runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td class="td2">
                    </td>
                    <td class="td1">

                    </td>
                </tr>
                 <tr>
                    <td class="td2">
                        ǩԼ����</td>
                    <td class="td1">
                    <div class="input-group">
                        &nbsp;<asp:RadioButtonList ID="ClassID" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Selected="true" Value="0">����</asp:ListItem>
                            <asp:ListItem Value="1">��ҵ</asp:ListItem>
                        </asp:RadioButtonList>
                       </div>
                    </td>
                    <td class="td2">
                        ��ϵ��</td>
                    <td class="td1">
                        <asp:TextBox ID="ContactName" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        �û�����</td>
                    <td class="td1">
                        <asp:TextBox ID="UserPwd" required runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="td2">
                        ��������</td>
                    <td class="td1">
                    <asp:TextBox ID="UserPayPwd" required runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>



                 <tr>
                                <td class="td2">
                                    �̻���</td>
                                <td class="td1">
                                    <asp:TextBox ID="MerchantName" runat="server" Width="200px" ></asp:TextBox>
                                </td>
                                <td class="td2">
                                    ��Կ</td>
                                <td class="td1">
                                    <asp:TextBox ID="ApiKey" runat="server" Width="200px" ></asp:TextBox>
                                </td>
                            </tr>
                    <tr>
                                <td class="td2">
                                    ���֤</td>
                                <td class="td1">
                                    <asp:TextBox ID="IDCard" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td class="td2">
                                    �Ƿ���֤</td>
                                <td class="td1">
                                     <div class="input-group">
                                                        &nbsp;<asp:RadioButtonList ID="IsRealName" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                            <asp:ListItem  Value="1">��</asp:ListItem>
                                                            <asp:ListItem Value="0" Selected="true">��</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                       </div>
                                </td>
                     </tr>
                    <tr>
                                                <td class="td2">
                                                    �绰</td>
                                                <td class="td1">
                                                <asp:TextBox ID="Phone" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                                <td class="td2">
                                                    �Ƿ���֤</td>
                                                <td class="td1">
                                                <div class="input-group">
                                                                                                    &nbsp;<asp:RadioButtonList ID="IsPhone" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                                                        <asp:ListItem  Value="1">��</asp:ListItem>
                                                                                                        <asp:ListItem Value="0" Selected="true">��</asp:ListItem>
                                                                                                    </asp:RadioButtonList>
                                                                                                   </div>
                                                </td>
                                     </tr>

                                     <tr>
                                       <td class="td2">Email</td>
                                                                 <td class="td1">
                                                                 <asp:TextBox ID="EMail" runat="server" Width="200px"></asp:TextBox>
                                                                 </td>
                                                                 <td class="td2">
                                                                     �Ƿ���֤</td>
                                                                 <td class="td1">
    <div class="input-group">
                                                                                                    &nbsp;<asp:RadioButtonList ID="IsEmail" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                                                        <asp:ListItem  Value="1">��</asp:ListItem>
                                                                                                        <asp:ListItem Value="0" Selected="true">��</asp:ListItem>
                                                                                                    </asp:RadioButtonList>
                                                                                                   </div>
                                                                 </td>
                                                      </tr>



                        <tr>
                                <td class="td2">
                                    QQ</td>
                                <td class="td1">
                                     <asp:TextBox ID="QQ" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td class="td2">
                                    ע��ʱ��</td>
                                <td class="td1">
                                <asp:TextBox ID="AddTime" runat="server" Width="200px"></asp:TextBox>



                                </td>
                     </tr>



                    <tr>
                   <td class="td2">
                                                    ���㷽��</td>
                                                <td class="td1">

                                                <asp:DropDownList ID="WithdrawSchemeID" class="form-control" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"></asp:DropDownList>

                                                </td>
                                                <td class="td2">
                                                    ���ʷ���</td>
                                                <td class="td1">
                                    <asp:DropDownList ID="PayRateID" class="form-control" runat="server"></asp:DropDownList>
                                                </td>
                                     </tr>


                                    <tr>
                                                <td class="td2">
                                                    ����Ա</td>
                                                <td class="td1">
                                                <asp:DropDownList ID="manageId" class="form-control" runat="server"></asp:DropDownList>
                                                </td>
                                                <td class="td2">
                                                    ��ַ</td>
                                                <td class="td1">
                                                <asp:TextBox ID="SiteUrl" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                     </tr>

                                    <tr>
                                       <td class="td2">
                                        ���㷽ʽ</td>
                                         <td class="td1">
     <div class="input-group">
                                                 &nbsp;<asp:RadioButtonList ID="WithdrawType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                  <asp:ListItem  Value="0" Selected="true">ǰ̨</asp:ListItem>
                                                  <asp:ListItem Value="1" >�ӿ�</asp:ListItem>
                                                  <asp:ListItem Value="2" >ǰ̨+�ӿ�</asp:ListItem>
                                                  </asp:RadioButtonList>
                                                  </div>
                                         </td>
                                           <td class="td2">
                                            �����Ʒ����</td>
                                            <td class="td1">
                                        <asp:TextBox ID="RandomProduct" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                     </tr>
                                     <tr>
                                     <td class="td2">
                                     ��ҵ��ϵ��</td>
                                     <td class="td1">
    <asp:TextBox ID="LinkMan" runat="server" Width="200px"></asp:TextBox>
                                     </td>
                                     <td class="td2">
                                      ������</td>
                                      <td class="td1">

    <asp:DropDownList ID="AgentID" runat="server" class="form-control" RepeatDirection="Horizontal" RepeatLayout="Flow"></asp:DropDownList>
                                      </td>
                                      </tr>
                                      <tr>
                                                                       <td class="td2">
                                                                       ״̬</td>
                                                                       <td class="td1">
    <asp:DropDownList ID="Status" class="form-control" runat="server" Width="150px"></asp:DropDownList>
                                                                       </td>
                                                                       <td class="td2">
                                                                        ��ע</td>
                                                                        <td class="td1">
                            <asp:TextBox ID="LastLoginRemark" runat="server" Width="200px"></asp:TextBox>
                                                                        </td>
                                                                        </tr>















                <tr>
                    <td colspan="4" style="height: 20px">
                        <div align="center">
                            <asp:Button ID="btnAdd" runat="server" class="button btn  btn-danger" Text="�� ��" OnClick="btnAdd_Click"></asp:Button>

                        </div>
                    </td>
                </tr>
            </table>

        </form>




    </section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>
