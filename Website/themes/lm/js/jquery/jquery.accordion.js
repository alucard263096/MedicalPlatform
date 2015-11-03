;(function($){
	
	
	$.fn.accordion = function(options){
		
		var def  = {
			speed : 600,  //切换速度
			only : true,	  //是否只允许一个展开
			headClass : '.ui-accordion-hd', // 标题class
			headContentClass : '.ui-accordion-box', //内容class
			events : 'click',
			activeClass : 'cur'
		}
	
		if(this.length > 1){
			this.each(function(){
				$(this).accordion(options);	
			})
			return;
		}
		
		var _this = this;
	
		var set = $.extend(def,options);

		var head = this.find(set.headClass);
		
		var slide = function(index,s){
			head.eq(index).hasClass(set.activeClass);
			var self = head.eq(index);
			var next = self.next();
			var dom = self.get(0);
			var s = s || 0;
			if(next.hasClass($.trim(set.headContentClass).substr(1))){
				if(dom.opened){
					next.stop(true).slideUp(s);
					self.removeClass(set.activeClass);
				}else{
					next.stop(true).slideDown(s);
					self.addClass(set.activeClass);
					if(set.only){
						head.each(function(i, element) {
                         	if(index == i || !$(this).hasClass(set.activeClass)) return;
							slide(i,s);
                        });
					}
				} 
			}
			dom.opened = !dom.opened;
		}
		
		// 加载时初始化
		var init = function(){
			var has = false;
			for(var i=0; i<head.length; i++){
				if(head.eq(i).hasClass(set.activeClass)){
					has = true;
					slide(i);
					if(set.only){
						head.eq(i).siblings().removeClass(set.activeClass);
						break;	
					}
				}	
			}
			if(!has) slide(0);
		}
		//点击切换
		var sw = function(){
			var index = _this.find(set.headClass).index(this);
			slide(index,set.speed)
		}
		
		this.find(set.headClass).bind(set.events,function(){
			sw.call(this);
		});
		
		init.call(this);
			
	}
	
})(jQuery)