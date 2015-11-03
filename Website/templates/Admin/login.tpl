<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<{$charset}>" />
<TITLE><{$Title}> <{$Subtitle}></TITLE>
    <link rel="stylesheet" href="<{$rootpath}>/css/templatelogin.css" type="text/css" />
    <script language="javascript" src="<{$rootpath}>/js/jquery.js"></script>
	<script type="text/javascript" src="<{$rootpath}>/js/ui/jquery-ui.js"></script>
    <script language="javascript" src="<{$rootpath}>/js/ui-alert.js"></script>
	<link type="text/css" href="<{$rootpath}>/js/ui/jquery-ui.min.css" media="screen" rel="stylesheet" />
</head>
<body>
<table width='100%' height='600' >
	<tr valign='middle'>
		<td align='center'>
			<div style='width:500px'>
			<fieldset><legend><{$Title}> - <{$Subtitle}></legend>
			<table width=500px  cellpadding="2" cellspacing="2" >
				<tr>
					<td >&nbsp;</td>
				</tr>
				<tr>
					<td  align="center" class="bigtitle">网站/管理中心</td>
				</tr>
				<tr>
				    <td align="center" >
				        <table>
				            <tr>
					            <td style="width:100"  align="right">登录名: </td>
					            <td style="width:200">
                                    <input id='txtLoginname' class='submit' value=''  /></td>
				            </tr>
				            <tr>
					            <td style="width:100"  align="right">密码: </td>
					            <td style="width:200">
                                    <input id='txtPassword' type='password' class='submit' value='' /></td>
				            </tr>
				            <tr>
					            <td>&nbsp;</td>
					            <td align="left">
                                    <input id='btnLogin' type='button' value='登录' />
                                    <span color='#C00000' id='lblError'></span></td>
				            </tr>
				        </table>
				    </td>
				</tr>
				<tr>
					<td >&nbsp;</td>
				</tr>
			</table>
			</div>
		</td>
	</tr>
</table>

<script>
$(document).ready(function(){
	
	$("#txtLoginname").focus();
	$(".submit").keypress(function(e){
		if(e.which==13 )
		{
			$("#btnLogin").click();
		}
	});	
	$("#btnLogin").click(function(){
	
		var loginname=$("#txtLoginname").val();
		var password=$("#txtPassword").val();
		
		if($.trim(loginname)=="")
		{
			MsgError("请输入登录名！");
			return;
		}
		
		$.post("login.action.php",{"action":"login","loginname":loginname,"password":password},function(e){
			//alert($.trim(e));
			if($.trim(e)=="not_active")
			{
				MsgError("用户无效");
				$("#txtLoginname").focus();
			}
			else if($.trim(e)=="invalid_password")
			{
				MsgError("密码错误");
				$("#txtLoginname").focus();
			}
			else if($.trim(e)=="not_exists")
			{
				MsgError("用户不存在");
				$("#txtLoginname").focus();
			}
			else if($.trim(e)=="success")
			{
				window.location.href='home.php';
			}
			else
			{
				MsgError("用户无效");
				$("#txtLoginname").focus();
			}
		});
	});
		
});
</script>



















<div style='display:none;'>
<div id="dialog-message-info" title="消息" >
	<p>
		
	</p>
</div>
<div id="dialog-message-error" title="错误">
	<p>
		
	</p>
</div>
<div id="dialog-message-warning" title="警告">
	<p>
		
	</p>
</div>
</div>
</body>
</html>