<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <!--  搜索手机页面-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>购买手机界面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!--<link type="text/css" rel="styleSheet"  href="mayshop.css"/>-->
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
.search{
    width:78%;
	height:50px;
	padding-top:10px;
	
}
.daohang{
    width:78%;
	height:60px;
	border:1px solid #ccc;
	
}
.daohang dl{
float:left;


margin-top:5px;
}
.daohang dl dt{
float:left;
font-size:15px;

width:100px;
height:30px;
background-color:#ccc;
}
.daohang dl dd{
float:left;
margin:0px;
font-size:10px;
width:50px;
height:30px;
border:1px solid #ccc;
}
.shop{
  width:78%;height:700px;border:1px solid #ccc;margin-top:5px;
}
.shop ul{
width:100%;height:100%;margin-top:0px;float:left;margin-left:5px;
}
.shop ul li{
border:1px solid #ccc;width:20%;height:30%;
margin-top:5px;
margin-left:15px;
}
.shop ul li div{
  width:95%;height:75%;
}
.div_s{
width:100px;height:50px;position:relative;
background-color:#ccc;

display:none;
}
.name{
  color:black;
  font-size:15px;
}
.price{
   color:black;
  font-size:15px;
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
	 $(".shopshow").click(function(){
		
	    var goods_name=$(this).find(".name").text();
	    var goods_price=$(this).find(".price").text();
     var url = "${pageContext.request.contextPath}/tomay.action?";
	window.location.href = url
			+ "goods_name="
			+ goods_name
			+ "&goods_price="
			+ goods_price;
	window.event.returnValue = false;

	 });
	 $("#loginshows").click(function(){
			
		 $(".div_s").fadeToggle("show"); 
	
	});
    //点击退出用户登录
    $("#quitlogin").click(function(){
    	var url = "${pageContext.request.contextPath}/quitlogin.action";
    	window.location.href=url;
    });
	$("#serarch").click(function(){
	
	
		message=$("#message").val();
		var url="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname="+message+"&modl=0";
		
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
				    <li class="listyle"><a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname=*&modl=1">   手机   |</a></li>
					<li class="listyle"><a href="">    家电  |</a></li>
					<li class="listyle"><a href="">   数码产品  |</a></li>
				    <li class="listyle"><a href="">   电视  |</a></li>
					<li class="listyle"><a href="">   电脑  |</a></li>
				 </ul>
		</div>
   </div>
    <div class="search">
	   <input type="text" name="message" id="message" maxlength="40" style="width:50%;"/><button id="serarch">搜索</button>
	 </div>
     <div class="daohang">
     <!-- modl为搜索类型 -->
		<dl><dt>品牌：</dt>
		<dd><a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname=*&modl=1">全部产品</a></dd>
		<dd><a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname=iphone&modl=1">iphone</a></dd>
		<dd><a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname=华为&modl=1">华为</a></dd>
		<dd><a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname=荣耀&modl=1">荣耀</a></dd>
		<dd><a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname=小米&modl=1">小米</a></dd>
		<dd><a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname=三星&modl=1">三星</a></dd>
		<dd><a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname=OPOP&modl=1">OPOP</a></dd>
		<dd><a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname=vivo&modl=1">vivo</a></dd>
		</dl><br/>
	 </div>
	 <div  class="shop">
	           <ul>
	             <c:forEach items="${goodsPage.shop}" var="item">
	              <li class="shopshow">
				  <div><img src="${item.goods_image}" style="width:100%;height:100%;" id="imgs"></div>
				  <span><b class="name">${item.goods_name}</b></span><br/>
				   <span><b class="price">${item.goods_price}</b></span>
				 </li>
	             </c:forEach>
			    
				
			   </ul>
	 </div>
	 <div style="width:78%;height:50px;border:1px solid #ccc;">
	   <a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=1&bandname=${bandname}&modl=${modl}">首页</a>
	      <!-- 当前页是第一页也是最后一页 -->
	      <c:if test="${goodsPage.pageNum==1 && goodsPage.pageNum==goodsPage.totalPage}">
	          <c:forEach begin="${goodsPage.start}" end="${goodsPage.end}"  var="i">
	               <c:if test="${goodsPage.pageNum==i}">${i}</c:if>
	         </c:forEach>
	      </c:if>
	      <!--当前页是第一页但不是最后一页  -->
	      <c:if test="${goodsPage.pageNum==1 && goodsPage.pageNum!=goodsPage.totalPage}">
	          <c:forEach begin="${goodsPage.start}" end="${goodsPage.end}"  var="i">
	            <c:if test="${goodsPage.pageNum==i}">${i}</c:if>
	            <c:if test="${goodsPage.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=${i}&bandname=${bandname}&modl=${modl}">${i}</a>
	            </c:if>
	         </c:forEach>
	         <c:if test="${goodsPage.pageNum!=goodsPage.totalPage}"><a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=${goodsPage.pageNum+1}&bandname=${bandname}&modl=${modl}">下一页</a></c:if>
	      </c:if>
	      <!-- 不是第一页，也不是最后一页 -->
	          <c:if test="${goodsPage.pageNum!=1 && goodsPage.pageNum!=goodsPage.totalPage}">
	           <a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=${goodsPage.pageNum-1}&bandname=${bandname}&modl=${modl}">上一页</a>
	          <c:forEach begin="${goodsPage.start}" end="${goodsPage.end}"  var="i">
	            <c:if test="${goodsPage.pageNum==i}">${i}</c:if>
	            <c:if test="${goodsPage.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=${i}&bandname=${bandname}&modl=${modl}">${i}</a>
	            </c:if>
	         </c:forEach>
	        <a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=${goodsPage.pageNum+1}&bandname=${bandname}&modl=${modl}">下一页</a>
	      </c:if>
	      <!-- 如果是最后一页 -->
	       <c:if test="${goodsPage.pageNum!=1 && goodsPage.pageNum==goodsPage.totalPage}">
	           <a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=${goodsPage.pageNum-1}&bandname=${bandname}&modl=${modl}">上一页</a>
	          <c:forEach begin="${goodsPage.start}" end="${goodsPage.end}"  var="i">
	            <c:if test="${goodsPage.pageNum==i}">${i}</c:if>
	            <c:if test="${goodsPage.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=${i}&bandname=${bandname}&modl=${modl}">${i}</a>
	            </c:if>
	         </c:forEach>
	       
	      </c:if>

	     <a href="${pageContext.request.contextPath}/tososuoshop.action?pageNum=${goodsPage.totalPage}&bandname=${bandname}&modl=${modl}">尾页</a>
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
