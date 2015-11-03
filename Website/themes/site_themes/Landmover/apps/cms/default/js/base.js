var CMS = function(){};
//发短信
CMS.sms = function(){};
CMS.sms.sendSMS = function(param){
	$.post("/sms/sms!sendSMS.action",param,function(s){
		if(s&&s == 'success'){
			alert("短信已发送!");
		}
	});
};
CMS.sms.checkSMS = function(param){
	$.post("/sms/sms!checkSMS.action",param,function(s){
		if(s&&s == 'false'){
			alert("验证码不正确!");
		}
	 });
};

//反馈、意向
CMS.customerInfo = function(){
	var arr = {"feedback":{'width':'470px'},
	           "purpose":{'width':'470px'}};
	var arrTitle = {"feedback":"意见反馈",
	           "purpose":"提交意向"};
	$(".showCustomer").live("click",function(){
		var name = $.trim($(this).attr("name"));
		
		var url = "/customer/customer.action?type="+name;
		
		$.post(url,{},function(s){
			$.dialog({id:'J_feedback_info', title:arrTitle[name], content:s, padding:'',zIndex:2047483647, fixed:true, lock:true});

			$(".customer").attr("disabled",false);
			//发短信
			var sendMessage = $("#sendMessage"); 
			if(sendMessage&&sendMessage.length>0){
				$("#sendMessage").click(function(){
					var phone = $.trim($(".mobile").val());
					if(!CMS.checkMobile(phone)){
						alert("请输入正确的手机号!");
						return;
					}
					var parm = {"phone":phone,"_ts":Math.random()};
					CMS.sms.sendSMS(parm);
				});
			}
			var submit = function(){
				var fromPage = $.trim(CMS.dealNav());
				
				var json = {};
				$($('#'+name+'Form').serializeArray()).each(function(){		
					json[this.name] = $.trim(this.value);
				});
			
				$.post("/customer/customer!save.action",{
					"fromPage" : fromPage,
					"type" : name,
					"content" : JSON.stringify(json)
				},function(s){
					if(s == "success"){
						alert("提交成功.");
						$(".d-close").click();
					}else{
						alert("提交失败.");
					}
				});
			};
			$(".customer").click(function(){
				if(sendMessage&&sendMessage.length>0){
					var msg=[];	
					msg.push("请输入：");
					var purposeCustomer=$("#purposeCustomer").val();
					var purposeMobile=$("#purposeMobile").val();
					var randomNumber=$("#randomNumber").val();
					var phone = $.trim($(".mobile").val());
					if(App.isBlank(purposeCustomer)){
						msg.push(" 姓名"); 
						alert("请输入姓名");
						$("#purposeCustomer").focus();
						return;
					}else if(!CMS.checkName(purposeCustomer)){
						alert("请输入真实姓名");
						$("#purposeCustomer").focus();
						return;
					}
					//if(!CMS.checkMobile(purposeMobile)){
					//	alert("请输入正确的手机号!");
					//	return;
					//}
					//if(App.isBlank(randomNumber)){
					//	msg.push(" 验证码"); 
					//	alert("请输入验证码");
					//	return;
					//}
					//if(msg!=null && msg.length>1){
					
					//	return false;
					//}
				    //校验验证码
					//var param = {"phone":phone,"randomNumber":$.trim($("#randomNumber").val()),"_ts":Math.random()};
					//$.post("/sms/sms!checkSMS.action",param,function(s){
					//	if(s&&s == 'false'){
					//		alert("验证码不正确!");
					//	}else{
							submit();
					//	}
					// });
				}else{
					var feedEmail = $.trim($("#feedEmail").val());
					if(App.isBlank(feedEmail)){
						alert("请输入邮箱!");
						return;
					}
					if(!CMS.isEmail(feedEmail)){
						alert("请输入正确的邮箱!");
						return;
					}
					var feedbackContent = $.trim($("#feedbackContent").val());
					if(App.isBlank(feedbackContent)){
						alert("请输入反馈内容!");
						return;
					}
					submit();
				}
			});
			
			var updateLimitSize = function(){
				var limit = $("#limitNum").attr("limit");
				var str = $.trim($("#feedbackContent").val());
				var num = limit - str.length;
				if(num<0){
					alert("已经超过了限制字数，不能再输入");
					return false;
				}
				$("#limitNum").text(num);
				
			};
			$("#feedbackContent").keydown(function(){
				updateLimitSize();
			}).keyup(function(){
				updateLimitSize();
			});;
		});
	});
};

