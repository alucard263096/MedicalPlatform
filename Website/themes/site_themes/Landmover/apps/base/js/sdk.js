
String.prototype.replaceAll = function(searchValue, replaceValue){
	return this.replace(new RegExp(searchValue,"gm"), replaceValue);
};

window.$FlexPaper = window["$FlexPaper"] = function(){
	if (window['flexpaper']) 
		return window['flexpaper'];
	else 
		window['flexpaper'] = window.FlexPaperViewer_Instance.getApi();
	
	return window['flexpaper'];
};

/**
*
* FlexPaper constructor (name of swf, name of placeholder, config)
*
*/
window.FlexPaperViewer = function() {
	var config = arguments[2].config;

	window.FlexPaperViewer_Instance = flashembed(arguments[1], {
			src: arguments[0],
			version: [11, 0],
			expressInstall: "/st/static/common/js/flexpaper/expressInstall.swf"
		},{
			SwfFile : config.SwfFile,
			Scale : config.Scale, 
			ZoomTransition : config.ZoomTransition,
			ZoomTime : config.ZoomTime,
			ZoomInterval : config.ZoomInterval,
			FitPageOnLoad : config.FitPageOnLoad,
			FitWidthOnLoad : config.FitWidthOnLoad,
			FullScreenAsMaxWindow : config.FullScreenAsMaxWindow,
			ProgressiveLoading : config.ProgressiveLoading,
			MinZoomSize : config.MinZoomSize,
			MaxZoomSize : config.MaxZoomSize,
			SearchMatchAll : config.SearchMatchAll,
			SearchServiceUrl : config.SearchServiceUrl,
			InitViewMode : config.InitViewMode,
			BitmapBasedRendering : config.BitmapBasedRendering,
			StartAtPage : config.StartAtPage,
			PrintPaperAsBitmap : config.PrintPaperAsBitmap,
			AutoAdjustPrintSize : config.AutoAdjustPrintSize,
			
			ViewModeToolsVisible : config.ViewModeToolsVisible,
			ZoomToolsVisible : config.ZoomToolsVisible,
			NavToolsVisible : config.NavToolsVisible,
			CursorToolsVisible : config.CursorToolsVisible,
			SearchToolsVisible : config.SearchToolsVisible,
			  
			RenderingOrder : config.RenderingOrder,
			  
			localeChain : config.localeChain,
			key : config.key
	});
};



/**
 * Handles the event of external links getting clicked in the document. 
 *
 * @example onExternalLinkClicked("http://www.google.com")
 *
 * @param String link
 */
function onExternalLinkClicked(link){
   // alert("link " + link + " clicked" );
   window.location.href = link;
}

/**
 * Recieves progress information about the document being loaded
 *
 * @example onProgress( 100,10000 );
 *
 * @param int loaded
 * @param int total
 */
function onProgress(loadedBytes,totalBytes){
}

/**
 * Handles the event of a document is in progress of loading
 *
 */
function onDocumentLoading(){
}

/**
 * Receives messages about the current page being changed
 *
 * @example onCurrentPageChanged( 10 );
 *
 * @param int pagenum
 */
function onCurrentPageChanged(pagenum){
}

/**
 * Receives messages about the document being loaded
 *
 * @example onDocumentLoaded( 20 );
 *
 * @param int totalPages
 */
function onDocumentLoaded(totalPages){
}

/**
 * Handles the event of a document is in progress of loading
 *
 */
function onPageLoading(pageNumber){
}

/**
 * Receives messages about the page loaded
 *
 * @example onPageLoaded( 1 );
 *
 * @param int pageNumber
 */
function onPageLoaded(pageNumber){
}

/**
 * Receives error messages when a document is not loading properly
 *
 * @example onDocumentLoadedError( "Network error" );
 *
 * @param String errorMessage
 */
function onDocumentLoadedError(errMessage){
}

/**
 * Receives error messages when a document has finished printed
 *
 * @example onDocumentPrinted();
 *
 */
function onDocumentPrinted(){
}



/** 
 * 
 * FlexPaper embedding functionality. Based on FlashEmbed
 *
 */

