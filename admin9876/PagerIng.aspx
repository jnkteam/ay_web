<style>
 #Pager1{
     margin-top: 7px;
 }
 #Pager1_input{


     height: 34px;
     padding: 6px 12px;
     font-size: 14px;
     line-height: 1.42857143;
     color: #555;
     background-color: #fff;
     background-image: none;
     border: 1px solid #ccc;
     border-radius: 4px;
     -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
     box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
     -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
     -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
     transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
 }
 #Pager1 a{

               padding: 6px 12px;
                 height: 34px;
               line-height: 1.42857143;
               color: #333;
               text-decoration: none;
               background-color: #fff;
               border: 1px solid #ddd;}

 </style>
 <tr style="">
                        <td height="22" colspan="10">
                            <aspxc:AspNetPager ID="Pager1" runat="server" OnPageChanging="Pager1_PageChanging" AlwaysShow="True" CustomInfoHTML="<div id ='a' class='btn-group'><button type='button' class='btn btn-default'>�ܼ�¼����%RecordCount%</button><button type='button' class='btn btn-default'>��ҳ����%PageCount%</button><button type='button' class='btn btn-default'>��ǰҳ��%CurrentPageIndex%</button></div>"
                                CustomInfoTextAlign="Left" FirstPageText="��ҳ" HorizontalAlign="Right" LastPageText="ĩҳ"
                                NavigationToolTipTextFormatString="��ת{0}ҳ" NextPageText="��һҳ" PageIndexBoxType="DropDownList"
                                PageSize="20" PrevPageText="��һҳ" ShowBoxThreshold="50" ShowCustomInfoSection="Left"
                                ShowPageIndex="False" ShowPageIndexBox="Always" SubmitButtonText="GO&gt;&gt;"
                                TextAfterPageIndexBox="" TextBeforePageIndexBox="" Width="100%" Height="30px">
                            </aspxc:AspNetPager>
                        </td>
                    </tr>