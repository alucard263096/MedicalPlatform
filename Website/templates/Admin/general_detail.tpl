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
			<strong><{$info.name}></strong>
		</td>
		<td></td>
		<td>位置：</td>
		<td>
			<strong><{$info.position}></strong>
		</td>
	</tr>
	<tr valign='top'>
		<td></td>
		<td>内容：</td>
	</tr>
	<tr valign='top'>
		<td colspan='6' align='center'>
			<textarea id='detail_content' style="width:700px;height:400px;"><{$info.content}></textarea>
		</td>
	</tr>
	<tr>
		<td colspan='6' style="text-align:center;">
			<input id='detail_id' value='<{$info.id}>' type='hidden'  class='spText' />
			<{if $sysU=="0"}>
			<input id='save' value='保存' class='save detail_button submit' type='button' />
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


	
	$(".save").click(function(){
		<{if $info.type=='html'}>
		editor1.sync();
		<{/if}>
		$(".detail_button").attr("disabled",true);
		var ac=$(this).attr("id");
		var id=$("#detail_id").val();
		var content=$("#detail_content").val();
		
		$.post("general.action.php",{
									"action":"save",
									"id":id,
									"content":content
								 },function(data){

								 	if(data.substring(0,5)=="right")
								 	{
								 		MsgInfo("保存成功！");
										$("#search").click();
										$("#edit_title").show();
										$(".c_psw").attr("disabled",false);
										$(".lgn").attr("disabled",true);
											
										$("#detail_id").val(id);
										
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
<{if $info.type=='html'}>
	<script>
			$("#detail_content").hide();
			var editor1 = KindEditor.create('#detail_content', {
				cssPath : '<{$rootpath}>/kindeditor/plugins/code/prettify.css',
				uploadJson : '<{$rootpath}>/kindeditor/php/upload_json.php',
				fileManagerJson : '<{$rootpath}>/kindeditor/php/file_manager_json.php',
				safeMode : false,
        filterMode:false,
				allowFileManager : true
			});
			prettyPrint();
	</script>
<{/if}>