(function() {
		
	var IE = document.all,
		 URL = 'http://get.adobe.com/cn/flashplayer/otherversions/',
		 JQUERY = typeof jQuery == 'function', 
		 RE = /(\d+)[^\d]+(\d+)[^\d]*(\d*)/,
		 GLOBAL_OPTS = { 
			// very common opts
			width: '100%',
			height: '100%',		
			id: "_" + ("" + Math.random()).slice(9),
			wmode:'transparent',
			// flashembed defaults
			allowfullscreen: true,
			allowscriptaccess: 'always',
			quality: 'high',	
			
			// flashembed specific options
			version: [3, 0],
			onFail: null,
			expressInstall: null, 
			w3c: false,
			cachebusting: false  		 		 
	};
	
	if(IE){GLOBAL_OPTS.cachebusting=true;}
	
	// version 9 bugfix: (http://blog.deconcept.com/2006/07/28/swfobject-143-released/)
	if (window.attachEvent) {
		window.attachEvent("onbeforeunload", function() {
			__flash_unloadHandler = function() {};
			__flash_savedUnloadHandler = function() {};
		});
	}
	
	// simple extend
	function extend(to, from) {
		if (from) {
			for (var key in from) {
				if (from.hasOwnProperty(key)) {
					to[key] = from[key];
				}
			}
		} 
		return to;
	}	

	// used by asString method	
	function map(arr, func) {
		var newArr = []; 
		for (var i in arr) {
			if (arr.hasOwnProperty(i)) {
				newArr[i] = func(arr[i]);
			}
		}
		return newArr;
	}

	window.flashembed = function(root, opts, conf) {
	
		// root must be found / loaded	
		if (typeof root == 'string') {
			root = document.getElementById(root.replace("#", ""));
		}
		
		// not found
		if (!root) { return; }
		
		root.onclick = function(){return false;}
		
		if (typeof opts == 'string') {
			opts = {src: opts};	
		}

		return new Flash(root, extend(extend({}, GLOBAL_OPTS), opts), conf); 
	};	
	
	// flashembed "static" API
	var f = extend(window.flashembed, {
		
		conf: GLOBAL_OPTS,
	
		getVersion: function()  {
			var fo, ver;
			
			try {
				ver = navigator.plugins["Shockwave Flash"].description.slice(16); 
			} catch(e) {
				
				try  {
					fo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
					ver = fo && fo.GetVariable("$version");
					
				} catch(err) {
                try  {
                    fo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");
                    ver = fo && fo.GetVariable("$version");  
                } catch(err2) { } 						
				} 
			}
			
			ver = RE.exec(ver);
			return ver ? [ver[1], ver[3]] : [0, 0];
		},
		
		asString: function(obj) { 

			if (obj === null || obj === undefined) { return null; }
			var type = typeof obj;
			if (type == 'object' && obj.push) { type = 'array'; }
			
			switch (type){  
				
				case 'string':
					obj = obj.replace(new RegExp('(["\\\\])', 'g'), '\\$1');
					
					// flash does not handle %- characters well. transforms "50%" to "50pct" (a dirty hack, I admit)
					obj = obj.replace(/^\s?(\d+\.?\d+)%/, "$1pct");
					return '"' +obj+ '"';
					
				case 'array':
					return '['+ map(obj, function(el) {
						return f.asString(el);
					}).join(',') +']'; 
					
				case 'function':
					return '"function()"';
					
				case 'object':
					var str = [];
					for (var prop in obj) {
						if (obj.hasOwnProperty(prop)) {
							str.push('"'+prop+'":'+ f.asString(obj[prop]));
						}
					}
					return '{'+str.join(',')+'}';
			}
			
			// replace ' --> "  and remove spaces
			return String(obj).replace(/\s/g, " ").replace(/\'/g, "\"");
		},
		
		getHTML: function(opts, conf) {

			opts = extend({}, opts);
			
			/******* OBJECT tag and it's attributes *******/
			var html = '<object width="' + opts.width + 
				'" height="' + opts.height + 
				'" id="' + opts.id + 
				'" name="' + opts.id + '"';
			
			if (opts.cachebusting) {
				opts.src += ((opts.src.indexOf("?") != -1 ? "&" : "?") + Math.random());		
			}			
			
			if (opts.w3c || !IE) {
				html += ' data="' +opts.src+ '" type="application/x-shockwave-flash"';		
			} else {
				html += ' classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"';	
			}
			
			html += '>'; 
			
			/******* nested PARAM tags *******/
			if (opts.w3c || IE) {
				html += '<param name="movie" value="' +opts.src+ '" />'; 	
			} 
			
			// not allowed params
			opts.width = opts.height = opts.id = opts.w3c = opts.src = null;
			opts.onFail = opts.version = opts.expressInstall = null;
			
			for (var key in opts) {
				if (opts[key]) {
					html += '<param name="'+ key +'" value="'+ opts[key] +'" />';
				}
			}	
		
			/******* FLASHVARS *******/
			var vars = "";
			
			if (conf) {
				for (var k in conf) { 
					if (conf[k]) {
						var val = conf[k]; 
						vars += k +'='+ (/function|object/.test(typeof val) ? f.asString(val) : val) + '&';
					}
				}
				vars = vars.slice(0, -1);
				html += '<param name="flashvars" value=\'' + vars + '\' />';
			}
			
			html += "</object>";	
			
			return html;				
		},
		
		isSupported: function(ver) {
			return VERSION[0] > ver[0] || VERSION[0] == ver[0] && VERSION[1] >= ver[1];			
		}		
		
	});
	
	var VERSION = f.getVersion(); 
	
	function Flash(root, opts, conf) {  
	                                                
		// version is ok
		if (f.isSupported(opts.version)) {
			root.innerHTML = f.getHTML(opts, conf);
			
		// express install
		} else if (opts.expressInstall && f.isSupported([6, 65])) {
			root.innerHTML = f.getHTML(extend(opts, {src: opts.expressInstall}), {
				MMredirectURL: location.href,
				MMplayerType: 'PlugIn',
				MMdoctitle: document.title
			});	
			
		} else {
			
			// fail #2.1 custom content inside container
			if (!root.innerHTML.replace(/\s/g, '')) {
				/* root.innerHTML = 
					"<h2>Flash version " + opts.version + " or greater is required</h2>" + 
					"<h3>" + 
						(VERSION[0] > 0 ? "Your version is " + VERSION : "You have no flash plugin installed") +
					"</h3>" + 
					
					(root.tagName == 'A' ? "<p>Click here to download latest version</p>" : 
						"<p>Download latest version from <a href='" + URL + "'>here</a></p>");
				*/
				var pageHost = ((document.location.protocol == "https:") ? "https://" :	"http://");
				
				root.innerHTML = "<a href='http://get.adobe.com/cn/flashplayer/otherversions/'><img src='" 
										+ pageHost + "www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a>";
											
				if (root.tagName == 'A') {	
					root.onclick = function() {
						location.href = URL;
					};
				}				
			}
			
			// onFail
			if (opts.onFail) {
				var ret = opts.onFail.call(this);
				if (typeof ret == 'string') { root.innerHTML = ret; }	
			}			
		}
		
		// http://flowplayer.org/forum/8/18186#post-18593
		if (IE) {
			window[opts.id] = document.getElementById(opts.id);
		} 
		
		// API methods for callback
		extend(this, {
				
			getRoot: function() {
				return root;	
			},
			
			getOptions: function() {
				return opts;	
			},

			
			getConf: function() {
				return conf;	
			}, 
			
			getApi: function() {
				return root.firstChild;	
			}
			
		}); 
	}
	
	// setup jquery support
	if (JQUERY) {
		
		// tools version number
		jQuery.tools = jQuery.tools || {version: '1.2.5'};
		
		jQuery.tools.flashembed = {  
			conf: GLOBAL_OPTS
		};	
		
		jQuery.fn.flashembed = function(opts, conf) {		
			return this.each(function() { 
				$(this).data("flashembed", flashembed(this, opts, conf));
			});
		}; 
	} 
	
})();

String.prototype.format = function() {
    var s = this;
    for(var i = 0; i < arguments.length; i++){
        var reg = new RegExp("\\{" + i + "\\}", "gm");
        s = s.replace(reg, arguments[i]);
    }
    return s;
};
// abc.ensWith("**")
String.prototype.endsWith = function(suffix) {
    return (this.substr(this.length - suffix.length) === suffix);
};
String.prototype.startsWith = function(prefix) {
    return (this.substr(0, prefix.length) === prefix);
};
String.prototype.stripTags = function(){
    return this.replace(/<\/?[^>]+>/gi, '');
};
Array.prototype.remove = function(value){
    for(var i = 0; i < this.length;){
        if (this[i] === value){
            this.splice(i, 1);
        }else{
           ++i;
        }
    }
};
Array.prototype.indexOf = function(val) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val) return i;
    }
    return -1;
};

