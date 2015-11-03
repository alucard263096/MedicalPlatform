<{include file="$smarty_root/header.tpl" }>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=3GpApnIzrOQnwXVn99MmeeUE"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />

  <!-- Start page head -->
		<section class="page-head contain-head">
			<div class="container">
			
				<div class="row">
					<div class="span9 head-text">
						<h3><i class="icon-road"></i><{$info.name}></h3>
						<p>
						<{$info.address}>
						</p>
					</div>
					<div class="span3">
						<i class="icon icon-road"></i>
					</div>
				</div>
			</div>			
		</section>
		<!-- End page head -->
	<section class="page-contain">
			<div class="container">
				<div class="row">
							<div class="span4">
							<img alt="" width="300px" src="<{$rootpath}>/themes/site_themes/LandMover/images/building.jpg" />
							</div>
							<div class="span8">

					      			<table>
					      				<tr>
					      					<td width="50px"></td>
					      					<td></td>
					      				</tr>
					      				<tr>
					      					<td><strong>地址：</strong></td>
					      					<td><{$info.address}></td>
					      				</tr>
					      				<tr>
					      					<td><strong>电话：</strong></td>
					      					<td><{$info.tel}></td>
					      				</tr>
					      				<tr>
					      					<td><strong>传真：</strong></td>
					      					<td><{$info.tel}></td>
					      				</tr>
					      				<tr>
					      					<td><strong>手机：</strong></td>
					      					<td><{$info.tel}></td>
					      				</tr>
					      				<tr valign="top">
					      					<td><strong>简介：</strong></td>
					      					<td><span style="color: #bbbbbb"><{$info.summary}></span></td>
					      				</tr>
					      			</table>
							</div>
				</div>
				<div class="row">
					<div class="span12">
						<div class="divider"></div>
					</div>
				</div>
				<div class="row">
					<div class="span7">
						<h4>简介</h4>
						<div style="display:table;width:100%;">
						<{$info.content}>
						</div>
					</div>
					<div class="span5">
			    	  <div id="allmap" style="overflow:hidden;zoom:1;height:280px;">	
					    <div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
					  </div>
					</div>
				</div>
			</div>
	</section>

    
<script type="text/javascript">

var map = null;
var searchInfoWindow = null; 

$(document).ready(function(){
	
	map = new BMap.Map('map');
    var point = new BMap.Point(<{$info.x}>,<{$info.y}>);
    map.centerAndZoom(point, 15);
    map.enableScrollWheelZoom();
    
    var marker = new BMap.Marker(point); //创建marker对象
    marker.addEventListener("click", function(e){
	    searchInfoWindow.open(marker);
    });

    var content = '<div style="wmargin:0;line-height:20px;padding:2px;">地址：' +
    '<{$info.address}><br/>电话：<{$info.tel}>' +
  '</div>';
	      
   searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
  			title  : "<{$info.name}>",      //标题
  			width  : 290,             //宽度
  			height : 105,              //高度
  			enableAutoPan : true,     //自动平移
  			enableSendToPhone:false, 
  		    searchTypes :[
  		              ]
  		});
    
    map.addOverlay(marker); //在地图中添加marker
    searchInfoWindow.open(marker);
    marker.addEventListener("click", function(e){
	    searchInfoWindow.open(marker); //在marker上打开检索信息串口dow.open(marker);
    });

    
	//searchInfoWindow.open(marker); //在marker上打开检索信息串口dow.open(marker);


	
});
</script>
    
    
    
<{include file="$smarty_root/footer.tpl" }>
