<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="shortcut icon" href="resources/fc/images/icon/favicon.ico">
<!--[if lt IE 9]>
   <script src="plug-in/login/js/html5.js"></script>
  <![endif]-->
<!--[if lt IE 7]>
  <script src="plug-in/login/js/iepng.js" type="text/javascript"></script>
  <script type="text/javascript">
	EvPNG.fix('div, ul, img, li, input'); //EvPNG.fix('包含透明PNG图片的标签'); 多个标签之间用英文逗号隔开。
</script>
  <![endif]-->
  <link type="text/css" rel="stylesheet" href="plug-in/shop/css/c4.css">
<link href="plug-in/login/css/zice.style.css" rel="stylesheet" type="text/css" />
<link href="plug-in/login/css/buttons.css" rel="stylesheet" type="text/css" />
<link href="plug-in/login/css/icon.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="plug-in/login/css/tipsy.css" media="all" />
<style type="text/css">
html {
	background-image: none;
}

label.iPhoneCheckLabelOn span {
	padding-left: 0px
}

#versionBar {
	background-color: #212121;
	position: fixed;
	width: 100%;
	height: 35px;
	bottom: 0;
	left: 0;
	text-align: center;
	line-height: 35px;
	z-index: 11;
	-webkit-box-shadow: black 0px 10px 10px -10px inset;
	-moz-box-shadow: black 0px 10px 10px -10px inset;
	box-shadow: black 0px 10px 10px -10px inset;
}

.copyright {
	text-align: center;
	font-size: 10px;
	color: #CCC;
}

.copyright a {
	color: #A31F1A;
	text-decoration: none
}

.on_off_checkbox {
	width: 0px;
}

#login .logo {
	width: 500px;
	height: 51px;
}
</style>
</head>
<body>
    <div id="alertMessage"></div>
    <div id="successLogin"></div>
    <div class="text_success"><img src="plug-in/login/images/loader_green.gif" alt="Please wait" /> <span>登陆成功!请稍后....</span></div>
    <div id="login">
        <div class="ribbon" style="background-image: url(plug-in/login/images/typelogin.png);"></div>
        <div class="inner">
            <div class="logo"><img src="plug-in/weixin/logo/logo_weixin.png" /></div>
            <div class="formLogin">
                <form name="formLogin" id="formLogin" action="loginController.do?login" check="loginController.do?checkuser" method="post">
                    <input name="userKey" type="hidden" id="userKey" value="D1B5CC2FE46C4CC983C073BCA897935608D926CD32992B5900" />
                    <div class="tip">
                        <input class="userName" name="userName" type="text" id="userName" title="用户名" iscookie="true" value="admin" nullmsg="请输入用户名!" />
                    </div>
                    <div class="tip">
                        <input class="password" name="password" type="password" id="password" title="密码" value="123456" nullmsg="请输入密码!" />
                    </div>
                    <div class="tip">
                        <input class="randCode" name="randCode" type="text" id="randCode" title="" value="" nullmsg="请输入验证码!" />
                        <div style="float: right; margin-left:-220px; margin-right: 40px;">
                            <img id="randCodeImage" src="randCodeImage" />
                        </div>
                    </div>
                    <%--update-end--Author:zhangguoming  Date:20140226 for：添加验证码--%>
                    <div class="loginButton">
                        <div style="float: left; margin-left: -9px;">
                            <input type="checkbox" id="on_off" name="remember" checked="ture" class="on_off_checkbox" value="0" />
                            <span class="f_help">是否记住用户名 ?</span>
                        </div>

                        <div style="float: right; padding: 3px 0; margin-right: -12px;">
                            <div>
                                <ul class="uibutton-group">
                                    <li><a class="uibutton normal" href="#" id="but_login">登陆</a></li>
                                     <li><a class="uibutton normal" href="#" id="but_register">注册体验</a></li>
                                    <li><a class="uibutton normal" href="#" id="forgetpass">重置</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    
                      <div>
                        <div style="float: right; margin-left:-220px; margin-right: 40px;">
                           	 技术支持： <font color="red">JEECG开源社区</font>   &nbsp;&nbsp;&nbsp;  商务QQ: <font color="red">418799587</font> &nbsp;&nbsp;&nbsp;  论坛: <font color="red"><a href="http://www.jeecg.org">www.jeecg.org</a></font> 
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="shadow"></div>
    </div>
    <!--Login div-->
    <div class="clear"></div>
    <div id="versionBar">
        <div class="copyright">&copy; 版权所有 <span class="tip"><a href="http://www.jeewx.com" title="JEEWX 捷微：敏捷微信开发">捷微 JeeWx</a> (推荐使用IE8+,谷歌浏览器可以获得更快,更安全的页面响应速度)技术支持:<a href="http://www.jeecg.org" title="JEECG 开源社区">JEECG 开源社区</a></span></div>
    </div>
   <div id="codFloat" style="display:none;">

    <div class="wx_mask">
    </div>
    <div class="wx_confirm">
        <div class="wx_confirm_inner">
            <div class="wx_confirm_hd">
                <div id="div_title" class="wx_confirm_tit"></div>
                <div class="wx_confirm_close" id="codGoPayCancel2" onclick="$(&#39;#codFloat&#39;).hide();" title="关闭"></div>
            </div>
            <form id="zzzfform" method="post" target="_self">
                <div class="wx_confirm_bd">
                    <div class="wx_confirm_cont">
                        <div class="confirm_order">
                        		
                            <p>
                            	<span class="price" id="span_li">用&nbsp;户 &nbsp;名 ：</span><span style="margin-left:-2px;"  id="span_val"><input type="text" id="uname" name="uname" /></span>
                            </p>
                            <p>
                            	<span class="price" id="span_li1">密 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><span  id="span_val1"><input type="password" id="upassword" name="upassword" /></span>
                            </p>
                            <p>
                            	<span class="price" id="span_li2">确认密码：</span><span  id="span_val2"><input type="password" id="upassword1" name="upassword1" /></span>
                            </p>
                        </div>
                    </div>
                    <div id="divtitle" style="color:red;" class="wx_confirm_btns">
                       
                    </div>
                    <div class="wx_confirm_btns">
                        <button type="button" id="codGoPay" onclick="_register()">确认</button>
                        <button type="cancel" id="codGoPayCancel" onclick="$(#uname).val('');$(#upassword).val('');$(#upassword).val('');$(#divtitle),html('');$(&#39;#codFloat&#39;).hide();return false;">关闭</button> 
                    </div>
                </div>
        </div>
    </div>
    </form>
</div>
    <!-- Link JScript-->
    <script type="text/javascript" src="plug-in/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="plug-in/jquery/jquery.cookie.js"></script>
    <script type="text/javascript" src="plug-in/login/js/jquery-jrumble.js"></script>
    <script type="text/javascript" src="plug-in/login/js/jquery.tipsy.js"></script>
    <script type="text/javascript" src="plug-in/login/js/iphone.check.js"></script>
    <script type="text/javascript" src="plug-in/login/js/login.js"></script>
    <script type="text/javascript" src="plug-in/lhgDialog/lhgdialog.min.js"></script>
	<script src="plug-in/register/js/dialog.js"></script>
	<!-- <script src="plug-in/shop/js/yyucadapter.js" type="text/javascript"></script> -->
</body>
</html>