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
        ��������
        <small>������֧��ƽ̨</small>
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
                    ��վ����</td>
                <td width="80%" colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtName" runat="server" ></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    ��վ����</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtDomain" runat="server" ></asp:TextBox>&nbsp;ֱ����������,��Ҫ��http://</div>
                    </td>
            </tr>
            <tr>
                <td class="td2">
                    ��ֵ����</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtPayUrl" runat="server" ></asp:TextBox>&nbsp;������������ ��Ҫ��http://</div>
                    </td>
            </tr>
            <tr>
                <td class="td2">
                    ��ϵ�绰</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtPhone" runat="server" ></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    ����QQ</td>
                <td colspan="3" class="td1">
                    <%--<a href="#" onclick="addc();">��Ӽ���QQ</a> <a href="#" onclick="delc();">ɾ������QQ</a>--%>
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtJSQQ" runat="server" Width="400px"></asp:TextBox>&nbsp;��ʽ:����,QQ����| ���λ����|</div>

                    <div id="jsqqpanle" runat="server">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    �ͷ�QQ</td>
                <td colspan="3" class="td1">
                    <%-- <a href="#" onclick="addk();">��ӿͻ�QQ</a> <a href="#" onclick="delk();">ɾ���ͻ�QQ</a>--%>
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtKFQQ" runat="server" Width="400px"></asp:TextBox>&nbsp;��ʽ:����,QQ����| ���λ����|</div>

                    <div id="kefu" runat="server">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    ��վ�����׺</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtTitleSuffix" runat="server" Width="800px"></asp:TextBox></div></td>
            </tr> 
            <tr>
                <td class="td2">
                    ��վ�ؼ���</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtWebSiteKey" runat="server" Width="800px"></asp:TextBox></div></td>
            </tr> 
            <tr>
                <td class="td2">
                    ��վ����</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtWebSitedescription" runat="server" Width="800px"></asp:TextBox></div></td>
            </tr> 
            <tr>
                <td class="td2">
                    ��վ��Ȩ��Ϣ</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtFooter" runat="server" Width="400px"></asp:TextBox></div></td>
            </tr>            
            <tr>
                <td class="td2">
                    �̻�ע���Ƿ����</td>
                <td class="td1" colspan="3">
                
                    <div class="input-group"><asp:RadioButtonList ID="ddlstatus" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                   
                    </td>
            </tr>
            <tr>
                <td class="td2">
                    �������˻��ĵ�¼��ʾ��Ϣ</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtuserloginMsgForlock" runat="server" Width="400px" Text="����˻������������ܵ�¼������ϵ����Ա"></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    δ������˻��ĵ�¼��ʾ��Ϣ</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtUserloginMsgForUnCheck" runat="server" Width="400px" Text="�����˻�δ����ˣ����ܵ�¼������ϵ����Ա���"></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    �˻����ʧ�ܵĵ�¼��ʾ��Ϣ</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtUserloginMsgForCheckfail" runat="server" Width="400px" Text="�����˻�δ�����ͨ�������ܵ�¼������ϵ����Ա"></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    �Ƿ���ע��</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="ddlopen" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    ע���Ƿ���Ҫ�ʼ�����</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_ActivationByEmail" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    �Ƿ�����ͨ���ʼ���¼</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_isUserloginByEmail" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    ��Ҫ�ֻ���֤</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_mobilval" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    һ���ֻ������Է�����Ϣ����</td>
                <td class="td1" colspan="3">
                    &nbsp;<div class="input-group"><asp:TextBox class="form-control"  ID="txtMobilMaxSendTimes" runat="server" ></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    �Ƿ����ͻ����ֶ�������</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="RadioButtonPhone" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
             <tr>
                <td class="td2">
                    �Ƿ����̼����ֶ�����֤</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="RadioButtonshouji" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    �Ƿ����̼�����������֤</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="RadioButtonemail" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
             <tr>
                <td class="td2">
                    ���ֶ�������-�����ֻ�</td>
                <td colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="TextPhone" runat="server" ></asp:TextBox></div></td>
            </tr> 
            <tr>
                <td class="td2">
                    ����·վ�����</td>
                <td class="td1" colspan="3">
                    &nbsp;<div class="input-group"><asp:TextBox class="form-control"  ID="txtRefCount" runat="server" ></asp:TextBox>&nbsp;��ÿ�û���</div>
                    </td>
            </tr>
            <tr>
                <td class="td2">
                    ����·����״̬</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_NoRef" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
            </tr>
            <tr>
                <td class="td2">
                    ���ÿ���</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rblOpenDeduct" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div></td>
            </tr>
            <tr>
                <td class="td2">
                    �Ƿ�����ƽ̨�����û��������ֲ���</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_isopenCash" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    ƽ̨��ͣ�����û������ԭ��</td>
                <td class="td1" colspan="3">
                    &nbsp;<div class="input-group"><asp:TextBox class="form-control"  ID="txtclosecashReason" runat="server" ></asp:TextBox></div></td>
            </tr>
            <tr>
                <td class="td2">
                    �û�Ĭ�Ͽ�������</td>
                <td class="td1" colspan="3">
                    &nbsp;<div class="input-group"><asp:TextBox class="form-control"  ID="txtDefaultCPSDrate" runat="server" ></asp:TextBox></div></td>
            </tr>
             <tr>
                <td class="td2">
                     �û�Ĭ�Ͻ���ģʽ</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_settledmode" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="T+0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="T+1" Value="1"></asp:ListItem>                        
                    </asp:RadioButtonList></div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    ����������ͳ��</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtCode" runat="server" TextMode="MultiLine" Width="400px" ></asp:TextBox>&nbsp;֧��cnzz,51la,51yes����ͳ��</div>
                    </td>
            </tr>
            <tr>
                <td class="td2">
                    ��¼���״�����־��������</td>
                <td class="td1" colspan="3">
                    <div class="input-group"><asp:RadioButtonList ID="rbl_debuglog" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="��" Value="1"></asp:ListItem>
                        <asp:ListItem Text="��" Value="0"></asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
             <tr>
                <td width="10%" class="td2">
                    �����ӿ�����</td>
                <td width="90%" colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtapibankname" runat="server" ></asp:TextBox></div></td>
            </tr>
             <tr>
                <td width="10%" class="td2">
                    �����ӿڰ汾</td>
                <td width="90%" colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtapibankversion" runat="server" ></asp:TextBox></div></td>
            </tr>
             <tr>
                <td width="10%" class="td2">
                    ����ӿ�����</td>
                <td width="90%" colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtapicardname" runat="server" ></asp:TextBox></div></td>
            </tr>
             <tr>
                <td width="10%" class="td2">
                    ����ӿڰ汾</td>
                <td width="90%" colspan="3" class="td1">
                    <div class="input-group"><asp:TextBox class="form-control"  ID="txtapicardversion" runat="server" ></asp:TextBox></div></td>
            </tr>
             <tr>
                <td width="10%" class="td2">
                    ͨ���޶�����</td>
                <td width="90%" colspan="3" class="td1">
                    <div class="input-group">
                                           <div class="input-group-btn">
                                           <button type="button" class="btn btn-primary">����</button></div>
                   <asp:TextBox class="form-control min-width"  ID="txtbank" runat="server" Width="55px"></asp:TextBox></div>

                   <div class="input-group">
                                                              <div class="input-group-btn">
                                                              <button type="button" class="btn btn-primary">΢��</button></div>
                   <asp:TextBox class="form-control min-width"  ID="txtweixin" runat="server" Width="55px"></asp:TextBox></div>

                   <div class="input-group">
                                                              <div class="input-group-btn">
                                                              <button type="button" class="btn btn-primary">����</button></div>

                   <asp:TextBox class="form-control min-width"  ID="txtali" runat="server" Width="55px"></asp:TextBox></div></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="td1 mycenter" colspan="3" >

                        <asp:Button ID="btn_Update" runat="server" Text="ȷ�ϸ���" CssClass="button btn  btn-danger" OnClick="btnUpdate_Click" OnClientClick="allQQ()" />

                </td>
            </tr>
        </table>

        <script type="text/javascript">
