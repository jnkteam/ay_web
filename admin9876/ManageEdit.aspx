<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.ManageEdit" Codebehind="ManageEdit.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>无标题页</title>
    <!-- Bootstrap 3.3.7 -->
           <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
           <!-- Theme style -->
           <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/dist/css/AdminLTE.min.css">
        <style type="text/css">
    table
              {
                  width: 100%;
                  max-width: 100%;

                  border: 1px solid #f4f4f4;
                  able-layout:fixed;
              }
              .table td{
                  padding: 8px;
                  line-height: 1.92857143 !important;
                  vertical-align: top;
                  border-top: 1px solid #ddd;
                  font-size:14px;
                  overflow: hidden;

                  word-break: break-all; word-wrap:break-word;
              }
     A:link {COLOR:#237C04;TEXT-DECORATION: none}
     td {height:20px; line-height:20px; font-size:12px;padding:0px; vertical-align:middle !important;}
     .td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
     .td1 {padding-right:3px;padding-left:3px;color:#999999;padding-bottom:0px;padding-top:5px;height:25px;}
     .td2 {padding-right:3px;padding-left:8px;padding-top:5px; color: #333;background: #e8eaee;font-size:12px;text-align:right;}
    .td3 {padding:1px 1px 0 0px;color:#083772;background:#EFF3FB;font-size:12px;text-align:center;}
    .moban {padding-top:0px;border:0px}
    input { border:1px solid #999;padding:3px;margin-left:10px;font:12px tahoma;ling-height:16px}
    select { border:1px solid #999;padding:3px;margin-left:10px;font:12px tahoma;ling-height:16px}
    .input4 {border:1px solid #999;padding:3px;margin-left:10px;font:11px tahoma;ling-height:16px;height:45px;}

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
    padding:12px 15px 15px 15px;
    }

    #rblTypeOpen{border:0 !important;}
    #rblOpen{border:0 !important;}
    #rblTypeOpen td{border:0 !important;}
    #rblOpen td{border:0 !important;}

    </style>

    <script type="text/javascript">
        $().ready(function() {
            var isUpdate = $("input[name='hf_isupdate']").val();
            if (isUpdate == "0") {
                $("#tr_lastloginip").hide();
                $("#tr_lastlogintime").hide();
                $("#tr_balance").hide();
            }
            else if (isUpdate == "1") {                
                $("#tr_lastloginip").show();
                $("#tr_lastlogintime").show();
                $("#tr_balance").show();
            }
        })     
function backreturn(){
    history.go(-1);
}
    </script>

</head>
<body>    
    <form id="form1" runat="server">
    <asp:HiddenField ID="hf_isupdate" runat="server" Value="0" />

    <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered table-hover dataTable">
        <tr>
            <td class="td2">
                用户名
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox class="form-control"  ID="txtusername" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                密码
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox class="form-control"  ID="txtpassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>（不修改请留空）</div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                二级密码 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox class="form-control"  ID="txtsecondpwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>（不修改请留空）</div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                属性
            </td>
            <td class="td1">
                <asp:CheckBox ID="ckb_SuperAdmin" runat="server" Text="超级管理员" />
                <asp:CheckBox ID="ckb_Agent" runat="server" Text="代理" Visible="false" />
            </td>
        </tr>        
        <tr>
            <td class="td2">
                权限 
            </td>
            <td class="td1" style="width:80%">
                <asp:CheckBoxList ID="cbl_roles" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                </asp:CheckBoxList>
            </td>
        </tr>

            <tr>
            <td class="td2">
                角色
            </td>
            <td class="td1" style="width:80%">
                 <asp:DropDownList class="form-control" ID="roles" runat="server">
                                                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td class="td2">
                状态 
            </td>
            <td class="td1">
             <div class="input-group">
                <asp:DropDownList class="form-control" ID="ddlStus" runat="server">
                    <asp:ListItem Value="1">正常</asp:ListItem>
                    <asp:ListItem Value="0">锁定</asp:ListItem>
                </asp:DropDownList>
                </div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                姓名 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox class="form-control"  ID="txtrelname" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                QQ 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox class="form-control"  ID="qq" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                电话 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox class="form-control"  ID="tel" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr id="tr_lastloginip" style="display: none">
            <td class="td2">
                最近登录IP 
            </td>
            <td class="td1">
                <asp:Label ID="lbllastloginip" runat="server" CssClass="lable" Width="160px" ></asp:Label>
            </td>
        </tr>
        <tr id="tr_lastlogintime" style="display: none">
            <td class="td2">
                最近登录时间 
            </td>
            <td class="td1">
                <asp:Label ID="lbllastlogintime" runat="server" CssClass="lable" Width="160px" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="td2">
                提成类型 
            </td>
            <td class="td1">
             <div class="input-group">
                <asp:DropDownList class="form-control" ID="ddlCommissionType" runat="server">
                    <asp:ListItem Value="1">按条固定提成</asp:ListItem>
                    <asp:ListItem Selected="True" Value="2">按支付金额%</asp:ListItem>
                </asp:DropDownList>
                </div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                网银提成 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox class="form-control"  ID="txtCommission" runat="server">0</asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                卡类提成 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox class="form-control"  ID="txtCardCommission" runat="server">0</asp:TextBox></div>
            </td>
        </tr>
        <tr id="tr_balance" style="display: none">
            <td class="td2">
                账号余额 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox class="form-control"  ID="lblbalance" runat="server" Enabled="false">0</asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 20px">
                <div align="center">
                    <asp:Button ID="btnAdd" Class="button btn  btn-danger"  runat="server" Text="提 交" OnClick="btnAdd_Click"></asp:Button>

                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
