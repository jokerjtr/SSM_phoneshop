<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
	   <title>商品展示</title>
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
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script> -->
<script>
 $(document).ready(function(){
	 $("#che").click(function(){
      var bandname=$("#s_product_mark option:selected").val();
      
      var url="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=1&bandname="+bandname;

    
       window.location.href=url; 
	 });
	 
 });
</script>
	</head>
	<body>
	    <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：商品管理-》商品列表</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="${pageContext.request.contextPath}/admin/toindex.action">【反回】</a>
                </span>
            </span>
        </div> 
		<div></div>
		 <div class="div_search">
            <span>

                    品牌<select name="s_product_mark" style="width: 100px;" id="s_product_mark">
                      <!-- 选择全部商品时 -->
                        <c:if test="${bandname=='*'}">
                        <option  value="*" selected="selected">请选择</option>
                        <c:forEach items="${bandlist}" var="item">
                           <option value="${item.band_name}">${item.band_name}</option>
             
                        </c:forEach>  
                        </c:if>
                         <!-- 选择特定品牌是 bandname为当前选择的品牌，bandlist为总的品牌类表 -->
                        <c:if test="${bandname!='*'}">
                             <option  value="*">请选择</option>
                             <c:forEach items="${bandlist}" var="item">
                                  <c:if test="${bandname==item.band_name}">
                                       <option value="${item.band_name}" selected="selected">${item.band_name}</option>
                                  </c:if>
                                  <c:if test="${bandname!=item.band_name}">
                                       <option value="${item.band_name}">${item.band_name}</option>
                                  </c:if>
                             </c:forEach>
                        </c:if>
                         
                 </select>
                    <input value="查询" type="submit" id="che"/>
     
            </span>
        </div>
		 <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td>序号</td>
                        <td>商品名称</td>
                        <td>库存</td>
                        <td>价格</td>
                        <td>图片</td>
                        <td>缩略图</td>
                        <td>品牌</td>
                    
                        <td align="center">操作</td>
                    </tr>
                    <c:forEach items="${goodsPage.shop}" var="item" varStatus="i">
                        <tr id="product${i.count}">
                             <td>${i.count}</td>
                             <td><a href="#">${item.goods_name}</a></td>
                             <td>${item.goods_stock}</td>
                             <td>${item.goods_price}</td>
                             <td><img src="../${item.goods_image}" height="60" width="60"></td>
                             <td><img src="../${item.goods_image}" height="40" width="40"></td>
                             <td>${band_name[i.count-1]}</td>
                               
                             <td><a href="${pageContext.request.contextPath}/admin/undercarriage.action?pageNum=${goodsPage.pageNum}&bandname=${bandname}&id=${item.goods_id}" style="text-decoration:none">下架</a></td>
                         
                        </tr>
                    
                    </c:forEach>
                 
                    
                </tbody>
            </table>
        </div>
        
        <div style="width:78%;height:50px;text-align:center;">
	   <a href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=1&bandname=${bandname}">首页</a>
	      <!-- 当前页是第一页也是最后一页 -->
	      <c:if test="${goodsPage.pageNum==1 && goodsPage.pageNum==goodsPage.totalPage}">
	          <c:forEach begin="${goodsPage.start}" end="${goodsPage.end}"  var="i">
	               <c:if test="${goodsPage.pageNum==i}">${i}</c:if>
	         </c:forEach>
	      </c:if>
	      <!--当前页是第一页但不是最后一页  -->
	     <%--  <c:if test="${goodsPage.pageNum==1 && goodsPage.pageNum!=goodsPage.totalPage}">
	          <c:forEach begin="${goodsPage.start}" end="${goodsPage.end}"  var="i">
	            <c:if test="${goodsPage.pageNum==i}">${i}</c:if>
	            <c:if test="${goodsPage.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=${i}&bandname=${bandname}">${i}</a>
	            </c:if>
	         </c:forEach>
	         <c:if test="${goodsPage.pageNum!=goodsPage.totalPage}"><a href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=${goodsPage.pageNum+1}&bandname=${bandname}">下一页</a></c:if>
	      </c:if> --%>
	      <c:if test="${goodsPage.pageNum==1 && goodsPage.pageNum!=goodsPage.totalPage}">
	             <c:forEach begin="${goodsPage.start}" end="${goodsPage.end}" var="i">
	                 <c:if test="${goodsPage.pageNum==i+1}">${i+1}</c:if>
	                 <c:if test="${goodsPage.pageNum!=i+1}"><a href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=${i+1}&bandname=${bandname}">${i+1}</a>
	                 </c:if>
	             
	             </c:forEach>
	       <c:if test="${goodsPage.pageNum!=goodsPage.totalPage}"><a href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=${goodsPage.pageNum+1}&bandname=${bandname}">下一页</a></c:if>
	             
	      </c:if>
	      <!-- 不是第一页，也不是最后一页 -->
	          <c:if test="${goodsPage.pageNum!=1 && goodsPage.pageNum!=goodsPage.totalPage}">
	           <a href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=${goodsPage.pageNum-1}&bandname=${bandname}">上一页</a>
	          <c:forEach begin="${goodsPage.start}" end="${goodsPage.end}"  var="i">
	            <c:if test="${goodsPage.pageNum==i}">${i}</c:if>
	            <c:if test="${goodsPage.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=${i}&bandname=${bandname}">${i}</a>
	            </c:if>
	         </c:forEach>
	        <a href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=${goodsPage.pageNum+1}&bandname=${bandname}">下一页</a>
	      </c:if>
	      <!-- 如果是最后一页 -->
	       <c:if test="${goodsPage.pageNum!=1 && goodsPage.pageNum==goodsPage.totalPage}">
	           <a href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=${goodsPage.pageNum-1}&bandname=${bandname}">上一页</a>
	          <c:forEach begin="${goodsPage.start}" end="${goodsPage.end}"  var="i">
	            <c:if test="${goodsPage.pageNum==i}">${i}</c:if>
	            <c:if test="${goodsPage.pageNum!=i}">
	              <a href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=${i}&bandname=${bandname}">${i}</a>
	            </c:if>
	         </c:forEach>
	       
	      </c:if>

	     <a href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=${goodsPage.totalPage}&bandname=${bandname}">尾页</a>
	 </div>

</html>