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
		<td>登录名：</td>
		<td>
			<input id='detail_login_id' value='<{$user.login_id}>' type='text' class='spText lgn' />
		</td>
		<td></td>
		<td>重设密码：</td>
		<td>
			<input id='reset_psw' value='点击重设密码' type='button' class='c_psw'  />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>用户名：</td>
		<td>
			<input id='detail_user_name' value='<{$user.user_name}>' type='text' class='spText' />
		</td>
		<td></td>
		<td>邮箱：</td>
		<td>
			<input id='detail_email' value='<{$user.email}>' type='text' class='spText' />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>状态：</td>
		<td>
			<select id='detail_status' class='spDdl_1'>
				<option <{if 'A'==$user.status}>selected<{/if}> value='A'>启用</option>
				<option <{if 'I'==$user.status}>selected<{/if}> value='I'>不启用</option>
			</select>
		</td>
	</tr>
	<tr valign='top'>
		<td></td>
		<td>备注：</td>
		<td colspan='4'>
			<textarea id='detail_remarks' rows='5' cols='70'  class='spText' ><{$user.remarks}></textarea>
		</td>
	</tr>
	<tr valign='top'>
		<td></td>
		<td>访问权限：</td>
		<td colspan='4'>
			<table>
				<{foreach from=$access_right item=rs}>
				<tr>
					<tr>
						<td><input type='checkbox' class='m_fun spChk' value='<{$rs.function_id}>'  <{if 'A'==$rss.view}>selected<{/if}>  />全选</td>
						<td><strong><{$rs.function_name}></strong></td>
					</tr>
				</tr>
				<tr>
					<td></td>
					<td>
						<table>
							<{foreach from=$rs.sub_function item=rss}>
							<tr>
								<td><input type='checkbox' class='s_fun_<{$rs.function_id}> c_fun ckbAR spChk' value='<{$rss.function_id}>'  <{if $rss.right_u>0 }>checked<{/if}>  /><{$rss.function_name}></td>
								<{foreach from=$rss.access_right item=rssss }>
  								<td><input type='checkbox' class='s_fun_<{$rs.function_id}> right_<{$rss.function_id}> spChk' value='<{$rssss.right_id}>' <{if $rssss.right_u>0 }>checked=checked<{/if}> /><{$rssss.name}></td>
  								<{/foreach}>
							</tr>
							<{/foreach}>
						</table>
					</td>
				</tr>
				<{/foreach}>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan='6' style="text-align:center;">
			<input id='detail_user_id' value='<{$user.user_id}>' type='hidden'  class='spText' />
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
	<{else}>
	$("#new_title").hide();
	$("#edit_title").show();
	$(".c_psw").attr("disabled",false);
	$(".lgn").attr("disabled",true);
	<{/if}>


	$(".m_fun").click(function(){
	
		$(".s_fun_"+$(this).val()).prop("checked",$(this).prop("checked"));
		
	});
	$(".c_fun").click(function(){
	
		$(".right_"+$(this).val()).prop("checked",$(this).prop("checked"));
		
	});
	$("#detail_new").click(function(){
	
				$("#new_title").show();
				$("#edit_title").hide();
				
				$(".spText").val("");
				$(".spChk").prop("checked",false);
				$(".spDdl_1").val('A'); 
				$(".spDdl_2").val('0'); 
				
	});
	$("#reset_psw").click(function(){
		var user_id=$("#detail_user_id").val();
		$(".detail_button").attr("disabled",true);
		$.post("user.action.php",{
									"action":"reset_password",
									"user_id":user_id
								 },function(data){

								 	if(data=="success")
								 	{
								 		MsgError("重设成功！");
								 	}
								 	else
								 	{
								 		MsgError("重设失败！");
								 	}
									$(".detail_button").attr("disabled",false);
								 });
	});
	$(".save").click(function(){
		
		$(".detail_button").attr("disabled",true);
		var ac=$(this).attr("id");
		var user_id=$("#detail_user_id").val();
		var login_id=$("#detail_login_id").val();
		var user_name=$("#detail_user_name").val();
		var email=$("#detail_email").val();
		var status=$("#detail_status").val();
		var remarks=$("#detail_remarks").val();
		var access_right="";
		if($.trim(login_id)=="")
		{
			MsgError("登录名不能为空！");
			$(".detail_button").attr("disabled",false);
			return;
		}
		$.each($(".ckbAR"),function(){
			if($(this).prop("checked"))
			{
				var d_right="";
				$.each($(".right_"+$(this).val()),function(){
					if($(this).prop("checked"))
					{
						d_right+=$(this).val()+"?";
					}
				});
				access_right+=$(this).val()+","+d_right+";";
			}
		});

		$.post("user.action.php",{
									"action":"save",
									"user_id":user_id,
									"login_id":login_id,
									"user_name":user_name,
									"email":email,
									"status":status,
									"remarks":remarks,
									"access_right":access_right
								 },function(data){

								 	if(data=="login_id_exists")
								 	{
								 		MsgError("登录名已存在！");
								 	}
								 	else if(data.substring(0,5)=="right")
								 	{
								 		user_id=data.substring(5,data.length);
								 		MsgInfo("保存成功！重新登录才应用更新！");
										$("#search").click();
										
										$("#new_title").hide();
										$("#edit_title").show();
										$(".c_psw").attr("disabled",false);
										$(".lgn").attr("disabled",true);
											
										$("#detail_user_id").val(user_id);
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