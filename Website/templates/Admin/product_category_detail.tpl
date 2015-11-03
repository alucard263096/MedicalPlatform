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
		<td>名称：</td>
		<td>
			<input id='detail_name' value='<{$detail.name}>' type='text' class='spText ' />
		</td>
		<td></td>
		<td>序号：</td>
		<td>
			<input id='detail_seq' value='<{$detail.seq}>' type='text' class='spText number ' />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>状态：</td>
		<td>
			<select id='detail_status' class='spDdl_1'>
				<option <{if 'A'==$detail.status}>selected<{/if}> value='A'>启用</option>
				<option <{if 'I'==$detail.status}>selected<{/if}> value='I'>不启用</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><br><br><br></td>
	</tr>
	<tr>
		<td colspan='6' style="text-align:center;">
			<input id='detail_id' value='<{$detail.id}>' type='hidden'  class='spText' />
			<{if $sysU=="0"}>
			<input id='save' value='保存' class='save detail_button submit' type='button' />
			<input id='save_and_new' class='save detail_button submit' value='保存并新增' type='button' />
			<input id='save_and_close' class='save detail_button submit' value='保存并关闭' type='button' />
			<{/if}>
			<{if $sysA=="0"}>
			<input id='detail_new' class='detail_button submit' value='新增' type='button' />
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
		var name=$("#detail_name").val();
		var seq=$("#detail_seq").val();
		var status=$("#detail_status").val();

		var valstr="";
		if($.trim(name)==""){
			valstr+="请输入名称\r\n";
		}
		
		if($.trim(valstr)!="")
		{
			MsgError(valstr);
			$(".detail_button").attr("disabled",false);
			return;
		}
		
		var json={"action":"save",
				"id":id,
				"name":name,
				"seq":seq,
				"status":status
				};

		$.post("product_category.action.php",json,function(data){

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

