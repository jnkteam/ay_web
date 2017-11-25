<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserPayRateEdit" CodeBehind="UserPayRateEdit.aspx.cs" %>

<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>


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
.td1a {    padding：5px;
          color: #3e3e3e;
          width: 12.5%;}
.td2a {padding-right: 10px;
          padding-left: 8px;
          padding-top: 8px;
          color: #333;
          font-size: 14px;
          font-weight: 400;
          background: #e8eaee;
          text-align: right;
          width: 12.5%;}
.td3 {padding:1px 1px 0 0px;color:#083772;background:#EFF3FB;font-size:12px}
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


 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        费率设置
        <small>第三方支付平台</small>
      </h1>

      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">




    <form id="form1" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table1">
    <tr bgcolor="#ffffff">
    <td>
    <table>


            <tr height="30">
                <td colspan="10" style="text-align:left ">
                   用户ID:<asp:Label ID="lblUserId" runat="server" Text="Label" 
                        Font-Bold="True" ForeColor="Red"></asp:Label>
                        
                    <asp:CheckBox ID="ckb_isopen" runat="server" Text="启用单独配置" />
                    
                    
                &nbsp;<asp:Button ID="btnCopy" CssClass="button btn  btn-danger" runat="server" Text="复制默认比例"
                        onclick="btnCopy_Click" />
                    
                    
                </td>
            </tr>



            <tr  bgcolor="#ffffff">
                <td class="td2a">
                    网上银行：
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp102" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    网银APP
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp1020" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>				
                <td class="td2a">
                    支付宝扫码
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp101" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>	
                <td class="td2a">
                    支付宝APP
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp980" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>			
            </tr>
            <tr  bgcolor="#ffffff">
                <td class="td2a">
                    微信扫码
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp99" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    微信APP
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp990" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    QQ钱包
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp209" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    QQ钱包APP
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp210" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>				
            </tr>			
            <tr  bgcolor="#ffffff">
                <td class="td2a">
                    京东
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp300" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>			
                <td class="td2a">
                    神州行充值卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp103" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    神州行浙江卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp200" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    神州行江苏卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp201" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
            </tr>
            <tr  bgcolor="#ffffff">
                <td class="td2a">
                    神州行福建卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp203" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    盛大一卡通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp104" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    征途支付卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp105" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    骏网一卡通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp106" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
            </tr>
            <tr  bgcolor="#ffffff">
                <td class="td2a">
                    腾讯Q币卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp107" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    联通充值卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp108" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    久游一卡通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp109" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    网易一卡通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp110" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
            </tr>
            <tr  bgcolor="#ffffff">
                <td class="td2a">
                    完美一卡通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp111" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    搜狐一卡通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp112" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    电信充值卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp113" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    声讯卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp114" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
            </tr>
            <tr  bgcolor="#ffffff">
                <td class="td2a">
                    光宇一卡通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp115" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    微信外置wap
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp116" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    纵游一卡通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp117" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    天下一卡通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp118" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
            </tr>
            <tr  bgcolor="#ffffff">
                <td class="td2a">
                    天宏一卡通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp119" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    魔兽卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp204" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    联华卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp205" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    神州行辽宁卡
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp202" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>				
            </tr>
            <tr  bgcolor="#ffffff">
                <td class="td2a">
                    殴飞一卡通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp208" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                    财付通
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp100" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a" >
                    支付宝(不用)
                </td>
                <td class="td1a">
                    <asp:TextBox ID="txtp98" class="form-control" runat="server" Width="80px"></asp:TextBox>
                </td>
                <td class="td2a">
                </td>
                <td class="td1a">
                </td>
            </tr>
            <tr  bgcolor="#ffffff">
                <td colspan="10" style="text-align: center; height: 30px;">
                    <asp:Button ID="btnSave" CssClass="button btn  btn-danger" runat="server" Text="保 存" OnClick="btnSave_Click"></asp:Button>
                    <input type="button" class="button btn  btn-danger" value="返 回" onclick="backreturn()" />
                </td>
            </tr>
        </table>
        </td>
        </tr>
        </table>
    </form>

    </section>
    </div>

<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>

<script type="text/javascript">
function backreturn(){
    location.href = 'UserList.aspx?UserStatus=2';
}

</script>