function $d(obj){
   return document.getElementById(obj);
}
   var num=$d("hfnum").value;
   function addc(){			
			$d("jsqqpanle").innerHTML=$d("jsqqpanle").innerHTML + "<BR/>QQ�ţ�<input type='text' name='qqnum"+num+"' id='qqnum"+num+"'>QQ���ƣ�<input type='text' name='qqname"+num+"' id='qqname"+num+"'>";  		 
			num=parseInt(num)+1;//parseInt(document.getElementById("hfnum").value);

		}
		
		function delc(){
			var str=$d("jsqqpanle").innerHTML;			
			str="QQ�ţ�<input type='text' id='qqnum0' name='qqnum0'>QQ���ƣ�<input type='text' name='qqname0' id='qqname0'>";
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
			$d("kefu").innerHTML=$d("kefu").innerHTML + "<BR/>QQ�ţ�<input type='text' name='kfqqnum"+kfnum+"' id='kfqqnum"+kfnum+"'>QQ���ƣ�<input type='text' name='kfqqname"+kfnum+"' id='kfqqname"+kfnum+"'>";  		 
			kfnum=parseInt(kfnum)+1;//parseInt(document.getElementById("hfnum").value);

		}
		
		function delk(){
			var str=$d("kefu").innerHTML;			
			str="QQ�ţ�<input type='text' id='kfqqnum0' name='kfqqnum0'>QQ���ƣ�<input type='text' name='kfqqname0' id='kfqqname0'>";
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