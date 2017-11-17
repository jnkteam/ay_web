<%@ Page Language="C#" MasterPageFile="~/User/Site1.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="OriginalStudio.WebUI.User.Pincard.index" Title="卡类消耗" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .tab-head {
      margin: 20px 0;
      border-bottom: 1px solid #d9d9d9;
    }
    .tab-head-item {
      float: left;
      margin-right: -1px;
      margin-bottom: -1px;
      border: 1px solid #d9d9d9;
      background: #f2f8f9;
    }
    .tab-head-item.active,
    .tab-head-item:hover {
      border-top-color: #009fd9;
      border-bottom-color: white;
      background: white;
    }
    .tab-head-item-text {
      display: inline-block;
      width: 124px;
      height: 35px;
      border: 2px solid transparent;
      line-height: 35px;
      text-align: center;
      font-size: 14px;
      color: #333;
    }
    .tab-head-item.active .tab-head-item-text,
    .tab-head-item-text:hover {
      color: #0a8dca;
      border-top-color: #009fd9;
    }
    .message-table .tr-header th {
      padding-left: 10px;
      text-align: left;
      font-weight: normal;
      color: #afb0b0;
    }
    .message-tr-item {
      cursor: pointer;
    }
    .message-title {
      padding-left: 18px;
      background: url(/skin/images/User/Icon/point_light.png) no-repeat left center;
    }
    .message-title a {
      color: #333;
    }
    .message-title a:hover {
      color: #f30;
    }
    .message-read {
      background-image: url(/skin/images/User/Icon/point_dark.png);
    }
    .message-checkbox {
      display: inline-block;
      width: 16px;
      height: 16px;
      margin-left: 21px;
      background: url(/skin/images/User/Icon/checkbox_unchecked.png) no-repeat center;
    }
    .message-checkbox--checked {
      background-image: url(/skin/images/User/Icon/checkbox_checked.png);
    }
    .message-checkbox input {
      display: none;
    }
    .message-control {

      padding-left: 10px;
    }
    .message-control-checkbox-container {
      display: inline-block;
      line-height: 28px;
      cursor: pointer;
    }
    .message-control-checkbox-container .message-checkbox {
      vertical-align: sub;
      *vertical-align: middle;
    }
    .message-control-button {
      display: inline-block;
      height: 26px;
      padding: 0 15px;
      border: 1px solid #009fd9;
      border-radius: 1px;
      line-height: 26px;
      color: #009fd9;
    }
    .message-control-button:hover {
      background: #009fd9;
      color: white;
    }
    .message-control-button--disable,
    .message-control-button--disable:hover {
      background: #f2f8f9;
      border-color: #cccccc;
      color: #898b8b;
      cursor: default;
    }
    .submit a:hover{
color: white;
background: #FF8F17;
}
    .submit a
    {
margin-top: 16px;
margin-bottom: 23px;
border: 1px solid #FF8F17;
white-space: nowrap;
font-size: 14px;
color: #FF8400;
margin-right: 10px;
padding: 2px 20px;}
.submit a.cur{
color: white;
background: #FF8F17;
}
.Annkela:hover{
color: white;
background: #009FD9;
}
.Annkela 
{
margin-top: 16px;
margin-bottom: 23px;
border: 1px solid #009FD9;
white-space: nowrap;
font-size: 14px;
color: #009FD9;
margin-right: 10px;
padding: 2px 20px;
}

  </style>
   <script type="text/javascript">
       
       function cleanup() {
           var cardcontent = $("#arr_content").val();
           if (cardcontent == '') {
               alert('请输入卡号和密码');
               $('#arr_content').focus();
               return false;
           }
           var sSource = '/user/Service/cleanupcardcontent.ashx?t=' + Math.random();
           var postData = 'cardcontent=' + encodeURIComponent(cardcontent);

           $.ajax({
               type: "post",
               dataType: "json",
               timeout: 10000,
               url: sSource,
               data: postData,
               success: function(json) {

                   if (json.result == 'ok') {
                       $('#arr_content').val(json.msg);
                   } else {
                       //dialog_simple_fail(json.msg);
                       alert(json.msg);
                   }
               },
               error: function(a, b) {
               }
           })

           return false;
       }

       function clearchar() {
           var str = $("#arr_content").val();
           str = str.replace(eval('/' + $('#customchar').val() + '/g'), '');
           $("#arr_content").val(str);
           $("#customchar").val('');
       }

