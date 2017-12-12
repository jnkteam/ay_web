<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Sys.SiteInfo" ValidateRequest="false" Codebehind="SiteInfo.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
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

                font-size:14px;
                overflow: hidden;

                word-break: break-all; word-wrap:break-word;
            }


td {height:20px; line-height:20px; padding:0px; vertical-align:middle !important;}
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {padding-right:3px;padding-left:3px;color:#999999;padding-bottom:0px;padding-top:5px;height:25px;}
.td2 {padding-right:3px;padding-left:8px;padding-top:5px; color: #333;background: #e8eaee;text-align:right;}
#rblrunmode{border:0 !important;}
#rblRelease{border:0 !important;}
#rblrunmode td{border:0 !important;}
#rblRelease td{border:0 !important;}
#tab th {text-align: center;}
#tab td {text-align: center;}
.form-control{width: 410px !important;}
.min-width{width: 200px !important;}
.mycenter{text-align: center !important;}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        参数设置
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="JsSave" />
        <asp:HiddenField runat="server" ID="hfnum" />
        <asp:HiddenField runat="server" ID="kfSave" />
        <asp:HiddenField runat="server" ID="kfnum" />
        <asp:HiddenField runat="server" ID="hdTemplate" />
        <table width="100%" border="0" cellspacing="1" cellpadding="3" class="table table-bordered table-hover dataTable">

            <tr>
                <td width="23%" class="td2">
                    网站名称</td>
                <td width="80%" colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtName" runat="server" ></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    网站域名</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtDomain" runat="server" ></asp:TextBox>&nbsp;直接输入域名,需要加http://</div>
                    </td>
            </tr>
            <tr>
                <td class="td2">
                    充值网关</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtPayUrl" runat="server" ></asp:TextBox>&nbsp;输入网关域名 需要加http://</div>
                    </td>
            </tr>
            <tr>
                <td class="td2">
                    联系电话</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtPhone" runat="server" ></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    技术QQ</td>
                <td colspan="3" class="td1">
                    <%--<a href="#" onclick="addc();">添加技术QQ</a> <a href="#" onclick="delc();">删除技术QQ</a>--%>
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtJSQQ" runat="server" Width="400px"></asp:TextBox>&nbsp;格式:姓名,QQ号码| 最后位不加|</div>

                    <div id="jsqqpanle" runat="server">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    客服QQ</td>
                <td colspan="3" class="td1">
                    <%-- <a href="#" onclick="addk();">添加客户QQ</a> <a href="#" onclick="delk();">删除客户QQ</a>--%>
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtKFQQ" runat="server" Width="400px"></asp:TextBox>&nbsp;格式:姓名,QQ号码| 最后位不加|</div>

                    <div id="kefu" runat="server">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    网站标题后缀</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtTitleSuffix" runat="server" Width="800px"></asp:TextBox></div></td>
            </tr> 
            <tr>
                <td class="td2">
                    网站关键字</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtWebSiteKey" runat="server" Width="800px"></asp:TextBox></div></td>
            </tr> 
            <tr>
                <td class="td2">
                    网站描述</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtWebSitedescription" runat="server" Width="800px"></asp:TextBox></div></td>
            </tr> 
            <tr>
                <td class="td2">
                    网站版权信息</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtFooter" runat="server" Width="400px"></asp:TextBox></div></td>
            </tr>            
            <tr>
                <td class="td2">
                    商户注册是否审核</td>
                <td class="td1" colspan="3">
                
                    <div class="input-group"><asp:RadioButtonList ID="ddlstatus" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                   
                    </td>
            </tr>
            <tr>
                <td class="td2">
                    被锁定账户的登录提示信息</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtuserloginMsgForlock" runat="server" Width="400px" Text="你的账户被锁定，不能登录，请联系管理员"></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    未被审核账户的登录提示信息</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtUserloginMsgForUnCheck" runat="server" Width="400px" Text="您的账户未被审核，不能登录，请联系管理员审核"></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    账户审核失败的登录提示信息</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtUserloginMsgForCheckfail" runat="server" Width="400px" Text="您的账户未被审核通过，不能登录，请联系管理员"></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    是否开启注册</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="ddlopen" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    注册是否需要邮件激活</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_ActivationByEmail" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    是否允许通过邮件登录</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_isUserloginByEmail" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    需要手机验证</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_mobilval" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    一个手机最多可以发送信息次数</td>
                <td class="td1" colspan="3">
                    &nbsp;<div class="input-group"><asp:TextBox class="form-control"  ID="txtMobilMaxSendTimes" runat="server" ></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    是否开启客户提现短信提醒</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="RadioButtonPhone" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
             <tr>
                <td class="td2">
                    是否开启商家提现短信验证</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="RadioButtonshouji" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    是否开启商家提现邮箱验证</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="RadioButtonemail" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
             <tr>
                <td class="td2">
                    体现短信提醒-财务手机</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="TextPhone" runat="server" ></asp:TextBox></div></td>
            </tr> 
            <tr>
                <td class="td2">
                    有来路站点个数</td>
                <td class="td1" colspan="3">
                    &nbsp;<div class="input-group"><asp:TextBox class="form-control"  ID="txtRefCount" runat="server" ></asp:TextBox>&nbsp;（每用户）</div>
                    </td>
            </tr>
            <tr>
                <td class="td2">
                    无来路开启状态</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_NoRef" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
            </tr>
            <tr>
                <td class="td2">
                    启用扣量</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rblOpenDeduct" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div></td>
            </tr>
            <tr>
                <td class="td2">
                    是否允许平台所有用户进行提现操作</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_isopenCash" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    平台暂停所有用户结算的原因</td>
                <td class="td1" colspan="3">
                    &nbsp;<div class="input-group"><asp:TextBox class="form-control"  ID="txtclosecashReason" runat="server" ></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    用户默认扣量比例</td>
                <td class="td1" colspan="3">
                    &nbsp;<div class="input-group"><asp:TextBox class="form-control"  ID="txtDefaultCPSDrate" runat="server" ></asp:TextBox></div></td>
            </tr>
             <tr>
                <td class="td2">
                     用户默认结算模式</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_settledmode" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="T+0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="T+1" Value="1"></asp:ListItem>                        
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    第三方流量统计</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtCode" runat="server" TextMode="MultiLine" Width="400px" ></asp:TextBox>&nbsp;支持cnzz,51la,51yes流量统计</div>
                    </td>
            </tr>
            <tr>
                <td class="td2">
                    记录交易错误日志（方便查错）</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_debuglog" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
             <tr>
                <td width="10%" class="td2">
                    网银接口名称</td>
                <td width="90%" colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtapibankname" runat="server" ></asp:TextBox></div></td>
            </tr>
             <tr>
                <td width="10%" class="td2">
                    网银接口版本</td>
                <td width="90%" colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtapibankversion" runat="server" ></asp:TextBox></div></td>
            </tr>
             <tr>
                <td width="10%" class="td2">
                    卡类接口名称</td>
                <td width="90%" colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtapicardname" runat="server" ></asp:TextBox></div></td>
            </tr>
             <tr>
                <td width="10%" class="td2">
                    卡类接口版本</td>
                <td width="90%" colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtapicardversion" runat="server" ></asp:TextBox></div></td>
            </tr>
             <tr>
                <td width="10%" class="td2">
                    通道限额设置</td>
                <td width="90%" colspan="3" class="td1">
                    <div class="input-group">
                                           <div class="input-group-btn">
                                           <button type="button" class="btn btn-primary">网银</button></div>
                   <asp:TextBox class="form-control min-width"  ID="txtbank" runat="server" Width="55px"></asp:TextBox></div>

                   <div class="input-group">
                                                              <div class="input-group-btn">
                                                              <button type="button" class="btn btn-primary">微信</button></div>
                   <asp:TextBox class="form-control min-width"  ID="txtweixin" runat="server" Width="55px"></asp:TextBox></div>

                   <div class="input-group">
                                                              <div class="input-group-btn">
                                                              <button type="button" class="btn btn-primary">网银</button></div>

                   <asp:TextBox class="form-control min-width"  ID="txtali" runat="server" Width="55px"></asp:TextBox></div></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="td1 mycenter" colspan="3" >

                        <asp:Button ID="btn_Update" runat="server" Text="确认更新" CssClass="button btn  btn-danger" OnClick="btnUpdate_Click" OnClientClick="allQQ()" />

                </td>
            </tr>
        </table>

        <script type="text/javascript">
function $d(obj){
   return document.getElementById(obj);
}
   var num=$d("hfnum").value;
   function addc(){			
			$d("jsqqpanle").innerHTML=$d("jsqqpanle").innerHTML + "<BR/>QQ号：<input type='text' name='qqnum"+num+"' id='qqnum"+num+"'>QQ名称：<input type='text' name='qqname"+num+"' id='qqname"+num+"'>";  		 
			num=parseInt(num)+1;//parseInt(document.getElementById("hfnum").value);

		}
		
		function delc(){
			var str=$d("jsqqpanle").innerHTML;			
			str="QQ号：<input type='text' id='qqnum0' name='qqnum0'>QQ名称：<input type='text' name='qqname0' id='qqname0'>";
			$d("jsqqpanle").innerHTML=str;
			$d("JsSave").value="";
			num=1;
		}
		var kfnum=$d("kfnum").value;
		
		function allQQ(){
		   var myAllQQ="" ;
		   for(var i=0;i<num;i++){
		myAllQQ+=$d("qqname"+i).value+","+$d("qqnum"+i).value+"|";
		   }
		   $d("JsSave").value=myAllQQ;
		   var myAllkfQQ="" ;
		   for(var i=0;i<kfnum;i++){
		myAllkfQQ+=$d("kfqqname"+i).value+","+$d("kfqqnum"+i).value+"|";
		   }
		   $d("kfSave").value=myAllkfQQ;
		}
		 
		 function addk(){			
			$d("kefu").innerHTML=$d("kefu").innerHTML + "<BR/>QQ号：<input type='text' name='kfqqnum"+kfnum+"' id='kfqqnum"+kfnum+"'>QQ名称：<input type='text' name='kfqqname"+kfnum+"' id='kfqqname"+kfnum+"'>";  		 
			kfnum=parseInt(kfnum)+1;//parseInt(document.getElementById("hfnum").value);

		}
		
		function delk(){
			var str=$d("kefu").innerHTML;			
			str="QQ号：<input type='text' id='kfqqnum0' name='kfqqnum0'>QQ名称：<input type='text' name='kfqqname0' id='kfqqname0'>";
			$d("kefu").innerHTML=str;
			$d("kfSave").value="";
			kfnum=1;
		}
		
var   rbl   =   document.getElementsByName("RBLtemplate"); 
function hi(){
  
 for(var i=0;i<rbl.length;i++){
 if(rbl[i].checked){
$d("img"+rbl[i].value).className='current';
$d("hdTemplate").value=rbl[i].value;
 }else{
$d("img"+rbl[i].value).className='';
 }
 }
}
function bind(){
var myTemplate = $d("hdTemplate").value;

if(myTemplate!=null){

 for(var i=0;i<rbl.length;i++){

   if(rbl[i].value==myTemplate){
$d("img"+rbl[i].value).className='current';
   rbl[i].checked=true;
  
   }
 }
}
}
bind();
        </script>

    </form>
</section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>