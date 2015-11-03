;(function($){
    $.kingdee = $.kingdee || {version: "v1.0.0"},
    $.extend($.kingdee, {
        util: {
            getStrLength: function(str) {
                str = $.trim(str);
                var length = str.replace(/[^\x00-\xff]/g, "**").length;
                return parseInt(length / 2) == length / 2 ? length / 2: parseInt(length / 2) + .5;
            },
            empty: function(str) {
                return void 0 === str || null === str || "" === str
            },
            isURl: function(str) {
                return /([\w-]+\.)+[\w-]+.([^a-z])(\/[\w-.\/?%&=]*)?|[a-zA-Z0-9\-\.][\w-]+.([^a-z])(\/[\w-.\/?%&=]*)?/i.test(str) ? !0 : !1
            },
            isEmail: function(str) {
                return /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(str);
            },
            minLength: function(str, length) {
                var strLength = $.qupai.util.getStrLength(str);
                return strLength >= length;
            },
            maxLength: function(str, length) {
                var strLength = $.qupai.util.getStrLength(str);
                return strLength <= length;
            },
            redirect: function(uri, toiframe) {
                if(toiframe != undefined){
                    $('#' + toiframe).attr('src', uri);
                    return !1;
                }
                location.href = uri;
            },
            base64_decode: function(input) {
                var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
                var output = "";
                var chr1, chr2, chr3 = "";
                var enc1, enc2, enc3, enc4 = "";
                var i = 0;
                //if(typeof input.length=='undefined')return '';
                if(input.length%4!=0){
                    return "";
                }
                var base64test = /[^A-Za-z0-9\+\/\=]/g;
                
                if(base64test.exec(input)){
                    return "";
                }
                
                do {
                    enc1 = keyStr.indexOf(input.charAt(i++));
                    enc2 = keyStr.indexOf(input.charAt(i++));
                    enc3 = keyStr.indexOf(input.charAt(i++));
                    enc4 = keyStr.indexOf(input.charAt(i++));
                    
                    chr1 = (enc1 << 2) | (enc2 >> 4);
                    chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
                    chr3 = ((enc3 & 3) << 6) | enc4;
                    
                    output = output + String.fromCharCode(chr1);
                    
                    if (enc3 != 64) {
                        output+=String.fromCharCode(chr2);
                    }
                    if (enc4 != 64) {
                        output+=String.fromCharCode(chr3);
                    }
                    
                    chr1 = chr2 = chr3 = "";
                    enc1 = enc2 = enc3 = enc4 = "";
                
                } while (i < input.length);
                return output;
            }
        }
    });
})(jQuery);

;(function($){
    //把对象调整到中心位置
    $.fn.setmiddle = function() {
        var dl = $(document).scrollLeft(),
            dt = $(document).scrollTop(),
            ww = $(window).width(),
            wh = $(window).height(),
            ow = $(this).width(),
            oh = $(this).height(),
            left = (ww - ow) / 2 + dl,
            top = (oh < 4 * wh / 7 ? wh * 0.382 - oh / 2 : (wh - oh) / 2) + dt;                
        $(this).css({left:Math.max(left, dl) + 'px',top:Math.max(top, dt) + 'px'});             
        return this;
    }
    //返回顶部
    $.fn.returntop = function() {
        var self = $(this);
        self.live({
            mouseover: function() {
                $(this).addClass('return_top_hover');
            },
            mouseout: function() {
                $(this).removeClass('return_top_hover');
            },
            click: function() {
                $("html, body").animate({scrollTop: 0}, 120);
            }
        });
        $(window).bind("scroll", function() {
            $(document).scrollTop() > 0 ? self.fadeIn() : self.fadeOut();
        });
    }
})(jQuery);


;(function($){
    //提示信息
    $.kingdee.tip = function(options) {
        var settings = {
            content: '',
            icon: 'success',
            time: 1000,
            close: false,
            zindex: 2999
        };
        if(options) {
            $.extend(settings, options);
        }
        if(settings.close){
            $(".tipbox").hide();
            return;
        }
        if(!$('.tipbox')[0]){
            $('body').append('<div class="tipbox"><div class="tip-l"></div><div class="tip-c"></div><div class="tip-r"></div></div>');
            $('.tipbox').css('z-index', parseInt(settings.zindex));
        }
        $('.tipbox').attr('class', 'tipbox tip-' + settings.icon);
        $('.tipbox .tip-c').html(settings.content);
        $('.tipbox').css('z-index', parseInt($('.tipbox').css('z-index'))+1).setmiddle().show();
        
        if(settings.time>0){
            setTimeout(function() {
                $(".tipbox").fadeOut()
            }, settings.time);
        }
    }
})(jQuery);

