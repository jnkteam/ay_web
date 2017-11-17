<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.SupplierPayrate" Codebehind="SupplierPayrate.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>供应商费率</title>
     <link href="../style/admin.css" type="text/css" rel="stylesheet" />
     <link href="../style/page.css" type="text/css" rel="stylesheet" />
 <!-- Bootstrap 3.3.7 -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
   <!-- Theme style -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/dist/css/AdminLTE.min.css">
    <script src="../../js/common.js" type="text/javascript"></script>
    <script type="text/javascript">
     $().ready(function(){
        var sup = $("#hfsupplierid").val();
        switch(sup){
           
            default:
            $(".bank").show();
            $(".card").show();
            break;
        }
     });
function backreturn(){
    location.href='SupplierList.aspx';
}
    </script>
   <style type="text/css">
   table
            {
                width: 100%;
                max-width: 100%;
                margin-bottom: 20px;
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


td {height:20px; line-height:20px; font-size:12px;padding:0px; vertical-align:middle !important;}
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {padding-right:3px;padding-left:3px;color:#999999;padding-bottom:0px;padding-top:5px;height:25px;}
.td2 {padding-right:3px;padding-left:8px;padding-top:5px; color: #333;background: #e8eaee;font-size:12px;text-align:right;}

</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfsupplierid" runat="server" />
            <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered table-hover dataTable">
                <tr >
                    <td class="td2">
                        名称 </td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr class="bank" style="display:none">
                    <td class="td2">
                        网上银行</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp102" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>				
                <tr class="alipay" >
                    <td class="td2">
                        支付宝</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp101" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>							
                <tr class="card" style="display:none">
                    <td class="td2">
                        支付宝APP</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp980" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        微信</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp99" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>				
                <tr class="card" style="display:none">
                    <td class="td2">
                        微信APP</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp990" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" >
                    <td class="td2">
                        QQ钱包 </td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp209" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>	
                <tr class="card" style="display:none">
                    <td class="td2">
						QQ钱包App</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp210" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        京东</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp300" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>					
                <tr class="card" style="display:none">
                    <td class="td2">
                        网银APP</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp1020" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="tenpay" style="display:none">
                    <td class="td2">
                        财付通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp100" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>			
                <tr class="card" style="display:none">
                    <td class="td2">
                        神州行充值卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp103" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" >
                    <td class="td2">
                        神州行浙江卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp200" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                  <tr class="card" >
                    <td class="td2">
                        神州行江苏卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp201" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                  <tr class="card" >
                    <td class="td2">
                        神州行辽宁卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp202" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                  <tr class="card" >
                    <td class="td2">
                        神州行福建卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp203" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        盛大一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp104" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        征途支付卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp105" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        骏网一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp106" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        腾讯Q币卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp107" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        联通充值卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp108" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        久游一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp109" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        网易一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp110" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        完美一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp111" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        搜狐一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp112" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        电信充值卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp113" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        声讯卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp114" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        光宇一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp115" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        金山一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp116" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        纵游一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp117" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        天下一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp118" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        天宏一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp119" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                 <tr class="card" >
                    <td class="td2">
                        魔兽卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp204" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" >
                    <td class="td2">
                        联华卡</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp205" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" >
                    <td class="td2">
                        殴飞一卡通</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp208" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr class="card" style="display:none">
                    <td class="td2">
                        支付宝(不用)</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtp98" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>					
                <tr>
                    <td colspan="2" style="text-align: center; height: 30px;">
                        <asp:Button ID="btnSave" CssClass="button btn-xs  btn-danger" runat="server" Text="保 存" OnClick="btnSave_Click"></asp:Button>
                        <input type="button" Class="button btn-xs  btn-danger" value="返 回"  />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
