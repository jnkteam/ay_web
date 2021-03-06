﻿<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserEdits" Codebehind="UserEdits.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题页</title>
<link href="../style/union.css" type="text/css" rel="stylesheet" />
<script src="../../js/common.js" type="text/javascript"></script>
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/dist/css/AdminLTE.min.css">
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
    });
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
                    用户名ID</td>
                <td class="td1">
                    <asp:Label ID="lblid" runat="server" Width="160px"></asp:Label>
                </td>
                <td class="td2">
                    用户名</td>
                <td class="td1">
                    <asp:TextBox ID="txtuserName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    签约属性</td>
                <td class="td1">
                    <asp:RadioButtonList ID="rbuserclass" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="0" class="form-group">个人</asp:ListItem>
                        <asp:ListItem Value="1" class="form-group">企业</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="td2">
                    用户名</td>
                <td class="td1">
                    <asp:TextBox ID="txtfullname" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    用户密码</td>
                <td class="td1">
                    <asp:TextBox ID="txtpassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="td2">
                    转账密码</td>
                <td class="td1">
                <asp:TextBox ID="txtpassword2" runat="server" Width="200px" TextMode="Password"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="td2">
                    会员类型</td>
                <td class="td1">
                    <asp:RadioButtonList ID="rbluserType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="3" class="form-group">会员</asp:ListItem>
                        <asp:ListItem Value="4" class="form-group">代理</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="td2">
                    会员等级</td>
                <td class="td1">
                <div class="input-group">
                    <asp:DropDownList ID="ddlpromvip" class="form-control" runat="server" Width="150px"></asp:DropDownList>
                    <asp:DropDownList ID="ddlmemvip" class="form-control" runat="server" Width="150px"></asp:DropDownList>
                    </div>
                </td>
            </tr>
            
            <tr>
                <td class="td2">
                    所属代理</td>
                <td class="td1">
                   <div class="input-group">
                   <asp:DropDownList ID="ddlagents" class="form-control" runat="server" AutoPostBack="true" ></asp:DropDownList>
                   </div>
                </td>
                <td class="td2">
                    所属业务员</td>
                <td class="td1">

                <div class="input-group">
                <asp:DropDownList ID="ddlmange" class="form-control" runat="server"></asp:DropDownList>
                </div>
                <asp:TextBox ID="txtGetPromSuperior" runat="server" Width="200px" Visible="false"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td class="td2">
                    扣率</td>
                <td class="td1">
                    <asp:TextBox ID="txtCPSDrate" runat="server" Width="200px">0</asp:TextBox>
                </td>
                <td class="td2">
                    转率</td>
                <td class="td1">
                    <asp:TextBox ID="txtCVSNrate" runat="server" Width="200px">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    邮箱地址</td>
                <td class="td1">
                    <asp:TextBox ID="txtemail" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="td2">
                    QQ号码</td>
                <td class="td1">
                    <asp:TextBox ID="txtqq" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    手机号码</td>
                <td class="td1">
                    <asp:TextBox ID="txttel" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="td2">
                    身份证号码</td>
                <td class="td1">
                    <asp:TextBox ID="txtidCard" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    收款方式</td>
                <td class="td1">
                   <asp:RadioButtonList ID="rblsettlemode" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="1" class="form-group">银行帐户</asp:ListItem>
                        <asp:ListItem Value="2" class="form-group">支付宝</asp:ListItem>
                        <asp:ListItem Value="3" class="form-group">财付通</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td class="td2">
                    开户银行</td>
                <td class="td1">
                <div class="input-group">
                     <asp:DropDownList class="form-control" ID="ddlpayeeBank" runat="server">
                        <asp:ListItem value="">--开户银行--</asp:ListItem>
                        <asp:ListItem value="0002">支付宝</asp:ListItem>
                        <asp:ListItem value="0003">财付通</asp:ListItem>
                        <asp:ListItem value="1002">中国工商银行</asp:ListItem>
                        <asp:ListItem value="1005">中国农业银行</asp:ListItem>
                        <asp:ListItem value="1003">中国建设银行</asp:ListItem>
                        <asp:ListItem value="1026">中国银行</asp:ListItem>
                        <asp:ListItem value="1001">招商银行</asp:ListItem>
                        <asp:ListItem value="1006">民生银行</asp:ListItem>
                        <asp:ListItem value="1020">交通银行</asp:ListItem>
                        <asp:ListItem value="1025">华夏银行</asp:ListItem>
                        <asp:ListItem value="1009">兴业银行</asp:ListItem>
                        <asp:ListItem value="1027">广发银行</asp:ListItem>
                        <asp:ListItem value="1004">浦发银行</asp:ListItem>
                        <asp:ListItem value="1022">光大银行</asp:ListItem>
                        <asp:ListItem value="1021">中信银行</asp:ListItem>
                        <asp:ListItem value="1010">优奇支付银行</asp:ListItem>
                        <asp:ListItem value="1066">中国邮政储蓄银行</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    账号类型</td>
                <td class="td1">
                    <asp:RadioButtonList ID="rblaccoutType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="0" class="form-group">私人帐户</asp:ListItem>
                        <asp:ListItem Value="1" class="form-group">公司帐户</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="td2">
                    省份城市</td>
                <td class="td1">
                    <div class="input-group" style="left:-3px;">
                        <label><asp:DropDownList class="form-control" ID="ddlprovince" runat="server" AutoPostBack="True" onselectedindexchanged="ddlprovince_SelectedIndexChanged"></asp:DropDownList></label>
                        <label><asp:DropDownList class="form-control" ID="ddlcity" runat="server"><asp:ListItem Value="">--市区--</asp:ListItem></asp:DropDownList></label>
                    </div>
                </td>

            </tr>
            <tr>
                <td class="td2">
                    支行名称</td>
                <td class="td1">
                    <asp:TextBox ID="txtbankAddress" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="td2">
                    收款人</td>
                <td class="td1">
                    <asp:TextBox ID="txtpayeeName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    银行帐号</td>
                <td class="td1">
                    <asp:TextBox ID="txtaccount" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="td2">
                    状态 </td>
                <td class="td1">
                <div class="input-group">
                    <asp:DropDownList class="form-control" ID="ddlStatus" runat="server" Width="150px">
                    </asp:DropDownList>
                    </div>
                </td>
            </tr>            
            <tr>
                <td class="td2">
                    提现方案</td>
                <td class="td1">
                <div class="input-group">
                    <asp:DropDownList class="form-control" ID="ddlTocashScheme" runat="server" Width="150px"></asp:DropDownList>
                    </div>
                </td>
                <td class="td2">
                    积分</td>
                <td class="td1">
                    <asp:Label ID="lblIntegral" runat="server"  Width="160px" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    注册时间</td>
                <td class="td1">
                    <asp:Label ID="lblregTime" runat="server"  Width="160px" ></asp:Label>
                </td>
                <td class="td2">
                    最后登录IP</td>
                <td class="td1">
                    <asp:Label ID="lbllastLoginIp" runat="server"  Width="160px" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    最后登录时间</td>
                <td class="td1">
                    <asp:Label ID="lbllastLoginTime" runat="server"  Width="160px" ></asp:Label>
                </td>
                <td class="td2">
                    帐户余额</td>
                <td class="td1">
                    <asp:Label ID="lblbalance" runat="server"  Width="160px" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    网站名称</td>
                <td class="td1">
                    <asp:TextBox ID="txtsiteName" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="td2">
                    API账号</td>
                <td class="td1">
                     <asp:TextBox ID="txtapiAcct" runat="server"   Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    安全问题</td>
                <td class="td1">
                    <asp:TextBox ID="txtquestion" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="td2">
                    安全答案</td>
                <td class="td1">
                     <asp:TextBox ID="txtanswer" runat="server"   Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    无来路支付地址</td>
                <td class="td1" colspan="4">
                    <asp:TextBox ID="txtUrlNoRefPayUrl" runat="server" Width="90%"></asp:TextBox>                   
                </td>
            </tr>
            <tr>
                <td class="td2">
                    短信接收地址</td>
                <td class="td1" colspan="4">
                    <asp:TextBox ID="txtsmsNotifyUrl" runat="server" Width="90%"></asp:TextBox>                   
                </td>
            </tr>
            <tr>                
                <td class="td2">
                    无来路状态</td>
                <td class="td1">
                    <asp:CheckBox ID="cb_UrlNoRefPayUrl" runat="server" Text="开启"  class="form-group"/>
                    是否记录交易错误日志：<asp:CheckBox ID="cb_isdebug" runat="server" Text="是"  class="form-group"/>
                 </td>
                 <td class="td2">
                    结算模式</td>
                <td>
                    <asp:RadioButtonList ID="rbl_settledmode" class="rbl-asp" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="T+0" Value="0" class="form-group"></asp:ListItem>
                        <asp:ListItem Text="T+1" Value="1" class="form-group"></asp:ListItem>
                    </asp:RadioButtonList>             
                </td>
            </tr>
            <tr>
                <td class="td2">
                    网站地址</td>
                <td class="td1" colspan="5" style="width:100%">
                    <asp:TextBox ID="txtsiteUrl" runat="server" Width="80%"></asp:TextBox>
                   
                </td>
                
            </tr>           
            <tr>
                <td class="td2">
                    API通讯密钥</td>
                <td class="td1" colspan="5" style="width:100%">
                    <asp:TextBox ID="txtapikey" runat="server" Rows="2" TextMode="MultiLine" Width="80%" CssClass="lable"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    认证信息 </td>
                <td class="td1" colspan="5" style="width:100%">
                    <asp:CheckBox ID="cb_isRealNamePass" runat="server" Text="实名认证" />
                <asp:CheckBox ID="cb_isEmailPass" runat="server" Text="邮件认证" />
                <asp:CheckBox ID="cb_isPhonePass" runat="server" Text="手机认证" />
                <asp:CheckBox ID="cb_istransfer" runat="server" Text="开启转账" />
                <asp:CheckBox ID="cb_isagentDistribution" runat="server" Text="对私代发" />
                </td>
            </tr>
             <tr>
                <td class="td2">
                    代发规则</td>
                <td class="td1">
                <div class="input-group">
                    <asp:DropDownList class="form-control" ID="ddlagentDistscheme" runat="server" Width="150px"></asp:DropDownList>
                    </div>
                </td>
                <td class="td2">
                    点卡版本</td>
                <td class="td1">
                <div class="input-group">
                    <asp:DropDownList class="form-control" ID="ddlcardversion" runat="server" Width="150px">
                        <asp:ListItem Value="0" Selected="True">--点卡版本--</asp:ListItem>
                        <asp:ListItem Value="1">普及</asp:ListItem>
                        <asp:ListItem Value="2">专业</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    结算途径</td>
                <td class="td1">
                <div class="input-group">
					<asp:DropDownList class="form-control" ID="ddlsettles_type" runat="server" Width="150px">
                        <asp:ListItem Value="0" Selected="True">前台方式</asp:ListItem>
                        <asp:ListItem Value="1">接口方式</asp:ListItem>
                        <asp:ListItem Value="2">前台+接口方式</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                </td>
                <td class="td2">
                    订单标题</td>
                <td class="td1">
                <div class="input-group">
					<asp:DropDownList class="form-control" ID="ddlrandom_subject" runat="server" Width="150px">
                        <asp:ListItem Value="0">默认</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">随机</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                </td>				
            </tr>
			<tr>
                 <td class="td2">
                    服务商通道</td>
                <td class="td1" colspan="5">
                    <asp:RadioButtonList ID="rblservice_channel" Width="200" RepeatLayout="Flow" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" onselectedindexchanged="rblservice_channel_SelectedIndexChanged">
                        <asp:ListItem Text="不启用" Value="0" class="form-group"></asp:ListItem>
                        <asp:ListItem Text="启用" Value="1" class="form-group"></asp:ListItem>
                    </asp:RadioButtonList>　　<asp:HyperLink ID="hlSetting" runat="server" Target="_blank"><b>服务商设置</b></asp:HyperLink>
                </td>			
            </tr>			
            <tr>
                <td class="td2">
                    通道限额设置</td>
                <td class="td1" colspan="5">
					网银: <asp:TextBox ID="txtbank_limit" runat="server" Width="70px" value="0"></asp:TextBox>
					微信: <asp:TextBox ID="txtweixin_limit" runat="server" Width="70px" value="0"></asp:TextBox>
					支付宝: <asp:TextBox ID="txtali_limit" runat="server" Width="70px" value="0"></asp:TextBox>
					QQ钱包: <asp:TextBox ID="txtqq_limit" runat="server" Width="70px" value="0"></asp:TextBox>
                </td>
            </tr>				
            <tr>
                <td class="td2">
                    备注</td>
                <td class="td1" colspan="5" style="width:100%">
                    <asp:TextBox ID="txtdesc" runat="server" Rows="3" TextMode="MultiLine" Width="80%" CssClass="lable"></asp:TextBox>
                </td>
            </tr>            
            <tr>
                <td colspan="4" style="height: 20px">
                    <div align="center">
                        <asp:Button ID="btnAdd" class="button btn  btn-danger" runat="server" Text="提 交" OnClick="btnAdd_Click"></asp:Button>
                        <input type="button" class="button btn  btn-danger" value="返 回" onclick="backreturn()" />
                    </div>
                </td>
            </tr>
        </table>
        
    </form>
</body>
</html>
