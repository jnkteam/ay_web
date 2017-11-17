<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="OriginalStudio.WebUI.User.withdrawal.index" %>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="charset" content="utf-8" />
    <meta http-equiv="Expires" content="0" /> 
    <meta http-equiv="Cache-Control" content="no-cache" /> 
    <meta http-equiv="Pragma" content="no-cache" /> 
    <title><%=SiteName%></title>
    <link href="/css2.0/allcss.css" rel="stylesheet" type="text/css" />
    <script src="/js2.0/alljs.js" type="text/javascript"></script>
    <script src="/js2.0/functions.js" type="text/javascript"></script>
    <script src="/static/dialog/jquery.dialog.js?skin=default" type="text/javascript"></script>
    <script src="/static/dialog/plugins/iframeTools.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            var POUNDAGE_RATE = <%=shouxufei %>; //手续费率
            var MULTI = 1;   //提现金额梯度
            var MIN_MONEY = <%=tixianedu %>;   //最小提现输入金额
            var MIN_POUNDAGE =<%=zuixiaoshouxu %>; //最小手续费
            var MIN_POUND =<%=zuigaoshouxu %>; //最小手续费

            $("#withdrawMoney")
                .keyup(function(e,isMulti){
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
                })
                .blur(function(){
                    $(this).trigger('keyup', [true]);
                });
            });
    </script>     
    <!--这句话放在最后面-->
    <script src="/skin/user/js/withdrawal_apply.js" type="text/javascript"></script>
              
