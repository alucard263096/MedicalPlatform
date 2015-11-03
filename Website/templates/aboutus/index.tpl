<{include file="$smarty_root/header.tpl" }>
	<!-- Start page head -->
		<section class="page-head contain-head">
			<div class="container">
			
				<div class="row">
					<div class="span9 head-text">
						<h3><i class="icon-group"></i>公司简介</h3>
						<p>
						本公司为德国Heraeus Medical医疗器械生产商在中国大陆指定产品的总代理，同时作为企业驻中国的联络处。 
						</p>
					</div>
					<div class="span3">
						<i class="icon icon-group"></i>
					</div>
				</div>
			</div>			
		</section>
		<!-- End page head -->
		
		
		
		<!-- Start contain -->
		<section class="page-contain">
			<div class="container">
			<div class="row">
						<div class="span12">
							<h4>我们是雷德睦华</h4>
							<{foreach from=$content item=rs}>
							<p>
							<{$rs}>
							</p>
							<{/foreach}>					
							<a class="btn btn-primary" href="<{$rootpath}>/aboutus/contactus.php">如何联系我们</a>
						</div>
						<!--
						<div class="span6">
							<div class="team-wrapper">
								<div class="team-desc pull-left tooltips">
									<h5>李倢瑞 Jerry</h5>
									<p>( 销售总监 )</p>					
								</div>
								<div class="team-avatar avatar-left" style="left: 0px;">
									<img alt="" src="<{$rootpath}>/themes/lm/rinna/img/dummies/team/avatar1.png">
								</div>
							</div>
							<div class="team-wrapper">
								<div class="team-desc pull-left tooltips">
									<h5>黄小燕  Camille</h5>
									<p>市场助理 </p>				
								</div>
								<div class="team-avatar avatar-left" style="left: 0px;">
									<img alt="" src="<{$rootpath}>/themes/lm/rinna/img/dummies/team/yanzi.jpg">
								</div>
							</div>
							<div class="team-wrapper">
								<div class="team-desc pull-right tooltips">
									<h5>李倢瑞 Jerry</h5>
									<p>( 销售总监 )</p>						
								</div>
								<div class="team-avatar avatar-right" style="right: 0px;">
									<img alt="" src="<{$rootpath}>/themes/lm/rinna/img/dummies/team/avatar3.png">
								</div>
							</div>
							<div class="team-wrapper">
								<div class="team-desc pull-right tooltips">
									<h5>李倢瑞 Jerry</h5>
									<p>( 销售总监 )</p>			
								</div>
								<div class="team-avatar avatar-right" style="right: 0px;">
									<img alt="" src="<{$rootpath}>/themes/lm/rinna/img/dummies/team/avatar4.png">
								</div>
							</div>						
						</div>					
            -->
					</div>
			</div>
		</section>
<!-- End contain -->


 



<{include file="$smarty_root/footer.tpl" }>
