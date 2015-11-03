<{include file="$smarty_root/header.tpl" }>


		<!-- Start page head -->
		<section class="page-head contain-head">
			<div class="container">
				<div class="row">
					<div class="span9 head-text">
						<h3><i class="icon-comments"></i>联系我们</h3>
						<p>
						如果你对我们的产品感到有兴趣，请立即联系我们！
						</p>
					</div>
					<div class="span3">
						<i class="icon icon-comments"></i>
					</div>
				</div>
			</div>			
		</section>
		<!-- End page head -->


<!-- Start contain -->
		<section class="page-contain">
			<div class="container">
			<div class="row">
						<{$companyinfo}>
			</div>
			</div>
		</section>
		<hr />
<link rel="stylesheet" type="text/css" href="<{$rootpath}>/themes/lm/css/contact.css?1856470724" media="screen" />
<link rel="stylesheet" type="text/css" href="<{$rootpath}>/themes/lm/css/map.css?958646445" media="screen" />
	<section class="page">
		<div class="container">
			<div class="row">
				<div class="span12">
	    		<h5 >各区联系人</h5>
		    		<div class='contact_kd bg-t'>
		    		<{foreach from=$managerlist item=rs }>
				    <ul>
				        <li class="company_name provincelist"><{$rs.provinces}></li>
				        <li><{$rs.chname}> <{$rs.engname}></li>
				        <li>电话：<{$rs.tel}></li>
				    </ul>
				    <{if $rs.seq%5==0}>
				    <div class="line bg-b mb20"></div>
				    <{/if}>
				    <{/foreach}>
		    		</div>
		    		<{include file="$smarty_root/aboutus/map.tpl" }>
    
    <script>
    var arrprovince=new Array();
    <{foreach from=$provincelist item=prs}>
    arrprovince["<{$prs.spell}>"]="<{$prs.provinceName}>";
	<{/foreach}>
    $(document).ready(function(){


		
		$(".provincelist").each(function(){
			var provincestr=$(this).text();
			var arr=provincestr.split(",");
			var nstr="";
			var isFirst=true;
			for(var i=0;i<arr.length;i++){
				if($.trim(arr[i])!=""){
					if(isFirst==false){
						nstr=nstr+"、";
					}
					isFirst=false;
					nstr=nstr+arrprovince[arr[i]];
				}
			}
			$(this).text(nstr);
		});

    });
    
    
    </script>
		    		
		    		
		    	</div>
	    	</div>
    	</div>
    </section>


<!-- end contain -->

<{include file="$smarty_root/footer.tpl" }>
