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
		<td>中文名：</td>
		<td>
			<input id='detail_chname' value='<{$detail.chname}>' type='text' class='spText ' />
		</td>
		<td></td>
		<td>英文名：</td>
		<td>
			<input id='detail_engname' value='<{$detail.engname}>' type='text' class='spText ' />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>职务：</td>
		<td>
			<input id='detail_position' value='<{$detail.position}>' type='text' class='spText ' />
		</td>
		<script>
		$(document).ready(function(){
			var availableTags = [];
			<{foreach from=$hisposition item=rs}>
			availableTags.push("<{$rs.position}>");
			<{/foreach}>
			$( "#detail_position" ).autocomplete({source: availableTags});
		});
		</script>
		<td></td>
		<td>联系电话：</td>
		<td>
			<input id='detail_tel' value='<{$detail.tel}>' type='text' class='spText ' />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>QQ：</td>
		<td>
			<input id='detail_qq' value='<{$detail.qq}>' type='text' class='spText ' />
		</td>
		<td></td>
		<td>邮箱：</td>
		<td>
			<input id='detail_email' value='<{$detail.email}>' type='text' class='spText ' />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>联系地址：</td>
		<td colspan='4'>
			<textarea  id='detail_address' class='spText ' rows="1" cols="100"><{$detail.address}></textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>管理省份：</td>
		<td colspan='4'>
			<ul style="list-style-type:none;margin-left:-40px;">
				<{foreach from=$provincelist item=rs }>
				<li style="float:left;"><input class='spChk p_chk' type='checkbox' value='<{$rs.spell}>' id='p_<{$rs.spell}>' /><{$rs.provinceName}></li>
				<{/foreach}>
			</ul>
		</td>
	</tr>
	<script>
	$(document).ready(function(){
		var provincestr="<{$detail.provinces}>";
		var arr=provincestr.split(",");
		for(var i=0;i<arr.length;i++){
			if($.trim(arr[i])!=""){
				$("#p_"+arr[i]).prop("checked",true);
			}
		}
	});
	</script>
	<tr>
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
		<td>详情：</td>
		<td >
			<textarea rows="3" cols="30" id="detail_description" class='spText'><{$detail.description}></textarea>
		</td>
		<td></td>
		<td>备注：</td>
		<td >
			<textarea rows="3" cols="30" id="detail_remark" class='spText'><{$detail.remark}></textarea>
		</td>
	</tr>
	<tr>
		<td><br><br><br></td>
	</tr>
	<tr>
		<td colspan='6' style="text-align:center;">
			<input id='detail_id' value='<{$detail.id}>' type='hidden'  class='spText submit' />
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
	<{if $data_status == 'new'}>
	$("#new_title").show();
	$("#edit_title").hide();
	$(".c_psw").attr("disabled",true);
	$(".lgn").attr("disabled",false);
	$( "#detail_published_date" ).val('<{$today}>');
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
	});
	
	$(".save").click(function(){

		$(".detail_button").attr("disabled",true);
		var ac=$(this).attr("id");
		var id=$("#detail_id").val();
		var chname=$("#detail_chname").val();
		var engname=$("#detail_engname").val();
		var position=$("#detail_position").val();
		var tel=$("#detail_tel").val();
		var qq=$("#detail_qq").val();
		var email=$("#detail_email").val();
		var address=$("#detail_address").val();
		var provinces="";
		var isfirst=true;
		$(".p_chk:checked").each(function(){
			if(isfirst==false){
				provinces=provinces+",";
			}
			isfirst=false;
			provinces=provinces+$(this).val();
		});
		var description=$("#detail_description").val();
		var remark=$("#detail_remark").val();
		
		var status=$("#detail_status").val();
		if($.trim(chname)=="")
		{
			MsgError("中文名不能为空！");
			$(".detail_button").attr("disabled",false);
			return;
		}
		if($.trim(tel)=="")
		{
			MsgError("联系电话不能为空！");
			$(".detail_button").attr("disabled",false);
			return;
		}
		if($.trim(provinces)=="")
		{
			MsgError("管理省份不能为空！");
			$(".detail_button").attr("disabled",false);
			return;
		}
		var json={"action":"save",
				"id":id,
				"chname":chname,
				"engname":engname,
				"position":position,
				"tel":tel,
				"qq":qq,
				"email":email,
				"address":address,
				"provinces":provinces,
				"description":description,
				"remark":remark,
				"status":status
				};

		$.post("manager.action.php",json,function(data){

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

