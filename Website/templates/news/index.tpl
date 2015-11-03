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
					<!-- End article -->
					<div  class="span9 margintop20">
					<p>
						<a href="#"><img class="median" alt="" src="<{$rootpath}>/themes/lm/images/news.jpg"></a>
					</p>
					<div id='newslist'>
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
					</div>	
					<div id='showwaiting'><img alt=""  src="<{$rootpath}>/images/loading.gif"><div>正在加载，请稍后</div></div>
					</div>
					<!-- End article -->
					
					<!-- Start aside -->
					<div class="span3 margintop10">
						<aside>
							<div class="widget">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a href="#popular" data-toggle="tab">热点新闻</a></li>
								</ul>
								<div class="tab-content" id="myTabContent">
									<div class="tab-pane fade in active" id="popular">
										<ul class="recent">
										<{foreach from=$hotlist item=rs}>
										<li>
												<!-- <a class="alignleft" href="#"><img alt="" src="img/dummies/blog/thumbs/thumb4.jpg"></a> -->
												<h6><a href="<{$rootpath}>/news/detail.php?id=<{$rs.id}>" target="_blank"><{$rs.title}></a></h6>
										</li>
										<{/foreach}>							
										</ul>
									</div>
								</div>
							</div>						
						</aside>
					</div>
					<!-- End aside -->						
				</div>
			</div>
		</section>
		
		
		
		
		


<script type="text/javascript">

var newspage=0;
var newsLoading=false;
var isEnd=false;
function isScrollToBottom(){
	return $(document).scrollTop()>=$(document).height()-$(window).height();
}

$(document).ready(function(){
	$("#showwaiting").hide();
	$(document).scroll(function(){
		if(isScrollToBottom()
				&&newsLoading==false
				&&isEnd==false){
			newsLoading=true;
			$("#showwaiting").show();
			$.post("getnews.php",{"page":++newspage},function(data){
				newsLoading=false;
				if($.trim(data)==""){
					$("#showwaiting").html("").show();
					isEnd=true;
				}else{
					$("#showwaiting").hide();
					$("#newslist").append(data);
				}
			});
		}
	});

});


</script>

<{include file="$smarty_root/footer.tpl" }>
