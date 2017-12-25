<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserAdd" Codebehind="UserAdd.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../style/union.css" type="text/css" rel="stylesheet" />
    <script src="../../js/common.js" type="text/javascript"></script>
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../style/admin/dist/css/AdminLTE.min.css">
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
          width: 35%;}
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
a:hover {height:470px;width: 527px;color:#E54202;cursor:hand;}
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
<script type="text/javascript">
    $().ready(function() {
    var usertype = $("input[name='rbluserType']:checked").val();       
        if (usertype == "3") {
            $("#ddlmemvip").show();
            $("#ddlpromvip").hide();
        }
        else if (usertype == "4") {
            $("#ddlpromvip").show();
            $("#ddlmemvip").hide();
        }
        $("input[name='rbluserType']").click(function() {
            var usertype = $(this).val();   
                 
            if (usertype == "3") {
                $("#ddlmemvip").show();
                $("#ddlpromvip").hide();
            }
            else if (usertype == "4") {
                $("#ddlpromvip").show();
                $("#ddlmemvip").hide();
            }
        });
    })     
function backreturn(){
    history.go(-1);
}
    </script>
</head>
<body>

    <form id="form1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>

                <td class="td2">
                    用户名</td>
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
                    签约属性</td>
                <td class="td1">
                <div class="input-group">
                    &nbsp;<asp:RadioButtonList ID="ClassID" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="true" Value="0">个人</asp:ListItem>
                        <asp:ListItem Value="1">企业</asp:ListItem>
                    </asp:RadioButtonList>
                   </div>
                </td>
                <td class="td2">
                    联系人</td>
                <td class="td1">
                    <asp:TextBox ID="ContactName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr style="display: <%=pwdDisplay%>">
                <td class="td2">
                    用户密码</td>
                <td class="td1">
                    <asp:TextBox ID="UserPwd"  runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="td2">
                    提现密码</td>
                <td class="td1">
                <asp:TextBox ID="UserPayPwd"  runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>



             <tr>
                            <td class="td2">
                                商户名</td>
                            <td class="td1">
                                <asp:TextBox ID="MerchantName" runat="server" Width="200px" ></asp:TextBox>
                            </td>
                            <td class="td2">
                                秘钥</td>
                            <td class="td1">
                                <asp:TextBox ID="ApiKey" runat="server" Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                <tr>
                            <td class="td2">
                                身份证</td>
                            <td class="td1">
                                <asp:TextBox ID="IDCard" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td class="td2">
                                实名认证</td>
                            <td class="td1">
                                 <div class="input-group">
                                                    &nbsp;<asp:RadioButtonList ID="IsRealName" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                        <asp:ListItem  Value="1">是</asp:ListItem>
                                                        <asp:ListItem Value="0" Selected="true">否</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                   </div>
                            </td>
                 </tr>
                <tr>
                                            <td class="td2">
                                                电话</td>
                                            <td class="td1">
                                            <asp:TextBox ID="Phone" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="td2">
                                                电话认证</td>
                                            <td class="td1">
                                            <div class="input-group">
                                                                                                &nbsp;<asp:RadioButtonList ID="IsPhone" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                                                    <asp:ListItem  Value="1">是</asp:ListItem>
                                                                                                    <asp:ListItem Value="0" Selected="true">否</asp:ListItem>
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
                                                                 邮箱认证</td>
                                                             <td class="td1">
<div class="input-group">
                                                                                                &nbsp;<asp:RadioButtonList ID="IsEmail" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                                                    <asp:ListItem  Value="1">是</asp:ListItem>
                                                                                                    <asp:ListItem Value="0" Selected="true">否</asp:ListItem>
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
                                注册时间</td>
                            <td class="td1">
                            <asp:TextBox ID="AddTime" runat="server" Width="200px"></asp:TextBox>
                            </td>
                 </tr>
                <tr>
               <td class="td2">
                                                结算方案</td>
                                            <td class="td1">

                                            <asp:DropDownList ID="WithdrawSchemeID" class="form-control" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"></asp:DropDownList>

                                            </td>
                                            <td class="td2">
                                                费率方案</td>
                                            <td class="td1">
                                <asp:DropDownList ID="PayRateID" class="form-control" runat="server"></asp:DropDownList>
                                            </td>
                                 </tr>


                                <tr>
                                            <td class="td2">
                                                管理员</td>
                                            <td class="td1">
                                            <asp:DropDownList ID="manageId" class="form-control" runat="server"></asp:DropDownList>
                                            </td>
                                            <td class="td2">
                                                网址</td>
                                            <td class="td1">
                                            <asp:TextBox ID="SiteUrl" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                 </tr>

                                <tr>
                                   <td class="td2">
                                    结算方式</td>
                                     <td class="td1">
 <div class="input-group">
                                             &nbsp;<asp:RadioButtonList ID="WithdrawType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                              <asp:ListItem  Value="0" Selected="true">前台</asp:ListItem>
                                              <asp:ListItem Value="1" >接口</asp:ListItem>
                                              <asp:ListItem Value="2" >前台+接口</asp:ListItem>
                                              </asp:RadioButtonList>
                                              </div>
                                     </td>
                                       <td class="td2">
                                        随机商品名称</td>
                                        <td class="td1">
                                   <asp:RadioButtonList ID="RandomProduct" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
													<asp:ListItem  Value="1">是</asp:ListItem>
													<asp:ListItem Value="0" Selected="true">否</asp:ListItem>
												</asp:RadioButtonList>
                                        </td>
                                 </tr>
                                 <tr>
                                 <td class="td2">
                                 企业联系人</td>
                                 <td class="td1">
<asp:TextBox ID="LinkMan" runat="server" Width="200px"></asp:TextBox>
                                 </td>
                                 <td class="td2">
                                  代理人</td>
                                  <td class="td1">

<asp:DropDownList ID="AgentID" runat="server" class="form-control" RepeatDirection="Horizontal" RepeatLayout="Flow"></asp:DropDownList>
                                  </td>
                                  </tr>
                                  <tr>
                                                                   <td class="td2">
                                                                   状态</td>
                                                                   <td class="td1">
<asp:DropDownList ID="Status" class="form-control" runat="server" Width="150px"></asp:DropDownList>
                                                                   </td>
                                                                   <td class="td2">
                                                                    备注</td>
                                                                    <td class="td1">
                        <asp:TextBox ID="LastLoginRemark" runat="server" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                    </tr>
            <tr>
                <td colspan="4" style="height: 20px">
                    <div align="center">
                        <asp:Button ID="btnAdd" runat="server" class="button btn  btn-danger" Text="提 交" OnClick="btnAdd_Click"></asp:Button>

                    </div>
                </td>
            </tr>
        </table>
        
    </form>
</body>
</html>
<link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/jedate-6.0.2/skin/jedate.css">
<script src="<%=ADMIN_URI%>/style/admin/bower_components/jquery/dist/jquery.min.js"></script>
<script src="<%=ADMIN_URI%>/style/admin/jedate-6.0.2/jquery.jedate.js"></script>
<script>
  $(function () {

     $("#AddTime").jeDate({

            format: "YYYY-MM-DD hh:mm:ss",

        });

  });
</script>