//订阅
CMS.subscribe = function(){
	$(".subscribe").live("click",function(){
		var name = $.trim($(this).attr("name"));
		var email = $.trim($("#email").val());	
		
		if(!CMS.isEmail(email)){
			alert("请输入正确的电子邮件!");
			return;
		}
		var json = {};
		
		var fromPage = $.trim(CMS.dealNav());
		json["email"] = $.trim(email);
	
		$.post("/customer/customer!save.action",{
			"fromPage" : fromPage,
			"type" : name,
			"content" : JSON.stringify(json)
		},function(s){
			if(s == "success"){
				alert("提交成功.");
			}else{
				alert("提交失败.");
			}
		});
	});
};

//处理导航
CMS.dealNav = function(){
	var nav = "";//
	var navClass = $(".breadcrumb-nav");
	if(navClass&&navClass.length>0){
		$(".breadcrumb-nav a").each(function(index,item){
			    nav += $(this).html();
			if(index != $(".breadcrumb-nav a").size()-1){
				nav += " > ";
			}
		});
	}
	if(nav==""){
		nav=$("#source").text();
	}
	return nav;
};
CMS.isEmail = function(str) {
    return /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(str);
};

CMS.checkName = function(value) {
	var realNameReg = /^([\u4E00-\uFA29]|[\uE7C7-\uE7F3])*$/;
	return $.trim(value).length >= 2 && realNameReg.test(value);
};
//验证手机号
CMS.checkMobile = function(value){
	var reg = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
	return $.trim(value).length == 11 && reg.test(value);
};
CMS.checkTel = function(value){
	var telReg = /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/;
	return telReg.test(value);
};

CMS.video = function(){
	$(".video-a").live("click",function(){
		var vid = $(this).attr("vId");
		if(App.isBlank(vid))
			return;
		var aid = $(this).attr("aId");
		var html = "<embed id='flashUrl' width='531' wmode='transparent' align='middle' height='437' src='http://static.youku.com/v/swf/qplayer.swf?VideoIDS="+vid+"&isAutoPlay=true&isShowRelatedVideo=false&embedid=-&showAd=0' quality='high' allowscriptaccess='sameDomain' type='application/x-shockwave-flash'>";
		var title = $(this).attr("title");
		$.dialog({id:'J_feedback_info', title:title, content:html, padding:'',zIndex:2047483647, fixed:true, lock:true});
		if(!App.isBlank(aid)){
			$.post("/article/view.action?notReturn=1&id="+aid,{},function(){});
		}
	});
};
CMS.flash = function(){
	$(".flash-a").live("click",function(){
		var furl = $(this).attr("furl");
		if(App.isBlank(furl))
			return;
		var aid = $(this).attr("aId");
		var html = "<embed id='flashUrl' width='531' wmode='transparent' align='middle' height='437' src='"+furl+"' quality='high' allowscriptaccess='sameDomain' type='application/x-shockwave-flash'>";
		var title = $(this).attr("title");
		$.dialog({id:'J_feedback_info', title:title, content:html, padding:'',zIndex:2047483647, fixed:true, lock:true});
		if(!App.isBlank(aid)){
			$.post("/article/view.action?notReturn=1&id="+aid,{},function(){});
		}
	});
};

