<{include file="$smarty_root/header.tpl" }>

<!-- Start page head -->
		<section class="page-head contain-head">
			<div class="container">
				<div class="row">
					<div class="span9 head-text">
						<h3><i class="icon-download"></i>下载中心</h3>
						<p>
						请下载你所需要的资料 
						</p>
					</div>
					<div class="span3">
						<i class="icon icon-download"></i>
					</div>
				</div>
			</div>			
		</section>
		<!-- End page head -->


<section id="portfolio">
			
			<div class="container">
				<div class="page-section">
					<div class="row">
						<div class="span12">				
							<ul class="portfolio-categ filter">
								<li class="all active"><a href="#">全部</a></li>
								<{foreach from=$list item=rs}>
								<li class="cl<{$rs.id}>"><a href="#"><{$rs.name}></a>
								</li>
								<{/foreach}>
							</ul>					
						</div>
					</div>
					<div class="row">
						<ul class="portfolio-area">	
							<{foreach from=$list item=rs}>
							<{foreach from=$rs.filelist item=info}>
							<li class="portfolio-item" data-type="cl<{$rs.id}>" data-id="id-0">	
								<div class="span3">
									<div class="folio-title" style="min-height:80px;">
										<h6><{$info.name}></h6>
										<{if $info.extlink==""}>
										<a class="detaillink" href="download.php?filename=<{$info.filename}>">下载</a>
										<{else}>
										<a class="detaillink" href="<{$info.extlink}>" target="_blank">下载</a>
										<{/if}>
									</div>
								</div>
							</li>
							<{/foreach}>
							<{/foreach}>
						</ul>					
					</div>
				</div>
			</div>			
		</section>



	<script src="<{$rootpath}>/themes/lm/rinna/js/quicksand/jquery.quicksand.js"></script>	
	<script src="<{$rootpath}>/themes/lm/rinna/js/quicksand/setting.js"></script>



<{include file="$smarty_root/footer.tpl" }>