</script>
<script type="text/javascript">    
$(document).ready(function() {
        $("#money a").click(function() {
        $(this).addClass("cur").siblings().removeClass("cur");

        });
       
        $("#money a").click(function() {
            var value = $(this).attr("name");
            $("#ctl00_ContentPlaceHolder1_xk_faceValue").val(value);
            $('#mutixmoney').html(value);
        });
    });
   
    </script>
<script type="text/javascript" src="/javascript/app_user_commonS.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <td valign="top" class="r">
    	
      <div class="title02">卡类消耗</div>

    <div class="clear"></div>
    <ul class="tab-head">
      <li class="tab-head-item active">
        <a href="/user/Pincard/" class="tab-head-item-text">智能销卡</a>
      </li>
      <li class="tab-head-item">
        <a href="/user/Pincard/card/?cid=103" class="tab-head-item-text">普通销卡</a>
      </li>
      <li class="tab-head-item">
        <a href="/user/ordercard/" class="tab-head-item-text">销卡记录</a>
      </li>
      <li class="clear"></li>
    </ul>
     <div id="form_Groupscard" >
    <input type="hidden" id="cardid" name="cardid" value="allcard" />
	<asp:HiddenField ID="xk_faceValue" runat="server" />
    <table class="V_tb2">
              <!-- 隔行变色 -->
              <SCRIPT LANGUAGE="JavaScript">
              $(function(){
               $(".td1").each(function(i){   this.style.backgroundColor  =  ['#fff','#fafafa'][i%2]   })   
              })
              </SCRIPT>
          <tr class="td1">
            <th><font style="color:#F00;line-height: 80px;">*</font>选择面值</th>
            <td class="submit" id="money">
               <a href="#" class="" name= "5" >5元</a><a  name= "10" href="#" class="">10元</a><a name= "15" href="#" class="">15元</a><a name= "20"  href="#" class="">20元</a><a name= "30" href="#" class="">30元</a><a name= "50" href="#" class="">50元</a>
               <a href="#" name= "100"  class="cur">100元</a><a href="#" name= "200" class="">200元</a><a href="#" name= "300" class="">300元</a><a href="#" name= "500" class="">500元</a><a href="#" name= "1000" class="">1000元</a>
            </td>
          </tr>
          <tr class="td1">
            <th><font style="color:#F00">*</font>输入卡密</th>
            <td><textarea class="V_ta1" name="arr_content" id="arr_content" cols="75" rows="16" onBlur="this.value=this.value.replace(/[\u4E00-\u9FA5]/g,'')" onmouseover="this.style.borderColor='#7ECAF1'" onmouseout="this.style.borderColor='#ebebeb'"></textarea></td>
          </tr>
          <tr class="td1">
            <th></th>
            <td>已经输入<span id="Groupscount" class="txtc" style="font-size:18px">0</span> 张&nbsp;<span id="mutixmoney" style="font-weight:bold;color:#FF6600;font-size:18px;padding:0px;"><%=defaultvalue%></span>的充值卡，每次最多可提交100张</font></td>
          </tr>
          <tr class="td1">
            <th><font style="color:#F00">*</font>卡密整理</th>
            <td>
                <input id="customchar" name="customchar" placeholder="自定义去除非法字符" class="V_input1" style="width:200px" >
					<a href="javascript:" onclick="clearchar();" class="Annkela">去除字符</a>
					<a  href="javascript:" onclick="cleanup();" class="Annkela" >整理卡密</a>
           </td>
          </tr>
          <tr class="td1">
            <th><font style="color:#F00">*</font>操作</th>
            <td>
               <button type="button" class="button green" style="font-size:16px;margin-left:5px;width:230px;height:40px;font-weight:bold;background: #FF8F17;