function getDownInfo(){
	var arrStr = document.cookie.split("; ");
	for(var i = 0;i < arrStr.length;i ++){
		var temp = arrStr[i].split("=");
		if(temp[0] == "down-info")
			return unescape(temp[1]);
	}
	return "";
}
function setDown(fileId){
	var c = getDownInfo();
	var x = c.split("_");
	var newCookie = [];
	newCookie.push(fileId);
	for ( var i = 0; i < x.length; i++) {
		newCookie.push(x[i]);
	}
	document.cookie = "down-info="+newCookie.join("_")+";";
}
function haveDown(fileId){
	var c = getDownInfo();
	var x = c.split("_");
	for ( var i = 0; i < x.length; i++) {
		if(x[i] == fileId){
			return true;
		}
	}
	return false;
}
//下载表单
CMS.downform = function(){
	$(".down_form").live("click",function(){
		var fId = $(this).attr("f");
		if(haveDown(fId)){
			var downUrl = "/attachment/download!getFile.action?fileId="+fId;
			window.location.href = downUrl;
		}else{
			var url = "/customer/customer.action?type=downform";
			$.post(url,{},function(s){
				$.dialog({id:'J_feedback_info', title:"个人信息", content:s, padding:'',zIndex:2047483647, fixed:true, lock:true});
				$(".customer").attr("disabled",false);
				$(".customer").click(function(){
					var downformName = $.trim($("#downformName").val());
					var downformMobile = $.trim($("#downformMobile").val());
					var downformMail = $.trim($("#downformMail").val());
					if(App.isBlank(downformName)){
						alert("请输入姓名");
						$("#downformName").focus();
						return;
					}else if(!CMS.checkName(downformName)){
						alert("请输入真实姓名");
						$("#downformName").focus();
						return;
					}
					if(App.isBlank(downformMobile)){
						alert("请输入手机号");
						$("#downformMobile").focus();
						return;
					}else if(!CMS.checkMobile(downformMobile)){
						alert("请输入正确的手机号!");
						$("#downformMobile").focus();
						return;
					}
					if(App.isBlank(downformMail)){
						alert("请输入邮箱地址");
						$("#downformMail").focus();
						return;
					}else if(!CMS.isEmail(downformMail)){
						alert("请输入正确的邮箱地址!");
						$("#downformMail").focus();
						return;
					}
					var fromPage = $.trim(CMS.dealNav());
					var json = {};
					$($('#downformForm').serializeArray()).each(function(){		
						json[this.name] = $.trim(this.value);
					});
					$.post("/customer/customer!save.action",{
						"fromPage" : fromPage,
						"type" : "downform",
						"content" : JSON.stringify(json)
					},function(s){
						$(".d-close").click();
						setDown(fId);
						var downUrl = "/attachment/download!getFile.action?fileId="+fId;
						window.location.href = downUrl;
					});
				});
			});
		}
	});
};
// 友情链接
CMS.friendlyApply = function(){
	$(".friendlyApply").live("click",function(){
		$.post("/friendly!apply.action",{},function(s){
			$.dialog({id:'J_feedback_info', title:"友情链接申请", content:s, padding:'',zIndex:2047483647, fixed:true, lock:true});
			$(".friendlyApplyBtn").click(function(){
				var form = $("#friendlyForm");
				App.ajaxPostHtml("/friendly!applySave.action",form,function(){
					var title = $.trim($("#title").val());
					if(App.isBlank(title)){
						alert("请输入网站名称!");
						return false;
					}else if(title.length > 20){
						alert("网站名称输入过长");
						return false;
					}
					var link = $.trim($("#link").val());
					if(App.isBlank(link)){
						alert("请输入网站链接!");
						return false;
					}else if(link.length > 100){
						alert("网站链接输入过长");
						return false;
					}
					var categoryId = $("#categoryId").val();
					if(App.isBlank(categoryId)){
						alert("请选择网站类型!");
						return false;
					}
					var location = $.trim($("#location").val());
					if(App.isBlank(location)){
						alert("请输入贵站放置!");
						return false;
					}else if(location.length > 100){
						alert("贵站放置输入过长");
						return false;
					}
					var brief = $.trim($("#brief").val());
					if(App.isBlank(brief)){
						alert("请输入网站简介!");
						return false;
					}else if(brief.length > 500){
						alert("网站简介输入过长");
						return false;
					}
					var contactName = $.trim($("#contactName").val());
					if(App.isBlank(contactName)){
						alert("请输入联系姓名!");
						return false;
					}else if(contactName.length > 20){
						alert("联系姓名输入过长");
						return false;
					}
					var contactEmail = $.trim($("#contactEmail").val());
					if(!CMS.isEmail(contactEmail)){
						alert("请输入正确的邮箱!");
						return false;
					}
					$("#title").val(title);
					$("#link").val(link);
					$("#location").val(location);
					$("#brief").val(brief);
					$("#contactName").val(contactName);
					$("#contactEmail").val(contactEmail);
					$(".friendlyApplyBtn").attr("disabled",true);
					return true;
				},function(s){
					if(s == "success"){
						alert("申请成功");
						$(".d-close").click();
					}else{
						alert("操作失败,请稍后再试!");
						$(".friendlyApplyBtn").attr("disabled",false);
					}
				});
			});
		});
	});
};
/**数据统计*/
$(".text_link_c").live("click",function(){
	var id = $(this).attr("tid");
	$.post("/mark!textLink.action",{"id":id},function(){});
});
$(".friendly-link").live("click",function(){
	var id = $(this).attr("tid");
	$.post("/mark!friendly.action",{"id":id},function(){});
});
$("#live800iconlink").live("click",function(){
	$.get("/mark!live.action",{},function(){});
});
CMS.viewPage = function(){
	$("a").live("click",function(){
		try{
		var viewPageId = $("#viewPageId").val();
		if(!App.isBlank(viewPageId)){
			$.post("/mark!viewPage.action",{"id":viewPageId},function(s){});
		}
		}catch(e){};
	});
};
//阻止菜单A标签跳转
CMS.preventMenuJump = function(){
	 $('.J-mian-nav a').click(function(e){ 
      e.preventDefault();
    });
};
$(document).ready(function(){
	$.kingdee.front.init();
	CMS.preventMenuJump();
	CMS.customerInfo();
	CMS.video();
	CMS.flash();
	CMS.subscribe();
	CMS.downform();
	CMS.friendlyApply();
	CMS.viewPage();
	$('.J_scollnews').cycle({ pause:1,speed:400,fx: 'scrollUp'});
});
