<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/context/mytags.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>个人中心</title>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<meta content="telephone=no" name="format-detection" />
<meta content="email=no" name="format-detection" />




<link href="${webRoot }/plug-in/static/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<link href="${webRoot }/plug-in/static/style/wxsc.css" rel="stylesheet">
<link href="${webRoot }/plug-in/static/style/style.css" rel="stylesheet">
<script type="text/javascript" src="${webRoot }/plug-in/static/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${webRoot }/plug-in/static/jquery/jquery-2.0.3.min.js"></script>




<style type="text/css">
.img-thumbnail {
	display: inline-block;
	height: auto;
	max-width: 100%;
	padding: 2px;
	line-height: 1.428571429;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 4px;
	-webkit-transition: all .2s ease-in-out;
	transition: all .2s ease-in-out
}

.menu {
	position: fixed;
	height: 40px;
	bottom: 25px;
	left: 10px;
}

.menu .nav ul {
	display: none;
	margin: 4px 0 0 0;
	padding: 10px 10px 6px 47px;
	float: left;
	background: #FFF;
	height: 42px;
	border-radius: 22px;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.03);
	overflow: hidden;
}

.menu .nav li {
	border-left: 1px solid #e7e7e7;
	padding: 0 8px;
	float: left;
	line-height: 22px;
	list-style: none;
	color: #34495e
}

.menu .nav li a:hover,a:visited {
	color: #34495e;
	text-decoration: none;
}

.menu .logo {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	border: 2px solid #FFF;
	position: relative;
	background: url(static/images/07.jpg) no-repeat #41c281;
	position: absolute;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
	background-size: 46px 46px;
}
</style>
<script type="text/javascript">
function savephone(){
	var suserid=document.getElementById("hiddenuserid").value;
	var boundphone=document.getElementById("boundphone").value;
	var verifss=document.getElementById("verifss").value;
	var openid=document.getElementById("hiddenopenid").value;
	
	$.ajax( {   
	     type : "POST",   
	     url : "/haoyao/wchatUserBinding.do?method=savephone&sphone="+boundphone+"&suserid="+suserid+"&verifss="+verifss+"&openid="+openid+"",   
	     dataType: "json",   
	     success : function(data) { 
	    	 var phone=data.updates;
	         if( phone!= null){ 
	        	 $("#btnPay").attr("disabled","disabled");
	        	 alert("保存成功！");
	        	/*  $("#userphones").html("<i class=\"pull-right\"><!-- <span class=\"glyphicon glyphicon-remove\" style=\"padding-top:2px; font-size:16px; color:#b5b5b5;\"></span> --></i>手机号:<strong style=\"font-size:16px; color:#5cb85c;\">"+phone+"</strong>"); */
	        	 $("#userphones").html(" <p id=\"userphones\" style=\"margin:9px 0 7px 0; 4 \"><i class=\"pull-right\"><span class=\"icon-uniE623\" style=\"padding-top:2px; font-size:16px; color:#41c27f;\"  id=\"addPhone\"></span></i>手机号:"+phone+"</p>");
	        	 $('#editPhone').modal('hide');
			}   
	         else
		         if(data.update == "exist"){
		        	 $("#btnPay").removeAttr("disabled");
		             alert("该手机号已存在");   
		         }else
		         if(data.update == "shibai")
		         {
		        	 $("#btnPay").removeAttr("disabled");
		             alert("该手机号已存在"); 
		         }else
		         if(data.update =="chucuo"){
		        	 $("#btnPay").removeAttr("disabled");
		             alert("错误"); 
		         }else
			         if(data.update =="guoqi"){
			        	 $("#btnPay").removeAttr("disabled");
			             alert("验证码过期");  
			     }else
			         if(data.update =="cuowu"){
			        	 $("#btnPay").removeAttr("disabled");
			             alert("验证码错误");
			     }else
				     if(data.update =="guoduo"){
				    	 $("#btnPay").removeAttr("disabled");
			             alert("重试次数过多");
				  }else
				   	{
					  $("#btnPay").removeAttr("disabled");
			             alert("保存失败");	 
				    }
	     },   
	     error :function(){
	         alert("网络连接出错！");
	     }   
	 }); 
}


	function individual(){
		window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxab144e9dd399684a&redirect_uri=http://w.ehaoyao.com/haoyao/wchatUserBinding.do?method=userlist&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
	}
	function shopindex(openid){
		window.location.href="http://w.ehaoyao.com/haoyao/index_menu/index.html";
	}
	function order(openid){
		window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxab144e9dd399684a&redirect_uri=http://w.ehaoyao.com/haoyao/wchatTrade.do?method=myOrder&response_type=code&scope=snsapi_base&state=myOrder#wechat_redirect";
	}
