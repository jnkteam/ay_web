<%@ Page Language="C#" AutoEventWireup="True"
    Inherits="OriginalStudio.WebUI.Manage.TocashSchemeModi" Codebehind="TocashSchemeModi.aspx.cs" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>

   <!-- Bootstrap 3.3.7 -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
   <!-- Theme style -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/dist/css/AdminLTE.min.css">

    <style type="text/css">
        table
         {
             width: 100%;
             max-width: 100%;


             able-layout:fixed;
         }
         .table td{
             padding: 8px;
             line-height: 1.92857143 !important;
             vertical-align: top;

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
#txtdesc{width: 193px !important;
           margin-left: 11px;}
.form-control{width: 317px !important}
#Active{border:0 !important;}
#IsDebug{border:0 !important;}
#Active td{border:0 !important;}
#IsDebug td{border:0 !important;}
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
        function backreturn() {
            history.go(-1);
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">

    <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered table-hover dataTable">
        <tr>
            <td class="td2">
                方案名称 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtschemename" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                网银T+几 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtbankdetentiondays" runat="server" Width="200px">0</asp:TextBox></div>
            </td>
        </tr>

        <tr>
            <td class="td2">
                支付宝T+几 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtalipaydetentiondays" runat="server" Width="200px">0</asp:TextBox></div>
            </td>
        </tr>
         <tr>
            <td class="td2">
                微信T+几 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtweixindetentiondays" runat="server" Width="200px">0</asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                其它T+几 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtotherdetentiondays" runat="server" Width="200px">0</asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                最低提现金额限制(每笔) 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtminamtlimitofeach" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                最大提现金额限制(每笔) 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtmaxamtlimitofeach" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                每天最多可提现次数 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtdailymaxtimes" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                每天最多提现 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtdailymaxamt" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                提现手续费 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtchargerate" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                提现手续费最少每笔 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtchargeleastofeach" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                提现手续费最高每笔 
            </td>
            <td class="td1">
                <div class="input-group"><asp:TextBox  required class="form-control"  ID="txtchargemostofeach" runat="server" Width="200px"></asp:TextBox></div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                是否走接口 
            </td>
            <td class="td1">
            <div class="input-group">
                <asp:RadioButtonList ID="rblVaiInterface" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                <asp:ListItem Value="1" >是</asp:ListItem>                
                </asp:RadioButtonList>
                </div>
            </td>
        </tr>

        <tr>
                    <td class="td2">
                        结算通道
                    </td>
                    <td class="td1">
                    <div class="input-group">
                         <asp:DropDownList class="form-control" ID="SupplierDrop" runat="server" > </asp:DropDownList>
                        </div>
                    </td>
                </tr>


       <tr>
            <td class="td2">
                是否要审核
            </td>
            <td class="td1">
            <div class="input-group">
                <asp:RadioButtonList ID="rbltranRequiredAudit" runat="server" 
                    RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                <asp:ListItem Value="0" >否</asp:ListItem>
                </asp:RadioButtonList>
                </div>
            </td>
        </tr>
        <tr>
            <td class="td2">
                是否默认 
            </td>
            <td class="td1">
             <div class="input-group">
                <asp:RadioButtonList ID="rblisdefault" runat="server" 
                    RepeatDirection="Horizontal">
                <asp:ListItem Value="1">是</asp:ListItem>
                <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                </asp:RadioButtonList>
                </div>
            </td>
        </tr>
        <tr>
            <td class="td2">

            </td>
            <td class="td1">
                 <asp:Button ID="btnAdd" runat="server" CssClass="button btn  btn-danger" Text="提 交" OnClick="btnAdd_Click"></asp:Button>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