Array.prototype.remove = function(val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};
var KDWeibo = function(){};
/**
 * 可选样式
 * ***
    KDWeibo.share({'container':'.weiboShareButtonSize1','button-type':'1','show-count':'1',width:52,height:32});
    KDWeibo.share({'container':'.weiboShareButtonSize2',width:52,height:32})
 	KDWeibo.share(".weiboShareButtonSize1", '1', '1', 52, 32);
	KDWeibo.share(".weiboShareButtonSize2", '2', '1', 52, 24);
	KDWeibo.share(".weiboShareButtonSize3", '3', '1', 52, 16);
	KDWeibo.share(".weiboShareButtonSize4", '4', '1', 142, 60);
	KDWeibo.share(".weiboShareButtonSize5", '5', '1', 106, 52);
	KDWeibo.share(".weiboShareButtonSize6", '6', '1', 84, 44);
	KDWeibo.share(".weiboShareButtonSize4_nc", '4', '0', 142, 32);
	KDWeibo.share(".weiboShareButtonSize5_nc", '5', '0', 106, 24);
	KDWeibo.share(".weiboShareButtonSize6_nc", '6', '0', 84, 16);
*/
KDWeibo.share = function(options){
	var container = options['container'];
	var btnType = options['button-type'] || '1';
	var showCount = options['show-count'] || '1';
	var width = options['width'] || 34;
	var height = options['height'] || 16;
	var title = options['title'] || '';
	
	var _w = width , _h = height;
	if(!title){
		title = document.title;
	}
	var param = {
			url:location.href,
			title:title,     //分享的文字内容(可选，为空时读默认的，默认为所在页面的title)
			count:showCount,    //是否显示分享数，1显示(可选)
			time:new Date().getTime(),
			type: btnType	//1:16x16,2:24x24,3:32x32
	};
	if(param.title == '') param.title = document.title;
	param.title = param.title + ' (分享自#'+window.appSession.appTitle+'#)';
	var temp = [];
	for(var p in param){
		temp.push(p + '=' + encodeURIComponent( param[p] || '' ) );
	}
	var html = '<iframe allowTransparency="true" frameborder="0" scrolling="no" src="http://kdweibo.com/snsapi/share/share.jsp?' + temp.join('&') + '" width="'+ _w+'" height="'+_h+'"></iframe>';
	var btnContainers = $(container);
	var length = btnContainers.length;
	if(length == 1){

	}
	$(container).each(function(){
		$(this).attr("title","分享到金蝶微博");
		$(this).html(html);
	});
};
var App = function(){};
App.val = function(elementId){
	var result = $("#"+elementId).val();
	return $.trim(result);
};
App.getCookie = function(name){
    var r = document.cookie.match("\\b" + name + "=([^;]*)\\b");
    return r ? r[1] : undefined;
};
App.toInt = function(s){
    s = s.replace(/\D/g, '').replace(/\s+/g,'');
    if(s.length==0){
        return 0;
    }
    val = parseInt(s, 10);
    if(isNaN(val)){
        return 0;
    }
    return val;
};
App.isInt = function(s){
	if(s==null){
		return false;
	}
	if(/^(\d+)$/gi.test(s)){
		return true;
	}
	return false;
};
App.isBlank = function(s){
	if(typeof(s)=='string'){
		return s==null || $.trim(s)=="";
	}else if(s==null){
		return true;
	}else{
		return false;
	}
};
App.startsWith = function(s,x){
	if(s.length == 0){
		return false;
	}else if(s.indexOf(x) > -1){
		return true;
	}
	return false;
};
App.isNotBlank = function(s){
	return s!=null && $.trim(s)!= "";
};
App.trim = function(s){
	return s.replace(/(^\s*)|(\s*$)/g, "");
};
/**
判断日期格式是否为yyyy-mm-dd
*/
App.isDate = function(dateStr)   {
  if (App.trim(dateStr) == "") return true;
  var reg = /^(\d{4})-(\d{1,2})-(\d{1,2})$/;
  var str = dateStr;
  var arr = reg.exec(str);
  if (arr == null) return false;
  if (reg.test(str)) {
	  if (arr[2] > 0 && arr[2] <= 12 && arr[3] > 0 && arr[3] <= 31) {
		  return true;
	  }
  } 
  return false;
};

