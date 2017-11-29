<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserIdImgLists" Codebehind="UserIdImgList.aspx.cs" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>

<!DOCTYPE html >
<html>
<head>
    <title></title>
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

</head>
<body>
    <form id="form1" runat="server">

    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="table1">


        <tr>
            <td>

            </td>
        </tr>


        <tr >
            <td bgcolor="#ffffff">
                <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                                <asp:Repeater ID="rptIamges" EnableViewState="false" runat="server" OnItemDataBound="rptUsersItemDataBound">
                                    <HeaderTemplate>
                            <tr height="30"  style="background: #e8eaee" >

                                <td>
                                    图片ID
                                </td>
                                <td>
                                    商户名
                                </td>
                                <td>
                                    商户签约属性
                                </td>
                                <td>
                                    描述
                                </td>
                                <td>
                                    内容
                                </td>
                                <td>
                                    状态
                                </td>
                                <td>
                                    操作
                                </td>

                            </tr>
                        </HeaderTemplate>
                                    <ItemTemplate>
                            <tr>

                                <td>
                                    <%# Eval("ID")%>
                                </td>
                                <td>

                                 <%#Eval("UserName")%>

                                </td>
                                <td>
                                    签约属性
                                </td>
                                <td>
                                    <%# Eval("ImageDesc")%>
                                </td>
                                <td>
                                  <%# Eval("ImageFile")%>
                                </td>
                                <td>
                                  <%# Eval("Status")%>
                                </td>

                                <td>
                                    <input type="button" value="通过" class="button btn btn-xs  btn-info" onclick="javascript:setting('<%#Eval("id")%>')" />
                                    <input type="button" value="不通过" class="button btn btn-xs  btn-info" onclick="javascript:setting('<%#Eval("id")%>')" />
                                </td>

                            </tr>
                        </ItemTemplate>

                                </asp:Repeater>
                            </table>
                        </td>
                    </tr>

                </table>
            </td>
         </tr>


</table>
</form>
</body>
</html>



<script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>