</head>
<body>
    <header id="header" class="media">
        <a href="" id="menu-toggle"></a> 
        <a class="logo pull-left" href="Index.aspx"><%=UserName %></a>            
        <div class="media-body">
            <div class="media " id="top-menu">
                <div class="pull-left tm-icon">
                    <a data-drawer="messages" class="drawer-toggle" href="/user/message">
                        <i class="sa-top-message"></i>
                        <i class="n-count animated"><%=UserMsgCount %></i>
                        <span>消息</span>
                    </a>
                </div>                
                 <div class="pull-left" style="height:50px;line-height:50px; margin-left:100px;">
                    <span class="label">上次登录时间：<%=UserLastLoginTime %>   上次登录IP：<%=UserLastLoginIp %></span>
                    <span class="label" style="margin-left:80px;">余额：<span id="money"><%=UserBalance %></span><a href="javascript:" onclick="ajaxSubmit();" class="left-span color_tiann">刷新</a></span>
                </div>       
                                  
                <div id="time" class="pull-right">
                    <span id="hours"></span>
                    :
                    <span id="Span1"></span>
                    :
                    <span id="sec"></span>
                </div>                         
    
            </div>
        </div>
    </header>        
    <div class="clearfix"></div>        
    <section id="main" class="p-relative" role="main">
        <aside id="sidebar">                
            <div class="side-widgets overflow">
                <!-- Profile Menu -->
                <div class="text-center s-widget m-b-25 dropdown" id="profile-menu">
                    <a href="" data-toggle="dropdown">
                        <img class="profile-pic animated" src="/img/profile-pic.jpg" alt=""/>
                    </a>
                    <ul class="dropdown-menu profile-menu">
                        <li><a href="/user/message/">消息</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i></li>
                        <li><a href="/user/loginout.aspx">注销</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i></li>
                    </ul>
                    <h4 class="m-0 m-t-10"><%=mUserFullName%></h4>
                </div>
                    
                <!-- Calendar -->
                <div class="s-widget m-b-25">
                    <div id="sidebar-calendar"></div>
                </div>
                    
            </div>
                
            <!-- Side Menu -->
            <ul class="list-unstyled side-menu">
                <li class="active">
                    <a class="sa-side-home" href="/User/">
                        <span class="menu-item">商户首页</span>
                    </a>
                </li>
                <li class="dropdown">
                    <a class="sa-side-typography" href="/user/order/">
                        <span class="menu-item">交易管理</span>
                    </a>
                    <ul class="list-unstyled menu-item">
                        <li><a href="/user/order/">网银订单</a></li>
                        <li><a href="/user/ordercard/">点卡订单</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="sa-side-form" href="/user/money">
                        <span class="menu-item">财务管理</span>
                    </a>
                    <ul class="list-unstyled menu-item">
                        <li><a href="/user/money/">收支明细</a></li>
                        <% if (CanSettlesInFront) { %><li><a href="/user/withdrawal/">提现管理</a></li><% }%>                        
                        <li><a href="/user/cashcoupon/">结算记录</a></li>
                        <li><a href="/user/verify/">收款账户</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="sa-side-form" href="/user/realname">
                        <span class="menu-item">账号管理</span>
                    </a>
                    <ul class="list-unstyled menu-item">
                        <li><a href="/user/realname/">实名认证</a></li>
                        <li><a href="/user/profile/">资料维护</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="sa-side-form" href="/user/userrate">
                        <span class="menu-item">商品管理</span>
                    </a>
                    <ul class="list-unstyled menu-item">
                        <li><a href="/user/userrate/">费率查看</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="sa-side-form" href="/user/password/">
                        <span class="menu-item">安全中心</span>
                    </a>
                    <ul class="list-unstyled menu-item">
                        <li><a href="/user/password/">修改密码</a></li>
                        <li><a href="/user/mobile/">绑定手机</a></li>
                        <li><a href="/user/email/">安全邮箱</a></li>
                        <li><a href="/user/awalpassword/">提现密码</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="sa-side-typography" href="/user/api/">
                        <span class="menu-item">接入中心</span>
                    </a>
                    <ul class="list-unstyled menu-item">
                        <li><a href="/user/api/">资料下载</a></li>
                    </ul>
                </li>
            </ul>
        </aside>
        <!-- Content -->
        <section id="content" class="container">
            <form action="/user/withdrawal/post.aspx" method="post" id="form"  class="form-horizontal" role="form"  target="_blank">
                <h5 class="page-title">余额提现</h5>
                <input id="min" type="hidden" value='<%=tixianedu %>' />
                <input id="rate" type="hidden" value="<%=shouxufei %>" />
                <input id="multiple" type="hidden" value="1" />
                <input id="balance" type="hidden" value=".3" />
                <div class="block-area" id="tableHover">
                    <div class="table-responsive overflow">
                        <table class="table table-bordered table-hover tile view-table">
                            <tr>
                                <th class="view-title">收款账户：</th>
                                <td>
                                    <asp:Label ID="banktex" runat="server"></asp:Label>
                                    <div class="more-methods">
                                        <a href="/user/verify/addbank.aspx" onfocus="this.blur();">添加新的收款账户<i class="more-methods-plus">+</i></a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>结算方式：</th>
                                <td>
                                    <div class="col-lg-5">
                                        （网银：<span class="account-balance">T + <%=wangyinT %></span>）
                                        &nbsp; &nbsp;（QQ钱包：<span class="account-balance">T + <%=qqT %></span>）
                                        &nbsp; &nbsp; （支付宝：<span class="account-balance">T + <%=alipayT %></span>）
                                        &nbsp; &nbsp; （微信：<span class="account-balance">T + <%=weixinT %></span>）
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>账户余额：</th>
                                <td>
                                    <div class="col-lg-5">
                                        <span class="account-balance"><%=zongyue%></span>&nbsp;元 &nbsp;&nbsp; 不可提现金额(T+1):&nbsp;
                                        <span class="account-balance"><asp:Label ID="litTodayIncome" runat="server"></asp:Label></span>&nbsp;元
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>可提现余额：</th>
                                <td>
                                    <div class="col-lg-5"><span class="account-balance"><%=balancea %></span>&nbsp;元</div>
                                </td>
                            </tr>
                            <tr>
                                <th>提现金额：</th>
                                <td>
                                    <div class="col-lg-7 form-inline">
                                         <input type="text" name="money" class="form-control input-sm" id="withdrawMoney" maxlength="8" /><span class="form-label"> 元 </span>
                                         <span class="poundage-reduced form-label">（最小提现金额为<%=tixianedu %>元，必须为1元的倍数）</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>手续费：</th>
                                <td>
                                    <div class="col-lg-5"><span id="userPoundage">0.00</span> 元 <span class="poundage-reduced">（提现金额的<%=shouxufei %>%）</span></div>
                                </td>
                            </tr>
                            <tr>
                                <th>实际到账金额：</th>
                                <td>
                                    <div class="col-lg-5"><span id="actualToAccount">0.00</span> 元 <span class="poundage-reduced">（已扣除手续费）</span></div>
                                </td>
                            </tr>
                            <tr>
                                <th>提现密码：</th>
                                <td>
                                    <div class="col-lg-2"><input type="password" name="Password2" class="form-control input-sm" id="Password2" maxlength="18" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td><input type="button" value="确认提现" class="btn m-r-5 ajaxSubmit_apply" /></td>
                            </tr>
                        </table>
                        <input type="hidden" name="accountID" value="" id="accountID" />
                    </div>
                </div>
            </form>
        </section>
    </section>       
</body>
</html>