/**
* 判断start_time是否在end_time之前
*/
App.isStartTimeBeforeEndTime = function(start_time, end_time) { 
  var tmpBeginTime = new Date(start_time.replace(/-/g,"\/"));
  var tmpEndTime = new Date(end_time.replace(/-/g,"\/"));
  if (tmpBeginTime.getTime()>tmpEndTime.getTime()) {
  		return false;
  }
  return true;
};
App.qs = function(url) {
	if(url == ""){
		return {};
	}
	var a = url.split('?');
	if(a.length==1){
		return {};
	}
	a = a[1];
    if (a == ""){
    	return {};
    }
    if(a.startsWith('&')){
    	a = a.substr(1);
    }
    a = a.split('&');
    var b = {};
    for (var i = 0; i < a.length; ++i){
        var p=a[i].split('=');
        if (p.length != 2) continue;
        b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
    }
    return b;
};
App.toQs = function(parm){
	var args = {};
	for(var k in parm){
		if(parm[k]){
			args[k] = parm[k];
		}
	}
	return $.param(args);
};
App.showBox = function(url,data,css,callback){
	$.get(url,data,function(s){
		App.showMessage(s,css,callback);
	});
};
App.showMessage = function(message,css,callback){
	$("#popup-dialog").html(message);
	if(css){
		$("#popup-dialog").css(css);
	}else{
		$("#popup-dialog").css({'width':'628px'});
	}
	$("#popup-dialog").show();
	$("#showDialogLink").click();
	$.fancybox.resize();
	$.fancybox.center();
	if(typeof(callback)=='function'){
		callback();
	}
	$(".close-modal-box").click(App.closeBox);
};
App.setBoxContent = function(s){
	$("#popup-dialog").html(s);
	$.fancybox.resize();
	$(".close-modal-box").click(App.closeBox);
};
App.closeBox = function(){
	$("#popup-dialog").html("").hide();
	$.fancybox.close();
};
App.cleanWordHtml = function(str){
	// get rid of unnecessary tag spans (comments and title)
    str = str.replace(/\<\!--(\w|\W)+?--\>/gim, '');
    str = str.replace(/\<title\>(\w|\W)+?\<\/title\>/gim, '');
    // Get rid of classes and styles
    str = str.replace(/\s?class=\w+/gim, '');
    str = str.replace(/\s+style=\'[^\']+\'/gim, '');
    // Get rid of unnecessary tags
    str = str.replace(/<(meta|link|\/?o:|\/?style|\/?div|\/?st\d|\/?head|\/?html|body|\/?body|\/?span|!\[)[^>]*?>/gim, '');
    // Get rid of empty paragraph tags
    str = str.replace(/(<[^>]+>)+&nbsp;(<\/\w+>)/gim, '');
    // remove bizarre v: element attached to <img> tag
    str = str.replace(/\s+v:\w+=""[^""]+""/gim, '');
    // remove extra lines
    str = str.replace(/"(\n\r){2,}/gim, '');
    
    // Fix entites
    str = str.replace("&ldquo;", "\"");
    str = str.replace("&rdquo;", "\"");
    str = str.replace("&mdash;", "–");
        
    return str;
};
/**
 *  提示信息框
 *  sender 	事件触发的元素，提示框会显示在sender的正上方
 *  type	提示框类型：success/error/info/question/blame
 *  message	要提示的内容
 */
App.showTip = function(sender, type, message){
	if(sender.length == 0)
		return;
	var infoTipBox = $("#info-tip");
	//创建内容结构
	if(!infoTipBox.hasClass("infoTips")){
		infoTipBox.addClass("infoTips");
		infoTipBox.html('<div class="Contop"></div><div class="ConMiddle"><b class="icon"></b><span class="msg"></span></div>');
	}
	infoTipBox.addClass("t"+type);
	infoTipBox.find(".msg").html(message);
	var top = sender.offset().top - infoTipBox.height() - 80;//padding-bottom
	var left = sender.offset().left + sender.width()/2 - infoTipBox.width()/2 - 150;
	infoTipBox.css("top", top);
	infoTipBox.css("left", left);
	infoTipBox.css("display", "block");
	
	//关闭
	var tipBoxTimmer = setInterval(function(){
		infoTipBox.css("display", "none");
		infoTipBox.removeClass("t"+type);
		infoTipBox.find(".msg").html("");
		clearInterval(tipBoxTimmer);
		},
		2000
	);
};
App.ajaxGet = function(url,form,callback){
	var files = $(form).find("input[type='file']");
	if(files.size()==0){
		var data = $(form).serialize();
		$.get(url,data,function(s){
			//return data must be JSON format
			if(typeof(callback)=='function'){
				callback(s);
			}
		},'json');
	}else{
		alert("ajaxGet不支持文件上传.");
	}
};
App.ajaxDoGet = function(url,data,callback){
	//data ==> {'a':a,'b':b};
	$.get(url,data,function(s){
		//return data must be JSON format
		if(typeof(callback)=='function'){
			callback(s);
		}
	},'json');
};
App.ajaxGetHtml = function(url,form,callback){
	var files = $(form).find("input[type='file']");
	if(files.size()==0){
		var data = $(form).serialize();
		$.get(url,data,function(s){
			//return data must be HTML format
			if(typeof(callback)=='function'){
				callback(s);
			}
		});
	}else{
		alert("ajaxGetHtml不支持文件上传.");
	}
};
App.ajaxDoGetHtml = function(url,data,callback){
	//data ==> {'a':a,'b':b};
	$.get(url,data,function(s){
		//return data must be HTML format
		if(typeof(callback)=='function'){
			callback(s);
		}
	});
};
App.ajaxPost = function(url,form,before,callback){
	if(typeof(before)=='function'){
		if(!before(form)){
			return;
		}
	}
	var files = $(form).find("input[type='file']");
	if(files.size()==0){
		var data = $(form).serialize();
		$.ajax({
			  type: 'POST',
			  url: url,
			  data: data,
			  success: function(data, textStatus, jqXHR){
					if(typeof(callback)=='function'){
						callback(data);
					}
			  },
			  error: function(jqXHR, textStatus, errorThrown){
				  if(typeof(callback)=='function'){
						callback(jqXHR.responseText);
					}
			  },
			  dataType: "json"
			});
	}else{
		alert("ajaxPost不支持文件上传.");
	}
};
App.ajaxPostHtml = function(url,form,before,callback){
	if(typeof(before)=='function'){
		if(!before(form)){
			return;
		}
	}
	var files = $(form).find("input[type='file']");
	if(files.size()==0){
		var data = $(form).serialize();
		$.ajax({
			  type: 'POST',
			  url: url,
			  data: data,
			  success: function(data, textStatus, jqXHR){
					if(typeof(callback)=='function'){
						callback(data);
					}
			  },
			  error: function(jqXHR, textStatus, errorThrown){
				  if(typeof(callback)=='function'){
						callback(jqXHR.responseText);
					}
			  },
			  dataType: "html"
			});
	}else{
		alert("ajaxPostHtml不支持文件上传.");
	}
};
App.inlineTab = function(selectedCallback){
	$(".tab-container").each(function(){
		var id = $(this).attr("id");
		$(this).find(".tab-item").each(function(index,item){
			$(this).attr("_tc", id);
			if(index==0){
				$(this).show();
				$("#"+id+" .tab-content").eq(0).show();
			}
			$(this).mouseover(function(){
				var tcid = $(this).attr("_tc");
				$("#"+tcid+" .tab-content").hide();
				$("#"+tcid+" .tab-item").removeClass("current");
				$("#"+tcid+" .tab-item span").removeClass("cur");

				$(this).addClass("current");
				$(this).find("span").addClass("cur");
				$("#"+tcid+" .tab-content").eq(index).show();
				
				if(typeof(selectedCallback)=='function'){
					selectedCallback(this);
				}
			});
		});
	});
};
App.ddl = function(){
	var _show = false;
	$(".ddl-container").each(function(){
		var c = $(this);
		c.find(".ddl-select-text").click(function(){
			if(!_show){
				c.find(".ddl-item").show();
				_show = true;
			}else{
				c.find(".ddl-item").hide();
				_show = false;
			}
		});
		c.find(".ddl-item").click(function(){
			var VAL = $(this).attr("val");
			var TIT = $(this).text();
			var tid = c.attr("rel");
			c.find("#"+tid).val(VAL);
			c.find(".ddl-select-text").text(TIT);
			c.find(".ddl-item").hide();
		});
		c.find(".ddl-item").bind('mouseover',function(event){
			$(this).addClass('even');
		});
		c.find(".ddl-item").bind('mouseout',function(event){
			$(this).removeClass('even');
		});
	});
};
//是否合法的url地址
App.isValidURL= function(url){
	if(url=='#'){
		return true;
	}
    var RegExp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;

    if(RegExp.test(url)){
        return true;
    }else{
        return false;
    }
};
// 是否是图片
App.isImg = function(fileName){
	var fileExt = fileName.substring(fileName.lastIndexOf(".") + 1,fileName.length);
	var passExt= new Array("jpg","gif","png","jpeg");
	for(var i = 0 ; i < passExt.length ; i++){
		if(passExt[i] == fileExt.toLowerCase()){
			return true;
		}
	}
	return false;
};
// 富文本
App.imageUpload = function(callback){
	// 图片上传回调
	App.rteImageUploadCallback = function(url){
		App.closeBox();
		if(typeof(callback)){
			//console.info('return url:'+url); IE里面不支持
			callback(url);
		}
	};
	App.showBox("/attachment/rte-image.action",null,{
		width: 400
	}, function() {
		$("#img-select-dialog #imageFile").css("height","22px").css("line-height","22px");
		$("#img-select-dialog #btCancel").click(function(){App.closeBox();});
		$("#img-select-dialog #btImageSubmit").click(function(){
			var form = $("#img-select-dialog #imageUploadForm");
			var fileName = $("#img-select-dialog #imageFile").val();
			if(!App.isImg(fileName)){
				alert("上传文件类型错误,正确类型包括(jpg,gif,png,jpeg)");
				return;
			}
			$("#img-select-dialog #fileName").val(fileName);
			form.submit();
		});
	});
};
App.rteEditorInit = function(eleId,params,callback){
	tinymce.create('tinymce.plugins.ExamplePlugin', {
	    createControl: function(n, cm) {
	        switch (n) {
	            case 'uploadImage':
	                var c = cm.createButton('uploadImage', {
	                    title : '图片上传',
	                    'class': 'mce_image',
	                    onclick : function() {
	                		App.imageUpload();
	                		// 图片上传回调
	                		App.rteImageUploadCallback = function(url){
	                			App.closeBox();
	                			tinyMCE.activeEditor.execCommand('mceInsertRawHTML', false, '<img src="'+url+'" >');
	                			if(typeof(callback)){
	                				callback(url);
	                			}
	                		};
	                    }
	                });
	                return c;
	        }
	        return null;
	    }
	});
	// Register plugin with a short name
	tinymce.PluginManager.add('example', tinymce.plugins.ExamplePlugin);
	tinyMCE.init({
        mode : "exact",
        elements : eleId,
        theme : "advanced",
        language : "zh" ,
		plugins : "-example",
		document_base_url : window.appSession.cdn,
		relative_urls : false,
		// Theme options
		theme_advanced_buttons1 : "uploadImage,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true
    });
};
App.retContent = function(eleId){
	var val = tinyMCE.get(eleId).getContent();
	val = App.cleanWordHtml(val);
	//alert(val);
	return val;
};
App.swfUploadInit = function(progressDiv,btnCancel,uploadUrl,callback,params){
	var playerVersion = swfobject.getFlashPlayerVersion();
	if(parseInt(playerVersion.major)<10){
		var pageHost = ((document.location.protocol == "https:") ? "https://" :	"http://"); 
		var html = "<div><p style='margin:10px;font-size:15px;font-weight:bold;'>为了更好地上传文件，请您单击如下按钮来安装10.0版本以上的Flash播放器，安装完成后请重新启动您的浏览器。</p><p style='margin:10px;font-size:15px;'><a href='http://get.adobe.com/cn/flashplayer/otherversions/'><img src='" + pageHost + "www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a></p></div>" ;
		$("#"+progressDiv).html(html).show();
		return;
	}
	
	var swfUploadComplete = function(file){
		if (this.getStats() && this.getStats().files_queued === 0) {
			var tid = this.customSettings.cancelButtonId;
			if(tid){
				document.getElementById(tid).disabled = true;
			}
			if(progressDiv){
				$("#"+progressDiv).hide();
			}
			if(typeof(callback)=='function'){
				callback(file);
			}
		}
	};
	var fileDialogComplete = function(numFilesSelected, numFilesQueued) {
		try {
			if (numFilesSelected > 0 && this.customSettings.cancelButtonId) {
				document.getElementById(this.customSettings.cancelButtonId).disabled = false;
			}
			/* I want auto start the upload and I can do that here */
			if(progressDiv){
				$("#"+progressDiv).show();
			}
			this.startUpload();
		} catch (ex)  {
	        this.debug(ex);
		}
	};
	var setting = params || {"size_limit":"20 MB","queue_limit":0,"upload_limit":100};
	var appSession = window.appSession || {};
	var cdnHost = appSession["cdn"];
	var sessionId = appSession["sessionId"];
	var default_file_types = "*.doc;*.docx;*.xls;*.xlsx;*.ppt;*.pptx;*.pdf;*.rar;*.jpg;*.gif;*.png;*.jpeg";
	var default_file_type_description = "Word, Excel, PPT, PDF, RAR, JPEG, JPG, GIF, PNG";
	if(params && params["software"]){
		file_types = "*";
		file_type_description = "*";
	}
	if(uploadUrl.indexOf('?')>0){
		uploadUrl = uploadUrl + "&sessionid="+sessionId;
	}else{
		uploadUrl = uploadUrl + "?sessionid="+sessionId;
	}
	var settings = {
		flash_url :  "/st/static/common/js/swfupload/js/swfupload.swf",
		flash9_url : "/st/static/common/js/swfupload/js/swfupload_fp9.swf",
		upload_url: uploadUrl,

		file_size_limit : setting["size_limit"] || "20 MB",
		file_types : setting["file_types"] || default_file_types,
		file_types_description : setting["file_types_description"] || default_file_type_description,
		file_upload_limit : setting["upload_limit"] || 100,
		file_queue_limit : setting["queue_limit"] || 0,
		custom_settings : {
			progressTarget : progressDiv,
			upload_target : setting["upload_target"] || null
		},
		debug: false,

		// Button settings
		button_image_url: cdnHost + (setting["button_image_url"] || "/common/js/swfupload/images/swfbrowse.png"),
		button_width: setting["button_width"] || "72",
		button_height: setting["button_height"] || "25",
		button_placeholder_id: setting["button_placeholder_id"] || "spanButtonPlaceHolder",
		button_text: setting["button_text"] || '<span>浏览文件</span>',
		button_text_style: setting["button_text_style"] || ".theFont { font-size: 16; }",
		button_text_left_padding: setting["button_text_left_padding"] || 5,
		button_text_top_padding: setting["button_text_top_padding"] || 2,

		// The event handler functions are defined in handlers.js
		swfupload_preload_handler : setting["swfupload_preload_handler"] || preLoad,
		//replace loadFailed -> null
		swfupload_load_failed_handler : setting["swfupload_load_failed_handler"] || null,
		file_queued_handler : setting["file_queued_handler"] || fileQueued,
		file_queue_error_handler : setting["file_queue_error_handler"] || fileQueueError,
		file_dialog_complete_handler : setting["file_dialog_complete_handler"] || fileDialogComplete,
		upload_start_handler : setting["upload_start_handler"] || uploadStart,
		upload_progress_handler : setting["upload_progress_handler"] || uploadProgress,
		upload_error_handler : setting["upload_error_handler"] || uploadError,
		upload_success_handler : setting["upload_success_handler"] || uploadSuccess,
		upload_complete_handler : setting["upload_complete_handler"] || swfUploadComplete,
		queue_complete_handler : setting["queue_complete_handler"] || queueComplete	// Queue plugin event
	};

	swfu = new SWFUpload(settings);
	return swfu;
};
App.listHightlight = function(exp){
	var cc = $(exp);
	var _set_row_selected = function(cb){
		if($(cb).attr('checked')){
			 $(cb).parent().parent().addClass('selected-row');
		 }else{
			 $(cb).parent().parent().removeClass('selected-row');
		 }
	};
	cc.find("input:checkbox").click(function(){				 
		_set_row_selected(this);
	 }).each(function(){
		 _set_row_selected(this);
	 });
	cc.find('.dialog-row').bind('mouseover',function(event){	
		  $(this).addClass('even');
	});  
	cc.find('.dialog-row').bind('mouseout',function(event){
		$(this).removeClass('even');
	}); 
};
// 是否是IE浏览器
App.isIE = function(){
	if(window.ActiveXObject){
		return true;
	}
	return false;
};
// 获得flash版本
App.flashVersion = function(){
	var playerVersion = swfobject.getFlashPlayerVersion();
	return parseInt(playerVersion.major);
};
App.FlexPaper = function(flashDivId,swfFile,params){	
	var playerVersion = swfobject.getFlashPlayerVersion();
	if(parseInt(playerVersion.major)<11){
		var pageHost = ((document.location.protocol == "https:") ? "https://" :	"http://"); 
		var html = "<div><p style='margin:10px;font-size:15px;font-weight:bold;'>为了更好地阅读，请您单击如下按钮来安装11.0版本以上的Flash播放器，安装完成后请重新启动您的浏览器。</p><p style='margin:10px;font-size:15px;'><a href='http://get.adobe.com/cn/flashplayer/otherversions/'><img src='" + pageHost + "www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a></p></div>" ;
		$("#"+flashDivId).html(html);
		return;
	}
	var setting = params || {"width":"100%","height":"500px"};
	$("#"+flashDivId).attr("style","width:"+setting.width+";height:"+setting.height);
	var xiSwfUrlStr = "/st/static/common/js/flexpaper/FlexPaperViewer1.5.1.swf";
	var expressInstallSwfurl = "/st/static/common/js/flexpaper/expressInstall.swf";
    if(!swfFile.startsWith("{")){
	    var index = swfFile.indexOf('?');
	    if (index > 0) {	// 
	    	swfFile+"&ts="+new Date().getTime();
	    } else {
	    	swfFile+"?ts="+new Date().getTime();
	    }
	    swfFile = swfFile;
    }else{
    	xiSwfUrlStr = "/st/static/common/js/flexpaper/FlexPaperViewer1.5.1.swf";
    }
    
	var fp = new FlexPaperViewer(	
			 xiSwfUrlStr,
			 flashDivId, { config : {
			 SwfFile : encodeURIComponent(swfFile),
			 Scale : 0.95, 
			 ZoomTransition : 'easeOut',
			 ZoomTime : 0.5,
			 ZoomInterval : 0.2,
			 FitPageOnLoad : true,
			 FitWidthOnLoad : true,
			 FullScreenAsMaxWindow : false,
			 ProgressiveLoading : false,
			 MinZoomSize : 0.2,
			 MaxZoomSize : 5,
			 SearchMatchAll : false,
			 InitViewMode : 'Portrait',
			 PrintPaperAsBitmap : false,
			 
			 ViewModeToolsVisible : true,
			 ZoomToolsVisible : true,
			 NavToolsVisible : true,
			 CursorToolsVisible : true,
			 SearchToolsVisible : true,
			 PrintEnabled : false,
			 localeChain: 'zh_CN',
			 key: '$72815cdaaec3681f9d0'
	}});
};

//IE兼容css3
App.PIEAttach=function(selecter){
	if (window.PIE) {
		$(selecter).each(function() {
			PIE.attach(this);
		});
	}
};
App._buildTree = function(url,urlParams,eleId, setting, selectedValues, reinit){
	var btnId = eleId+"_button";
	var treeId = eleId+"_tree";
	var treeCId = eleId+"_tree_content";
	$("#"+eleId).attr("init","");
	var _temp = "<div id=\"{0}\" class=\"ztree-container\" style=\"position: absolute;\"><ul id=\"{1}\" class=\"ztree\"></ul></div>";
	_temp = _temp.replace("{0}",treeCId);
	_temp = _temp.replace("{1}",treeId);
	
	var _show_tree = function(doinit){
		var obj = $("#"+eleId);
		var flag = obj.attr("init");
		if(!doinit && flag && flag == '1'){
			var offset = $("#"+eleId).offset();
			$("#"+treeCId).css({left:offset.left + "px", top:offset.top + obj.outerHeight() + "px"}).slideDown("fast");
			$("body").unbind("mousedown",body_mousedown).bind("mousedown",body_mousedown);
		}else{
			obj.attr("init","1");
			_init_tree();
		}
	};
	var _init_tree = function(){
		var obj = $("#"+eleId);
		obj.attr("oldvalue",selectedValues);
		
		App.ajaxDoGet(url,urlParams,function(data){
			if(data && data.length>0 && selectedValues){
				var lbs = [];
				selectedValues = selectedValues.toString().split(',');
				for(var i=0;i<selectedValues.length;i++){
					for(var j=0;j<data.length;j++){
						if(data[j].id == selectedValues[i]){
							data[j].checked = true;
							lbs.push(data[j].name);
							break;
						}
					}
				}
			}
			$.fn.zTree.init($("#"+treeId), setting, data);
			_show_tree(false);
		});
	};
	var _hide_tree = function(){
		$("#"+treeCId).fadeOut("fast");
		$("body").unbind("mousedown", body_mousedown);
	};
	
	var body_mousedown = function(event){
		if (!(event.target.id == btnId 
				|| event.target.id == treeCId
					|| $(event.target).parents("#"+treeCId).length>0)) {
			
			_hide_tree();
				
		}
	};
	
	$(_temp).appendTo($('body')).hide();
	$("#"+btnId).unbind("click").click(function(){_show_tree(reinit);});
	$("#"+eleId).unbind("click").click(function(){_show_tree(reinit);});
};
/*
 * 单选
 * App.Tree("topicInput","/catalog/topic.action",{},
 * 	function(name,id){
 *     //单击后返回值.
 * 	})
 * */
App.Tree = function(eleId, url, urlParams, selectedCallback, selectedValues, reinit){
	if(!$.fn.zTree){
		alert("请引入/common/js/jquery.ztree.core-3.0.min.js");
		return false;
	}
		
	var _onclick = function(e, treeId, treeNode) {
		//selectedCallback(treeNode.name,treeNode.id);
		//add target to callback
		selectedCallback(treeNode.name,treeNode.id, $('#'+eleId));
	};
	var setting = {
		view: {
			dblClickExpand: false,
			showIcon: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onClick: _onclick
		}
	};
	
	App._buildTree(url, urlParams, eleId, setting, selectedValues, reinit);
};
/*
 * 多选.
 * App.MCTree("topicInput","/catalog/topic.action",{},
 * 	function(names,ids){
 *     //选中每个节点后立刻返回值.
 * 	})
 * */
App.MCTree = function(eleId, url, urlParams, selectedCallback, selectedValues, reinit){
	App.MCTreeType(eleId,url,urlParams,selectedCallback,selectedValues,reinit,{"Y": "p", "N": "ps"});
};

//父子关联关系
App.MCTreeType = function(eleId, url, urlParams, selectedCallback, selectedValues, reinit,chkboxTypes){
	if(!$.fn.zTree){
		alert("请引入/common/js/jquery.ztree.core-3.0.min.js");
		return false;
	}
		
	var _oncheck = function(e, treeId, treeNode) {
		_return_check_nodes();
	};
	var _return_check_nodes = function(){
		var treeId = eleId+"_tree";
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		var nodes = zTree.getCheckedNodes();
		var v1 = [],v2 = [];
		for (var i=0, l=nodes.length; i<l; i++) {
			v1.push(nodes[i].id);
			v2.push(nodes[i].name);
		}
		
		//selectedCallback(v2,v1);
		//add target to callback
		selectedCallback(v2,v1, $('#'+eleId));
	};
	var setting = {
		check: {
			enable: true,
			chkboxType : chkboxTypes
		},
		view: {
			dblClickExpand: false,
			showIcon: false,
			selectedMulti: true
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: _oncheck
		}
	};
	App._buildTree(url, urlParams, eleId, setting, selectedValues, reinit);

};

/**
 * cookie操作。实现代码来自ExtJS
 */
App.Cookies = {
	    
	    set : function(name, value){
	        var argv = arguments;
	        var argc = arguments.length;
	        var expires = (argc > 2) ? argv[2] : null;
	        var path = (argc > 3) ? argv[3] : '/';
	        var domain = (argc > 4) ? argv[4] : null;
	        var secure = (argc > 5) ? argv[5] : false;
	        document.cookie = name + "=" + escape(value) + ((expires === null) ? "" : ("; expires=" + expires.toGMTString())) + ((path === null) ? "" : ("; path=" + path)) + ((domain === null) ? "" : ("; domain=" + domain)) + ((secure === true) ? "; secure" : "");
	    },

	    
	    get : function(name){
	        var arg = name + "=";
	        var alen = arg.length;
	        var clen = document.cookie.length;
	        var i = 0;
	        var j = 0;
	        while(i < clen){
	            j = i + alen;
	            if(document.cookie.substring(i, j) == arg){
	                return App.Cookies.getCookieVal(j);
	            }
	            i = document.cookie.indexOf(" ", i) + 1;
	            if(i === 0){
	                break;
	            }
	        }
	        return null;
	    },

	    
	    clear : function(name){
	        if(App.Cookies.get(name)){
	            document.cookie = name + "=" + "; expires=Thu, 01-Jan-70 00:00:01 GMT";
	        }
	    },
	    
	    getCookieVal : function(offset){
	        var endstr = document.cookie.indexOf(";", offset);
	        if(endstr == -1){
	            endstr = document.cookie.length;
	        }
	        return unescape(document.cookie.substring(offset, endstr));
	    }
	};

App.track = function(action,params){
	var args = params || {};
	args["_ts"] = new Date().getTime();
	var url = "/track!"+action+".action?" + App.toQs(args);
	$("#_trackFrame").attr("src",url);
};
App.clickTrack = function(page_name,tag,object_id){
	var params = {"page":page_name,"tag":tag,"object":object_id};
	App.track("click",params);
};
App.VideoPlayer = function(contId,playCallBack){
	var ts = new Date().getTime()/1000;
	ts = ts.toString(16);
	ts = ts.split(".")[0];
	var pl = $("#"+contId).attr("flv");
	pl = pl.replace("/","-");
	var playing = false;
	flowplayer(
		contId, 
		"/st/static/common/js/flowplayer/flowplayer-3.2.8.swf", 
		{
			// fullscreen button not needed here
			plugins: {
		        secure: {
					// path to latest version
					url: 'flowplayer.securestreaming-3.2.3.swf',
					// URL used to fetch a timestamp from the server
					timestamp: ts,
					// identical to lighttpd.conf / secdownload.secret
					token: "0e25ea90ed2e4c28d0703b61d3763076"
				}
			},
			clip:{
				autoPlay: false,
	        	autoBuffering: true,
	        	urlResolvers: 'secure',
	        	baseUrl: '/swf-play',
	        	onStart : function() {
					if(!playing && typeof(playCallBack)=='function'){
						playCallBack();
						playing = true;
					}
	            }
	    	},
	  		playlist: [pl]
    	}
    );
};
$(document).ready(function(){
	if($.fn.fancybox){
		$("#showDialogLink").fancybox({
			'padding'		    : 0,
			'width'				: 628,
			'height'			: 670,
	        'transitionIn'		: 'none',
			'transitionOut'		: 'none',
			'modal'             : 'true',
			'overlayColor'		: '#000000',
			'overlayOpacity'	: 0.5,
			'centerOnScroll' 	: true
		});
	}
	
	//信息框
	$(".message-container").find(".close").click(function(){	
		$(".message-container").hide();												  
	});

	$(".close").click(function (){
		$(".flashMessage").hide();
	});
	
});	