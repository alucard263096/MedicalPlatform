<{foreach from=$newslist item=rs}>
						<article>
							<div class="row-fluid">
								<div class="span2">
								<a class="media-icon" href="#"><i class="icon-picture icon64"></i></a>
								</div>
								<div class="span10">
									<h4><a href="<{$rootpath}>/news/detail.php?id=<{$rs.id}>" target="_blank"><{$rs.title}></a></h4>
									<div class="meta-post">
										<span><i class="icon-calendar"></i> <a href="#"><{$rs.published_date}></a></span>
										<!-- <span><i class="icon-file-alt"></i> <a href="#">Web designs</a></span>
										<span><i class="icon-tags"></i> <a href="#">Designs ,</a> <a href="#">Creative ,</a><a href="#">Webs</a></span> -->
										<span><i class="icon-comments"></i> <a href="#">浏览（<{$rs.viewcount}>）</a></span>
									</div>
									<p>
									<{$rs.summary}> 
									</p>
									<p><a class="btn btn-primary"  href="<{$rootpath}>/news/detail.php?id=<{$rs.id}>" target="_blank">阅读正文</a></p>
								</div>
							</div>
						</article>
<{/foreach}>