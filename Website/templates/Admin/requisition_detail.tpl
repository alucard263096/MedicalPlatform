<div id='new_title' class="fieldset">新增</div>
<div id='edit_title' class="fieldset">更新</div>

<table style="border-spacing:5px;">
	<tr id='asd'>
		<td width="2%"><img src="<{$rootpath}>/images/onedot.gif" width="30" height="1" /></td>
		<td width="14%"><img src="<{$rootpath}>/images/onedot.gif" width="30" height="1" /></td>
		<td width="34%"><img src="<{$rootpath}>/images/onedot.gif" width="30" height="1" /></td>
		<td width="2%"><img src="<{$rootpath}>/images/onedot.gif" width="30" height="1" /></td>
		<td width="14%"><img src="<{$rootpath}>/images/onedot.gif" width="30" height="1" /></td>
		<td width="34%"><img src="<{$rootpath}>/images/onedot.gif" width="30" height="1" /></td>
	</tr>
	<tr>
		<td></td>
		<td>申请人姓名：</td>
		<td>
			<input  value='<{$detail.name}>' type='text' class='spText' readonly="readonly" />
		</td>
		<td></td>
		<td>申请人职位：</td>
		<td>
			<input  value='<{$detail.position}>' type='text' class='spText' readonly="readonly" />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>申请人邮箱：</td>
		<td>
			<input  value='<{$detail.email}>' type='text' class='spText' readonly="readonly" />
		</td>
		<td></td>
		<td>申请人联系电话：</td>
		<td>
			<input  value='<{$detail.phone}>' type='text' class='spText' readonly="readonly" />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>申请人QQ：</td>
		<td>
			<input  value='<{$detail.qq}>' type='text' class='spText' readonly="readonly" />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>公司名称：</td>
		<td>
			<input  value='<{$detail.company_name}>' type='text' class='spText' readonly="readonly" />
		</td>
		<td></td>
		<td>公司所在地：</td>
		<td>
			<input  value='<{$detail.company_city}>' type='text' class='spText' readonly="readonly" />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>公司电话：</td>
		<td>
			<input  value='<{$detail.company_phone}>' type='text' class='spText' readonly="readonly" />
		</td>
		<td></td>
		<td>公司网址：</td>
		<td>
			<input  value='<{$detail.company_website}>' type='text' class='spText' readonly="readonly" />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>公司地址：</td>
		<td colspan='4'>
			<textarea   readonly="readonly" class='spText ' rows="1" cols="50"><{$detail.company_address}></textarea>
		</td>
	</tr>
  <tr>
    <td></td>
    <td>是否已经了解合作方式</td>
    <td colspan='4'>
      <input  value='<{if $rs.knew='Y'}>是<{else}>否<{/if}>' type='text' class='spText' readonly="readonly" />
        </td>
  </tr>
	<tr>
		<td></td>
		<td>客户留言：</td>
		<td colspan='4'>
			<textarea   class='spText ' rows="1" cols="50"><{$detail.message}></textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>所需进一步资料：</td>
		<td colspan='4'>
			<textarea   class='spText ' rows="1" cols="50"><{$detail.question}></textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>申请日期：</td>
		<td>
      <input  value='<{$detail.applied_date}>' type='text' class='spText' readonly="readonly"  />
		</td>
		<td></td>
		<td style="color:red;">处理方式：</td>
		<td>
			<select id='detail_status' class='spDdl_1'>
				<option <{if 'P'==$detail.status}>selected<{/if}> value='P'>未处理</option>
				<option <{if 'A'==$detail.status}>selected<{/if}> value='A'>完成</option>
				<option <{if 'I'==$detail.status}>selected<{/if}> value='I'>不通过</option>
			</select>
		</td>
	</tr>
	<tr>
		<td></td>
		<td style="color:red;">处理意见：</td>
		<td colspan='4'>
			<textarea  id='detail_remarks' class='spText ' rows="1" cols="50"><{$detail.remarks}></textarea>
		</td>
	</tr>
	<tr>
		<td><br><br><br></td>
	</tr>
	<tr>
		<td colspan='6' style="text-align:center;">
			<input id='detail_id' value='<{$detail.id}>' type='hidden'  class='spText' />
			<{if $sysU=="0"}>
			<input id='save' value='处理' class='save detail_button submit' type='button' />
			<{/if}>
			<input class='close submit' value='关闭' type='button' />
		</td>
	</tr>
</table>
<script>
$(document).ready(function(){
	$( "#detail_coordinate" ).tooltip();
	<{if $data_status == 'new'}>
	$("#new_title").show();
	$("#edit_title").hide();
	$(".c_psw").attr("disabled",true);
	$(".lgn").attr("disabled",false);
	<{else}>
	$("#new_title").hide();
	$("#edit_title").show();
	$(".c_psw").attr("disabled",false);
	$(".lgn").attr("disabled",true);
	<{/if}>
    $("#detail_new").click(function(){
    $("#new_title").show();
    $("#edit_title").hide();
    $(".spText").val("");
    $(".spChk").prop("checked",false);
    $(".spDdl_1").val('A');
    $(".spDdl_2").val('0');

    editor1.html("");
    });

    $(".save").click(function(){


    $(".detail_button").attr("disabled",true);
    var ac=$(this).attr("id");
    var id=$("#detail_id").val();
    var remarks=$("#detail_remarks").val();
    var status=$("#detail_status").val();

    var valstr="";
    if($.trim(remarks)==""){
    valstr+="请输入处理意见\r\n";
    }

    if($.trim(valstr)!="")
    {
    MsgError(valstr);
    $(".detail_button").attr("disabled",false);
    return;
    }

    var json={"action":"save",
    "id":id,
    "remarks":remarks,
    "status":status
    };

    $.post("requisition.action.php",json,function(data){

    if(data.substring(0,5)=="right")
    {
    id=data.substring(5,data.length);
    MsgInfo("保存成功！");
    $("#search").click();

    $("#new_title").hide();
    $("#edit_title").show();
    $(".c_psw").attr("disabled",false);
    $(".lgn").attr("disabled",true);

    $("#detail_id").val(id);
    if(ac=="save_and_new")
    {
    $("#new_title").show();
    $("#edit_title").hide();
    $(".spText").val("");
    $(".spChk").prop("checked",false);
    $(".spDdl_1").val('A');
    $(".spDdl_2").val('0');
    $(".c_psw").attr("disabled",true);
    $(".lgn").attr("disabled",false);
    $("#detail_logo_img").attr("src","");
    }
    if(ac=="save_and_close")
    {
    $( "#details" ).dialog( "close" );
    }
    }
    else
    {
    MsgError("保存失败！");
    }
    $(".detail_button").attr("disabled",false);
    });
    });
    $(".close").click(function(){
    $( "#details" ).dialog( "close" );
    });
    });
  </script>

