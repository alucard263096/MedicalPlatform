<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title><{$sitesetting.seo_title}></title>
	<meta name="description" content="<{$sitesetting.seo_description}>" />
	<meta name="keywords" content="<{$sitesetting.seo_keywords}>" />
	<link rel="shortcut icon" href="<{$rootpath}>/upload/fav/<{$sitesetting.favfile}>">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta http-equiv="cleartype" content="on" />
	<script>(function(h){h.className=h.className.replace(/\bno-js\b/,'js')}(document.documentElement))</script>
	<script src="<{$rootpath}>/themes/lm/index/internalnotforuse/scripts/modernizrcustom.js"></script>
	<link rel="stylesheet" href="<{$rootpath}>/themes/lm/index/internalnotforuse/style.css" />
</head> 
<!--[if IE 9]><body class="home ie9"><![endif]-->
<!--[if !IE 9]><!--><body class="home"><!--<![endif]-->
	<!-- Start Header -->
	<div id="header">			
	<div id="language" class="dropdown">
		
	</div>
	
	<div id="search">
		
	</div>
	<div id="identification" class="clearfix">
		<h1 id="heraeus">Heraeus</h1>
	</div>
</div> 
	<!-- Ende Header -->
	
	<!-- Start main -->
	<div id="main" class="clearfix">
		
		<div id="stage">
			<!-- Stage -->
			<!-- Stage Container-->
			<{foreach from=$bannerlist item=rs}>
			<div class="slide <{$rs.style}>">
				<img src="<{$rootpath}>/upload/banner/<{$rs.pic}>" >
				<div class="text">
					<h3><a style='color:white;' class='infotitle' href="#" ><{$rs.slogan}></a></h3>
						<a href="<{if $rs.link == ''}>#<{else}><{$rs.link}><{/if}>" class="link" target=""> <{$rs.label}> </a>
				</div>
				<div class="infobox">
					<div class="text">
						<div class="infotext">
							<h4><{$rs.title}></h4>
							<p><{foreach from=$rs.cl item=rss}>
								<{$rss}><br />
								<{/foreach}>
							</p>
							<{if $rs.link != ''}><p><a class="not-mobile " href='<{$rs.link}>'>点击查看详情</a></p><{/if}>
						</div>
					</div>
				</div>	
			</div>
			<{/foreach}>
			<!-- Stage-->
		</div>
		
		
		<div id="content" class="clearfix ">
			
				<div id="teaser" class="clearfix">
			
			
					<div class="teaser bbs normal"><!-- Teaserklassen triggern hauptsächlich das Aussehen der Boxen -->
	<a>
		<span class="small">产品</span>
		<span class="big">Heraeus骨水泥</span>
	</a>
	<div class="layer">
		<h3 class='showdesc'>Heraeus系列</h3>
		<ul class="imageteaser clearfix">
					<li>
	<a href="<{$rootpath}>/product/detail.php?id=3" class="link showdesc" target="" refl='p_pl'> <img src="<{$rootpath}>/themes/lm/images/palacos.png" alt="Professionals" title="Professionals" /> <p class="text">骨水泥</p> </a>	
</li>
					<li>
	<a href="<{$rootpath}>/product/detail.php?id=3" class="link showdesc" target="" refl='p_plg'> <img src="<{$rootpath}>/themes/lm/images/qameisu.png" alt="Graduates" title="Graduates" /> <p class="text">抗生素骨水泥</p> </a>	
</li>
					<li>
	<a href="<{$rootpath}>/product/detail.php?id=4" class="link showdesc" target="" refl='p_ov'> <img src="<{$rootpath}>/themes/lm/images/ov.png" alt="Students" title="Students" /> <p class="text">脊柱专用骨水泥</p> </a>	
</li>
					<li>
	<a href="<{$rootpath}>/product/detail.php?id=2" class="link showdesc" target="" refl='p_pm'> <img src="<{$rootpath}>/themes/lm/images/palamix.png" alt="Students" title="Students" /> <p class="text">骨水泥真空混合系统</p> </a>	
</li>
		</ul>
			<span id='p_pl' class='descOfProduct hide'>用于初次关节置换术的PALACOS®骨水泥通过它的高品质和卓越的性能赢得了骨科医生和外科医生的支持。</span>
			<span id='p_plg' class='descOfProduct hide'>贺利氏创新的抗感染涂层技术AntibiotiCoat是建立在含有抗生素跟脂肪酸的薄层的基础上，这种抗生素跟脂肪酸与医疗植入物的组合运用能够预防植入物受到污染。</span>
			<span id='p_ov' class='descOfProduct hide'>OSTEOPAL®V用于填充及稳定脊椎体的专业骨水泥材料。</span>
			<span id='p_pm' class='descOfProduct hide'>贺利氏公司出品的高质量真空搅拌系统PALAMIX®及有效的脉冲冲洗系统(PALAVAGE®)，都是现代骨水泥技术的重要组件。</span>
	</div>
</div>

