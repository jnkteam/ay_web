<%@ Page Language="C#" MasterPageFile="~/User/Site1.Master" AutoEventWireup="True" CodeBehind="read.aspx.cs" Inherits="KuaiCard.WebUI.User.message.read" Title="收款帐号管理" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script>
  $(function(){

        $("#setread").click(function(){

            var ids="";
            $("[name='id']").each(function(){
              if ($(this).attr("checked")){
                ids += $(this).val() + ",";
              }
            });
            if (ids.length>0){
              ids = ids.substring(0, ids.length-1);
            }

            if (ids){
                core.ajaxload({
                url: '/user/Service/setread.ashx?id=' + ids
                });
            }

        });

  });

</script>

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
  </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <td valign="top" class="r">
    	
      <div class="title02">站内消息</div>

    <div class="clear"></div>
    <ul class="tab-head">
      <li class="tab-head-item">
        <a href="/user/message/" class="tab-head-item-text">全部消息</a>
      </li>
      <li class="tab-head-item">
        <a href="/user/message/unread.aspx" class="tab-head-item-text">未读消息</a>
      </li>
      <li class="tab-head-item active">
        <a href="/user/message/read.aspx" class="tab-head-item-text">已读消息</a>
      </li>
      <li class="clear"></li>
    </ul>

      <table class="ipList message-table" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="title tr-header">
          <th width="50"></th>
          <th width="42%">标题</th>
          <th width="30%">发送时间</th>
          <th>详情</th>
        </tr>

      <asp:Repeater ID="msg_data" runat="server"  onitemdatabound="rptfeedback_ItemDataBound">
                    <ItemTemplate>
        <tr class="td1 message-tr-item">
          <td>
            <span class="message-checkbox">
              <input type="checkbox" name="id" value="<%# Eval("id")%>">
            </span>
          </td>
          <td>
          <div class="message-title message-read">
              <a><%# Eval("msg_content")%>  </a>
            </div>
          </td>
          <td> <%# Eval("msg_addtime", "{0:yyyy-MM-dd HH:mm:ss}")%></td>
          <td>
            <a href="/user/message/content.aspx?id=<%# Eval("id")%>">查看</a>
          </td>
        </tr>
      </ItemTemplate>
             </asp:Repeater>  
      </table>
      
      <div class="clear"></div>

        <table width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="left">

    <div class="message-control">
      <span class="message-control-checkbox-container">
        <span class="message-checkbox"></span>
        &nbsp;&nbsp;
        全选
      </span>
      &nbsp; &nbsp;
      <a href="javascript:void(0)" id="setread" class="message-control-button message-control-button--disable">标记已读</a>
    </div>

            </td>
            <td class="center">&nbsp;</td>
            <td class="right" align="right">
              <div class="pageList">
                  <div class="pagebreak">
                    <table cellspacing="0" cellpadding="0"><tr><td class="page_text page_home"> 
                    <webdiyer:AspNetPager CssClass="pagination" ID="Pager1" runat="server"  CustomInfoHTML="共%PageCount%页/%RecordCount%条"
                                CustomInfoTextAlign="Left" FirstPageText="首页" HorizontalAlign="Right" LastPageText="末页"
                                NavigationToolTipTextFormatString="跳转{0}页" NextPageText="下一页" PageIndexBoxType="TextBox"
                                PageSize="20" PrevPageText="上一页" ShowBoxThreshold="50" 
                                 SubmitButtonText="GO&gt;&gt;"
                                TextAfterPageIndexBox="页" TextBeforePageIndexBox="跳到" Width="900px" Height="30px" CurrentPageButtonClass="active" 
                                OnPageChanged="Pager1_PageChanged" CustomInfoSectionWidth="20%" 
                                 PageIndexBoxClass="Pager1_input" PageIndexBoxStyle="width:20px">
                            </webdiyer:AspNetPager></td></tr></table>
                  </div>
               </div>
            </td>
          </tr>
        </table>
    <script charset="utf-8">
      $(function () {
        var CHECKBOX_SELECTOR = ".message-checkbox";
        var CHECKED_CLASSNAME = "message-checkbox--checked";
        var CONTROL_BUTTON_DISABLE_CLASSNAME = "message-control-button--disable";
        var $_messageTable = $(".message-table");
        var $_allCheckboxInput = $_messageTable.find(CHECKBOX_SELECTOR).children("input");
        var $_controlContainer = $(".message-control");
        var $_controlCheckboxContainer = $_controlContainer.children(".message-control-checkbox-container");
        var $_controlButton = $_controlContainer.children(".message-control-button");
        
        // 更新 控制按钮（全选/非全选、删除、标记已读）的显示状态
        var updateControlElementStatus = function () {
          var isAllChecked = true;
          var isOneChecked = false;
          
          $_allCheckboxInput.each(function () {
            if (!$(this).prop("checked")) {
              isAllChecked = false;
            }
            else {
              isOneChecked = true;
            }
          });
          
          var $_controlCheckbox = $_controlCheckboxContainer.find(CHECKBOX_SELECTOR);
          if (isAllChecked) {
            $_controlCheckbox.addClass(CHECKED_CLASSNAME);
          }
          else {
            $_controlCheckbox.removeClass(CHECKED_CLASSNAME);
          }
          
          if (isOneChecked) {
            $_controlButton.removeClass(CONTROL_BUTTON_DISABLE_CLASSNAME);
          }
          else {
            $_controlButton.addClass(CONTROL_BUTTON_DISABLE_CLASSNAME);
          }
        };
        // 根据checkbox更新父容器span的显示状态
        var updateCheckboxStatus = function ($_checkbox) {
          $_checkbox.each(function () {
            var $_checkbox = $(this);
            var $_checkboxSpan = $_checkbox.parent();
            var isChecked = $_checkbox.prop("checked");
            
            if (isChecked) {
              $_checkboxSpan.addClass(CHECKED_CLASSNAME);
            }
            else {
              $_checkboxSpan.removeClass(CHECKED_CLASSNAME);
            }
          });
          
          updateControlElementStatus();
        };
        
        // 点击表格行 使该行复选框选中
        $_messageTable.on("click", ".message-tr-item", function () {
          var $_checkboxInput = $(this).find(CHECKBOX_SELECTOR).children("input");
          
          $_checkboxInput.prop("checked", !$_checkboxInput.prop("checked"));
          updateCheckboxStatus($_checkboxInput);
        });
        // 全选/全不选 控制
        $_controlCheckboxContainer.click(function () {
          // 表格没有记录时，不响应 全选/全不选 事件
          if (!$_allCheckboxInput.length) {
            return;
          }
          
          var $_controlCheckboxSpan = $(this).find(CHECKBOX_SELECTOR);
          $_controlCheckboxSpan.toggleClass(CHECKED_CLASSNAME);
          
          $_allCheckboxInput.prop("checked", $_controlCheckboxSpan.hasClass(CHECKED_CLASSNAME));
          updateCheckboxStatus($_allCheckboxInput);
          
          updateControlElementStatus();
        });
      });
    </script>
    
          <!-- 隔行变色 -->
      <SCRIPT LANGUAGE="JavaScript">
          $(function(){
           $(".td1").each(function(i){   this.style.backgroundColor  =  ['#fff','#fafafa'][i%2]   })   
          })
          </SCRIPT>

    </td>
</asp:Content>
