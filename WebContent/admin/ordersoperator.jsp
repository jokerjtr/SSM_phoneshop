<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
	   <title>订单处理页面</title>
	   <meta http-equiv=content-type content="text/html; charset=utf-8" />
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
	 
.tr_color{background-color: #9F88FF}	 
</style>
   <meta http-equiv=content-type content="text/html; charset=utf-8" />
 <script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script>
  $(document).ready(function(){
	  $("#sub").click(function(){
		 var bandname=$("#s_product_mark option:selected").val();
		 window.location.href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname="+bandname+"&page=1";
			 
	  });
	  $(".bt").click(function(){
		 var object=$(this);
		var orderids=$(this).parents("tr").attr("id"); <!-- 订单编号 --> 
		var goodsids=$(this).parent("td").siblings(".goodsid").text();<!-- 商品编号--> 
		var goodsnums=$(this).parent("td").siblings(".goodsnumber").text();<!--商品数量-->
		var goodsstocks=$(this).parent("td").siblings(".goodsstock").text();<!--商品库存-->
		var sendtypes=$(".sendtype option:selected").val();<!--商品的配送方式-->
		var status=$(".status option:selected").val();<!--订单状态-->
		if(parseInt(goodsnums)>parseInt(goodsstocks)){alert("库存不足");}
		else{
            $.ajax(
              {
            	  url:"${pageContext.request.contextPath}/admin/handleOrder.action",
            	  type:"POST",
            	 
            	  data:{ 'orderid':orderids,
        			    'goodsid':goodsids,
        			     'goodsnum':goodsnums,
        			    'sendtype':sendtypes,
        			    'status':status
        		       },
        		  success:function(data){
        			 object.val(data);
        			 object.attr({"disabled":"disabled"});
               		}
              }		
            );
        
		 }
		
  });
  });
  
</script>
	</head>
	<body>
	    <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：订单处理-》订单处理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="#">【反回】</a>
                </span>
            </span>
        </div> 
		<div></div>
		 <div class="div_search">
            <span>
                
                               品牌<select name="s_product_mark" style="width: 100px;" id="s_product_mark">
					   <c:if test="${bandname=='*'}">
					    <option value="*" selected="selected">请选择</option>
					    <c:forEach items="${band}" var="item">
					       <option value="${item.band_name}">${item.band_name}</option>
					    </c:forEach>
					   </c:if>
					   <c:if test="${bandname!='*'}">
					    <option value="*">请选择</option>
					    <c:forEach items="${band}" var="item">
					       <c:if test="${item.band_name==bandname}">
					           <option value="${item.band_name}" selected="selected">${item.band_name}</option>
					       
					       </c:if>
					       <c:if test="${item.band_name!=bandname}">
					           <option value="${item.band_name}">${item.band_name}</option>
					       </c:if>
					    </c:forEach>
					   </c:if>
				</select> 
					
                    <input value="查询" type="submit" id="sub" />
               
            </span>
        </div>
		 <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                   <td>序号</td>
				   <td>商品编号</td>
                   <td>商品名</td>  
				   <td>品牌名</td>
                   <td>商品描述</td> 
                   <td>商品数量</td>
                   <td>库存量</td> 				   
                   <td>商品单价</td> 
				   <td>支付方式</td>
				   <td>送货地址</td>
				   <td>送货方式</td>
				   <td>订单状体</td>
				   <td>操作</td>
                    </tr>
                   
                  
                   <c:forEach items="${pageBean.shop}" var="item" varStatus="i">
                       <tr id="${item.orderid}">
                        <td>${i.count}</td>
						<td class="goodsid">${item.goodsid}</td>
					    <td>${item.goodsname}</td>
						<td>${item.bandname}</td>
						<td>${item.remark}</td>
                        <td class="goodsnumber">${item.goodsnumber}</td>
						<td class="goodsstock">${item.goodsstock}</td>
						<td>${item.goodsprice}</td>
                        <td>${item.paytype}</td>
						<td>${item.address}</td>
						<td><select class="sendtype">
						   <option value="0" select="selected">中通快递</option>
						   <option value="1">圆通快递</option>
						   <option value="2">邮政快递</option>
						   <option value="3">京东快递</option>
						   <option value="4">韵达快递</option>
						</selected></td>
                         <td><select class="status">
						   
						   <option value="1" select="selected">审核通过</option>
						   <option value="2">审核不通过</option>
						 </select></td>
						 <td>
					       <input type="button" value="提交" class="bt"/><span id="${i.count}" style="display:none">${i.count}</span>
						    
						 </td>						
                        
                    </tr>
                   </c:forEach>
				  <tr>
			<td colspan="13" style="text-align:center">
				       <a href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname=${bandname}&page=1">首页</a>
	   <!-- 如果只有一页 -->
	  <c:if test="${pageBean.totalPage==1}">
	     <a href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname=${bandname}&page=1">1</a>
	  </c:if>
	   <!--如果当前是第一页  -->
	   <c:if test="${pageBean.pageNum==1&& pageBean.totalPage!=1}">
	      <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
	            <c:if test="${pageBean.pageNum==i}">${i}</c:if>
	            <c:if test="${pageBean.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname=${bandname}&page=${i}">${i}</a>
	            </c:if>
	         </c:forEach>
	        <c:if test="${pageBean.pageNum!=pageBean.totalPage}">
	           <a href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname=${bandname}&page=${pageBean.pageNum+1}">下一页</a>
	        </c:if>
	   </c:if>
	   <!--  如果当前页面是最后一页-->
	   <c:if test="${pageBean.pageNum==pageBean.totalPage&& pageBean.totalPage!=1}">
	         <c:if test="${pageBean.pageNum!=1}">
	           <a href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname=${bandname}&page=${pageBean.pageNum-1}">上一页</a>
	         </c:if>
	         <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
	            <c:if test="${pageBean.pageNum==i}">${i}</c:if>
	            <c:if test="${pageBean.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname=${bandname}&page=${i}">${i}</a>
	            </c:if>
	         </c:forEach>
	   </c:if>
	   <!-- 如果不是最后一页,不是第一页 -->
	   <c:if test="${pageBean.pageNum!=1&& pageBean.totalPage!=1 && pageBean.pageNum!=pageBean.totalPage}">
	         <c:if test="${pageBean.pageNum!=1}">
	           <a href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname=${bandname}&page=${pageBean.pageNum-1}">上一页</a>
	         </c:if>
	         <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
	            <c:if test="${pageBean.pageNum==i}">${i}</c:if>
	            <c:if test="${pageBean.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname=${bandname}&page=${i}">${i}</a>
	            </c:if>
	         </c:forEach>
	         <c:if test="${pageBean.pageNum!=pageBean.totalPage}">
	           <a href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname=${bandname}&page=${pageBean.pageNum+1}">下一页</a>
	        </c:if>
	   </c:if>
	   <!-- 尾页-->
	   <a href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname=${bandname}&page=${pageBean.totalPage}">尾页</a>
				    
				    </td>
				  </tr>
                   
                </tbody>
            </table>
        </div>
	</body>

</html>