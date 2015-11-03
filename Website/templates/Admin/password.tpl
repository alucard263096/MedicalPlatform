<{include file="$smarty_root/Admin/header.tpl" }>

<table class="fieldsetContent">
	<tr>
		<td>当前密码：</td>
		<td><input type='password' id='current_password' /></td>
	</tr>
	<tr>
		<td>新密码：</td>
		<td><input type='password' id='new_password' /></td>
	</tr>
	<tr>
		<td>重复新密码：</td>
		<td><input type='password' id='duplic_new_password' /></td>
	</tr>
	<tr>
		<td colspan='3'><input type='button' id='change_password' value='确定修改' /> </td>
	</tr>
</table>

<script>
$(document).ready(function(){
	$("#change_password").click(function(){
	
		var npws=$("#new_password").val();
		var dnpws=$("#duplic_new_password").val();
		var cpws=$("#current_password").val();

		if($.trim(npws)==""){
			MsgError("新密码不能为空");
			return;
		}

		
		if(npws!=dnpws)
		{
			MsgError("两个新密码不相同");
			return;
		}
		
		$.post("password.action.php",{"action":"change_password","current_password":cpws,"new_password":npws},function(data){
			if(data=="current_password_diff")
			{
				MsgError("当前密码错误！");
			}
			else if(data=="success")
			{
				MsgInfo("修改成功");
			}
			else
			{
				MsgError("系统错误，修改失败！");
			}
		});
	});
});
</script>

<{include file="$smarty_root/Admin/footer.tpl" }>