</script>
<script type="text/javascript">
var count=60;
var count = 60; //间隔函数，1秒执行
var InterValObj;
var curCount;//当前剩余秒数
function selverify(){
	 
	
	
	var suserid=document.getElementById("hiddenuserid").value;
	 var boundphone=document.getElementById("boundphone").value;
	 var openid=document.getElementById("hiddenopenid").value;
	 var a=/^1[3|4|5|8][0-9]\d{4,8}$/;
	 if(boundphone==''){
		 alert("手机号不能为空");
		 return false; 
	 }
		if(!a.test(boundphone))   
		{      
			alert("请输入正确的手机号码");     
			return false; 
	}else{
		curCount = count;
		//设置button效果，开始计时
		$("#btnSendCode").attr("disabled", "true");
		$("#btnSendCode").val( + curCount + "秒后重新获取验证码");
		InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
	
	$.ajax( {
	     type : "POST",   
	     url : "/haoyao/wchatUserBinding.do?method=selverify&sphone="+boundphone+"&suserid="+suserid+"&openid="+openid+"",   
	     dataType: "json",   
	     success : function(data) {
	         if(data.update == "true"){ 
	        	 alert("发送成功！");
			}else
			if(data.update =="shuduo"){
	             alert("该号码在有效时间内发送次数过多！");   
	         }else
	         if(data.update=="chaoguo"){
	        	 alert("该号码超出了一天发送次数过多");
	         }else
	        	 if(data.update=="ues"){
	        		 alert("该号码已使用");
	        		 return false; 
	        	 }
	     },   
	     error :function(){
	         alert("网络连接出错！");
	     }   
	 }); 
	}
}

function SetRemainTime() {
	if (curCount == 0) {
		window.clearInterval(InterValObj);//停止计时器
		$("#btnSendCode").removeAttr("disabled");//启用按钮
		$("#btnSendCode").val("获取验证码");
		
		}
	else {
		curCount--;
		$("#btnSendCode").val( + curCount + "秒后重新获取");
		}
	}
</script>
<script type="text/javascript">
function dizhi(openid){
	var accesstoken=document.getElementById("accesstoken").value;
	var state=document.getElementById("state").value;
	var code=document.getElementById("code").value;
 	window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxab144e9dd399684a&redirect_uri=http://w.ehaoyao.com/haoyao/wchatUserBinding.do?method=addressManage&response_type=code&scope=snsapi_base&state=addressManage#wechat_redirect";
 }
function shopcar(openid){
	window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxab144e9dd399684a&redirect_uri=http://w.ehaoyao.com/haoyao/index_menu/cart.html?response_type=code&scope=snsapi_base&state=1#wechat_redirect";
}
function myorder(openid){
	window.location.href="/jeewx/orderController.do?list&open_user_id="+openid;
}
function myadd(openid){
	window.location.href="/jeewx/addressController.do?display&open_user_id="+openid+"&app_code=${app_code}";
}
</script>
</head>




