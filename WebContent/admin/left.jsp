<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <link href="../css/admin.css" type="text/css" rel="stylesheet" />
        <script language=javascript>
            function expand(el)
            {
                childobj = document.getElementById("child" + el);

                if (childobj.style.display == 'none')
                {
                    childobj.style.display = 'block';
                }
                else
                {
                    childobj.style.display = 'none';
                }
                return;
            }
            function quit(){
         	   
         	   var s=confirm("确认推出吗");
         	 return s;
         	   
            }
        </script>
    </head>
    <body>
        <table height="100%" cellspacing=0 cellpadding=0 width=170 
               background=../img/menu_bg.jpg border=0>
               <tr>
                <td valign=top align=middle>
                    <table cellspacing=0 cellpadding=0 width="100%" border=0>

                        <tr>
                            <td height=10></td></tr></table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>

                        <tr height=22>
                            <td style="padding-left: 30px" background=../img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(1) 
                                    href="javascript:void(0);">产品中心</a></td></tr>
                        <tr height=4>
                            <td></td></tr></table>
                    <table id=child1 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="../img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild 
                                   href="${pageContext.request.contextPath}/admin/toshowshop.action?pageNum=1&bandname=*" 
                                   target="_top">产品展示</a></td></tr>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="../img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild 
                                   href="${pageContext.request.contextPath}/admin/tobandfileup.action" 
                                   target=main>品牌上架</a></td></tr>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="../img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild 
                                   href="${pageContext.request.contextPath}/admin/toshopupload.action" 
                                   target=main>产品上架</a></td></tr>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="../img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild 
                                   href="#" 
                                   target=main>产品修改</a></td></tr>
                        <tr height=4>
                            <td colspan=2></td></tr></table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=../img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(2) 
                                    href="javascript:void(0);">销售管理</a></td></tr>
                        <tr height=4>
                            <td></td></tr></table>
                    <table id=child2 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="../img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild 
                                   href="${pageContext.request.contextPath}/admin/tosales.action?bandname=*&page=1&desc=0" 
                                   target=main>销售统计</a></td></tr>
                       
                        <tr height=4>
                            <td colspan=2></td></tr></table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
					    <tr height=22>
						    <td style="padding-left: 30px" background=../img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(3) 
                                    href="javascript:void(0);">订单管理</a></td></tr>
						  <tr height=4>
                            <td></td></tr>
					</table>
					<table id=child3 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>
						   <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="../img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild 
                                   href="${pageContext.request.contextPath}/admin/toOrdersOperator.action?bandname=*&page=1" 
                                   target=main>订单处理</a></td></tr>
						   
						   </table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>

                        <tr height=22>
                            <td style="padding-left: 30px" background=../img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(0) 
                                    href="javascript:void(0);">个人管理</a></td></tr>
                        <tr height=4>
                            <td></td></tr></table>
                    <table id=child0 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>

                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="../img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild 
                                   href="${pageContext.request.contextPath}/admin/toupdatepsd.action" 
                                   target="_top">修改口令</a></td></tr>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="../img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild 
                                   onclick="return quit()" 
                                   href="${pageContext.request.contextPath}/admin/exitlogin.action" target="_top" 
                                   >退出系统</a></td></tr></table></td>
                <td width=1 bgcolor=#d1e6f7>
				</td>
            </tr>
        </table>
    </body>
</html>
