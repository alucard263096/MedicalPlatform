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
		<td>栏目名称：</td>
		<td>
			<input id='detail_name' value='<{$detail.name}>' type='text' class='spText ' />
		</td>
		<td></td>
		<td>顺序：</td>
		<td>
			<input id='detail_seq' value='<{$detail.seq}>' type='text' class='spText number ' />
		</td>
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
		<td></td>
		<td>文件列表：</td>
		<td colspan='4'>
			<table id="filelist">
				<{foreach from=$detail.filelist item=rs}>
				<tr valign="middle" class='filerow filerow_<{$rs.id}>' value="<{$rs.id}>">
					<input  value="<{$rs.filename}>" type='hidden'  id='ffilename_<{$rs.id}>' />
					<input value="<{$rs.length}>" type='hidden'  id='flength_<{$rs.id}>' />
					<td rowspan="2"><input class='fileseq number' value="<{$rs.seq}>" id='fseq_<{$rs.id}>' style='width:20px;' />.</td>
					<td>文件名：</td>
					<td><input class='filename' value="<{$rs.name}>"  id='fname_<{$rs.id}>'/></td>
					<td><input type="file" name='ffile_<{$rs.id}>'  id='ffile_<{$rs.id}>' onchange='upload(<{$rs.id}>)'  style='width:70px;'  /></td>
					<td>
					<{if $rs.filename eq ""}>
					<a id='dc_<{$rs.id}>' >未上传</a>
					<{else}>
					<a id='dc_<{$rs.id}>' href='<{$rootpath}>/dc.php?filename=<{$rs.filename}>'><{$rs.filename}></a>
					<{/if}>
					</td>
					<td rowspan="2"><select  class='spDdl_1'  id='fstatus_<{$rs.id}>'>
							<option <{if 'A'==$rs.status}>selected<{/if}> value='A'>启用</option>
							<option <{if 'I'==$rs.status}>selected<{/if}> value='I'>不启用</option>
						</select>
					</td>
					<td rowspan="2">
						<input type='button' value='删除' class='deleteFileRow submit' onclick='deleteFileRow(<{$rs.id}>)'  />
					</td>
				</tr>
        <tr class='filerow_<{$rs.id}>'>
            <td>外部链接：</td>
            <td colspan='3'><input class='extlink' value="<{$rs.extlink}>"  id='fextlink_<{$rs.id}>'/></td>
        </tr>
				<{/foreach}>
			</table>
			<input id='addFile' value='上传文件' type='button' class='detail_button' />
      *当外部链接不为空时，前台网页优先使用外部链接。
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
function deleteFileRow(filerow_id){
	filerow_id=filerow_id.toString();
	$(".filerow_"+filerow_id).remove();
}
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

	$("#addFile").click(function(){

		 $.get("download.action.php",{"action":"newfile"}, function(data){
			 if(data.substring(0,5)=="right")
			 	{
			 		var file_id=data.substring(5,data.length);
			 		str="<tr  valign='middle' class='filerow filerow_"+file_id+"' value='"+file_id+"'>";
			 		str=str+"<input  value='0' type='hidden'  id='ffilename_"+file_id+"' />";
			 		str=str+"<input value='0' type='hidden'  id='flength_"+file_id+"' />";
			 		str=str+"<td  rowspan='2'><input class='fileseq number' value='0' id='fseq_"+file_id+"' style='width:20px;' />.</td>";
					str=str+"<td>文件名：</td>";
					str=str+"<td><input class='filename' value='' id='fname_"+file_id+"' /></td>";
					str=str+"<td><input type='file' name='ffile_"+file_id+"' id='ffile_"+file_id+"' onchange='upload("+file_id+")'   style='width:70px;' /></td>";
					str=str+"<td><a id='dc_"+file_id+"' >未上传</a></td>";
					str=str+"<td  rowspan='2'><select class='status spDdl_1' id='fstatus_"+file_id+"'>";
					str=str+"		<option <{if selected value='A'>启用</option>";
					str=str+"		<option   value='I'>不启用</option>";
					str=str+"	</select>";
					str=str+"</td>";
					str=str+"<td  rowspan='2'><input type='button' value='删除' class='deleteFileRow submit' onclick='deleteFileRow("+file_id+")' /></td>";
					str=str+"</tr>"; 
					str=str+"<tr class='filerow_"+file_id+"'>"; 
					str=str+"<td>外部链接：</td>"; 
					str=str+"<td colspan='3'><input class='extlink'   id='fextlink_"+file_id+"'/></td>"; 
					str=str+"</tr>"; 

					$("#filelist").append(str);
			 	}
			 else{
				 MsgError("增加失败！");
			 }    
	     });


	});
	 


	$("#detail_new").click(function(){
	
				$("#new_title").show();
				$("#edit_title").hide();
				
				$(".spText").val("");
				$(".spChk").prop("checked",false);
				$(".spDdl_1").val('A'); 
				$(".spDdl_2").val('0'); 
				$("#filelist tr").remove();
	});
	
	$(".save").click(function(){
		
		$(".detail_button").attr("disabled",true);
		var ac=$(this).attr("id");
		var id=$("#detail_id").val();
		var name=$("#detail_name").val();
		var seq=$("#detail_seq").val();
		var status=$("#detail_status").val();
		if($.trim(name)=="")
		{
			MsgError("栏目名不能为空！");
			$(".detail_button").attr("disabled",false);
			return;
		}
		if($.trim(seq)=="")
		{
			seq=0;
		}
		var json={"action":"save",
				"id":id,
				"name":name,
				"seq":seq,
				"status":status
				};
		var savefileids="0";
		$(".filerow").each(function(index,data){
			var fid=$(this).attr("value");
			savefileids+=","+fid;
			var fseq=$("#fseq_"+fid).val();
			if($.trim(fseq)=="")
			{
				fseq=0;
			}
			json["fseq_"+fid]=fseq;
			json["fname_"+fid]=$("#fname_"+fid).val();
			json["fstatus_"+fid]=$("#fstatus_"+fid).val();
			json["ffilename_"+fid]=$("#ffilename_"+fid).val();
			json["flength_"+fid]=$("#flength_"+fid).val();
			json["fextlink_"+fid]=$("#fextlink_"+fid).val();
		});
		json["fileidlist"]=savefileids;

		$.post("download.action.php",json,function(data){

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
											$("#filelist tr").remove();

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