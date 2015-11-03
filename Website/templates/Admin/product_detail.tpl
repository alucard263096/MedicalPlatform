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
		<td>产品分类：</td>
		<td>
			<select id='detail_category_id'>
				<option value='0'>--请选择--</option>
				<{foreach from=$categoryList item=rs }>
				<option value='<{$rs.id}>' <{if $detail.category_id==$rs.id }>selected<{/if}> ><{$rs.name}></option>
				<{/foreach}>
			</select>
		</td>
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
		<td>简介：</td>
		<td colspan='4'>
			<textarea  id='detail_summary' class='spText ' rows="2" cols="50"><{$detail.summary}></textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>内容：</td>
		<td colspan='4' align='center'>
			<textarea id='detail_content' style="width:300px;height:350px;visibility:hidden;"><{$detail.content}></textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>Logo：</td>
		<td><input type="file" name='file' id='file' onchange='upload()' />
			<input id='detail_logo_file' value='<{$detail.logo}>' type='hidden' class='spText ' />
		</td>
		<td></td>
		<td colspan='2'>请上传格式为：270（width）*186（height）</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
			<img id='detail_logo_img' alt="未上传" height="80px"  src="<{$rootpath}>/upload/product/<{$detail.logo}>">
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
			<input id='review' class='submit' value='预览' type='button' />
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

		editor1.sync();
		
		$(".detail_button").attr("disabled",true);
		var ac=$(this).attr("id");
		var id=$("#detail_id").val();
		var category_id=$("#detail_category_id").val();
		var name=$("#detail_name").val();
		var logo=$("#detail_logo_file").val();
		var seq=$("#detail_seq").val();
		var summary=$("#detail_summary").val();
		var content=$("#detail_content").val();
		var status=$("#detail_status").val();

		var valstr="";
		if($.trim(name)==""){
			valstr+="请输入名称\r\n";
		}
		if($.trim(logo)==""){
			valstr+="请上传logo\r\n";
		}
		if($.trim(category_id)=="0"){
			valstr+="请选择产品分类\r\n";
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
				"logo":logo,
				"category_id":category_id,
				"summary":summary,
				"content":content,
				"seq":seq,
				"status":status
				};

		$.post("product.action.php",json,function(data){

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

	<script>
			var editor1 = KindEditor.create('#detail_content', {
				cssPath : '<{$rootpath}>/kindeditor/plugins/code/prettify.css',
				uploadJson : '<{$rootpath}>/kindeditor/php/upload_json.php',
				fileManagerJson : '<{$rootpath}>/kindeditor/php/file_manager_json.php',
				allowFileManager : true,
				safeMode : false,
        filterMode:false,
				imageUploadJson : '<{$rootpath}>/upload' //服务端上传图片处理URI
			});
			prettyPrint();
	</script>
