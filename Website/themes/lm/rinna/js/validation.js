/*global jQuery:false */
jQuery(document).ready(function($) {
"use strict";

	//Contact
	$('form.validateform').submit(function(){

		$("#errormessage").removeClass("show");
		$("#sendmessage").removeClass("show");
		
		var f = $(this).find('.listForm li'), 
		ferror = false, 
		emailExp = /^[^\s()<>@,;:\/]+@\w[\w\.-]+\.[a-z]{2,}$/i;
		var digitsExp = new RegExp("^[0-9]*$");

		f.children('input').each(function(){ // run all inputs

			var i = $(this); // current input
			var rule = i.attr('data-rule');

			if( rule !== undefined ){
			var ierror=false; // error flag for current input
			var pos = rule.indexOf( ':', 0 );
			if( pos >= 0 ){
				var exp = rule.substr( pos+1, rule.length );
				rule = rule.substr(0, pos);
			}else{
				rule = rule.substr( pos+1, rule.length );
			}
			
			switch( rule ){
				case 'required':
				if( i.val()==='' ){ ferror=ierror=true; }
				break;
				
				case 'maxlen':
				if( i.val().length<parseInt(exp) ){ ferror=ierror=true; }
				break;

				case 'email':
				if( !emailExp.test(i.val()) ){ ferror=ierror=true; }
				break;

				case 'digits':
				if( !digitsExp.test(i.val()) ){ ferror=ierror=true; }
				break;

				case 'checked':
				if( !i.attr('checked') ){ ferror=ierror=true; }
				break;
				
				case 'regexp':
				exp = new RegExp(exp);
				if( !exp.test(i.val()) ){ ferror=ierror=true; }
				break;
			}
				i.next('.validation').html( ( ierror ? (i.attr('data-msg') !== undefined ? i.attr('data-msg') : 'wrong Input') : '' ) ).show('blind');
			}
		});
		f.children('textarea').each(function(){ // run all inputs

			var i = $(this); // current input
			var rule = i.attr('data-rule');

			if( rule !== undefined ){
			var ierror=false; // error flag for current input
			var pos = rule.indexOf( ':', 0 );
			if( pos >= 0 ){
				var exp = rule.substr( pos+1, rule.length );
				rule = rule.substr(0, pos);
			}else{
				rule = rule.substr( pos+1, rule.length );
			}
			
			switch( rule ){
				case 'required':
				if( i.val()==='' ){ ferror=ierror=true; }
				break;
				
				case 'maxlen':
				if( i.val().length<parseInt(exp) ){ ferror=ierror=true; }
				break;
			}
				i.next('.validation').html( ( ierror ? (i.attr('data-msg') != undefined ? i.attr('data-msg') : 'wrong Input') : '' ) ).show('blind');
			}
		});
		if( ferror ) {
			$("#errormessage").text("请正确输入必填项");
			$("#errormessage").addClass("show");
			return false;
			}
			else var str = $(this).serialize();
		
			   $.ajax({
			   type: "POST",
			   url: "joinus.action.php",
			   data: str,
			   success: function(msg){
				$("#errormessage").ajaxComplete(function(event, request, settings){
			
				if(msg.substring(0,5)=="right")
				{
					$("#sendmessage").addClass("show");
					$("#formsubmit").attr("disabled",true); 
					$("#errormessage").removeClass("show");
					
				}
				else if(msg=="exists")
				{
					$("#errormessage").text("您已经提交了申请，请耐心等候。");
					$("#errormessage").addClass("show");
				}
				else
				{
					$("#errormessage").text("未知错误");
					$("#errormessage").addClass("show");
				}
			
				});
				}
			});
				return false;
	});

});