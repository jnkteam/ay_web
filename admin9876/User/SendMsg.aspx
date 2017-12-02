<%@ Page Language="C#" AutoEventWireup="True" ValidateRequest="false" Inherits="OriginalStudio.WebUI.Manage.User.SendMsg" Codebehind="SendMsg.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>内部消息</title>
    <base target="_self" />
    <script src="../style/admin/bower_components/jquery/dist/jquery.min.js"></script>

     <link rel="stylesheet" href="../style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
     <!-- Theme style -->
     <link rel="stylesheet" href="../style/admin/dist/css/AdminLTE.min.css">
     <!-- Font Awesome -->
     <link rel="stylesheet" href="../style/admin/bower_components/font-awesome/css/font-awesome.min.css">
     <!-- Ionicons -->
     <link rel="stylesheet" href="../style/admin/bower_components/Ionicons/css/ionicons.min.css">
     <style>
     table{ width: 100%;max-width: 100%;able-layout:fixed;border-collapse:collapse;border: 1px solid #f4f4f4; }
     input { border:1px solid #999;padding:3px;font:12px tahoma;ling-height:16px}
     select { border:1px solid #999;padding:3px;margin-left:10px;font:12px tahoma;ling-height:16px}
     td {height:30px; font-size:14px;vertical-align:middle !important;border: 1px solid #f4f4f4;padding: 10px;}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2">
        <tr>
           <td align="right" class="jfontItem" style="width: 125px">
                收信者：
            </td>
            <td align="left">
                <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="txtMsgTo" MaxLength="50" runat="server" Width="540px"></asp:TextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td align="right" class="jfontItem" style="width: 125px">
                消息标题：<asp:HiddenField ID="NewsID" Value="0" runat="server" />
            </td>
            <td align="left">
            <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="tb_title" MaxLength="50" runat="server" Width="540px"></asp:TextBox>
            </div>
            </td>
        </tr>
        <tr>
            <td align="right" class="jfontItem" style="width: 125px">
                消息内容：
            </td>
            <td align="left">
                <textarea id="myEditor"  onblur="moveVal()" rows="10" cols="60"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right" class="jfontItem" style="width: 125px; height: 40px;">
            </td>
            <td align="left" style="height: 40px">
            <div class="input-group">
                <asp:Button CssClass="button btn  btn-danger" ID="bt_sub" runat="server" Text=" 发 布 " OnClick="bt_sub_Click">
                </asp:Button>
            </div>
            </td>
        </tr>
        <tr>
            <td align="right" class="jfontItem" style="width: 125px; height: 40px;">
            </td>
            <td align="left" style="height: 40px">
                <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="content" runat="server" />
    </form>

    <!-- CK Editor -->
    <script src="<%=ADMIN_URI%>/style/admin/bower_components/ckeditor/ckeditor.js"></script>

    <script>
      $(function () {

        var editor = CKEDITOR.replace('myEditor');


        editor.on( 'change', function( event ) {
            var data = this.getData();//内容
            $("#hfcontent").val(data);
        });



      });

    </script>

</body>
</html>
