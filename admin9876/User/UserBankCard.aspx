<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserBankCard" Codebehind="UserBankCard.aspx.cs" %>

<!DOCTYPE html>
<html>
<head >
    <title></title>
    <!-- Bootstrap 3.3.7 -->
           <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
           <!-- Theme style -->
           <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/dist/css/AdminLTE.min.css">
            <!-- Font Awesome -->
             <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/font-awesome/css/font-awesome.min.css">
             <!-- Ionicons -->
             <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/Ionicons/css/ionicons.min.css">
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
                  border-top: 1px solid #ddd;
                  font-size:14px;
                  overflow: hidden;
                   text-align: center;
                  word-break: break-all; word-wrap:break-word;
              }

     A:link {COLOR:#237C04;TEXT-DECORATION: none}
     td {height:20px; line-height:20px; font-size:12px;padding:0px; vertical-align:middle !important;}
     .td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:center;}
     .td1 {padding-right:3px;padding-left:3px;color:#999999;padding-bottom:0px;padding-top:5px;height:25px;}
     .td2 {padding-right:3px;padding-left:8px;padding-top:5px; color: #333;background: #e8eaee;font-size:12px;text-align:right;}
    .td3 {padding:1px 1px 0 0px;color:#083772;background:#EFF3FB;font-size:12px;text-align:center;}
    .moban {padding-top:0px;border:0px}
    input { border:1px solid #999;padding:3px;font:12px tahoma;ling-height:16px}
    select { border:1px solid #999;padding:3px;margin-left:10px;font:12px tahoma;ling-height:16px}
    .input4 {border:1px solid #999;padding:3px;margin-left:10px;font:11px tahoma;ling-height:16px;height:45px;}

    .nrml{background-color:#eeeeee;font-weight: bold;}
    .radio { border:none; }
    .checkbox { border:none; height: 18px; width: 40px;}
    .addnew {font-size: 12px;color: #FF0000;}
    a.servername{height:470px;width: 527px;color:#E54202;cursor:hand;}
    .current {border:#ff6600 1px solid;}
    a:hover {height:470px;width: 527px;color:#E54202;cursor:hand;}
    #nav LI A.noncurrent {/*border:#DC171E 3px solid;*/}
    #nav UL {PADDING-BOTTOM: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 0px}
    #nav LI {DISPLAY: inline; padding-left:10px;}
    #nav LI a:hover {border:#B6E000 1px solid;}
    #nav li A:visited {border:#ff0000 1px solid;}
    img{padding:0 9px}
    #tplPreview {
    position: absolute;
    top:0px;
    left:0px;
    background:#ffffff;
    border:1px solid #333;
    font-size:12px;
    color:#4B4B4B;
    padding:12px 15px 15px 15px;
    }
    #sign{background: url("<%=ADMIN_URI%>/style/images/tab_sign.png"); width: 70px; margin-left:20px; height: 23px; float: left;}
    #sign1{float: left;}
    #rblTypeOpen{border:0 !important;}
    #rblOpen{border:0 !important;}
    #rblTypeOpen td{border:0 !important;}
    #rblOpen td{border:0 !important;}
    .table1 tr{padding: 10px;}
    </style>

    <script type="text/javascript">

function backreturn(){
    history.go(-1);
}
    </script>

</head>
<body>
    <form id="form1" runat="server">



    <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered table-hover dataTable">


         <tr>
                        <td align="center">






                             <div>
        	<table class="table table-bordered table-hover dataTable" cellspacing="1" cellpadding="4" id="GridView" style="color:#333333;width:100%;">
        		 <asp:Repeater ID="bindIpRepeater" EnableViewState="false" runat="server" >
                                                <HeaderTemplate>
                                                <tr height="30"  style="background: #e8eaee">
                                                 <td>序号</td>
                                                 <td>对公对私</td>
                                                 <td>银行名称</td>
                                                 <td>银行卡号</td>
                                                 <td>账户姓名</td>
                                                 <td>开户行地址</td>
                                                 <td>操作</td>



                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr height="30">

                                                    <td>
                                                       <%# Eval("id")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("accountTypeName")%>
                                                     </td>
                                                    <td>
                                                       <%# Eval("BankName")%>
                                                    </td>
                                                     <td>
                                                        <%# Eval("BankAccountHide")%>
                                                     </td>
                                                     <td>
                                                        <%# Eval("AccountName")%>
                                                     </td>
                                                    <td>
                                                        <%# Eval("bankAddress")%>
                                                     </td>

                                                      <td>


                                                       <input type="button" class="button btn btn-xs  btn-danger" value="删除" onclick="window.location.href='UserBankCard.aspx?cmd=delete&bankid=<%# Eval("id")%>&userid=<%# Eval("userid")%>'"/>
</td>
                                                </tr>
                                            </ItemTemplate>

                                        </asp:Repeater>

        	</table>
        </div>




                        </td>
                    </tr>






    </table>
    </form>
</body>
</html>

