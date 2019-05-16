<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>销售统计</title>
<meta http-equiv=content-type content="text/html; charset=utf-8" />
<style>
body {
	font-size: 13px;
}

.div_search {
	font-size: 13px;
	margin: 10px 5px;
	padding-left: 10px;
	line-height: 30px;
	height: 30px;
	background-color: #E8F2FC;
	border: solid #1c94c4 1px;
	overflow: hidden
}

.table_a {
	border-collapse: collapse;
	border: 1px solid #E3E6EB
}

.table_a td {
	line-height: 25px;
	padding-left: 8px;
	text-align: left;
}

.div_head {
	font-size: 13px;
	margin: 10px 5px;
	padding-left: 10px;
	line-height: 25px;
	height: 25px;
	background-color: #E8F2FC;
	border-bottom: solid #1c94c4 1px
}

.tr_color {
	background-color: #9F88FF
}
</style>
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script>
  $(document).ready(function(){
	  $("#sub").click(function(){
		  var bandname=$("#s_product_mark option:selected").val();
		  var desc=$("#s_product_desc option:selected").val();
		 window.location.href="${pageContext.request.contextPath}/admin/tosales.action?bandname="+bandname+"&page=1&desc="+desc 
		  
	  });
	  
  });
</script>
</head>
<body>
	<div class="div_head">
		<span> <span style="float: left;">当前位置是：销售管理-》销售统计</span> <span
			style="float: right; margin-right: 8px; font-weight: bold;"> <a
				 href="${pageContext.request.contextPath}/admin/toindex.action">【反回】</a>
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
				<select name="s_product_desc" style="width: 100px;" id="s_product_desc">
				
					<c:if test="${desc=='0'}">
						<option selected="selected" value="0">降序</option>
					     <option value="1">升序</option>
					</c:if>
					<c:if test="${desc=='1'}">
						<option  value="0">降序</option>
					    <option value="1" selected="selected">升序</option>
					</c:if>
				</select> 
				<input value="查询" type="submit" id="sub"/>
			
		</span>
	</div>
	<div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_a" border="1" width="100%">
			<tbody>
				<tr style="font-weight: bold;">
					<td>序号</td>
					<td>商品名称</td>
					<td>手机品牌</td>
					<td>销售量</td>
				</tr>
			   <c:forEach items="${pageBean.shop}" var="item">
			       <tr>
					<td>${item.id}</td>
					<td>${item.name}</td>
					<td>${item.bandname}</td>
                    <td>${item.number}</td>
				</tr>
			   </c:forEach>
				
			</tbody>
		</table>
	</div>
	<div align="center">
	   <a href="${pageContext.request.contextPath}/admin/tosales.action?bandname=${bandname}&page=1&desc=${desc}">首页</a>
	   <!-- 如果只有一页 -->
	  <c:if test="${pageBean.totalPage==1}">
	     <a href="${pageContext.request.contextPath}/admin/tosales.action?bandname=${bandname}&page=1&desc=${desc}">1</a>
	  </c:if>
	   <!--如果当前是第一页  -->
	   <c:if test="${pageBean.pageNum==1&& pageBean.totalPage!=1}">
	      <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
	            <c:if test="${pageBean.pageNum==i}">${i}</c:if>
	            <c:if test="${pageBean.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/admin/tosales.action?bandname=${bandname}&page=${i}&desc=${desc}">${i}</a>
	            </c:if>
	         </c:forEach>
	        <c:if test="${pageBean.pageNum!=pageBean.totalPage}">
	           <a href="${pageContext.request.contextPath}/admin/tosales.action?bandname=${bandname}&page=${pageBean.pageNum+1}&desc=${desc}">下一页</a>
	        </c:if>
	   </c:if>
	   <!--  如果当前页面是最后一页-->
	   <c:if test="${pageBean.pageNum==pageBean.totalPage&& pageBean.totalPage!=1}">
	         <c:if test="${pageBean.pageNum!=1}">
	           <a href="${pageContext.request.contextPath}/admin/tosales.action?bandname=${bandname}&page=${pageBean.pageNum-1}&desc=${desc}">上一页</a>
	         </c:if>
	         <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
	            <c:if test="${pageBean.pageNum==i}">${i}</c:if>
	            <c:if test="${pageBean.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/admin/tosales.action?bandname=${bandname}&page=${i}&desc=${desc}">${i}</a>
	            </c:if>
	         </c:forEach>
	   </c:if>
	   <!-- 如果不是最后一页,不是第一页 -->
	   <c:if test="${pageBean.pageNum!=1&& pageBean.totalPage!=1 && pageBean.pageNum!=pageBean.totalPage}">
	         <c:if test="${pageBean.pageNum!=1}">
	           <a href="${pageContext.request.contextPath}/admin/tosales.action?bandname=${bandname}&page=${pageBean.pageNum-1}&desc=${desc}">上一页</a>
	         </c:if>
	         <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
	            <c:if test="${pageBean.pageNum==i}">${i}</c:if>
	            <c:if test="${pageBean.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/admin/tosales.action?bandname=${bandname}&page=${i}&desc=${desc}">${i}</a>
	            </c:if>
	         </c:forEach>
	         <c:if test="${pageBean.pageNum!=pageBean.totalPage}">
	           <a href="${pageContext.request.contextPath}/admin/tosales.action?bandname=${bandname}&page=${pageBean.pageNum+1}&desc=${desc}">下一页</a>
	        </c:if>
	   </c:if>
	   <!-- 尾页-->
	   <a href="${pageContext.request.contextPath}/admin/tosales.action?bandname=${bandname}&page=${pageBean.totalPage}&desc=${desc}">尾页</a>
	
	</div>
</body>

</html>