;(function($) {
    //焦点图
    $.kingdee.photo_slide = function() {
        var f = arguments.length;
        if (! (f != 1 && f < 4)) {
            var a = {},
            a = f >= 4 ? {
                listID: arguments[0],
                listBtnID: arguments[1],
                feedClassName: arguments[2],
                feedWidth: arguments[3],
                feedBoxClass: arguments[4]
            }: arguments[0];
            if (!$.kingdee.util.empty(a) && !$.kingdee.util.empty(a.listID) && !$.kingdee.util.empty(a.listBtnID) && !$.kingdee.util.empty(a.feedClassName) && !$.kingdee.util.empty(a.feedWidth) && $("#" + a.listID).size() != 0) {
                var e = 0,
                d = 1,
                j = null,
                h = [],
                g = null,
                g = $.kingdee.util.empty(a.feedBoxClass) ? $("#" + a.listID + " ul") : $("#" + a.listID + " ." + a.feedBoxClass),
                k = function() {
                    $("#" + a.listBtnID + " li").removeClass("c");
                    $("#" + a.listBtnID + " li").eq(d % e).addClass("c");
                    g.animate({
                        left: "-" + a.feedWidth * 2 + "px"
                    },
                    300, i());
                    d++;
                    d > e && (d = 1)
                },
                f = function() {
                    $("#" + a.listBtnID + " li").each(function(b) {
                        $(this).mouseover(function() {
                            clearInterval(j);
                            $("#" + a.listBtnID + " li").removeClass("c");
                            $(this).addClass("c");
                            b + 1 > d ? (i(b + 1), g.animate({
                                left: "-" + a.feedWidth * 2 + "px"
                            },
                            300)) : b + 1 < d && (i(null, b + 1), g.animate({
                                left: "0px"
                            },
                            300));
                            d = b + 1;
                            j = setInterval(k, 5E3)
                        })
                    })
                },
                i = function(b, c) {
                    if (b == null || b == void 0) b = d % e + 1;
                    if (c == null || b == void 0) c = d - 1 == 0 ? e: d - 1;
                    g.html("").append(h[c - 1].clone()).append(h[d - 1].clone()).append(h[b - 1].clone()).css({
                        left: "-" + a.feedWidth + "px"
                    })
                },
                l = function() {
                    for (var b = $("#" + a.listID + " ." + a.feedClassName).clone(), d = 0; d < b.length; d++) h[d] = b.eq(d)
                },
                m = function() {
                    if (e!=t) for (var b = 0; b < e - 1; b++) $("#" + a.listBtnID + ">ul").append("<li>●</li>")
                },
                e = $("#" + a.listID + " ." + a.feedClassName).size();
				t = $("#" + a.listBtnID + ">ul li").size();
                e > 0 && (m(), e > 1 && (l(), f(), i()));
                e > 1 && (j = setInterval(k, 5E3))
            }
        }
    }
})(jQuery);

;(function($){
    //上传文件
    $.fn.uploader = function(options) {
        var settings = {
            btnid: $(this).attr('id'),
            action_url: '',
            input_id: 'J_img',
            input_name: 'img',
            showMessage: function(message){
                $.kingdee.tip({content:message, icon:'error'});
            },
            onSubmit: function(id, fileName){
            },
            onComplete: function(id, fileName, result){
                if(result.status == '1'){
                    $('#'+settings.input_id).val(result.data);
                }else{
                    $.kingdee.tip({content:result.msg, icon:'error'});
                }
            }
        };
        if(options) {
            $.extend(settings, options);
        }
        new qq.FileUploaderBasic({
            allowedExtensions: ['jpg','gif','jpeg','png','bmp','pdg','swf'],
            button: document.getElementById(settings.btnid),
            multiple: false,
            action: settings.action_url,
            inputName: settings.input_name,
            forceMultipart: true, //用$_FILES
            messages: {
                typeError: '不允许上传的文件类型！',
                sizeError: '文件大小不能超过{sizeLimit}！',
                minSizeError: '文件大小不能小于{minSizeLimit}！',
                emptyError: '文件为空，请重新选择！',
                noFilesError: '没有选择要上传的文件！',
                onLeave: '正在上传文件，离开此页将取消上传！'
            },
            showMessage: settings.showMessage,
            onSubmit: settings.onSubmit,
            onComplete: settings.onComplete
        });
    }
})(jQuery);
