<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>金风细雨</title>
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
	border:1px solid #ccc;
	float:left;
	margin-left:10px;

}
.div_1_2 ul{
    list-style:none;
	width:90%;
	height:98%; 
	/* border:1px solid #C7C7C7; */
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
  color:black;

}
.fontstyle2{
  font-size:3px;
  color:black;

}
.fontstyle1
{  font-size:5px;
    color:black;
}
.shoping{
   width: 50%; 
   height: 50%; 
   margin-top: 50px;
}
.goods_name{
  display:none;
}
.goods_price{
    display:none;
}
.div_s{
width:100px;height:50px;position:relative;
background-color:#ccc;
display:none;
}

</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script>
  
	$(document)
			.ready(
					function() {

						$("li.listyle").mouseover(function() {
							$(this).css("background-color", "#E0E0E0")
						});
						$("li.listyle").mouseout(function() {
							$(this).css("background-color", "#000000")
						});
						<!--图片效果-->
						$("li.shopli").mouseover(function() {
							$(this).css("background-color", "#E0E0E0")
						});
						$("li.shopli").mouseout(function() {
							$(this).css("background-color", "#ffffff")
						});

						$("div.sp")
								.click(
										function() {

											var goods_name = $(this).children(
													".fontstyle2").text();
											var goods_price = $(this).children(
													".fontstyle").text();
											var url = "${pageContext.request.contextPath}/tomay.action?";
											window.location.href = url
													+ "goods_name="
													+ goods_name
													+ "&goods_price="
													+ goods_price;
											window.event.returnValue = false;

										});
						$("li.shopli").click(function(){
							
							  var goods_name=$(this).children(".goods_name").text();
							  var goods_price=$(this).children(".goods_price").text();
							var url = "${pageContext.request.contextPath}/tomay.action?";
						    var action=url+"goods_name="+goods_name+"&"+"goods_price="+goods_price;
							window.location.href=action;
						});
                        //登录用户后点用户名弹出和收信息
						$("#loginshows").click(function(){
							
							 $(".div_s").fadeToggle("show"); 
						
						});
                        //点击退出用户登录
                        $("#quitlogin").click(function(){
                        	var url = "${pageContext.request.contextPath}/quitlogin.action";
                        	window.location.href=url;
                        });
                        //用ajax来实现品牌搜索
                         $("li#band").click(function(){
                        	 //json
                        	  
                        	 $.ajax(
                        			 {
                        				 url:"${pageContext.request.contextPath}/findenname.action",
                        				 type:"POST",
                        				
                        				 data:{'en_name':$(this).text()},
                        				 success:function(data){
                        					
                        					setul(data);
                        				 }
                        			 }
                        	 );
                        	 
                         });
                       
					});
	
