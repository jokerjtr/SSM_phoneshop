<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>注册界面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style>
.div1{
    width:78%;
	height:100px;
	border:1px solid #ffffff;
    
	
}
.div2{
    width:100px;
	height:50%;
	float:left;
	
	
}
.lis{
    float:left;
	line-height:20px;
	position:relative;
	list-style:none;
	margin-left:5px;
}
.font_set
{    
   color:#000000;
   font-size:10px;
}
a{ text-decoration:none;
}
a:hover font{
   color:red;
}
ul li{
list-style:none;
float:left;
margin-left:50px;



}
ul li a{
  color:#ffffff;
}
.listyle{
  width:80px;
 
}
.register{
     width:78%;
	 height:500px;
     border-top:3px dashed #F2F2F2;
	 margin-top:5px;
}
.register_div
{   width:50%;
    height:100%;
	 border:1px solid #ffffff;
	 float:left;
}
.register_div_div
{
   width:70%;
   height:60%;
   border:1px solid #ffffff;
   margin-left:-80px; 
}
.register_div_divs
{
   width:70%;
   height:38%;
   border:1px solid #ffffff;
   margin-left:-80px; 
   margin-top:5px;
  
}
.register_div2
{   width:40%;
    height:100%;
	
	 float:right;
}
.register_div3
{   width:60%;
    height:70%;
	
	 float:right;
	 
}
.dt{
 font-size:20px;
 color:#FF7F50;

}
.dd{
  font-size:10px;
  font-weight:50;
  margin-left:10px;

}

 .pan{
   color:red;
} 
.pan1
{   font-size:10px;
}
.div_s{
width:100px;height:100px;position:relative;
background-color:#ccc;
display:none;
}
font{
color:black;
}

</style>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<script>
 
	$(document).ready(function() {
		$("li.listyle").mouseover(function() {
			$(this).css("background-color", "#E0E0E0")
		});
		$("li.listyle").mouseout(function() {
			$(this).css("background-color", "#000000")
		});
        $("input#username").blur(function(){
        	$.post("${pageContext.request.contextPath}/exits.action",{username:$("input#username").val()},
        			function(data,status){
        	 $("#t1").text(data);
        	});
        });
        $("#loginshows").click(function(){
			
			 $(".div_s").fadeToggle("show"); 
		
		});
       //点击退出用户登录
       $("#quitlogin").click(function(){
       	var url = "${pageContext.request.contextPath}/quitlogin.action";
       	window.location.href=url;
       });
		

	});

	function checkinfo() {
		if (checkusername() && checkpassword() && recheckpassword())
			return true;
		else
			return false;
	}
	function checkusername() {
		var name = document.getElementById("username").value;
        var span=document.getElementById("t1").innerHTML;
        if(span=="用户已存在")return false;
		if (name.length == 0) {

			document.getElementById("t1").innerHTML = "不能为空";
			document.getElementById("username").focus();
			return false;
		} else if (name.length < 5) {
			document.getElementById("t1").innerHTML = "不能少5位";
			document.getElementById("username").focus();
			return false;
		} else if (name.length < 20){
			var index_char = name.substr(0, 1);
			if (index_char >= '0' && index_char <= '9') {
				document.getElementById("t1").innerHTML = "用户名已字母开头";
				document.getElementById("username").focus();
				return false;}
		       
				for (i=0; i < name.length; i++) {
					var names = name.substring(i, i + 1);
					
				
					if (!((names >= 'a' && names <= 'z')|| (names >= 'A' && names <= 'Z') || (names >= '0' && names <= '9'))) 
					{
						document.getElementById("t1").innerHTML = "输入字母和数字";
						document.getElementById("username").focus();
						return false;
					}
				}

				return true;
			} else {
				document.getElementById("t1").innerHTML = "不能多于20位";
				document.getElementById("username").focus();
				return false;
			}

		}
	
	function checkpassword() {
		var password = document.getElementById("password").value;
		if (password.length < 8) {
			document.getElementById("t2").innerHTML = "密码不能少与8位";

			return false;
		} else {
			if (password.length > 25) {
				document.getElementById("t2").innerHTML = "不能多于25位";

				return false;
			}
			return true;
		}
	}
	function recheckpassword() {
		var password = document.getElementById("password").value;
		var repassword = document.getElementById("repassword").value;
		if (password != repassword) {
			document.getElementById("t3").innerHTML = "两次输入不同";

			return false;
		} else
			return true;

	}
