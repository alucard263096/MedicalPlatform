


$(document).ready(function(){
	$('area').click(function(){
		$(this).blur();	
	});

	// 解析XML

	var xmlDate = null;

	var parseXML = function(url,fn){
		$.get(url,function(data){
			fn(data);
			// 手风琴
			$('.jxsin').accordion({
				headClass : '.hd',
				headContentClass : '.cnt',
				speed : 200	
			});
		});
	}
	
	var byTag = function(tagName,parent){
		return parent.getElementsByTagName(tagName);
	}

	var innerHtml = function(obj){
		return obj.childNodes[0] ? obj.childNodes[0].nodeValue : "";
	}

	var parseProv = function(){
		var self = this;
		var id = innerHtml(byTag('id',this)[0]);
		var pname = innerHtml(byTag('pname',this)[0]);
		var fgs = byTag('city',this);
		var $box = $('#'+id);
		$box.addClass('notEmpty');

		fgs = parseCity(fgs);

		var arrow = '<span class="arrow"></span>';
		var name = '<h2>'+pname+'</h2>';

		
		var strCompany = parseCompany.call(this);

		$box.append('<a class="closeMap" href="javascript:;"></a>').append(arrow).append($(name)).append('<h3 class="fgs-title">分公司</h3>')
			.append('<div class="fgs">'+fgs+'</div>').append('<h3>授权经销商</h3>')
			.append($(strCompany));

	}

	var parseCity = function(citys){
		var s = '';
		$.each(citys,function(){
			var cname = byTag('cname',this)[0];
			var url = byTag('url',this)[0];
			if(url){
				url = innerHtml(url);
				s += '<a target="_blank" href="'+url+'">'+innerHtml(cname)+'</a>';
			}
		});
		return s;
	}

	var parseCompany = function(){
		var companys = byTag('company',this);
		var str = '<div class="jxs"><div class="jxsin">';
		$.each(companys,function(){
			var partner,principal,phone,email,addr;
			var s;
			partner = innerHtml(byTag('partner',this)[0]);
			principal = innerHtml(byTag('principal',this)[0]);
			phone = innerHtml(byTag('phone',this)[0]);
			email = innerHtml(byTag('email',this)[0]);
			addr = innerHtml(byTag('addr',this)[0]);
			s = '<h4 class="hd">'+partner+'</h4>';
			s += '<div class="cnt">';
			s += '联系人：'+principal+' ';
			s += '电话：'+phone+' ';
			s += '邮箱：'+email+' ';
			s += '公司地址：'+addr+' </div>';
			str += s;
		});
		return str+'</div></div>';
	}
	
	
//	parseXML(mapxmlurl,function(xmlData){
//		var xml,domProvs; 
//         if( typeof xmlData == "string" ){  
//             xml = new ActiveXObject("Microsoft.XMLDOM");  
//             xml.async = false;  
//             xml.loadXML(xmlData);  
//         } else {  
//             xml = xmlData;   
//         }
//         domProvs = byTag('province',xml);
//         $.each(domProvs,function(){
//         	parseProv.call(this);
//         });
//		 init();
//		 
//		 $('.fgs').each(function(){
//			if($.trim($(this).html()) == ''){
//				$(this).prev('.fgs-title').hide();
//			}	 
//		});
//	});
	
	
	// 显示隐藏
	var mapElements = [];
	var id = 0;
	// 延迟显示
	var delayTime = 400;
	var delayTimer = null;
	// 延迟隐藏 
	var waitTime = 30;

	// 当前显示的对象
	var curMapEle = null;

	var init = function(){
		$('.map_detail').each(function(){
			
			var subfix = $(this).attr('id').split('_')[1];
			var self = this;
			mapElements.push({
				aid : id++, 
				detail : $(self),
				detailId : $(self).attr('id'),
				areaId : 'area_'+subfix,
				area : $('#area_'+subfix),
				pvMapId : 'pro_'+subfix,
				pvMap : $('#pro_'+subfix)
			});
		});

		$.each(mapElements,function(){
			var self = this;
			this.area.hover(function(e){
				$('.map_detail').hide();
				clearTimeout(self.waitTimer);
				self.pvMap.show();
				// 显示
				clearTimeout(delayTimer);
	
				delayTimer = setTimeout(function(){
					if(curMapEle){
						curMapEle.detail.hide();
						curMapEle.pvMap.hide();
					}
					if(self.detail.hasClass('notEmpty')){
						self.detail.stop(true,true).fadeIn(100,function(){
							if(!self.scrollBar){
								initScrollBar.call(self);
							}
							self.scrollBar = true;
						});
					
						
					}
					curMapEle = self;
				},delayTime);
				
			},function(e){
				clearTimeout(delayTimer);
				self.waitTimer = setTimeout(function(){
					self.pvMap.hide();
					self.detail.stop(true,true).fadeOut(100);
					curMapEle = null;
				},waitTime);
			});

			this.detail.hover(function(){
				clearTimeout(delayTimer);
				clearTimeout(self.waitTimer);
			},function(){
				$(this).hide();
				self.pvMap.hide();
			});
	
		});
		
		
		$('.closeMap').click(function(){
			$(this).closest('.map_detail').hide();	
			});
	}
	init();
	// 滚动条
	function initScrollBar (){
	
		var inner = this.detail.find('.jxsin');
		var outer = this.detail.find('.jxs');
		var innerHeight = inner.height();
		var outerHeight = outer.height()-10;
		var handle = null;
		var mouseDownY = 0;
		var t = 0;
		if(innerHeight < outerHeight) return;
		var createHandle = function(){
			var s = '<i class="scroll_drag_handle"></i>';
			handle =  $(s);
		}
		var createPath = function(){
			var s = '<div class="scroll_vertical_bar"></div>';
			s = $(s).css({
				height : outerHeight + 10	
			});
			s.append(handle);
			outer.append(s);
		}		
		createHandle();
		createPath();
		
		handle.mousedown(function(e){
			handle.drag = true;
			mouseDownY = e.pageY;
			e.preventDefault();
		});
		
		$(document).mousemove(function(e){
			if(handle.drag){
				t = e.pageY - outer.offset().top;
				if(t < 0) t = 0;
				if(t > outerHeight){
					t = outerHeight;
				}	
				handle.css({
					top : t+5
				});
				inner.css({
					marginTop : -(innerHeight - outerHeight)* (t /(outerHeight))	
				});
			}
			
			
		});
		$(document).mouseup(function(){
			handle.drag = false;
		});
		
		
		
	}
	init();
	
	
	
	
});