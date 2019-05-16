<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>确认订单</title>
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
.sp{
   width:100%;
   height:100%;
   border:1px solid #C7C7C7;


}
.div_1_2 ul{
padding:3px;
}
.img{
   width:100%;
   height:100%;

}
.div_1_2 ul li{
   float:left;
   width:18%;
   height:45%;
  margin:2px;
   border:1px solid  #ffffff;

}
.div_1_1_1{
    width:60%;
	height:60%;
	border:1px solid red;
	float:left;
	background:url(image/index_head/logo.png);
	background-size:100% 100%;
}
.div_1_1_2
{    width:60%;
	height:35%;
	border:1px solid blue;
	float:left;
	background-color:#DEDEDE;
}

.div_1_1_2 ul li{
margin-left:0px;
width:40%;
height:30%;

}
.div_1_1_2 ul li a{
   color:#8B8B83;
   margin-left:-10px;
   font-size:10px;

}
.fontstyle{
  font-size:3px;
  color:red;

}
.fontstyle1
{  font-size:5px;
    color:red;
}
.shopimg
{
  width:50%;
  height:50%;
  border:1px solid red;
  margin-top:50px;
}
.imgs{
  width:50%;
  height:50%;
  margin-top:50px;
}
.div_main{
border:1px solid red;width:78%;height:500px;
background:url(image/logo/background.jpg)
}
.div_froms{
   width:60%;
   height:80%;
   border:1px solid red;
   float:right;
}
.div_s{
width:100px;height:100px;position:relative;
background-color:#ccc;
display:none;
}
font{
color:black;
}
strong{
font-size:15px;
}
</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script>
  $(document).ready(function(){
     
	 
	 $("#loginshows").click(function(){
			
		 $(".div_s").fadeToggle("show"); 
	
	});
    //点击退出用户登录
    $("#quitlogin").click(function(){
    	var url = "${pageContext.request.contextPath}/quitlogin.action";
    	window.location.href=url;
    });
	 
  });
function checkmessage(){
	
	var pay_type=document.getElementById("pay_type").value();
	var address=document.getElementById("address").value();
	if(pay_type!=null&&address!=null)return true;
	return false;
	
	
}

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
								     <li style="float:left;width:80px;height:40px;color:red;font-size:10px;margin-left:-35px;border:1px solid blue;">信息更改</li>
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
				    <li class="listyle"><a href="">   手机   |</a></li>
					<li class="listyle"><a href="">    家电  |</a></li>
					<li class="listyle"><a href="">   数码产品  |</a></li>
				    <li class="listyle"><a href="">   电视  |</a></li>
					<li class="listyle"><a href="">   电脑  |</a></li>
				 </ul>
		</div>
   </div>
    <div  class="div_main">
	   <div><strong style="font-size:30px;color:blue;">确认订单</strong></div>
		<div style="width:30%;height:300px;float:left;">
		<img src="${orderimage}" id="imgs" class="imgs""/>
		</div>
		 <div class="div_froms">
		     <form action="${pageContext.request.contextPath}/produceOrder.action" method="post" id="for1" onsubmit="return checkmessage()">
			    <table>
				   <tr><td><strong>商品:</strong></td><td><input type="text" name="goods_name" id="goods_name" readonly value="${order_name}"/></td></tr>
				   <tr><td><strong>商品颜色:</strong></td><td><input type="text" name="goods_color" id="goods_color" value="${order_color}"readonly/></td></tr>
				   <tr><td><strong>商品参数:</strong></td><td><input type="text" name="goods_ram" id="goods_ram" readonly value="${order_ram}"/></td></tr>
				   <tr><td><strong>商品价格:</strong></td><td><input type="text" name="goods_price" id="goods_price" readonly value="${order_price}"/></td></tr>
				   <tr><td><strong>商品数量:</strong></td><td><input type="text" name="goods_number" id="goods_number" readonly value="${order_number}"/></td></tr>
				   <tr><td><strong>商品总价:</strong></td><td><input type="text" name="goods_total" id="goods_total" readonly value="${order_total}"/></td></tr>
				   <tr><td><strong>收货人：</strong></td>
				   <td>
				      <c:forEach items="${address}" var="item" varStatus="var">
				          <input type="radio" value="${item.addr_id}" name="address" id="address" checked/>${item.name}   ${item.addr_detail}<br/>
				      </c:forEach>
				   
				   </td></tr>
				   <tr><td>支付方式：</td><td><input type="radio" value="0" name="pay_type" id="pay_type" checked/>线上支付<br/>
				   <input type="radio" value="1" name="pay_type" id="pay_type"/>货到付款
				   </td></tr>
				    
					<tr><td><input type="submit" value="提交订单"></td></tr>
				</table>
			 
			 </form>
		</div>
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