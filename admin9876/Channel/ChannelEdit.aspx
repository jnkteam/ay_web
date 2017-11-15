<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.ChannelEdit" Codebehind="ChannelEdit.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>新建编辑供应商</title>
    <link href="../style/admin.css" type="text/css" rel="stylesheet" />
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
function backreturn(){
    location.href='ChannelList.aspx';
}
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered table-hover dataTable">
                <tr>
                    <td class="td2">
                        通道代号 </td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox  class="form-control"  ID="txtcode" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        英文代码 </td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox  class="form-control"  ID="txtenmodeName" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        通道类别 </td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:DropDownList class="form-control" ID="ddlType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                        </asp:DropDownList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        通道类别供应商 </td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:DropDownList class="form-control" ID="ddlTypeSupp" runat="server">
                        </asp:DropDownList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        供应商 </td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:DropDownList class="form-control" ID="ddlSupp" runat="server">
                        </asp:DropDownList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        通道名称 </td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox  class="form-control"  ID="txtmodeName" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        面值 </td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox  class="form-control"  ID="txtfaceValue" runat="server" Width="200px" Text="0"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        类别开启状态 </td>
                    <td class="td1">
                    <div class="input-group">
                         <asp:RadioButtonList ID="rblTypeOpen" runat="server" RepeatDirection="horizontal">                                        
                                <asp:ListItem Value="2" Selected="true">全部开启</asp:ListItem>
                                <asp:ListItem Value="1">全部关闭</asp:ListItem>
                                <asp:ListItem Value="8" Selected="true">按配置(默认开启)</asp:ListItem>
                                <asp:ListItem Value="4">按配置(默认关闭)</asp:ListItem>
                         </asp:RadioButtonList>
                         </div>
                    </td>
                    
                </tr>  
                <tr>
                    <td class="td2">
                        是否开启 </td>
                    <td class="td1">
                    <div class="input-group">
                         <asp:RadioButtonList ID="rblOpen" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Value="-1" Selected="true">默认</asp:ListItem>
                                <asp:ListItem Value="1">开启</asp:ListItem>
                                <asp:ListItem Value="0">关闭</asp:ListItem>
                         </asp:RadioButtonList>
                         </div>
                    </td>
                    
                </tr>               
                <tr>
                    <td class="td2">
                        排序 </td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox  class="form-control"  ID="txtsort" runat="server" Width="200px" Text="0"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">

                    </td>
                    <td class="td1">

                     <asp:Button ID="btnSave" runat="server" CssClass="button btn-xs  btn-danger" Text="保 存" OnClick="btnSave_Click"></asp:Button>

                        <input type="button"  Class="button btn-xs  btn-danger" value="返 回" onclick="backreturn()" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
