//创建cookie
function setCookie(name, value, expireday) {
    var exp = new Date();
    exp.setTime(exp.getTime() + expireday * 24 * 60 * 60 * 1000); //设置cookie的期限
    document.cookie = name + "=" + escape(value) + "; expires" + "=" + exp.toGMTString();//创建cookie
}
//提取cookie中的值
function getCookie(name) {
    var cookieStr = document.cookie;
    if (cookieStr.length > 0) {
        var cookieArr = cookieStr.split(";"); //将cookie信息转换成数组
        for (var i = 0; i < cookieArr.length; i++) {
            var cookieVal = cookieArr[i].split("="); //将每一组cookie(cookie名和值)也转换成数组
            if (cookieVal[0].replace(/(^\s*)|(\s*$)/g, "") == name) {
                return unescape(cookieVal[1]); //返回需要提取的cookie值
            }
        }
    }
}