<div class="teaser business normal">
	<a>
		<span class="small">产品</span>
		<span class="big">聚乳酸手术保护膜</span>
	</a>
	<div class="layer">
		<h3>聚乳酸手术保护膜</h3>
		<div class="textteaser">
			<img src="<{$rootpath}>/themes/lm/images/mast.png" alt="Heraeus" title="Heraeus" />
			<div class="teasertext">
				<p class="headline">SurgiWrap聚乳酸手术保护膜（简称“MAST膜”）是由美国MAST Biosurgery Inc.研制生产。</p>
				<p>组织粘连的产生是人体自然愈合过程中的一部分，也是外科手术后软组织修复的一个严重并发症。这种不良的无法控制的现象会导致手术失败和愈后不良，例如肠梗阻、盆腹腔痛、不孕症、心包粘连、肌腱灵活性降低、瘢痕组织引起的神经束膜疼痛、压迫神经疼痛以及脑膜搏动引起植入物碎裂等症状发生。</p>
				<a href="product/detail.php?id=1" class="not-mobile " target=""> 更多关于MAST </a> <a href="product/detail.php?id=1" class="only-mobile " target=""> 更多关于聚乳酸手术保护膜 </a>
			</div>
		</div>
		<div class="links">
				<a href="product/detail.php?id=1" class="not-mobile " target=""> 产品特性 </a> <a href="<{$rootpath}>/product/detail.php?id=1" class="only-mobile " target=""> 产品特性 </a>
				<a href="product/detail.php?id=1" class="not-mobile " target=""> 如何购买 </a> <a href="<{$rootpath}>/product/detail.php?id=1" class="only-mobile " target=""> 如何购买 </a>
		</div>
	</div>
</div>
<div class="teaser wide news">	
	<div class="slider">
<{foreach from=$hotlist item=rs}>
				<div class="slide">
	<p class="date"><{$rs.published_date}></p>
	<p class="summary"><{$rs.title}></p>
	<div class="layer">
		<p class="date"><{$rs.published_date}></p>
		<p class="summary"><{$rs.title}></p>
		<p><{$rs.summary}></p>
				<a href="<{$rootpath}>/news/detail.php?id=<{$rs.id}>" class="" target=""> 阅读全文 </a>
	</div>
</div>						
<{/foreach}>	
	</div>
</div>


<div class="teaser about normal"><!-- Teaserklassen triggern hauptsächlich das Aussehen der Boxen -->
	<a>
		<span class="small">加盟</span>
		<span class="big">成为我们的一份子</span>
	</a>
	<div class="layer">
		<h3>填写基本加盟信息</h3>
		<img src="<{$rootpath}>/themes/lm/images/gosuccess.jpg" alt="Students" title="Students" />
		<form id='joinusform' action="<{$rootpath}>/aboutus/joinus.php" method="post">
		<table class='inputtable'>
			<tr>
				<td>姓名：</td>
				<td><input type='text' name='name' watermark="请输入真实姓名" /></td>
			</tr>
			<tr>
				<td>联系电话：</td>
				<td><input type='text' name='phone' watermark="请输入您的联系方式"  /></td>
			</tr>
			<tr>
				<td>公司名称：</td>
				<td><input type='text' name='company_name'  watermark="请输入您的公司名称" /></td>
			</tr>
			<tr>
				<td>公司地址：</td>
				<td><input type='text'  name='company_address' watermark="请输入您的公司地址" /></td>
			</tr>
			<tr valign='top'>
				<td>留言：</td>
				<td><textarea cols='50' name='remarks' rows='3' ></textarea></td>
			</tr>
		</table>
		</form>
		<div class="links">
				<a href="#" class="not-mobile btnJoinus" target=""> 提交申请 </a> <a href="#" class="only-mobile btnJoinus" target=""> 提交申请 </a>
		</div>
	</div>
</div>
<div class="teaser career normal">
	<a>
		<span class="small">关于  </span>
		<span class="big">雷德睦华</span>
	</a>
	<div class="layer">
		<h3>雷德睦华</h3>
		<ul class="imageteaser clearfix">
					<li>
	<a href="<{$rootpath}>/aboutus/index.php" class="link" target=""> <img src="<{$rootpath}>/themes/lm/images/logo2.png" alt="Professionals" title="Professionals" /> <p class="text">公司简介</p> </a>	
</li>
					<li>
	<a href="<{$rootpath}>/aboutus/contactus.php" class="link" target=""> <img src="<{$rootpath}>/themes/lm/images/contactus.jpg" alt="Graduates" title="Graduates" /> <p class="text">联系我们</p> </a>	
</li>
					<li>
	<a href="<{$rootpath}>/aboutus/joinus.php" class="link" target=""> <img src="<{$rootpath}>/themes/lm/images/joinus.jpg" alt="Students" title="Students" /> <p class="text">加入我们</p> </a>	
</li>
					<li>
	<img src="<{$rootpath}>/themes/lm/images/qrcode.png" alt="Pupils" title="Pupils" /> 
</li>
		</ul>
	</div>
</div>

				</div>
						
				
		</div>
	</div>
	<!-- Ende main -->
	
	
	<!-- Start Navigation -->
	<!-- Start Navigation -->
<div id="navigation" class="clearfix">

</div>
<!-- Ende Navigation -->
	<!-- Ende Navigation -->
	
	<!-- Start Footer -->
	<div id="footer" class="clearfix">
	<p id="copyright"><img src="<{$rootpath}>/themes/lm/images/lmlogo.jpg" alt="" /></p>
	
</div>
 
	<!-- Ende Footer -->

		<script src="<{$rootpath}>/js/jquery.js"></script>
		<script src="<{$rootpath}>/js/jquery.watermark.min.js"></script>
	<script src="<{$rootpath}>/themes/lm/index/en/internalnotforuse/scripts/lang.js"></script>
	<script src="<{$rootpath}>/themes/lm/index/internalnotforuse/scripts/plugins.js"></script>
		<!-- GA Tracking -->
	
	<script src="<{$rootpath}>/themes/lm/index/internalnotforuse/scripts/main.js"></script> 	
	
	<script>
	$(document).ready(function(){
		$(".showdesc").hover(function(){
			var refname=$(this).attr("refl");
			$("#"+refname).show();
		},function(){
			$(".descOfProduct").hide();
		});
		
		$(".btnJoinus").click(function(){
			$("#joinusform").submit();
		});
	});
	</script>
</body>
</html> 