function setul(data)
{
	$("#ajax").css("display",'none');
	
	var object=JSON.parse(data);
	var number=(JSON.parse(data)).length;
	if(number>10) var j=10;
	else j=number;
	$(".ul1").remove();
	$(".div_1_2").append('<ul style="width:98%;height:98%;float:left;" class="ul1"></ul>')
	for(var i=0;i<j;i++){
		
         $(".ul1").append(
          '<li style="widht:18%;height:50%;border:1px solid #ccc;" class="lis">'+
              '<div style="width:98%;height:70%;">'+
                    '<img src="'+object[i].goods_image+'" style="width:100%;height:100%;" class="img1"/>'+
              '</div>'+
              '<span style="width:100%;">'+
                      '<font style="color:black;" class="span1">'+object[i].goods_name+'</font>'+
               '</span>'+'<br/>'+
               '<span style="width:100%;">'+
                       '<font style="color:black;" class="span2">'+object[i].goods_price+'</font>'+
                '</span>'+'<br/>'+
           '</li>'
         
         
         )
       
	}
	 //ajax点击后的效果
    $("li.lis").click(function(){
    	
	var goods_name = $(this).find(".span1")
									.text();
							var goods_price = $(this).find(".span2")
									.text();
							var url = "${pageContext.request.contextPath}/tomay.action?";
							window.location.href = url + "goods_name="
									+ goods_name + "&goods_price="
									+ goods_price;
							window.event.returnValue = false;

						});

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
  <div style="width:78%;height:40px;border:1px solid #ffffff;margin-top:10px;text-align:left;background-color:#8A2BE2">
     <font style="font-size:20px;align:left"><b>热门商品</b></font>
  </div>
   <div class="div_1">
       <div class="div_1_1">
	      <div class="div_1_1_1"></div>
		  <div class="div_1_1_2">
		     <ul style="padding:5px;">
			    <li id="band" style="font-size:2px;padding:5px;">MI</li>
			    <li id="band" style="font-size:2px;padding:5px;">iphone</li>
				<li id="band" style="font-size:2px;padding:5px;">HUAWEI</li>
				<li id="band" style="font-size:2px;padding:5px;">honor</li>
				<li id="band" style="font-size:2px;padding:5px;">OPOP</li>
				<li id="band" style="font-size:2px;padding:5px;">SAMSUNG</li>
				<li id="band" style="font-size:2px;padding:5px;">vivo</li>
			 </ul>
		  
		  </div>
	   </div>
			<div class="div_1_2">
			   
				<ul id="ajax">
					<c:forEach items="${shop}" var="item" begin="0" end="9">
						<li><a href="">
								<div class="sp">
									<div
										style="border: 1px solid #ffffff; width: 100%; height: 80%">
										<img src="${item.goods_image}" class="img" />
									</div>
									<span id="" class="fontstyle2">${item.goods_name}</span><br />
									<span class="fontstyle" id="">${item.goods_price}</span>
								</div>
						</a></li>
					</c:forEach>
					<!--  <li><a href=""><div class="sp"><div style="border:1px solid #ffffff;width:100%;height:80%"><img src="image\phone\honor\honor9\honor_9_youth.png" class="img"/></div><span id="" class="fontstyle">三星</span><br/><span class="fontstyle" id="">￥5000</span></div></a></li> 
                <li><a href=""><div class="sp"><div style="border:1px solid #ffffff;width:100%;height:80%"><img src="image\phone\honor\honor9\honor_9_youth.png" class="img"/></div><span id="" class="fontstyle">三星</span><br/><span class="fontstyle" id="">￥5000</span></div></a></li>  -->

				</ul>
          
			</div>

		</div>
   <div style="width:78%;height:40px;border:1px solid #ffffff;margin-top:10px;text-align:left;background-color:#8F8F8F">
     <font style="font-size:20px;align:left"><b>商品</b></font>
  </div>
		<div
			style="width: 78%; height: 600px; border: 1px solid #C7C7C7; margin-top: 10px; overflow: auto">
			<ul style="width: 90%; height: 90%">
				<li class="shopli" style="text-align: button"><img
						src="image\phone\huawei\HUAWEI_MAT\huaiwei_mate_20rs.png"
						class="shoping"/><span class="goods_name">huawei mate 20rs</span><span class="goods_price">9999</span></li>
				<li class="shopli" style="text-align: button"><img
						src="image\phone\huawei\HUAWEI_MAT\huaiwei_mate_pro.png"
						class="shoping"/><span class="goods_name">huawei mate pro</span><span class="goods_price">4500</span></li>
				
				<li class="shopli" style="text-align: button"><img
						src="image\phone\huawei\HUAWEI_NOVA\HUAWEI_nova_3.jpg"
						class="shoping"/><span class="goods_name">HUAWEI nova</span><span class="goods_price">6000</span></li>
						
				 <li class="shopli" style="text-align: button"><img
						src="image\phone\Apple\iphone 8 plus1.jpg"
						class="shoping"/><span class="goods_name">iphone 8 plus</span><span class="goods_price">5500</span></li>
				        
				 <li class="shopli" style="text-align: button"><img
						src="image/phone/Apple/iphone xr.jpg"
						class="shoping"/><span class="goods_name">iphone xr</span><span class="goods_price">8000</span></li>
			     
			     <li class="shopli" style="text-align: button"><img
						src="image/phone/Sum/sum s91.jpg"
						class="shoping"/><span class="goods_name">三星 s91</span><span class="goods_price">8000</span></li>
			     <li class="shopli" style="text-align: button"><img
						src="image/phone/Sum/Galaxy s10 white.jpg"
						class="shoping"/><span class="goods_name">Galaxy s10</span><span class="goods_price">7500</span></li>	
				<li class="shopli" style="text-align: button"><img
						src="image/phone/OPOP/OPOP R17.jpg"
						class="shoping"/><span class="goods_name">OPOP R17</span><span class="goods_price">1900</span></li>		
				<li class="shopli" style="text-align: button"><img
						src="image/phone/MI/MI 9SE.jpg"
						class="shoping"/><span class="goods_name">小米 9SE</span><span class="goods_price">6500</span></li>	
						
				<li class="shopli" style="text-align: button"><img
						src="image/phone/vivo/vivo iQoo1.jpg"
						class="shoping"/><span class="goods_name">vivo iQoo</span><span class="goods_price">4900</span></li>
						
				<li class="shopli" style="text-align: button"><img
						src="image/phone/vivo/vivo s1.jpg"
						class="shoping"/><span class="goods_name">vivo S1</span><span class="goods_price">5900</span></li>
				<li class="shopli" style="text-align: button"><img
						src="image/phone/Apple/iphone 8 white.jpg"
						class="shoping"/><span class="goods_name">iphone 8</span><span class="goods_price">5000</span></li>																																																																																										
			</ul>
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