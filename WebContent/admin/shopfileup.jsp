<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
	<meta http-equiv=content-type content="text/html; charset=utf-8" />
	   <title>品牌上架</title>
	   <style>
 body{
    font-size: 13px;
}
.div_search{
    font-size: 13px;
    margin: 10px 5px;
    padding-left: 10px;
    line-height: 30px;
    height:30px;
    background-color: #E8F2FC;
    border: solid #1c94c4 1px;
    overflow: hidden
}
.table_a{
    border-collapse:collapse;
    border: 1px solid #E3E6EB
}
.table_a td{
    line-height: 25px;
    padding-left: 8px;
    text-align: left;
}
.div_head{
    font-size: 13px;
    margin: 10px 5px;
    padding-left: 10px;
    line-height: 25px;
    height:25px;
    background-color: #E8F2FC;
    border-bottom: solid #1c94c4 1px
}
	 
	 
</style>
<script>
     function checkfile(){
    	document.getElementById("mess").style.display="none";
    	var file=document.getElementById("file");
    	var filename=file.files[0].name;
    	var subfix=filename.substring(filename.lastIndexOf(".")).toLowerCase();
    	if(subfix!=".jpg"&&subfix!=".png"){
    		alert("图片只能以.jpg或者.png格式");
    		file.value="";
    		document.getElementById("im").style.display="none";
    		return false;
    		
    	}
    	var filesize=file.files[0].size;
    	if(filesize>=1024000){
    		
    		alert("文件过大");
    		file.value="";
    		document.getElementById("im").style.display="none";
    		return false;
    	}
    	 document.getElementById("im").style.display="block";
    	 return true;
     }
     function checkmessage(){
         var goodsname=document.getElementById("goodsname").value;
    	 var goodsprice=document.getElementById("goodsprice").value;
    	 var goodscolor=document.getElementById("goodscolor").value;
    	 var goodsnetwork=document.getElementById("goodsnetwork").value;
    	 var goodsstock=document.getElementById("goodsstock").value;
    	 if(goodsname==' '||goodsname.length==0){alert("手机名不能为空");return false;}
    	 var length=goodsprice.length;
    	  if(goodsprice.substring(0,1)=="."||goodsprice.substring(0,1)>9||goodsprice.substring(0,1)<=0){
    		  
    		alert("价格不能小于0");return false;  
    	  }
    	 for(var i=1;i<length;i++)
    		 {
    		     var goods=goodsprice.substring(i,i+1);
    		      if(goods=='.'&&i!=length-1)continue;
    		      if(goods>'9'||goods<'0'){alert("价格输入不合法");return false;}
    		    
    		 
    		 }
    	 if(goodscolor==' '||goodscolor.length==0){alert("手机颜色不能为空");return false;}
    	 if(goodsnetwork==' '||goodsnetwork.length==0){alert("手机内存不能为空");return false;}
    	 var netlength=goodsstock.length;
    	 if(goodsstock.substring(0,1)=='0'){alert("库存数量输入不合法");return false;}
    	 for(j=0;j<netlength;j++)
    		 {
    		      var name=goodsstock.substring(j,j+1);
    		      if(name>'9'||name<'0'){
    		    	  alert("库存输入不合法");return false;
    		      }
    		    
    		 }
    	
    	var show=document.getElementById("im").style.display;
    	
         if(show=="none"){
        	 
    		document.getElementById("mess").style.display="block";
    		document.getElementById("mess").innerHTML="图片不能为空";
    		return false;
    	}
     	 return true;
    	 
     }

</script>
	</head>
	<body>
	         <div class="div_head">
            <span>
                <span style="float:left">当前位置是：商品管理-》手机产品上架</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a href="${pageContext.request.contextPath}/admin/toindex.action">【反回】</a>
                </span>
            </span>
        </div>
        <div></div>
		<div style="font-size: 13px;margin: 10px 5px">
		     <form action="${pageContext.request.contextPath}/admin/fileup.action" method="post" enctype="multipart/form-data"
		      onsubmit="return checkmessage();"
		     >
			      <table border="1" width="100%" class="table_a">
				      <tr>
                    <td>手机名称</td>
                    <td><input type="text" name="goodsname" value="" id="goodsname"/></td>
                    </tr>
					<tr>
                   
                    </tr>
					<tr> 
					     <td>品牌分类</td>
						 <td>
						    <select name="bandid">
							   
							   <c:forEach items="${bandlist}" var="item">
							          <option value="${item.band_id}">${item.band_name}</option>
							   </c:forEach>
							</select>
						 </td>
					</tr>
					  <tr>
                    <td>商品价格</td>
                    <td><input type="text" name="goodsprice" id="goodsprice"/></td>
                    </tr>
					<tr>
                    <td>手机颜色</td>
                    <td><input type="text" name="goodscolor" id="goodscolor"/></td>
                    </tr>
				    <tr>
                    <td>手机运行内存</td>
                    <td><input type="text" name="goodsnetwork" id="goodsnetwork"/></td>
                    </tr>
					<tr>
                    <td>手机库存量</td>
                    <td><input type="text" name="goodssotck" id="goodsstock"/></td>
                    </tr>
					<tr>
					   <td>手机图片</td>
					   <td><input type="file" name="upfile" id="file" onchange="checkfile()"><font style="display:none;" id="im">*</font><font style="display:none;color:red;" id="mess"></font></td>
					</tr>
					<tr>
					   <td>商品状态</td>
					   <td><select name="goodsstatus">
					         <option value="0" selected>非热卖品</option> 
							<option value="1">热卖品</option>
							
					   </select></td>
					</tr>
					<tr><td colspan="2"><input type="submit" value="提交"/></td></tr>
					
				  </table>
			 
			 </form>
		
		</div>
	</body>

