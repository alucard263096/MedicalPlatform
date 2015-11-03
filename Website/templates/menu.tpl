
		<!-- Start navigation -->
		<section class="nav-container">	
			<div class="navbar-inner" style='background: url(<{$rootpath}>/themes/lm/images/ban.png) center no-repeat;background-size:cover;'>
				<div class="container">
					<div class="row">
						<div class="span12">			
							<a href="<{$rootpath}>/index.php" class="small-logo">
							<img style='margin-top:-30px' src="<{$rootpath}>/themes/lm/images/h_logo.png" alt="" />
							<div style='color:white;font-size:20px;font-weight:bold;margin-left:50px;margin-top:-10px'>贺利氏骨水泥</div>	
							</a>	
							<nav> 
								<ul>
									<li class="dropdown">
									<a  href="#" class="dropdown-toggle <{if $module=='aboutus'}>active<{/if}>" data-toggle="dropdown" >关于我们 <b class="caret"></b></a>		
										<ul class="dropdown-menu">
											<li><a href="<{$rootpath}>/aboutus/index.php">公司简介</a></li>
											<li><a href="<{$rootpath}>/aboutus/contactus.php">联系我们</a></li>	
											<li><a href="<{$rootpath}>/aboutus/joinus.php">加入我们</a></li>										
										</ul>						
									</li>
									<{foreach from=$productmenu item=rs}>
									<li class="dropdown">		
										<a  href="#" class="dropdown-toggle <{if $module=='product'&&$pcid==$rs.id}>active<{/if}>" data-toggle="dropdown" ><{$rs.name}><b class="caret"></b></a>	
										<ul class="dropdown-menu">
											<{foreach from=$rs.productlist item=rss}>
											<li><a href="<{$rootpath}>/product/detail.php?id=<{$rss.id}>"><{$rss.name}></a></li>
											<{/foreach}>								
										</ul>			
									</li>			
									<{/foreach}>	
									<li><a href="<{$rootpath}>/download/index.php" <{if $module=='download'}>class='active'<{/if}>>下载</a></li>	
									<li><a href="<{$rootpath}>/news/index.php" <{if $module=='news'}>class='active'<{/if}>>新闻中心</a></li>	
									<li><a href="<{$rootpath}>/partner/index.php" <{if $module=='partner'}>class='active'<{/if}>>合作伙伴</a></li>	
									<!--<li><a href="<{$rootpath}>/bbs" >进入论坛</a></li>		-->
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End navigation -->