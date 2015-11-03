<div id='new_title' class="fieldset">新增</div>
<div id='edit_title' class="fieldset">更新</div>

<table  style="border-spacing:5px;">
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
		<td>标题：</td>
		<td>
			<input id='detail_title' value='<{$detail.title}>' type='text' class='spText ' />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>发布日期：</td>
		<td>
			<input id='detail_published_date' value='<{$detail.published_date}>' type='text' class='spText ' />
		</td>
		<td></td>
		<td>状态：</td>
		<td>
			<select id='detail_status' class='spDdl_1' >
				<option <{if 'A'==$detail.status}>selected<{/if}> value='A'>启用</option>
				<option <{if 'I'==$detail.status}>selected<{/if}> value='I'>不启用</option>
			</select>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>导读：</td>
		<td colspan='4'>
			<textarea rows="3" cols="70" id="detail_summary" class='spText'><{$detail.summary}></textarea>
		</td>
	</tr>
	<tr valign='top'>
		<td></td>
		<td>正文：</td>
	</tr>
	<tr valign='top'>
		<td colspan='6' align='center'>
			<textarea id='detail_content' style="width:700px;height:350px;visibility:hidden;"><{$detail.content}></textarea>
		</td>
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
var today="<{$today}>";
$(document).ready(function(){
	$( "#detail_published_date" ).datepicker({dateFormat:"yy-mm-dd"});
	<{if $data_status == 'new'}>
	$("#new_title").show();
	$("#edit_title").hide();
	$(".c_psw").attr("disabled",true);
	$(".lgn").attr("disabled",false);
	$( "#detail_published_date" ).val(today);
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
				$( "#detail_published_date" ).val(today);
	});
	
	$(".save").click(function(){

		editor1.sync();
		$(".detail_button").attr("disabled",true);
		var ac=$(this).attr("id");
		var id=$("#detail_id").val();
		var title=$("#detail_title").val();
		var summary=$("#detail_summary").val();
		var published_date=$("#detail_published_date").val();
		var content=$("#detail_content").val();
		var status=$("#detail_status").val();
		if($.trim(title)=="")
		{
			MsgError("标题不能为空！");
			$(".detail_button").attr("disabled",false);
			return;
		}
		if($.trim(published_date)=="")
		{
			MsgError("发布日期不能为空！");
			$(".detail_button").attr("disabled",false);
			return;
		}
		var json={"action":"save",
				"id":id,
				"title":title,
				"summary":summary,
				"published_date":published_date,
				"content":content,
				"status":status
				};

		$.post("news.action.php",json,function(data){

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
											editor1.html("");
											$( "#detail_published_date" ).val(today);
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

	<script>
			var editor1 = KindEditor.create('#detail_content', {
				cssPath : '<{$rootpath}>/kindeditor/plugins/code/prettify.css',
				uploadJson : '<{$rootpath}>/kindeditor/php/upload_json.php',
				fileManagerJson : '<{$rootpath}>/kindeditor/php/file_manager_json.php',
				allowFileManager : true
			});
			prettyPrint();
	</script>