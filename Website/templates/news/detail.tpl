<{include file="$smarty_root/header.tpl" }>

<!-- Start page head -->
		<section class="page-head contain-head">
			<div class="container">
			
				<div class="row">
					<div class="span9 head-text">
						<h3><i class="icon-info"></i>新闻中心</h3>
						<p>
						在这里为你展示雷德睦华的所有最新资讯 
						</p>
					</div>
					<div class="span3">
						<i class="icon icon-info"></i>
					</div>
				</div>
			</div>			
		</section>
		<!-- End page head -->
		
		
		
		
<section class="page-contain">
			<div class="container">
				<div class="row">
					<!-- Start article -->
					<div class="span9 margintop20">
						<article>
							<div class="row-fluid">
								<div class="span12">
									<h4><a href="#"><{$info.title}></a></h4>
									<div class="meta-post">
										<span><i class="icon-calendar"></i> <a href="#"><{$info.published_date}></a></span>
										<!-- <span><i class="icon-file-alt"></i> <a href="#">Web designs</a></span>
										<span><i class="icon-tags"></i> <a href="#">Designs ,</a> <a href="#">Creative ,</a><a href="#">Webs</a></span> -->
										<span><i class="icon-comments"></i> <a href="#">浏览（<{$info.viewcount}>）</a></span>
									</div>
									<{$info.content}>
								</div>
							</div>
						</article>
						
						
					<!-- End article -->
					
					
				</div>
			</div>
		</section>
  	
	

      
    
    
    
<{include file="$smarty_root/footer.tpl" }>
