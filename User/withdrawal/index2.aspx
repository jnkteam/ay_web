<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.User.withdrawal.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>余额提现 - <%=SiteName%></title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />

  <link href="/skin/css/common.css" rel="stylesheet" type="text/css" media="screen,projection" />
  <link href="/skin/user/user.css" rel="stylesheet" type="text/css" media="screen,projection" />
  <link href="/skin/user/Css/withdrawal_apply.css" rel="stylesheet" type="text/css" media="screen,projection" />

<script type="text/javascript" src="/jquery/1.8.0/jquery.min.js"></script>
  <script type="text/javascript" src="/static/js/jquery.core.js"></script>
  <script type="text/javascript" src="/static/js/jquery.form.js"></script>
  <script type="text/javascript" src="/static/js/jquery.cookie.js"></script>
  <script type="text/javascript" src="/static/dialog/jquery.dialog.js?skin=default"></script>
  <script type="text/javascript" src="/static/dialog/plugins/iframeTools.js"></script>
  <script type="text/javascript" src="/skin/user/js/user.js"></script>
  <script type="text/javascript" src="/skin/user/js/withdrawal_apply.js"></script>

  <script type="text/javascript" src="/skin/js/jquery.treeview.js"></script>
  <script type="text/javascript" src="/skin/user/js/menu.js"></script>

<script type="text/javascript">
    $(function () {
      var POUNDAGE_RATE = <%= shouxufei %>; //手续费率
        var MULTI = 1;   //提现金额梯度
        var MIN_MONEY = <%= tixianedu %>;   //最小提现输入金额
        var MIN_POUNDAGE =<%= zuixiaoshouxu %>; //最小手续费
        var MIN_POUND =<%= zuigaoshouxu %>; //最小手续费
      $("#withdrawMoney").keyup(function(e,isMulti){
        var withdraw = parseInt($(this).val());

        if(!withdraw){
          withdraw = MIN_MONEY;
        }

        if(isMulti){
          if(withdraw < MIN_MONEY){
            withdraw = MIN_MONEY;
          }

          var remainder = withdraw%MULTI;
          if(remainder != 0){
            withdraw = withdraw - remainder;
            // 下句取消注释则向上一个梯度取整
            // withdraw += MULTI;
          }
        }

        var poundageInit = withdraw * POUNDAGE_RATE;

        if(poundageInit < MIN_POUNDAGE && poundageInit != 0){
          poundageInit = MIN_POUNDAGE;
        }
        if (poundageInit > MIN_POUND){
          poundageInit = MIN_POUND;
        }
        var poundageMoney = (Math.round(poundageInit * 100) / 100).toFixed(2);

        if(e.which != 37 && e.which != 39 && e.which != 8 ){
          $(this).val(withdraw);
        }

        $("#userPoundage").html(poundageMoney);
        var actualMoney = (withdraw - poundageMoney).toFixed(2);
        if(actualMoney < 0){
          actualMoney = 0;
        }
        $("#actualToAccount").html(actualMoney);
      }).blur(function(){
        $(this).trigger('keyup', [true]);
      });

    });

  </script>
  <script type="text/javascript">
      function ajaxSubmit() {
          var sSource = '/user/Service/amt.ashx?t=' + Math.random();
          var postData = '';
          var loading = $.dialog.tips("更新中...", 2, "loading");
          $.ajax({
              type: "post",
              dataType: "json",
              timeout: 10000,
              url: sSource,
              data: postData,

              success: function (json) {

                  if (json.result == 'ok') {
                      loading.close();
                      $('#money').html(json.amt);

                  } else {
                      loading.close();
                      $.dialog({
                          title: '信息提示',
                          content: '错误',
                          icon: json.ico,
                          time: '2',
                          ok: true

                      });

                  }
              }

          })
      }
    </script>
