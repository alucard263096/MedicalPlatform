	$(document).ready(function(){
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////						   
		
		if($.cookie("css")) {
			$("#css-skin").attr("href",$.cookie("css"));
		}
		$(".stylechanger li a").click(function() { 
			$("#css-skin").attr("href",'color/'+$(this).attr('rel'));
			$.cookie("css",'color/'+$(this).attr('rel'), {expires: 365, path: '/'});
			return false;
		});
		
		
	$(".openpanel").click(function(){$(".panel").toggle("slow");$(this).toggleClass("active");return false});	
				});