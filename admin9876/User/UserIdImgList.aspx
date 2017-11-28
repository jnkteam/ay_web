<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserIdImgLists" Codebehind="UserIdImgList.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
                                    <input id="chkAll" type="checkbox">
                                </td>
                                <td>
                                    商户ID
                                </td>
                                <td>
                                    用户名
                                </td>
                                <td>
                                    真实名
                                </td>
                                <td>
                                    证件号码
                                </td>
                                <td>
                                    提交时间
                                </td>
                                <td>
                                    正面
                                </td>
                                <td>
                                    反面
                                </td>
                                <td>
                                    审核状态
                                </td>
                                <td>
                                    审核时间
                                </td>
                                <td>
                                    说 明
                                </td>
                                <td>
                                    审核人
                                </td>
                                <td>
                                    审 核
                                </td>
                            </tr>
                        </HeaderTemplate>
                                    <ItemTemplate>
                            <tr ondblclick="javascript:sendInfo('<%# Eval("id")%>')">
                                <td>
                                    <input id="chkItem" type="checkbox" value='<%#Eval("id")%>' name="chkItem" />
                                </td>
                                <td>
                                    <%# Eval("userId")%>
                                </td>
                                <td>
                                     <a href="javascript:showInfo('<%# Eval("ID")%>')">
                                         <strong>
                                         <%#Eval("UserName")%>
                                         </strong>
                                     </a>
                                </td>
                                <td>
                                    <%# Eval("payeeName")%>
                                </td>
                                <td>
                                    <%# Eval("IdCard")%>
                                </td>
                                <td>
                                    <%# Eval("addtime","{0:yyyy-MM-dd HH:ss:mm}")%>
                                </td>
                                <td>
                                    <a href="idimg.aspx?id=<%#Eval("id")%>&show=on" target="_blank">
                                        <img id="img1" src="idimg.aspx?id=<%#Eval("id")%>&show=on" width="180px" height="120px"
                                            style="border: 0" /></a>
                                </td>
                                <td>
                                    <a href="idimg.aspx?id=<%#Eval("id")%>&show=down" target="_blank">
                                        <img id="img2" src="idimg.aspx?id=<%#Eval("id")%>&show=down" width="180" height="120px"
                                            style="border: 0" /></a>
                                </td>
                                <td>
                                    <%# Eval("status")%>
                                </td>
                                <td>
                                    <%# Eval("checktime","{0:yyyy-MM-dd HH:ss:mm}")%>
                                </td>
                                <td>
                                    <%# Eval("why")%>
                                </td>
                                <td>
                                    <%# Eval("admin")%>
                                </td>
                                <td>
                                    <asp:Label ID="labagcmd" runat="server"></asp:Label>
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
    <script type="text/javascript">

$(function () {

   $("#StimeBox").jeDate({

          format: "YYYY-MM-DD hh:mm:ss",

      });
   $("#EtimeBox").jeDate({

               format: "YYYY-MM-DD hh:mm:ss",
           });
});



        function handler(tp) {
        }

        var mytr = document.getElementById("tab").getElementsByTagName("tr");
        for (var i = 1; i < mytr.length; i++) {
            mytr[i].onmouseover = function() {
                var rows = this.childNodes.length;
                for (var row = 0; row < rows; row++) {
                    this.childNodes[row].style.backgroundColor = '#E6EEFF';
                }
            };
            mytr[i].onmouseout = function() {
                var rows = this.childNodes.length;
                for (var row = 0; row < rows; row++) {
                    this.childNodes[row].style.backgroundColor = '';
                }
            };
        }

        $().ready(function() {
            $("#chkAll").click(function() {
                $("input[type='checkbox']").each(function() {
                    if ($("#chkAll").attr('checked') == true) {
                        $(this).attr("checked", true);
                    }
                    else
                        $(this).attr("checked", false);
                });
            });
        });


function showInfo(id) {
//    window.open("../User/UserEdit.aspx?id=" + id, "查看用户信息", "Width=800px;Height=350px;");
     layer.ready(function(){
          //自定页
          layer.open({
              type: 2,
              title: '用户信息',
              skin: 'layui-layer-rim', //加上边框
              //closeBtn: 0, //不显示关闭按钮
              area: ['67%', '90%'], //宽高
              content:" ../User/UserEdit.aspx?id=" + id,
          });
      });
}

</script>
