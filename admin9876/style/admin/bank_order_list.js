
//数据查询=======================
//$("#search").click(function() {
function search(page) {


    $.ajax({
        method: 'POST',
        cache: false,
        contentType: "application/json",
        url: './BankOrderList.ashx',
        data: {
            txtOrderId       : $("#txtOrderId").val(),
            txtuserid        : $("#txtuserid").val(),
            ddlChannelType   : $("#ddlChannelType").val(),
            ddlsupp          : $("#ddlsupp").val(),
            txtUserOrder     : $("#txtUserOrder").val(),
            txtSuppOrder     : $("#txtSuppOrder").val(),
            ddlOrderStatus   : $("#ddlOrderStatus").val(),
            ddlNotifyStatus  : $("#ddlNotifyStatus").val(),
            StimeBox         : $("#StimeBox").val(),
            EtimeBox         : $("#EtimeBox").val(),
            page             : page,
        },
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        beforeSend: function () {
            $("#search").html("查询中...");
        },
        success: function (data, textStatus) {
            data = JSON.parse(data);
            $("#search").html("查询");


            if (data['success']) {
                //console.info(data['data']);

                var dtCount = data['data'].length;
                var html = "";
                for (var i = 0; i < dtCount; i++) {


                    html+= "<tr height='30'  ondblclick='javascript:sendInfo()'>";
                    html+= "<td> "+data['data'][i]['userid']+"</td>";
                    html+= "<td> "+data['data'][i]['orderid']+"</td>";
                    html+= "<td> "+data['data'][i]['orderTypeName']+"</td>";
                    html+= "<td> "+data['data'][i]['TypeName']+"</td>";
                    html+= "<td> "+data['data'][i]['refervalue']+"</td>";
                    html+= "<td> "+data['data'][i]['payAmt']+"</td>";
                    html+= "<td> "+data['data'][i]['supplierAmt']+"</td>";
                    html+= "<td> "+data['data'][i]['profits']+"</td>";
                    html+= "<td> "+data['data'][i]['completetime']+"</td>";
                    html+= "<td> "+getStatusStyle(data['data'][i]['status'])+"</td>";
                    html+= "<td> "+getNotifystatStatusStyle(data['data'][i]['notifystat'])+"</td>";
                    html+= "<td> "+data['data'][i]['supplierName']+"</td>";
                    html+= "<td> "+data['data'][i]['server']+"</td>";

                    html+= "<td>"+getHandler(data['data'][i]['status'],data['data'][i]['orderid'],data['data'][i]['supplierId'],data['data'][i]['refervalue'],data['data'][i]['difftime'])+"</td></tr>";



                };
                $("#data").html(html);
                //console.info("总记录："+data['count'][0]['rec_Count']);
                //console.info("总页数："+data['count'][0]['page_Count']);
                //console.info("当前页："+data['index']);

                pager(data['count'][0]['rec_Count'],data['count'][0]['page_Count'],data['index']);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            errorMsg = '';
        }
    });



}

//分页操作
function pager(allCount , pageCount, index){
    var pagerHtml = "";
    var prePage  = parseInt(index) - 1;
    var nextPage = parseInt(index) + 1;
    //构建分页区间
    var leftRange  = parseInt(index) - 5;
    var rightRange = parseInt(index) + 5;
    leftRange = leftRange <=0 ? 1 :leftRange;
    rightRange = rightRange >=pageCount ? pageCount :rightRange;

    pagerHtml +="<tr style=''>";
    pagerHtml +="<td height='22' colspan='10'>";
    pagerHtml +="<div ID='Pager1' style='height:30px;width:100%;text-align:right;'>";
    pagerHtml +="<div align='left' style='height:30px;float:left;width:40%;'>";
    pagerHtml +="<div id ='a' class='btn-group'><button type='button' class='btn btn-default'>总记录数："+allCount+"</button>";
    pagerHtml +="<button type='button' class='btn btn-default'>总页数："+pageCount+"</button>";
    pagerHtml +="<button type='button' class='btn btn-default'>当前页："+index+"</button></div></div>";
    pagerHtml +="<div align='right' style='width:60%;float:left;'>";
    pagerHtml +="<a href='javascript:search(1)' style='margin-right:5px;'>首页</a>";
    if(index == 1){
        pagerHtml +="<a disabled='disabled' style='margin-right:5px;'>上一页</a>";
    }else{
        pagerHtml +="<a href='javascript:search("+prePage+")' style='margin-right:5px;'>上一页</a>";
    }
    if(index == pageCount){
        pagerHtml +="<a disabled='disabled' style='margin-right:5px;'>下一页</a>";
    }else{
        pagerHtml +="<a href='javascript:search("+nextPage+")' style='margin-right:5px;'>下一页</a>";
    }
    pagerHtml +="<a href='javascript:search("+pageCount+")' style='margin-right:5px;'>末页</a>&nbsp;&nbsp;";
    pagerHtml +="<select name='Pager1_input' id='Pager1_input'>";
    for(var i = leftRange; i<=rightRange; i++){
        var select = index == i ? "selected=true" : '';
        pagerHtml +="<option  value='"+i+"' "+select+" >"+i+"</option>";
    }

    pagerHtml +="</select></div></div></td></tr>";

    $("#pager").html(pagerHtml);
    $("#Pager1_input").change(function(){search(this.value);});

}




//获取操作
function getHandler(status, orderid, supplierId, refervalue, difftime) {
    var orderid = orderid+'';
    var button1 = "<input type='submit' onclick=handleButton('btnReissue','"+orderid.toString()+"') ID='btnReissue'  value='补发'  title='手动回发' class='button btn btn-xs  btn-info' />";
    var button2 = "<input type='submit' onclick=handleButton('btnRest','"+orderid.toString()+"','"+supplierId.toString()+"','"+refervalue.toString()+"') ID='btnRest'  value='补单'  title='' class='button btn btn-xs  btn-info' />";
    var button3 = "";
    var button4 = "<input type='submit' onclick=handleButton('btnReDeduct','"+orderid.toString()+"') ID='btnReDeduct'  value='还'  title='' class='button btn btn-xs  btn-info' />";
    var print   = "&nbsp;<a title='打印' alt='打印' style='font-size:15px; color:#00c0ef'  href='BankOrderPrint.aspx?ID=3813646' target='_blank' ><i class='fa fa-print'></i></a>";
    var handlerStr = "";
    switch (status)
    {
        case "1":
            handlerStr+= button2;

            break;

        case "2":
        {
            handlerStr+= button1;

            if (difftime > 0)
            {

                button3 = "<input type='submit' onclick=handleButton('btnDeduct','"+orderid+"') ID='btnDeduct'  value='扣'  title='扣量' class='button btn btn-xs  btn-info' />";
            }
            else if ((difftime > 0.0) && (difftime <= 0))
            {

                button3 = "<input type='submit' onclick=handleButton('btnDeduct','"+orderid+"') ID='btnDeduct'  value='危险'  title='' class='button btn btn-xs  btn-info' />";
            }
            else
            {

                button3 = "<input type='submit' onclick=handleButton('btnDeduct','"+orderid+"') ID='btnDeduct'  value='不能'  title='' class='button btn btn-xs  btn-info' />";
            }
            handlerStr+= button3;
            break;
        }
        case "4":
            handlerStr+= button1;

            break;

        case "8":
            handlerStr+= button1;
            handlerStr+= button4;
            break;
    }
    handlerStr+=print;
    return handlerStr;

}
/**
 * @param type
 * @param orderid
 * @param supplierId
 * @param refervalue
 */
function handleButton(type,orderid,supplierId,refervalue) {


    $.ajax({
        method: 'POST',
        cache: false,
        contentType: "application/json",
        url: './BankOrderListHandle.ashx',
        data: {
            type        : type,
            orderid     : orderid,
            supplierId  : supplierId,
            refervalue  : refervalue,

        },
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        beforeSend: function () {

        },
        success: function (data, textStatus) {
            data = JSON.parse(data);

            if (data['result'] == "redirectUri") {
                window.location.href = data['url'];
            }else {
                alert(data['result']);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            errorMsg = '';
        }
    });



}
//增加数据 状态样式 方法
function getStatusStyle(status) {

    var statusCss = "";
    switch (status)
    {
        case "1":
            statusCss = "<a title='处理中' style='color:darkorange' href='javascript:void(0)'> <i class='fa   fa-hourglass-end'></i></a>";
            break;

        case "2":

            statusCss = "<a title='已完成' style='color:#1db283' href='javascript:void(0)'> <i class='fa  fa-check-circle'></i></a>";
            break;

        case "4":

            statusCss = "<a title='失败'  style='color:#ff4a4a' href='javascript:void(0)'> <i class='fa  fa-times-circle'></i></a>";
            break;

        case "8":
            statusCss = "<a title='扣量' style='color:#00c0ef' href='javascript:void(0)'> <i class='fa    fa-plus-circle'></i></a>";
            break;
        default:
            statusCss = "<a title='？' style='color:#000' href='javascript:void(0)'> <i class='fa   fa-question-circle'></i></a>";

            break;
    }


    return statusCss;
}



//增加数据 状态样式 方法
function getNotifystatStatusStyle(status)
{

    var statusCss = "";
    switch (status)
    {
        case "1":
            statusCss = "<a title='处理中' style='color:darkorange' href='javascript:void(0)'> <i class='fa   fa-hourglass-end'></i></a>";
            break;

        case "2":

            statusCss = "<a title='已完成' style='color:#1db283' href='javascript:void(0)'> <i class='fa  fa-check-circle'></i></a>";
            break;

        case "4":

            statusCss = "<a title='失败'  style='color:#ff4a4a' href='javascript:void(0)'> <i class='fa  fa-times-circle'></i></a>";
            break;


        default:
            statusCss = "<a title='？' style='color:#000' href='javascript:void(0)'> <i class='fa   fa-question-circle'></i></a>";

            break;
    }


    return statusCss;
}