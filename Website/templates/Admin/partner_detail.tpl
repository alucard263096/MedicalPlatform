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
		<td>Logo：</td>
		<td><input type="file" name='file' id='file' onchange='upload()' />
			<input id='detail_logo_file' value='<{$detail.logo_file}>' type='hidden' class='spText ' />
		</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		</td>
		<td></td>
		<td></td>
		<td>
			<img id='detail_logo_img' alt="未上传" width="100px"  src="<{$rootpath}>/upload/partner/<{$detail.logo_file}>">
		</td>
	</tr>
	<tr>
		<td></td>
		<td>类型：</td>
		<td>
			<select id='detail_type'>
				<option value=''>--请选择--</option>
				<{foreach from=$partnertype item=rs}>
				<option value='<{$rs.code}>' <{if $rs.code eq $detail.type}>selected<{/if}>><{$rs.name}></option>
				<{/foreach}>
			</select>
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
		<td>电话：</td>
		<td>
			<input id='detail_tel' value='<{$detail.tel}>' type='text' class='spText ' />
		</td>
		<td></td>
		<td>手机：</td>
		<td>
			<input id='detail_mobile' value='<{$detail.mobile}>' type='text' class='spText ' />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>传真：</td>
		<td>
			<input id='detail_fax' value='<{$detail.fax}>' type='text' class='spText ' />
		</td>
		<td></td>
		<td>联系人：</td>
		<td>
			<input id='detail_contacter' value='<{$detail.contacter}>' type='text' class='spText ' />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>联系地址：</td>
		<td colspan='4'>
			<textarea  id='detail_address' class='spText ' rows="1" cols="50"><{$detail.address}></textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>所在城市：</td>
		<td>
			<select id='selProvince'>
				<option value='0'>--请选择省--</option>
				<{foreach from=$provincelist item=rs}>
				<option value='<{$rs.serialId}>'><{$rs.provinceName}></option>
				<{/foreach}>
			</select>
			<select id='detail_city_id'>
				<option value='0'>--请选择城市--</option>
			</select>
		</td>
		<script>
		$(document).ready(function(){
			$("#selProvince").change(function(){
				var province_id=$(this).val();
				$("#detail_city_id").load("partner.action.php",
						{
						"action":"getcitylist",
						"province_id":province_id
						},
						function(data){
							
						});
	
				});

			<{if $detail.city_id != "" }>
				$("#detail_city_id").load("partner.action.php",
						{
						"action":"getcitylist",
						"province_id":<{$detail.province_id}>
						},
						function(data){
							$("#selProvince").val(<{$detail.province_id}>);
							$("#detail_city_id").val(<{$detail.city_id}>);
						});
				
			<{/if}>
		});
		</script>
		<td></td>
		<td>坐标：</td>
		<td>
			<input id='detail_coordinate' value='<{$detail.coordinate}>' type='text' class='spText ' title="打开右边获取坐标网页，搜索地址后点击右上角复制坐标."/>
			<a href='http://api.map.baidu.com/lbsapi/getpoint/' target='_blank' >点击获取坐标</a>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>网址：</td>
		<td>
			<input id='detail_website' value='<{if $detail.website eq ""}>http://<{/if}><{$detail.website}>' type='text' class='spText ' />
		</td>
		<td></td>
		<td>微信公众号：</td>
		<td>
			<input id='detail_weixin' value='<{$detail.weixin}>' type='text' class='spText ' />
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
		<td>备注：</td>
		<td colspan='4' >
			<textarea rows="3" cols="60" id="detail_remark" class='spText'><{$detail.remark}></textarea>
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
				$("#detail_logo_img").attr("src","");

				editor1.html("");
	});
	
	$(".save").click(function(){

		editor1.sync();

		
		$(".detail_button").attr("disabled",true);
		var ac=$(this).attr("id");
		var id=$("#detail_id").val();
		var name=$("#detail_name").val();
		var logo_file=$("#detail_logo_file").val();
		var type=$("#detail_type").val();
		var tel=$("#detail_tel").val();
		var fax=$("#detail_fax").val();
		var mobile=$("#detail_mobile").val();
		var contacter=$("#detail_contacter").val();
		var address=$("#detail_address").val();
		var city_id=$("#detail_city_id").val();
		var coordinate=$("#detail_coordinate").val();
		var website=$("#detail_website").val();
		var weixin=$("#detail_weixin").val();
		var summary=$("#detail_summary").val();
		var content=$("#detail_content").val();
		var remark=$("#detail_remark").val();
		var status=$("#detail_status").val();

		var valstr="";
		if($.trim(name)==""){
			valstr+="请输入名称\r\n";
		}
		if($.trim(type)==""){
			valstr+="请选择类型\r\n";
		}
		if($.trim(tel)==""){
			valstr+="请输入电话\r\n";
		}
		if($.trim(contacter)==""){
			valstr+="请输入联系人\r\n";
		}
		if($.trim(address)==""){
			valstr+="请输入地址\r\n";
		}
		if($.trim(city_id)=="0"){
			valstr+="请选择所在城市\r\n";
		}
		if($.trim(coordinate)==""){
			valstr+="请获取地图坐标\r\n";
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
				"logo_file":logo_file,
				"type":type,
				"tel":tel,
				"fax":fax,
				"mobile":mobile,
				"contacter":contacter,
				"address":address,
				"city_id":city_id,
				"coordinate":coordinate,
				"website":website,
				"weixin":weixin,
				"summary":summary,
				"content":content,
				"remark":remark,
				"status":status
				};

		$.post("partner.action.php",json,function(data){

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
											editor1.html("");
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