</script>
</head>
<body onload="document.forms.username.focus()">
   <center>
    <div class="div1">
      <!--logo-->
       <div class="div2">
	       <a href="" alt="金风细雨" title="金风细雨楼">
	          <img src="image\index_head\logo.jpg" style="width:100%;height:100%"/>
	       </a>
		</div>
	         <!--logo-->
	    <div class="div2" style="width:40%;margin-left:10px">
		     <img src="image\index_head\header.jpg" style="width:100%;height:100%"/>
		</div>
	    <div class="div2" style="float:right;width:40%;">
		   <!-- 登陆注册-->
		    <div style="width:90%;height:50%;float:right;" class="div2">
			     <ul style="float:left;margin-top:0px;">
						<li class="lis"><c:choose>
								<c:when test="${not empty loginUser}">
								<font style="color:red;font-size:5px" id="loginshows">用户账号：${loginUser.user_name}<font>
								<div class="div_s">
								   <ul style="width:50px;height:98px;margin-left:0px;">
								     <!-- <li style="float:left;width:80px;height:40px;color:red;font-size:10px;margin-left:-35px;border:1px solid blue;">信息更改</li> -->
								     <li id="quitlogin" style="float:left;width:80px;height:40px;color:red;font-size:10px;margin-left:-35px;border:1px solid blue;margin-top:2px;">退出登录</li>
								   </ul>
								</div>
								</c:when>
								<c:otherwise>
                                  <a href="${pageContext.request.contextPath}/tologin.action"><font
									class="font_set">登录 | </font></a>
								</c:otherwise>
								
							</c:choose>
						</li>
					<li class="lis"><a href="${pageContext.request.contextPath}/toregist.action"><font class="font_set">注册 | </font></a></li>
					<li class="lis"><a href=""><font class="font_set">会员中心 | </font></a></li>
					<li class="lis"><a href=""><font class="font_set">购物指南 | </font></a></li>
					<li class="lis"><a href=""><font class="font_set">关于我们 </font></a></li>
				 </ul>
			
			</div>
		    <div style="width:90%;height:40%;float:right" class="div2">
			        <!-- 购物车-->
					<div style="width:70%;height:100%;float:right" class="div2">
					      <div style="background-color:#F8F8FF">电话热线:&nbsp;&nbsp;<strong>18711807001</strong></div>
					</div>
					<!--热线电话-->
					<div style="width:20%;height:100%;float:right" class="div2">
					   <div style="width:100%;height:100%">
					       <img src="image\index_head\gowuche.png" style="width:20px;height:20px;"/>
						   <a href="${pageContext.request.contextPath}/getCart.action"><font class="font_set">购物车</font></a>
					   </div>
					</div>
			</div>
			
		</div>
		<!--一级导航栏-->
		<div style="border:1px solid #ffffff;width:100%;height:50%;margin-top:50px;background-color:#000000">
		    <ul>
				  <li class="listyle"><a href="${pageContext.request.contextPath}/toindex.action">  首页   |</a></li>
				    <li class="listyle"><a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname=*">   手机   |</a></li>
					<li class="listyle"><a href="">    家电  |</a></li>
					<li class="listyle"><a href="">   数码产品  |</a></li>
				    <li class="listyle"><a href="">   电视  |</a></li>
					<li class="listyle"><a href="">   电脑  |</a></li>
				 </ul>
		</div>
   </div>
   <!--注册-->
   <div class="register">
         <!--注册-->
       <div class="register_div">
	        <div class="register_div_div">
			   <form  action="${pageContext.request.contextPath}/regist.action" method="post" onsubmit="return checkinfo()" name="forms">
			       <table  cellspacing="3px" width="100%" height="100%">
				       <tr><td width="20%"><span class="pan">*</span><span class="pan1">用户名:</span></td>
					   <td><input type="text" name="username" id="username" /><span><font style="font-size:3px;color:red;" id="t1"></font></span></td>
					   </tr>
					    <tr><td width="20%"><span class="pan">*</span><span class="pan1">密码:</span></td>
						<td><input type="password" name="password" id="password" onblur="checkpassword()"/><span><font style="font-size:3px;color:red;" id="t2"></font></span></td>
						</tr>
						 <tr><td width="20%"><span class="pan">*</span><span class="pan1">确认密码:</span></td>
						 <td><input type="password" name="repassword" id="repassword" onblur="recheckpassword()"/><span><font style="font-size:3px;color:red;" id="t3"></font></span></td>
						 </tr>
						  <tr><td width="20%"><span class="pan">*</span><span class="pan1">Email:</span></td>
						  <td><input type="email" name="email" id="email"/></td>
						  </tr>
						   <tr><td width="20%"><span class="pan1">姓名:</span></td>
						   <td><input type="text" name="name" id="name"/></td>
						   </tr>
						    <tr><td width="20%"><span class="pan1">性别:</span></td>
							<td><input type="radio" value="nan" name="sex" checked/><font class="pan1">:男</font> &nbsp;<input type="radio" value="nv" name="sex"/><font class="pan1">:女</font></td>
							</tr>
							<tr><td width="20%"><span class="pan1">手机号:</span></td>
						   <td><input type="text" name="phone" id="phone"/></td>
						   </tr>
							 <tr><td width="20%"><span class="pan1">出生地址:</span></td>
							 <td><input type="text" name="address" id="address"/></td>
							 </tr>
							 <tr><td width="20%"></td><td><input type="submit" value="同意协议并注册" style="margin-left:25px;color:#ffffff;background-color:#FF0000" /></td></tr>
				   </table>
			   </form>
			</div>
			<div class="register_div_divs"><font style="float:left;font-size:10xp;color:#CDCDC1;">注册协议：</font>
			  <textarea cols=45 rows=10 style="overflow-y:scroll;resize:none;" readonly>尊敬的用户欢迎您注册成为本网站会员。请用户仔细阅读以下全部内容。如用户不同意本服务条款任意内容，请不要注册或使用本网站服务。如用户通过本网站注册程序，即表示用户与本网站已达成协议，自愿接受本服务条款的所有内容。此后，用户不得以未阅读本服务条款内容作任何形式的抗辩。

 一、本站服务条款的确认和接纳
 本网站涉及的各项服务的所有权和运作权归本网站所有。本网站所提供的服务必须按照其发布的服务条款和操作规则严格执行。本服务条款的效力范围及于本网站的一切产品和服务，用户在享受本网站的任何服务时，应当受本服务条款的约束。

 二、服务简介
 本网站运用自己的操作系统通过国际互联网络为用户提供各项服务。用户必须: 1. 提供设备，如个人电脑、手机或其他上网设备。 2. 个人上网和支付与此服务有关的费用。
</textarea>
			</div>
	   </div>
	   <div class="register_div2">
	   <div class="register_div3"><dl><dt class="dt">立即享受</dt><dd class="dd">正品保障、正规发票</dd><dd class="dd">货到付款、会员服务</dd><dd class="dd">自由退换、售后上门</dd>
	   </dl>
	    <dl>
		   <dt class="dt">已经拥有账号了？</dt><dd class="dd">立即登录即可体验在线购物！<a href="${pageContext.request.contextPath}/tologin.action">登录</a></dd>
		</dl>
	   </div>
	   </div>
   </div>
   
   
   
     
 
   </center>
</body>
</html>