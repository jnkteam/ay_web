<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserChannel" Codebehind="UserChannel.aspx.cs" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../style/admin/dist/css/AdminLTE.min.css">
     <!-- Font Awesome -->
      <link rel="stylesheet" href="..//style/admin/bower_components/font-awesome/css/font-awesome.min.css">
      <!-- Ionicons -->
      <link rel="stylesheet" href="../style/admin/bower_components/Ionicons/css/ionicons.min.css">
    <style type="text/css">
    table { FONT-WEIGHT:normal;line-height:170%;FONT-FAMILY:Arial}
    A:link {COLOR:#237C04;TEXT-DECORATION: none;}
    td {    padding: 8px;
            line-height: 1.42857143;
            text-align: center;
            border-top: 1px solid #ddd;
            font-size: 14px;
            overflow: hidden;
            word-break: break-all;
            word-wrap: break-word; }
    .td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
    .td1 {    padding:5px;
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
    .button {color: #fff; border:1px solid #666; height:21px; line-height:21px;}
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
    img{padding:0 5px}
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
    .input-group{
        position: relative;
        display: table;
        border-collapse: separate;
            float: left;
            margin: 2px;
    }
    .btn-danger{
    height: 40px;
    color: #fff;
    border: none;
    }
    .btn[disabled] {background: #c3c3c3}
    </style>

    <script src="../../js/common.js" type="text/javascript"></script>

    <script type="text/javascript">
    $().ready(function(){
         $("#chkAll").click(function(){
            $("input[type='checkbox']").each(function(){
               if ($("#chkAll").attr('checked') == true){
                   $(this).attr("checked", true);
               }
               else
                   $(this).attr("checked", false);
            });
        });
    })
    </script>

</head>
<body class="yui-skin-sam">
    <form id="form1" runat="server">
        <div id="modelPanel" style="background-color: #F2F2F2">
        </div>
        <input id="selectedUsers" runat="server" type="hidden" />
        <table width="100%" border="0" cellspacing="1" cellpadding="1" class="table1">
            <tr>
                <td align="left" style="text-align: left !important;">
                    <asp:Button ID="btnAllOpen" class="button btn  btn-danger" runat="server" Text="全部开启" OnClick="btnAllOpen_Click"/>  <asp:Button class="button btn  btn-danger" ID="btnAllColse" runat="server" Text="全部关闭" OnClick="btnAllColse_Click"/>
                    <asp:Button ID="btnReSet" class="button btn  btn-danger" runat="server" Text="恢复默认" onclick="btnReSet_Click"/>

                                            <asp:Button ID="btnSave" class="button btn  btn-danger" runat="server" Text="保存设置"
                        onclick="btnSave_Click" />
                    </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left !important;">
                    <asp:Label ID="lblInfo" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table width="100%"  border="0" align="center" cellpadding="2" cellspacing="1">
                        <asp:Repeater ID="rpt_paymode" runat="server"
                            onitemdatabound="rpt_paymode_ItemDataBound"
                            onitemcommand="rpt_paymode_ItemCommand">
                                <HeaderTemplate>
                                    <table id="tab" width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                                        <tr style="background-color: #F2F2F2">
                                            <td width="101" height="25">
                                                通道编码</td>
                                            <td width="156">
                                                通道名称</td>
                                            <td width="172">
                                                提成比例</td>
                                            <td width="152">
                                                通道状态</td>
                                            <td width="144">
                                                用户设置</td>
                                            <td width="144">
                                                启用状态</td>
                                            <td width="144">
                                                通道商</td>
                                            <td width="149">
                                                操作</td>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%#Eval("typeId")%><asp:HiddenField ID="hftypeId" runat="server" Value='<%#Eval("typeId")%>' />
                                        </td>
                                        <td>
                                            <%#Eval("typename")%></td>
                                        <td>
                                            <%#Eval("payrate","{0:0.00}")%>%</td>
                                        <td>
                                            <%#Eval("type_status")%>
                                        </td>
                                        <td>
                                            <%#Eval("user_setting")%>
                                        </td>
                                        <td>
                                            <%#Eval("sys_setting")%>
                                        </td>
                                        <td>
                                            <div class="input-group">
                                                <asp:DropDownList class="form-control" ID="ddlsupp" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="height40">
                                                <asp:Button ID="btn_open"  CssClass="button btn btn-xs  btn-info" runat="server" Text="开启" CommandName="open" CommandArgument='<%#Eval("typeId")%>' />
                                                <asp:Button ID="btn_close"  CssClass="button btn btn-xs  btn-info" runat="server" Text="关闭" CommandName="close" CommandArgument='<%#Eval("typeId")%>'/>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>

                                <FooterTemplate>
                                    </table>

                                </FooterTemplate>
                            </asp:Repeater>
                            <tr>
                            <td style="height: 20px">

                </td>
            </tr>
        </table>
        <asp:HiddenField ID="puser" runat="server" />
    </form>
    <script type="text/javascript">
$(document).ready(function() {       
    $(".bottonstyle02").each(function(){
            $(this).click(function(){
               var oId = $(this).attr("id");           
               var txt= $("#"+oId).text();
               var msg = "",cmd = "",isopen = true;               
               if(txt == "关闭"){
                    msg = "确认要关闭此支付通道吗？";
                    cmd = "close";  
                    isopen = false;          
               } 
               else{
                    msg = "确认要开启此支付通道吗？";
                    cmd = "open";            
               }
               if (confirm(msg))
			   {
				    var modeid = $(this).attr("id");
				    $.get("UserChannel.aspx", {userId:$("#puser").val(),id: modeid,cmd:cmd,t:Math.random()},
					    function(data){		        
					        if (data == 'success'){
                                alert(txt+'成功！');                                
                                if(isopen){
                                    $("#imgstus"+oId).attr("src","/images/right.png");                                    
                                    $("#"+oId).attr("innerText","关闭");
                                }
                                else{
                                    $("#imgstus"+oId).attr("src","/images/wrong.png");
                                    $("#"+oId).attr("innerText","开启");
                                }                                
					        } else {
						        alert(txt+'失败！');
					        }
				    });
			    }
             });         
	    })
});
    </script>




</body>
</html>