color: white;">我已经选好面值,确认提交</button>
            </td>
          </tr>
          <tr class="td1">
            <th>提交说明</th>
            <td><div id="Groupsload"></div><div class="b_m_t txtr dis-n" id="Groupsinfo"></div><div id="Groupsinfo_01" style="margin-bottom:5px"></div><div id="Groupsinfo_02" style="margin-bottom:5px"></div><div id="Groupsinfo_03" style="margin-bottom:5px"></div><div id="Groupsinfo_04" style="margin-bottom:5px"></div><div id="Groupsinfo_05" style="margin-bottom:5px"></div><div id="Groupsinfo_06" style="margin-bottom:5px"></div><div id="Groupsinfo_07" style="margin-bottom:5px"></div><div id="Groupsinfo_08" style="margin-bottom:5px"></div><div id="Groupsinfo_09" style="margin-bottom:5px"></div><div id="Groupsinfo_10" style="margin-bottom:5px"></div><div id="Groupsinfo_11" style="margin-bottom:5px"></div><div id="Groupsinfo_12" style="margin-bottom:5px"></div><div id="Groupsinfo_13" style="margin-bottom:5px"></div><div id="Groupsinfo_14" style="margin-bottom:5px"></div><div id="Groupsinfo_15" style="margin-bottom:5px"></div><div id="Groupsinfo_16" style="margin-bottom:5px"></div><div id="Groupsinfo_17" style="margin-bottom:5px"></div><div id="Groupsinfo_18" style="margin-bottom:5px"></div><div id="Groupsinfo_19" style="margin-bottom:5px"></div><div id="Groupsinfo_20" style="margin-bottom:5px"></div>
		<div id="Groupsinfo_21" style="margin-bottom:5px"></div><div id="Groupsinfo_22" style="margin-bottom:5px"></div><div id="Groupsinfo_23" style="margin-bottom:5px"></div><div id="Groupsinfo_24" style="margin-bottom:5px"></div><div id="Groupsinfo_25" style="margin-bottom:5px"></div><div id="Groupsinfo_26" style="margin-bottom:5px"></div><div id="Groupsinfo_27" style="margin-bottom:5px"></div><div id="Groupsinfo_28" style="margin-bottom:5px"></div><div id="Groupsinfo_29" style="margin-bottom:5px"></div><div id="Groupsinfo_30" style="margin-bottom:5px"></div><div id="Groupsinfo_31" style="margin-bottom:5px"></div><div id="Groupsinfo_32" style="margin-bottom:5px"></div><div id="Groupsinfo_33" style="margin-bottom:5px"></div><div id="Groupsinfo_34" style="margin-bottom:5px"></div><div id="Groupsinfo_35" style="margin-bottom:5px"></div><div id="Groupsinfo_36" style="margin-bottom:5px"></div><div id="Groupsinfo_37" style="margin-bottom:5px"></div><div id="Groupsinfo_38" style="margin-bottom:5px"></div><div id="Groupsinfo_39" style="margin-bottom:5px"></div><div id="Groupsinfo_40" style="margin-bottom:5px"></div><div id="Groupsinfo_41" style="margin-bottom:5px"></div><div id="Groupsinfo_42" style="margin-bottom:5px"></div><div id="Groupsinfo_43" style="margin-bottom:5px"></div><div id="Groupsinfo_44" style="margin-bottom:5px"></div><div id="Groupsinfo_45" style="margin-bottom:5px"></div>
		<div id="Groupsinfo_46" style="margin-bottom:5px"></div><div id="Groupsinfo_47" style="margin-bottom:5px"></div><div id="Groupsinfo_48" style="margin-bottom:5px"></div><div id="Groupsinfo_49" style="margin-bottom:5px"></div><div id="Groupsinfo_50" style="margin-bottom:5px"></div><div id="Groupsinfo_51" style="margin-bottom:5px"></div><div id="Groupsinfo_52" style="margin-bottom:5px"></div><div id="Groupsinfo_53" style="margin-bottom:5px"></div><div id="Groupsinfo_54" style="margin-bottom:5px"></div><div id="Groupsinfo_55" style="margin-bottom:5px"></div><div id="Groupsinfo_56" style="margin-bottom:5px"></div><div id="Groupsinfo_57" style="margin-bottom:5px"></div><div id="Groupsinfo_58" style="margin-bottom:5px"></div><div id="Groupsinfo_59" style="margin-bottom:5px"></div><div id="Groupsinfo_60" style="margin-bottom:5px"></div>
		</td>
          </tr>
        </table>
    <div class="V_con1">
<p>1. 程序自动判断充值卡类型,无需手动选择；<br/>2. 程序自动整理卡号卡密,去除非法字符只保留卡密。<br/>3. 面值不同的充值卡，可以一起提交<br/>4. 默认面值为100，大面值注意自己选择面值<br/> 5. 自定义非法字符,可以指定批量去除某字符<br/>6. 批量提交一次最多100张卡,系统只提取前100张<br/>7. 如果智能提交判断错误，请切换到普通提交</p>

    </div>
    </td>
    
      </td>

</asp:Content>
