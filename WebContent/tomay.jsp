<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>手机购买页面</title>
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
   color:#ffffff;
}
.div_main{
   width:78%;
   height:900px;
   border:1px solid #ccc;
   

}
.imgdiv{
    width:30%;
	height:30%;

	float:left;
}
.movediv{
    width:600px;
	height:400px;
	
	position:absolute;
	top:200px;
	left:500px;
}
.div3
{
   width:69%;
   height:98%;
   border:1px solid #ccc;
   float:left;
   margin-left:2px;
   margin-top:3px;

}
.shoptitle
{  width:100%;
   height:5%;
   
}
.shopmoney
{   width:100%;
    height:5%;

    background-color:#FFF68F;
	padding-top:10px;

}
.color{
  width:60%;
  height:60%;
  
 
}
.div_color{
width:78%;height:100%;float:left;
}
.div_color ul{
    width:85%;
	height:95%;
   
	float:left;
	margin:0px;
	padding:0px;
	
}
.div_color ul li{
    width:40%;
	height:30px;
	border:1px dashed #ccc;
	margin:10px;
	overflow:hidden; 
}
.div_color ul li a{
  font-size:5px;
  float:left;

  color:black;
}
.ram{
   width:60%;
    height:5%;
 
}
.divnumber
{   width:60%;
    height:5%;
    margin-top:5px;
    background-color:#ccc;

}
.divmay{
   width:60%;
    height:5%;
    margin-top:5px;
   
}
.div_s{
width:100px;height:100px;position:relative;

display:none;
}
font{
color:black;

}
.div_s{
width:100px;height:50px;position:relative;
background-color:#ccc;
display:none;
}

</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script>
//手机商品对象
 
  $(document).ready(function(){
	  var phone={"goods_name":'',"goods_color":'',"goods_netword":'',"goods_number":''}
	   phone.goods_name=$("#title").text();
	   phone.goods_color=$("#color").children("li:first").text();
	   phone.goods_netword=$("#ram").children("li:first").text();
	    
     $("li.listyle").mouseover(function(){
	   $(this).css("background-color","#E0E0E0")
	 });
	$("li.listyle").mouseout(function(){
	   $(this).css("background-color","#000000")
	 });
	<!--图片放大-->
	 $("div#imgshow").mouseover(function(e){
	  var url=$("#img")[0].src;
     $("#upimage")[0].src=url;
	 $("div#upshow").css("display","block");
	 });
	  $("div#imgshow").mouseout(function(){
	    $("div#upshow").css("display","none");
	  });
	  //Ajax根据颜色调用数据库来显示商品价格
	  $("li.color").click(function(){
		    $("li.color").css("border-color","black");
		    $(this).css("border-color","red");
		    phone["goods_color"]=$(this).text();
		    
		 
		    $.post("${pageContext.request.contextPath}/checkmoney.action",{
		    	goods_name:$("#title").text(),
		    	goods_color:phone.goods_color,
		    	goods_netword:phone.goods_netword
		    },function(data,status){
		    	$("#money").text(data);
		    }
		    
		    );  
	  });
	  $("li.ram").click(function(){
		  $("li.ram").css("border-color","black");
		  $(this).css("border-color","red");
		  phone.goods_netword=$(this).text();
		  $.post("${pageContext.request.contextPath}/checkmoney.action",{
			  goods_name:$("#title").text(),
		    	goods_color:phone.goods_color,
		    	goods_netword:phone.goods_netword
		    },function(data,status){
		    	$("#money").text(data);
		    }
		    
		    ); 
	  });
	  //立即购购买确认订单
	  $("button#may").click(function(){
		    if($("#money").text()!="null"&&$("#money").text()!='')
		    {
		   var url="${pageContext.request.contextPath}/toconfirmorder.action?";
		   var message="goods_image="+$("#img")[0].src+"&goods_name="+phone.goods_name+"&goods_color="+phone.goods_color+"&goods_ram="+phone.goods_netword+"&money="+$("#money").text()+
		   "&goods_number="+$("input#number").val();
		  
		   window.location.href=url+message;
		   }
		    else{
		    	$("#showerr").text("该选项没有了");
		    }
		  
	  });
	  $("button#addshopcat").click(function(){
		  if($("#money").text()!="null"&&$("#money").text()!=''){
			  var url="${pageContext.request.contextPath}/addCart.action?";
			  var message="goods_image="+$("#img")[0].src+"&goods_name="+phone.goods_name+"&goods_color="+phone.goods_color+"&goods_ram="+phone.goods_netword+"&money="+$("#money").text()+
			   "&goods_number="+$("input#number").val();
			  window.location.href=url+message; 
		  }
			  
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
  
  function subnumber(){
        var number=document.getElementById("number").value;
        if(number>1)number=number-1;
          document.getElementById("number").value=number;		

  }
  function addnumber(){
   var number=parseInt(document.getElementById("number").value);
    if(number<10)number=number+1;
	document.getElementById("number").value=number;
     	
     
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
								  <!--    <li style="float:left;width:80px;height:40px;color:red;font-size:10px;margin-left:-35px;border:1px solid blue;">信息更改</li> -->
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
     <div class="div_main">
	    <div class="imgdiv" id="imgshow"><img src="${goods_image[0]}" style="width:100%;height:100%;" id="img"></div>
		<div class="movediv" id="upshow" style="display:none;"><img src="" id="upimage" style="width:100%;height:100%;"></div>
		<div class="div3">
		    <!--商品信息-->
			<div class="shoptitle"><strong id="title" style="font-size:25px;">${goods_name}</strong></div>
			<div class="shopmoney"><span style="font-size:20px">价格:</span>&nbsp;&nbsp;&nbsp;<strong id="money" style="color:#FF0000;font-size:30px;">${goods_price}</strong></div>
		    <div class="color">
			    <div style="width:20%;height:100%;float:left;"><strong>机身颜色</strong></div>
			     <div class="div_color">
			       
				     <ul id="color">
				        <c:forEach items="${goods_color}" var="item">
				              <li class="color">${item}</li> 
				        </c:forEach>
					 </ul>
					 
				 </div>
			</div>
			<div class="ram">
			   <div style="width:20%;height:100%;float:left;margin-top:15px;"><strong>内存</strong></div>
			   <div class="div_color">
				     <ul id="ram"> 
				      <c:forEach items="${goods_ram}" var="item">  
				     <li class="ram">${item}</li>
				     </c:forEach>
					 </ul>
				 </div>
			</div>
		 <div class="divnumber">
			  <span style="margin-left:-60px;float:left;">数量</span>
			  <span style="float:left;">
			     <a href="javascript:subnumber();"><strong style="font-size:30px">-</strong></a><input type="text" name="number" id="number" value="1" min="1" max="10" style="width:30px;height:20px;"/><a href="javascript:addnumber();"><strong style="font-size:30px">+</strong></a>
			  </span>
		</div>
		<div class="divmay">
		   <button style="width:100px;height:40px;color:red;" id="may">立即购买</button>
		   <button style="width:100px;height:40px;color:red;" id="addshopcat">加入购物车</button>
		   <span id="showerr"></span>${addcat}
		</div>
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