<body style="background: rgb(236, 240, 241);">
	
	<input type="hidden" id="hiddenuserid" name="hiddenuserid" value="${open_user_id }">

	<div class="container">


		<div class="media" style="padding:15px 0">
			<div class="pull-left text-center" href="#">
				<img class="media-object img-thumbnail"
					src="./个人中心_files/getheadimg.jpg" width="100" height="100">
			</div>
			<div class="media-body" style="padding:8px 0 0 0">
				<p style="margin:0; font-size:18px;"></p>
				<p id="userphones" style="margin:9px 0 7px 0; 4 ">
					<i class="pull-right"><span class="icon-uniE623"
						style="padding-top:2px; font-size:16px; color:#41c27f;"
						id="addPhone"></span></i>手机号:
				</p>


			</div>
		</div>






		<div class="panel list_boder">
			<div class="media" style="margin:10px ; ">
				<span class="pull-right"><a
					href="/jeewx/orderController.do?list&open_user_id=${open_user_id }"
					class="goto"><i class="icon-uniE61B"
						style="vertical-align:-26px;"></i></a></span>
				<div class="  pull-left text-center"
					style="background:#41c27f;border-radius:50%; width:32px; height:32px;  line-height:34px; font-size:20px; padding-top:6px ">
					<i class="icon-uniE615" style="color:#FFF;"></i>
				</div>
				<div class="media-body" style="margin-top:5px;"
					onclick="myorder('${open_user_id }')">
					<p style="font-size:18px;">我的订单</p>
				</div>
			</div>
		</div>

		<!-- <div class="panel list_boder" >
    <div class="media" style="margin:10px ; ">
    <span class="pull-right"><a href="#"  class="goto"><i class="icon-uniE61B"></i></a></span>
    <div class=" list_yuan1 pull-left text-center" style="background:#fc825a"><i class="icon-uniE616" style="color:#FFF"></i></div>
   <div class="media-body" style="margin-top:3px;"> <h4>我的充值卡</h4></div>
    </div>
  </div> -->


		<div class="panel list_boder">
			<div class="media" style="margin:10px ; ">
				<span class="pull-right"><a
					href="/jeewx/addressController.do?display&open_user_id=${open_user_id }
					class="goto"><i class="icon-uniE61B"
						style="vertical-align:-26px;"></i></a></span>
				<div class=" pull-left text-center"
					style="background:#57c8d9;border-radius:50%; width:32px; height:32px;  line-height:34px; font-size:20px; padding-top:6px ">
					<i class="icon-uniE621" style="color:#FFF;margin-top:-8px;"></i>
				</div>
				<div class="media-body" style="margin-top:5px;"
					onclick="myadd('${open_user_id }')">
					<p style="font-size:18px;">地址管理</p>
				</div>
			</div>
		</div>




	</div>


	<div id="editPhone" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">绑定手机</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						手机号：
						<div class="input-group" style="width:100%;">
							<input type="text" class="form-control" id="boundphone"
								name="boundphone" value=""> <span
								class="input-group-btn"> <input id="btnSendCode"
								class="btn btn-default" type="button" onclick="selverify()"
								value="发送验证码">
							</span>
						</div>
					</div>
					验证码：
					<div class="form-group">
						<input type="text" class="form-control" id="verifss"
							name="verifss" value="">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="border:1px solid #29b572; color:#29b572">取消</button>
					<button type="button" class="btn btn-o2o" onclick="savephone()">保存</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		if( window.history.length == 1 ){
			$('#pageBack').hide();
		};
		$('#editName').click(function(){
			$('#editNickname').modal('show');
		});
		$('#addPhone').click(function(){
			$('#editPhone').modal('show');
		});
		$('.js-editAddress').click(function(){
			$('#editAddress').modal('show');
		});
	</script>
	<div class="menu">
		<div id="menuBtn" class="logo"></div>
		<div class="nav">
			<ul id="menuContent">
				<li><a href="/jeewx/schoolController.do?display&open_user_id=${open_user_id }&app_code=shop"
					style="color:#34495e;text-decoration:none;">首页</a></li>
				<li><a
					href="/jeewx/orderController.do?list&open_user_id=${open_user_id }"
					style="color:#34495e;text-decoration:none;">我的订单</a></li>
				<li><a
					href="/jeewx/accountController.do?display&open_user_id=${open_user_id }"
					style="color:#34495e;text-decoration:none;">个人中心</a></li>
				<li><a
					href="/jeewx/cartController.do?"
					style="color:#34495e;text-decoration:none;">购物车</a></li>
			</ul>
		</div>
	</div>

	<script type="text/javascript">
		getMenu();

		function getMenu(){
				$('#menuBtn').click(function(){
					$('#menuContent').toggle();
				});
		};
	</script>
</body>
</html>