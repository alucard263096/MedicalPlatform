    <table class="form_table">
				<col width="150px" />
				<col />
				<tr>
					<th>网站名称：</th>
					<td><input type='text' class='normal' id='base_website_name' pattern='required' alt='商店名称必须填写' value="<{$base.website_name}>" /></td>
				</tr>
				<tr>
					<th>网页图标：</th>
					<td>
						<div style="height:53px;">
							<img id='img_fav' src='<{$rootpath}>/upload/fav/<{$base.favfile}>' height='50px' />
						</div>
						<input type='file' class='normal' name='favfile' id='favfile' onchange='uploadFavfile()' /><label>直接从本地上传图片覆盖原有的网站图标</label>
						<input type='hidden' class='normal' id='base_favfile'  value="<{$base.favfile}>" /><label>
					</td>
				</tr>
				<tr>
					<th>联系人：</th>

					<td><input type='text' class='normal' id='base_contacter'  value="<{$base.contacter}>" /></td>
				</tr>
				<tr>
					<th>QQ：</th>
					<td><input type='text' class='normal' pattern='qq' id='base_qq' empty alt='请填写正确的QQ号'  value="<{$base.qq}>" /></td>
				</tr>
				<tr>
					<th>Email：</th>
					<td><input type='text' class='normal' pattern='email' id='base_email' empty alt='请填写正确的email地址'  value="<{$base.email}>" /></td>
				</tr>
				<tr>
					<th>手机：</th>
					<td><input type='text' class='normal' pattern='mobi' id='base_mobile' empty alt='请填写正确的手机号码'  value="<{$base.mobile}>" /></td>
				</tr>
				<tr>
					<th>客服电话：</th>
					<td><input type='text' class='normal' pattern='phone' id='base_phone' empty alt='请填写正确的固定电话'   value="<{$base.phone}>"/></td>
				</tr>
				<tr>
					<th>具体地址：</th>
					<td><input type='text' class='normal' pattern='required' id='base_address' empty alt='商店名称必须填写'  value="<{$base.address}>"/></td>
				</tr>
				<tr>
					<th>Seo 网页主题：</th>
					<td><input type='text' class='normal' pattern='required' id='base_seo_title' empty alt='首页title后缀'  value="<{$base.seo_title}>" /></td>
				</tr>
				<tr>
					<th>Seo 网页关键字：</th>
					<td><input type='text' class='normal' pattern='required' id='base_seo_keywords' empty alt='首页keywords' value="<{$base.seo_keywords}>" /></td>
				</tr>
				<tr>
					<th>Seo 网页描述：</th>
					<td><input type='text' class='normal' pattern='required' id='base_seo_description' empty alt='首页description' value="<{$base.seo_description}>" /></td>
				</tr>
				<tr>
					<th></th>
					<td>
						<{if $sysA=="0"}><button class="submit detail_button" type='button' id='base_submit'><span>保存基本设置</span></button><{/if}>
					</td>
				</tr>
			</table>
			
			
<script type="text/javascript">
$(document).ready(function(){

	$("#base_submit").click(function(){

		$(".detail_button").attr("disabled",true);
		
		var website_name=$("#base_website_name").val();
		var favfile=$("#base_favfile").val();
		var contacter=$("#base_contacter").val();
		var qq=$("#base_qq").val();
		var email=$("#base_email").val();
		var mobile=$("#base_mobile").val();
		var phone=$("#base_phone").val();
		var address=$("#base_address").val();
		var seo_title=$("#base_seo_title").val();
		var seo_keywords=$("#base_seo_keywords").val();
		var seo_description=$("#base_seo_description").val();
		
		var json={"action":"savebase",
				"website_name":website_name,
				"favfile":favfile,
				"contacter":contacter,
				"qq":qq,
				"email":email,
				"mobile":mobile,
				"phone":phone,
				"address":address,
				"seo_title":seo_title,
				"seo_keywords":seo_keywords,
				"seo_description":seo_description
				};
		
		$.post("website.action.php",json,function(data){

		 	if(data.substring(0,5)=="right")
		 	{
		 		id=data.substring(5,data.length);
		 		MsgInfo("保存成功！");
		 	}
		 	else
		 	{
		 		MsgError("保存失败！");
		 	}
			$(".detail_button").attr("disabled",false);
		 });
		
	});

});


function uploadFavfile()
{
	if($.trim($("#favfile").val())!="")
	{
		$(".detail_button").ajaxStart(function(){
			$(".detail_button").attr("disabled",true);
		})
		.ajaxComplete(function(){
			$(".detail_button").attr("disabled",false);
		});
		$.ajaxFileUpload
		(
			{
				"url":'website.action.php?action=uploadfav',
				"secureuri":false,
				"fileElementId":"favfile",
				"dataType": 'text',
				"success": function(data, status)
				{
					if(data.substring(0,7)=="success"){
						str=data.substring(7,data.length);
						$("#base_favfile").val(str);
						$("#img_fav").attr("src",'<{$rootpath}>/upload/fav/'+str);
					}else{
						alert("上传失败");
					}
				},
				"error": function(data, status, e)
				{
					//alert(e);
				}
			}
		);
	}
}



</script>
			
			
			
			
			
			
			
			
 