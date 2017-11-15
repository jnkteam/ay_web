<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.User.UserImageCheck" Codebehind="UserImageCheck.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../style/admin/dist/css/AdminLTE.min.css">

    <script src="../../js/common.js" type="text/javascript"></script>
    <style type="text/css">
table { FONT-WEIGHT:normal;line-height:170%;FONT-FAMILY:Arial}
A:link {COLOR:#237C04;TEXT-DECORATION: none}
td {    padding: 8px;
            line-height: 1.42857143;

            border-top: 1px solid #ddd;
            font-size: 14px;
            overflow: hidden;
            word-break: break-all;
            word-wrap: break-word;  }
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {    padding：5px;
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
input {
           padding: 6px 12px;
           font-size: 14px;
           line-height: 1.42857143;
           color: #555;
           background-image: none;
           border: 1px solid #ccc;
           }
select { border:1px solid #999;padding:3px;margin-left:10px;font:12px tahoma;ling-height:16px}
#nav LI A.noncurrent {/*border:#DC171E 3px solid;*/}
#nav UL {PADDING-BOTTOM: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 0px}
#nav LI {DISPLAY: inline; padding-left:10px;}
#nav LI a:hover {border:#B6E000 1px solid;}
#nav li A:visited {border:#ff0000 1px solid;}
img{border:#CCCCCC 1px solid;}

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
             alert(usertype);         
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
    function backreturn() {
        window.close();
}
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td class="td2">
                    用户名ID</td>
                <td class="td1">
                    <asp:Label ID="lblid" runat="server" Width="160px" CssClass="lable"></asp:Label>
                </td>
                <td class="td2">
                    用户名</td>
                <td class="td1">
                    <asp:TextBox ID="txtuserName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>      
            <tr>
                <td class="td2">
                    真实姓名</td>
                <td class="td1">
                   <asp:TextBox ID="txtRealName" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="td2">
                    证件号码</td>
                <td class="td1">
                    <asp:TextBox ID="txtidCard" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    证件正面</td>
                <td class="td1">
                <a href="idimg.aspx?id=<%=ItemInfoId%>&show=on" target="_blank"><img id="img1" src="idimg.aspx?id=<%=ItemInfoId%>&show=on"
                                            style="border: 0" width="349px" height="211px" /></a>
                </td>
                <td class="td2">
                    证件反面</td>
                <td class="td1">
                    <a href="idimg.aspx?id=<%=ItemInfoId%>&show=down" target="_blank"><img id="img2" src="idimg.aspx?id=<%=ItemInfoId%>&show=down"
                                            style="border: 0" width="349px" height="211px"/></a>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    原因</td>
                <td class="td1" colspan="4">
                   <asp:TextBox ID="txtWhy" runat="server" Width="80%"></asp:TextBox>
                </td>               
            </tr>
            <tr>
                <td colspan="4" style="height: 20px">
                    <div align="center">
                        <div class="input-group">
                        <asp:Button ID="btnOK" CssClass="button btn  btn-danger" runat="server" Text="审核通过" onclick="btnOK_Click"></asp:Button>&nbsp;
                        <asp:Button ID="btnFail" CssClass="button btn  btn-danger" runat="server" Text="审核失败" onclick="btnFail_Click"></asp:Button>
                        </div>

                    </div>
                </td>
            </tr>
        </table>
        
    </form>
</body>
</html>
