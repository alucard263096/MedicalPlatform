<{include file="$smarty_root/header.tpl" }>

<!-- Start page head -->
		<section class="page-head contain-head">
			<div class="container">
			
				<div class="row">
					<div class="span9 head-text">
						<h3 style='font-size:40px;'><{$info.name}></h3>
						<p style='font-size:24px;'>
						<{$info.summary}>
						</p>
					</div>
					<div class="span3">
						<img src='<{$rootpath}>/upload/product/<{$info.logo}>' />
					</div>
				</div>
			</div>			
		</section>
		<!-- End page head -->
		
				<{$info.content}>
				
				
<script src="<{$rootpath}>/themes/lm/rinna/js/parallax/jquery.inview.js"></script>
<script src="<{$rootpath}>/themes/lm/rinna/js/parallax/nbw-parallax.js"></script>

<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="<{$rootpath}>/themes/lm/js/product_chart.js"></script>
				
				

<{include file="$smarty_root/footer.tpl" }>
