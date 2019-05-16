<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>购物车</title>
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
.div_cat{
     width:78%;
	 height:300px;
	 
	 overflow:auto;
	 margin-top:10px;
}
.div_cat table{
    border-collapse:collapse;
    border: 1px solid #E3E6EB
}
.div_cat table td{
    line-height: 25px;
    padding-left: 8px;
    text-align: left;}
.div_cat1{
     width:78%;
	 height:50px;
	 border:1px solid #ffffff;
	 overflow:auto;
	 margin-top:10px;
	
}
.div_cat2{
     width:78%;
	 height:30px;
	 border-top:1px dashed #EEE0E5;
	  border-bottom:1px dashed #EEE0E5;
	 margin-top:10px;
	 margin-bottom:10px;

}
#button{
   background-color:#FF3030
}
.div_s{
width:100px;height:100px;position:relative;
background-color:#ccc;

display:none;
}

</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script>
 
$(document).ready(function(){
	
	 //登录用户后点用户名弹出和收信息
	$("#loginshows").click(function(){
		
		 $(".div_s").fadeToggle("show"); 
	
	});
    //点击退出用户登录
    $("#quitlogin").click(function(){
    	var url = "${pageContext.request.contextPath}/quitlogin.action";
    	window.location.href=url;
    });
   var total=0;
    //checkbox选择事件改变
    $("input#goods").change(function(){
    	  if($(this).attr('checked')){
    		    /* total=total+parseDoule($(this).val()); */
    		    total=total+parseFloat($(this).val());
    		    $("#money").text(total);   
    	  }	
    	  else{
    		  total=total-parseFloat($(this).val());
  		    $("#money").text(total); 
    	  }
    	  
    });
});
function tomay(){
	var img=document.getElementById("imgs").src;
	var message=document.getElementById("message").value;
	
	alert(message.split(" "));
	
	/* var goods_name
	var goods_color
	var goods_ram */
	
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
								    <!--  <li style="float:left;width:80px;height:40px;color:red;font-size:10px;margin-left:-35px;border:1px solid blue;">信息更改</li> -->
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
      <div class="div_cat">
	      	<table  border="1" style="float:left;width:100%;">
					<tbody><tr>
					    <th align="left" font-color="red" display="none">*
						<th align="left" font-color="red">图片</th>
						<th align="left">商品</th>
						<th align="left">价格</th>
						<th align="left">数量</th>
						<th align="left">小计</th>
						<th align="left">操作</th>
						</th>
					</tr>
					   <c:forEach items="${goods}" var="item">
						<tr>
						    <td width="60px">
						       <input type="checkbox" name="goods" value="${item.goods_total_money}" id="goods"/>
						    </td>
							<td width="60px">
								<input type="hidden" name="id" value="${item.goods_id}">
								<img src="${item.goods_image}" style="width:50px;height:50px" id="imgs">
							</td>
							<td class="ss">
							   <input type="text" style="height:40px;background-color:#ffffff;border:none" name="message" id="message" value="${item.goods_name}&nbsp;${item.goods_color}&nbsp;${item.goods_netword}" disabled/>
								
							</td>
							
							<td>
								￥${item.goods_price}
							</td>
							<td class="quantity" width="60">
								${item.goods_number}
							</td>
							
							<td width="140">
								<span class="subtotal">￥${item.goods_total_money}</span>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/deleteByGoodsId.action?id=${item.goods_id}" class="delete">删除</a>
								<a href="${pageContext.request.contextPath}/toconfirmorder.action?id=${item.goods_id}&goods_number=${item.goods_number}" class="delete">购买</a>
							</td>
							
						</tr>
						</c:forEach>
						
				</tbody></table>
	  </div>
	  
	  <div class="div_cat1">
	       <span style="float:right"><em style="color:#FFC125">登录后确认是否享有优惠</em>&nbsp;&nbsp;&nbsp;&nbsp;
		   商品金额:<em><strong style="color:red;font-size:20px;">￥</strong><strong id="money" style="color:red;font-size:20px;">5555</strong></em></span>
	  </div>
	  <div class="div_cat2">
	        <span style="float:right"><a href="${pageContext.request.contextPath}/deleteAllcookie.action">清空购物车</a></span>
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