</head>
<body>


   <table class="tab" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="64" colspan="2">

      
	<div class="head">
		<a class="logo" href="/user/" onfocus="this.blur();"><%=SiteName%></a>
		<ul class="nav">
		<li> 上次登录时间：<asp:Literal ID="litLastLoginTime"
                            runat="server"></asp:Literal> 上次登录IP：<asp:Literal ID="litLastLoginIp"
                            runat="server"></asp:Literal> </li>
			<li>欢迎您，<asp:Literal ID="LitUserName" runat="server"></asp:Literal></li>

			<li><a class="mess1">余额：</a><a id= "money"><%=zongyue%></a>&nbsp; <a href="javascript:" onclick="ajaxSubmit();">刷新</a></li>
				<li><a class="messHov" href="/user/message/">站内消息（<%=getmsgcount %>）</a></li>
			

			
			<li><a class="mess2" href="/user/loginout.aspx">退 出</a></li>

		</ul>
	</div>


    </td>
  </tr>
  <tr>
    <td class="l" width="180" valign="top">

      
	<div class="menu">

		<h2><a href="/user/" onfocus="this.blur();">会员首页</a></h2>

		<ul class="menuList" id="tree">
		<li>
				<span class="l1"><a href="/user/">商户首页</a></span>
				
			</li>
			<li>
				<span class="l1">交易管理</span>
				<ul class="menuList2" style="display:none">
					<li><a href="/user/order/" onfocus="this.blur();">网银订单</a></li>
					<li><a href="/user/ordercard/" onfocus="this.blur();">点卡订单</a></li>

				</ul>
			</li>

			<li>
				<span class="l2">财务管理</span>
								<ul class="menuList2" style="display:none">
					<li><a href="/user/money/" onfocus="this.blur();">收支明细</a></li>
					<% if (CanSettlesInFront) { %><li><a href="/user/withdrawal/" onfocus="this.blur();">提现管理</a></li><% }%>
					<li><a href="/user/cashcoupon/" onfocus="this.blur();">结算记录</a></li>
					<li><a href="/user/verify/" onfocus="this.blur();">收款账户<img src="/skin/images/user/new.png" style="vertical-align:middle;padding-left:10px" /></a></a></li>
				</ul>
			</li>
			<li>
				<span class="l3">账号管理</span>
			<ul class="menuList2" style="display:none">
					<li><a href="/user/realname/" onfocus="this.blur();">实名认证<img src="/skin/images/user/new.png" style="vertical-align:middle;padding-left:10px" /></a></li>

					<li><a href="/user/profile/" onfocus="this.blur();">资料维护</a></li>
				</ul>
			</li>
			<li>
				<span class="l1">商品管理</span>
                                        <ul class="menuList2" style="display:none">
					<li><a href="/user/userrate/" onfocus="this.blur();">费率查看</a></li>
                                </ul>
                        <li>
			<li>
				<span class="l1">批量销卡</span>
                                        <ul class="menuList2" style="display:none">
					<li><a href="/user/Pincard/" onfocus="this.blur();">点卡消耗</a></li>
                                 </ul>
                        <li>

				<span class="l4">信息管理</span>
				<ul class="menuList2" style="display:none">
					<li><a href="/user/message/" onfocus="this.blur();">站内消息</a></li>
					
				</ul>
                        <li>

				<span class="l4">安全中心</span>
				<ul class="menuList2" style="display:none">
					<li><a href="/user/password/" onfocus="this.blur();">修改密码</a></li>
					<li><a id="linshouji" runat="server" onfocus="this.blur();">绑定手机</a></li>
					<li><a id="linemail" runat="server" onfocus="this.blur();">安全邮箱</a></li>
					<li><a href="/user/awalpassword/" onfocus="this.blur();">提现密码</a></li>
					
				</ul>
                        <li>

				<span class="l4">接入中心</span>
				<ul class="menuList2" style="display:none">
					<li><a href="/user/api/" onfocus="this.blur();">资料下载</a></li>
                                </ul>

			</li>
		</ul>

	</div>



    </td>
    <td valign="top" class="r">

      <div class="title02">余额提现<a href="/user/cashcoupon/" class="Annkela"><img src="/skin/images/User/Icon/withdrawal_manage.png"/>提现记录</a></div>
    <form action="/user/withdrawal/post.aspx" method="post" id="form" target="_blank">
        <input type="hidden" name="a" value="post" />

        <input id="min" type="hidden" value='<%=tixianedu %>' />
        <input id="rate" type="hidden" value="<%=shouxufei %>" />
        <input id="multiple" type="hidden" value="1" />
        <input id="balance" type="hidden" value=".3" />


        <table class="V_tb2">
          <tr class="td1">
            <th>收款账户：</th>
            <td class="payment-td">
                <asp:Label ID="banktex" runat="server"></asp:Label>
              
              <div class="more-methods">
                <a href="/user/verify/addbank.aspx" onfocus="this.blur();">
                  添加新的收款账户
                  <i class="more-methods-plus">+</i>
                </a>
              </div>
              <div class="clear-float"></div>
            </td>
          </tr>
          <tr class="td1">
            <th>结算方式：</th>
            <td>（网银：<span class="account-balance">T + <%=wangyinT %></span>）
               &nbsp; &nbsp;（QQ钱包：<span class="account-balance">T + <%=qqT %></span>）
              &nbsp; &nbsp; （支付宝：<span class="account-balance">T + <%=alipayT %></span>）
              &nbsp; &nbsp; （微信：<span class="account-balance">T + <%=weixinT %></span>）
            </td>
          </tr>
          <tr class="td1">
            <th>账户余额：</th>
            <td><span class="account-balance">
                <%=zongyue%></span>&nbsp;元 &nbsp;&nbsp; 不可提现金额(T+1):&nbsp;<span class="account-balance"><asp:Label ID="litTodayIncome" runat="server"></asp:Label></span>&nbsp;元</td>
          </tr>
          <tr class="td1">
            <th>可提现余额：</th>
            <td><span class="account-balance">
                <%=balancea %></span>&nbsp;元</td>
          </tr>
          <tr class="td1">
            <th>提现金额：</th>
            <td>
              <input type="text" name="money" class="V_input3" id="withdrawMoney" maxlength="8" /> 元 <span class="poundage-reduced">（最小提现金额为<%=tixianedu %>元，必须为1元的倍数）</span>
            </td>
          </tr>
          <tr class="td1">
            <th>手续费：</th>
            <td>
              <span id="userPoundage">0.00</span> 元 <span class="poundage-reduced">（提现金额的<%=shouxufei %>%）</span>
            </td>
          </tr>
          <tr class="td1">
            <th>实际到账金额：</th>
            <td><span id="actualToAccount">0.00</span> 元 <span class="poundage-reduced">（已扣除手续费）</span></td>
          </tr>
           <tr class="td1">
            <th>提现密码：</th>
            <td>
              <input type="password" name="Password2" class="V_input3" id="Password2" maxlength="18" />
            </td>
          </tr>
          <tr class="td1">
            <th></th>
            <td><input type="button" value="确认提现" class="V_btn4 submit ajaxSubmit_apply" /></td>
          </tr>
        </table>
        <input type="hidden" name="accountID" value="" id="accountID">
</form>
    </td>
  <SCRIPT LANGUAGE="JavaScript">
      $(function() {
          $(".td1").each(function(i) { this.style.backgroundColor = ['#fff', '#fafafa'][i % 2] })
      })
  </SCRIPT>

</table>
    
</body>
</html>
