<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Sys.SiteInfo" ValidateRequest="false" Codebehind="SiteInfo.aspx.cs" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>



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


td {height:20px; line-height:20px; text-align: center; padding:0px; vertical-align:middle !important;}
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;}
.td1 {padding-right:3px;padding-left:3px;color:#999999;padding-bottom:0px;padding-top:5px;height:25px;}
.td2 {padding-right:3px;padding-left:8px;padding-top:5px; color: #333;background: #ecf0f5;}
.td_header {font-weight: bold; color: #333;background: #e8eaee;}
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
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
     <form id="form1" runat="server">
     <asp:HiddenField ID="hiddenNameValue" runat="server"  />
    <!-----------tab页面------------->
    <div class="row">
            <div class="col-xs-12">
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                 <% foreach (DataRow row in tableOptionsType.Rows){%>
                  <li class="<% if(Convert.ToInt32(row["type_id"]) == 1){%>active<%}%>"><a href="#fa-icons-<%=row["type_id"]%>" data-toggle="tab"><%=row["type_desc"]%></a></li>
                 <%}%>
                </ul>
                <div class="tab-content">
                  <!-- Font Awesome Icons -->

            <% foreach (DataRow row in tableOptionsType.Rows){%>
            <div class="tab-pane <% if(Convert.ToInt32(row["type_id"]) == 1){%>active<%}%>" id="fa-icons-<%=row["type_id"]%>">
            <table width="100%" border="0" cellspacing="1" cellpadding="3" class="table table-bordered table-hover dataTable">
            <tr>
                <td width="23%" class="td_header"> 参数类型</td>
                <td width="23%" class="td_header"> 参数代码</td>
                <td width="23%" class="td_header"> 参数描述</td>
                <td width="23%" class="td_header"> 参数值</td>
            </tr>
            <% foreach (DataRow rowVal in allOptionsSet.Tables[Convert.ToString(row["type_id"])].Rows){%>
            <tr>
                <td  class="td2"> <%=rowVal["type_desc"]%></td>
                <td  class="td2"> <%=rowVal["option_code"]%></td>
                <td  class="td2"> <%=rowVal["option_desc"]%></td>
                <td  class="td1">
                <% if(Convert.ToString(rowVal["select_items"]) == ""){%>
                    <div class="input-group"><input class="form-control input_item" name="<%=rowVal["option_code"]%>" value="<%=rowVal["option_value"]%>" type="text"/> </div>
                <%}else{
                        string item = Convert.ToString(rowVal["select_items"]);
                        string[] itemArr=item.Split('|');
                        for (int itemArrCount = 0; itemArrCount < itemArr.Length; itemArrCount++)
                        {
                        string singleItem = itemArr[itemArrCount];
                        string[] singleItemArr = singleItem.Split(':');
                %>

                <input class="input_item" <% if(singleItemArr[0] == Convert.ToString(rowVal["option_value"])){%>checked<%}%> name="<%=rowVal["option_code"]%>" value="<%=singleItemArr[0]%>" type="radio"><%=singleItemArr[1]%> &nbsp;
               

                <%}}%>
                </td>
            </tr>
             <%}%>
            </table>
            </div>
            <%}%>
                  <!-- /#fa-icons -->

                  <!-- glyphicons-->
                  <!--<div class="tab-pane" id="glyphicons">-->

                   <!--12222-->
                  <!--</div>-->
                  <!-- /#ion-icons -->

                </div>
                <div style="text-align: center; height: 70px; line-height: 40px;">
                 <asp:Button ID="btnAdd" Class="button btn  btn-danger"  runat="server" Text="提 交" OnClick="btnUpdate_Click" OnClientClick="return beforeSubmit()"></asp:Button>
                 </div>
                <!-- /.tab-content -->
              </div>
              <!-- /.nav-tabs-custom -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
    <!-----------tab页面------------->

    </form>

</section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>

<script type="text/javascript">
    function beforeSubmit() {



        var nameValueMap = "<?xml version='1.0' encoding='utf-8'?><HH>";
        var datas = [];
        $('.input_item').each(function(){
            if($(this).attr("type") == "radio"){
            var name =   $(this).attr('name');
            var val = $("input[name="+name+"]:checked").val();
            nameValueMap +="<"+name+">"+val+"</"+name+">";
            }else{
                nameValueMap +="<"+$(this).attr("name")+">"+$(this).val()+"</"+$(this).attr("name")+">";
            }

        });
        var stringJson = JSON.stringify( datas );
        //console.info(checkboxSelectText);
        nameValueMap +="</HH>";
        //console.info(nameValueMap);
        //return false;
        $("#hiddenNameValue").val(nameValueMap);

    }
</script>