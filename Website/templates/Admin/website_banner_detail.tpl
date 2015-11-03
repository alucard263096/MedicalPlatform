<div id='banner_new_title' class="fieldset">新增</div>
<div id='banner_edit_title' class="fieldset">更新</div>
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
		<td>状态：</td>
		<td>
			<select id='banner_detail_status' class='spDdl_1' >
				<option <{if 'A'==$detail.status}>selected<{/if}> value='A'>启用</option>
				<option <{if 'I'==$detail.status}>selected<{/if}> value='I'>不启用</option>
			</select>
		</td>
		<td></td>
		<td>顺序：</td>
		<td>
			<input id='banner_detail_seq' value='<{$detail.seq}>' type='text' class='spText number ' />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>口号：</td>
		<td colspan='4'>
			<textarea  id='banner_detail_slogan' class='spText ' rows="1" cols="50"><{$detail.slogan}></textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>标签：</td>
		<td colspan='4'>
			<textarea  id='banner_detail_label' class='spText ' rows="1" cols="50"><{$detail.label}></textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>标题：</td>
		<td colspan='4'>
			<textarea  id='banner_detail_title' class='spText ' rows="1" cols="50"><{$detail.title}></textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>超链接：</td>
		<td colspan='4'>
			<textarea  id='banner_detail_link' class='spText ' rows="1" cols="50"><{$detail.link}></textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>内容：</td>
		<td colspan='4'>
			<textarea  id='banner_detail_cont' class='spText ' rows="3" cols="100"><{$detail.cont}></textarea>
		</td>
	</tr>
	
	<tr>
		<td></td>
		<td>背景图：</td>
		<td colspan='4'><input type="file" name='banner_upload_file' id='banner_upload_file' onchange='uploadBanner()' />
			<input id='banner_detail_pic' value='<{$detail.pic}>' type='hidden' class='spText ' />
		</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td colspan='4'>
			<img id='banner_detail_img' alt="未上传" height="250px" width="500px"  src="<{$rootpath}>/upload/index/<{$detail.pic}>">
		</td>
	</tr>
	<tr>
		<td><br><br><br></td>
	</tr>
	<tr>
		<td colspan='6' style="text-align:center;">
			<input id='banner_detail_id' value='<{$detail.id}>' type='hidden'  class='spText' />
			<{if $sysU=="0"}>
			<input id='banner_save' value='保存' class='banner_save detail_button submit' type='button' />
			<input id='banner_save_and_new' class='banner_save detail_button submit' value='保存并新增' type='button' />
			<input id='banner_save_and_close' class='banner_save detail_button submit' value='保存并关闭' type='button' />
			<{/if}>
			<{if $sysA=="0"}>
			<input id='banner_detail_new' class='detail_button submit' value='新增' type='button' />
			<{/if}>
			<input class='banner_close submit' value='关闭' type='button' />
		</td>
	</tr>
</table>
<script>
$(document).ready(function(){
	<{if $data_status == 'new'}>
	$("#banner_new_title").show();
	$("#banner_edit_title").hide();
	$(".c_psw").attr("disabled",true);
	$(".lgn").attr("disabled",false);
	<{else}>
	$("#banner_new_title").hide();
	$("#banner_edit_title").show();
	$(".c_psw").attr("disabled",false);
	$(".lgn").attr("disabled",true);
	<{/if}>
	$("#banner_detail_new").click(function(){
				$("#new_title").show();
				$("#edit_title").hide();
				$(".spText").val("");
				$(".spChk").prop("checked",false);
				$(".spDdl_1").val('A'); 
				$(".spDdl_2").val('0');
				$("#banner_detail_img").attr("src","");

	});
	
	$(".banner_save").click(function(){

		
		$(".detail_button").attr("disabled",true);
		var ac=$(this).attr("id");

		
		var id=$("#banner_detail_id").val();
		var slogan=$("#banner_detail_slogan").val();
		var label=$("#banner_detail_label").val();
		var title=$("#banner_detail_title").val();
		var cont=$("#banner_detail_cont").val();
		var seq=$("#banner_detail_seq").val();
		var pic=$("#banner_detail_pic").val();
		var link=$("#banner_detail_link").val();
		var status=$("#banner_detail_status").val();
		

		var valstr="";
		if($.trim(slogan)==""){
			valstr+="请输入口号\r\n";
		}
		if($.trim(label)==""){
			valstr+="请选择标签\r\n";
		}
		if($.trim(title)==""){
			valstr+="请输入标题\r\n";
		}
		if($.trim(cont)==""){
			valstr+="请输入内容\r\n";
		}
		if($.trim(pic)==""){
			valstr+="请上传图片\r\n";
		}
		if($.trim(valstr)!="")
		{
			MsgError(valstr);
			$(".detail_button").attr("disabled",false);
			return;
		}
	
		
		var json={"action":"savebanner",
				"id":id,
				"slogan":slogan,
				"label":label,
				"title":title,
				"cont":cont,
				"seq":seq,
				"link":link,
				"pic":pic,
				"status":status
				};

		$.post("website.action.php",json,function(data){

								 	if(data.substring(0,5)=="right")
								 	{
								 		id=data.substring(5,data.length);
								 		MsgInfo("保存成功！");
										refreshBannerList();
										
										$("#banner_new_title").hide();
										$("#banner_edit_title").show();
										$(".c_psw").attr("disabled",false);
										$(".lgn").attr("disabled",true);
											
										$("#banner_detail_id").val(id);
										if(ac=="banner_save_and_new")
										{
											$("#banner_new_title").show();
											$("#banner_edit_title").hide();
											$(".spText").val("");
											$(".spChk").prop("checked",false);
											$(".spDdl_1").val('A'); 
											$(".spDdl_2").val('0'); 
											$(".c_psw").attr("disabled",true);
											$(".lgn").attr("disabled",false);
											$("#banner_detail_img").attr("src","");
										}
										if(ac=="banner_save_and_close")
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
	$(".banner_close").click(function(){
		$( "#details" ).dialog( "close" );
	});
});

</script>

