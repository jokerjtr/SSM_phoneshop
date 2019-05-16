<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   function check(){
	   var name=document.getElementById("band_name").value;
	   
	   if(name==" "||name.length==0) {alert("品牌名不能为空");return false;}
	    return true;
	   
   }

</script>
	</head>
	<body>
	         <div class="div_head">
            <span>
                <span style="float:left">当前位置是：商品管理-》品牌上架</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="${pageContext.request.contextPath}/admin/toindex.action">【反回】</a>
                </span>
            </span>
        </div>
        <div></div>
		<div style="font-size: 13px;margin: 10px 5px">
		     <form action="${pageContext.request.contextPath}/admin/toupdateband.action" method="post" onsubmit="return check()">
			      <table border="1" width="100%" class="table_a">
				      <tr>
                    <td>品牌名称</td>
                    <td><input type="text" name="band_name" value="" id="band_name"/></td>
                    </tr>
					<tr>
                    <td>品牌的英文名</td>
                    <td><input type="text" name="en_name" value="" /></td>
                    </tr>

					 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="提交">
                    </td>
                </tr>  
				  
				  </table>
			 
			 </form>
		
		</div>
	</body>

</html>