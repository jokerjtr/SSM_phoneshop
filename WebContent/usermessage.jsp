<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户信息</title>
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
.imgstyle{
   width:90%;
   height:90%;
}
.shopli
{
   width:15%;
   height:48%;
   border:1px solid #ccc;
   margin-left:10px;
   margin-top:10px;
}
.dd{
   float:left;
   color:#fffff
  
}
.dl{
   padding-top:5px;
}
 font{
   color:black;
} 
.div_1
{   width:78%;
    height:500px;
	border:1px solid #ffffff;
}
.div_1_1{
    width:30%;
	height:100%;
	border:1px solid #ffffff;
	float:left;
}
.div_1_2{
    width:68%;
	height:100%;
	border:1px solid #ffffff;
	float:left;
	margin-left:10px;
}
.div_1_2 ul{
    list-style:none;
	width:90%;
	height:98%; 
	border:1px solid #C7C7C7;
	margin:0px;
}
.div_git
{
    width:78%;
	height:300px;
	padding-top:50px;
	background:url(image/logo/user_backgorun.jpg);
}
.div_s{
width:100px;height:50px;position:relative;
background-color:#ccc;

display:none;
}


</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script>
  $(document).ready(function(){
     $("li.listyle").mouseover(function(){
	   $(this).css("background-color","#E0E0E0")
	 });
	$("li.listyle").mouseout(function(){
	   $(this).css("background-color","#000000")
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
  

</script>
</head>
<body>

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
					<li class="lis"><a href="${pageContext.request.contextPath}/showusermessage.action"><font class="font_set">会员中心 | </font></a></li>
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
    <div class="div_git">
	
	   <form action="${pageContext.request.contextPath}/updateUserMessage.action" method="post" >
	      <table>
	          
		        <tr><td colspan="2" hidden>用户编号：<input type="text" name="id" value="${usermessage.user_id}" id="user_id"/></td></tr>
		        <tr><td><b>姓名:</b></td><td><input type="text" name="name" value="${usermessage.name}" id="name"/></td></tr>
			   <tr><td><b>性别:</b></td><td>
			    <c:if test="${usermessage.sex=='男'}">
			    <input type="radio" name="sex" value="nan" id="sex" checked/>:男
			    <input type="radio" name="sex" value="nv" id="sex" />:女
			    </c:if>
			     <c:if test="${usermessage.sex=='女'}">
			    <input type="radio" name="sex" value="nan" id="sex"/>:男
			    <input type="radio" name="sex" value="nv" id="sex" checked/>:女
			    </c:if>
			   
			   </td>
			   </tr>
			   <tr><td><b>email:</b></td><td><input type="email" name="email" value="${usermessage.user_email}" id="email"/></td></tr>
			   <tr><td><b>电话号码:</b></td><td><input type="text" name="phone" value="${usermessage.user_phone}" id="phone"/></td></tr>
			   <tr><td><b>出身地址:</b></td><td><input type="text" name="address" value="${usermessage.user_address}" id="address"/></td></tr>
			   <tr><td><b>更改密码:</b></td><td><input type="text" name="password" value="" id="password"/></td></tr>
			   <tr><td><input type="submit" value="提交"/></td><td><a href="">默认收货地址</a></td></tr>
		  </table>
	   </form>

	</div>
     <div style="width:78%;height:30px;border:1px solid #ffffff;margin-top:10px;background-color:#C7C7C7">
	      <div style="width:90%;height:100%;border:1px solid #ffffff;">
		    <dl style="margin-left:100px;margin-top:10px">
			    <dt style="float:left;background-color:#8F8F8F"><a href=""><font>购物指南   |</font></a></dt>
				 <dd class="dd"><a href=""><font>支付方式      |</font></a></dd>
				 <dd class="dd"><a href=""><font>配送方式      |</font></a></dd>
				 <dd class="dd"><a href=""><font>销售方式      |</font></a></dd>
			</dl>
			  
		  </div>
	 
	 </div>
      <div style="width:78%;height:100px;border:1px solid #fffff;margin-top:10px #ccc;">
	      <footer>
		     <img src="image\index_head\footer.jpg"/>
			 <div style>Copyright © 2018-2019 author lihuizhi</div>
		  </footer>
	  </div>
   
   </center>
</body>
</html>