<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
	   <title>修改密码</title>
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
<script>
  function back(){
	  
	  window.history.back();
	  
  }
  function checkepsd(){
	  var newpsd=document.getElementById("newpsd").value;
	  var repsd=document.getElementById("repsd").value;
	  if(newpsd.length<5||newpsd.length>20){
		  document.getElementById("cs").innerHTML="长度不能少于5位,小于20";
		  
		  return false;
	  }
	  if(newpsd!=repsd){
		  document.getElementById("rs").innerHTML="两次密码不一致";
		  return false;}
	       return true;  
        
  }
  function onblurs(){
	  document.getElementById("cs").innerHTML="";
  }
  function onblurss()
  {
	  document.getElementById("rs").innerHTML="";
  }
</script>
</head>
	<body>
	    <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：个人管理-》口令修改</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;"  href="javascript:back()">【反回】</a>
                </span>
            </span>
        </div> 
		<div></div>
		 
		
            <div style="font-size: 13px;margin: 10px 5px">
		     <form action="${pageContext.request.contextPath}/admin/repsd.action" method="post" onsubmit="return checkepsd()">
			      <table border="1" width="100%" class="table_a">
				       <tr><td>原始密码</td><td><input type="password" name="psd"></td></tr>
					   <tr><td>新密码</td><td><input type="password" name="newpsd" id="newpsd" onblur="return checkepsd()" onfocus="onblurs()"><span style="color:red" id="cs"></span></td></tr>
					   <tr><td>确认新密码</td><td><input type="password" name="repsd" id="repsd" onblur="return checkepsd()" onfocus="onblurss()"><span style="color:red" id="rs" onblur="return checkepsd()"></span></td></tr>
					   <tr><td  colspan="2"><input type="submit" value="确认"/></td></tr>
				  </table>
			 
			 </form>
		
		</div>
      
	</body>

</html>