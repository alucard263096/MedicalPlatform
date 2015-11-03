

<script type="text/javascript">
$(document).ready(function(){

	<{foreach from=$managerlist item=rs }>
		<{foreach from=$rs.provincelist item=spell}>
		$("#detail_<{$spell}>").addClass("notEmpty").append("<div><b><{$rs.chname}> <{$rs.engname}></b><br />联系电话：<{$rs.tel}></div>");
		if($("#pro_<{$spell}>").length==0){
			$("#pro_pro").append("<a id='pro_<{$spell}>' href='#'></a>");
		}
		$("#name_<{$spell}>").text(arrprovince["<{$spell}>"]);
		<{/foreach}>
	<{/foreach}>
});
</script>
		<script type="text/javascript" src="<{$rootpath}>/themes/lm/js/jquery/jquery.accordion.js?1066871252" ></script>
		<script type="text/javascript" src="<{$rootpath}>/themes/lm/js/map.js?3186767804" ></script>
<div class="china_map clearfix">
<{include file="$smarty_root/aboutus/maparea.tpl" }>
	<div class="province" id="pro_pro">
    </div>

	<div class="name">
		<span id="name_Guangdong"></span>
        <span id="name_Anhui"></span>
        <span id="name_Beijing"></span>
        <span id="name_Chongqing" ></span>
        <span id="name_Fujian"></span>
        <span id="name_Gansu"> </span>
        <span id="name_Guangxi"></span>
        <span id="name_Guizhou"></span>
        <span id="name_Hainan" ></span>
        <span id="name_Hebei" ></span>
        <span id="name_Henan" ></span>
        <span id="name_Heilongjiang" ></span>
        <span id="name_Hongkong" ></span>
        <span id="name_Hubei" ></span>
        <span id="name_Hunan" ></span>
        <span id="name_Jiangsu" ></span>
        <span id="name_Jiangxi" ></span>
        <span id="name_Jilin" ></span>
        <span id="name_Liaoning" ></span>
        <span id="name_Mongol" ></span>
        <span id="name_Ningxia" ></span>
        <span id="name_Qinghai" ></span>
        <span id="name_Shaanxi" ></span>
        <span id="name_Shandong" ></span>
        <span id="name_Shanghai" ></span>
        <span id="name_Shanxi" ></span>
        <span id="name_Sichuan" ></span>
        <span id="name_Taiwan" ></span>
        <span id="name_Tianjin" ></span>
        <span id="name_Xinjiang" ></span>
        <span id="name_Xizang" ></span>
        <span id="name_Yunnan" ></span>
        <span id="name_Zhejiang" ></span>
	</div>
    
    <!-- 弹出分公司 -->
    <div class="map_detail dn" id="detail_Guangdong">
    </div>
    <div class="map_detail dn" id="detail_Anhui">
    </div>
    <div class="map_detail dn" id="detail_Beijing">
    </div>
    <div class="map_detail dn" id="detail_Chongqing">
    </div>
    <div class="map_detail dn" id="detail_Fujian">
    </div>
    <div class="map_detail dn" id="detail_Gansu">
    </div>
    <div class="map_detail dn" id="detail_Guangxi">
    </div>
    <div class="map_detail dn" id="detail_Guizhou">
    </div>
    <div class="map_detail dn" id="detail_Hainan">
    </div>
    <div class="map_detail dn" id="detail_Hebei">
    </div>
    <div class="map_detail dn" id="detail_Henan">
    </div>
    <div class="map_detail dn" id="detail_Heilongjiang">
    </div>
    <div class="map_detail dn" id="detail_Hongkong">
    </div>
    <div class="map_detail dn" id="detail_Hubei">
    </div>
    <div class="map_detail dn" id="detail_Hunan">
    </div>
    <div class="map_detail dn" id="detail_Jiangsu">
    </div>
    <div class="map_detail dn" id="detail_Jilin">
    </div>
    <div class="map_detail dn" id="detail_Jiangxi">
    </div>
    <div class="map_detail dn" id="detail_Liaoning">
    </div>
    <div class="map_detail dn" id="detail_Mongol">
    </div>
    <div class="map_detail dn" id="detail_Ningxia">
    </div>
    <div class="map_detail dn" id="detail_Qinghai">
    </div>
    <div class="map_detail dn" id="detail_Shaanxi">
    </div>
    <div class="map_detail dn" id="detail_Shandong">
    </div>
    <div class="map_detail dn" id="detail_Shanghai">
    </div>
    <div class="map_detail dn" id="detail_Shanxi">
    </div>
    <div class="map_detail dn" id="detail_Sichuan">
    </div>
    <div class="map_detail dn" id="detail_Taiwan">
    </div>
    <div class="map_detail dn" id="detail_Tianjin">
    </div>
    <div class="map_detail dn"" id="detail_Xinjiang">
    </div>
    <div class="map_detail dn" id="detail_Xizang">
    </div>
    <div class="map_detail dn" id="detail_Yunnan">
    </div>
    <div class="map_detail dn" id="detail_Zhejiang">
  
    </div>
    <!-- 弹出分公司 -->
  </div>