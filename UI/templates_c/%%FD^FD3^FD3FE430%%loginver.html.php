<?php /* Smarty version 2.6.26, created on 2015-04-11 22:43:05
         compiled from F:/Apache2.4/htdocs/MedicalPlatform/UI/templates/member/loginver.html */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['smarty_root'])."/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div role="main" class="ui-content">
    <div class="col-xs-12 text-right" style="padding-top:10px;">
        <a href="<?php echo $this->_tpl_vars['rootpath']; ?>
/member/reg.php" style="color:#42A4D3;font-weight:lighter;"><h4>快速注册</h4></a>
    </div>
    <div class="col-xs-12">
            <input type="number" maxlength="11" class="inp" id="mobile_no" value="<?php echo $this->_tpl_vars['mobile']; ?>
" style="border:thin solid #42A4D3" placeholder="手机号" />
    </div>
    <div class="col-xs-12">
        <input type="number" maxlength="6" class="inp" id="verify_code" value="" style="border:thin solid #42A4D3" placeholder="验证码" />
    </div>
    <div class="col-xs-7">
    </div>
    <div class="col-xs-5" style="">
        <a href="#" id="reget_vercode" data-role="button" style="padding:2px;font-size:70%; background-color:#42A4D3;color:snow; font-weight:lighter;">获取校验码</a>
    </div>
    <div class="col-xs-12">
        <a href="#" data-role="button" class="ui-state-disabled" id="btnLogin" style="background-color:#42A4D3;color:snow; font-weight:lighter;">登录</a>
    </div>
    <div class="col-xs-12 text-right" style="padding-top:10px;">
        <a href="<?php echo $this->_tpl_vars['rootpath']; ?>
/member/login.php" style="color:#42A4D3;font-weight:lighter;"><h4>密码登录</h4></a>
    </div>
</div>
<script>
    var intervalid = 0;
    var count = 0;
    function resetRegetButton() {
        intervalid = 0;
        count = 0;
        $("#reget_vercode").addClass("ui-state-disabled");
        $("#reget_vercode").text("获取校验码（60）");
        intervalid = setInterval("regetButton()", 1000);
    }

    function regetButton() {
        count++;
        var reminder_second = 60 - count;
        if (reminder_second <= 0) {
            $("#reget_vercode").removeClass("ui-state-disabled");
            $("#reget_vercode").text("获取校验码");
            clearInterval(intervalid);
        } else {
            $("#reget_vercode").text("获取校验码（" + reminder_second + "）");
        }
    }
    function StepSendVerifyCode() {
        var mobile = $("#mobile_no").val();
        $("#reget_vercode").addClass("ui-state-disabled");
        var json = {
            "action": "login",
            "mobile": mobile
        };

        $.post("<?php echo $this->_tpl_vars['rootpath']; ?>
/member/verifycode.php", json, function (data) {
            //alert("b"+data+"a");
            if (data == "INVALIDMOBILE") {
                PopupTips("您输入的手机号码不正确");
            } else if (data == "INVALIDSECURITYCODE") {
                PopupTips("图形验证码输入错误");
            } else if (data == "NOMEMBER") {
                PopupTips("此手机号码尚未注册，请先注册");
            } else if (data == "SUCCESS") {
                resetRegetButton();
            } else {
                PopupTips("未知错误");
            }
            $("#reget_vercode").removeClass("ui-state-disabled");
        });
    }
    $(document).ready(function () {

        try {
            var mobile = getCookie("mobile");
            $("#mobile_no").val(mobile);
        } catch (e) {

        }
        $(".inp").keyup(function () {
            var mobile_no = $("#mobile_no").val();
            var verify_code = $("#verify_code").val();
            if (verify_code.length == 6 || mobile_no.length == 11) {
                $("#btnLogin").removeClass("ui-state-disabled");
            } else {
                $("#btnLogin").addClass("ui-state-disabled");
            }
        });
        $("#reget_vercode").click(function () {
            StepSendVerifyCode()
        });
        $("#btnLogin").click(function () {
            var mobile = $("#mobile_no").val();
            var verify_code = $("#verify_code").val();

            var json = {
                "action": "verifycode",
                "mobile": mobile,
                "verify_code": verify_code
            };
            $("#btnLogin").addClass("ui-state-disabled");

            $.post("<?php echo $this->_tpl_vars['rootpath']; ?>
/member/quicklogin.php", json, function (data) {
                //alert(data);
                if (data == "NOMEMBER") {
                    PopupTips("此手机号码未注册，请先注册");
                }  else if (data == "VCINCORRECT") {
                    PopupTips("验证码不正确，请重新输入");
                } else if (data == "SUCCESS") {
                    setCookie("mobile", $("#mobile_no").val(), 300000);
                    document.location.href = "<?php echo $this->_tpl_vars['rootpath']; ?>
/member/loadlogin.php";
                } else {
                    PopupTips("未知错误");
                }
                $("#btnLogin").addClass("ui-state-disabled");

            });

        });
    });

</script>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['smarty_root'])."/footer.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>