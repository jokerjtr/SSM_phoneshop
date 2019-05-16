<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <link href="../css/admin.css" type="text/css" rel="stylesheet" />
 <script>
		    function newDate(){
			
			   var date=new Date();
			   year=date.getFullYear();
			   month=date.getMonth()+1;
			   day=date.getDate();
			   hourse=date.getHours();
			   mintune=date.getMinutes();
			   second=date.getSeconds();
			   var time=year+"-"+month+"-"+day+"   "+hourse+":"+mintune+":"+second;
			 document.getElementById("time").innerHTML=time;
			 setTimeout("newDate()",1000);
			}
</script>
    </head>
    <body onload="newDate()">
        <table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
            <tr height=28>
                <td background=./img/title_bg1.jpg>当前位置: </td></tr>
            <tr>
                <td bgcolor=#b1ceef height=1></td></tr>
            <tr height=20>
                <td background=../img/shadow_bg.jpg></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="90%" align=center border=0>
            <tr height=100>
                <td align=middle width=100><img height=100 src="../img/admin_p.gif" 
                                                width=90></td>
                <td width=60>&nbsp;</td>
                <td>
                    <table height=100 cellspacing=0 cellpadding=0 width="100%" border=0>

                        <tr>
                            <td>当前时间：<span id="time"></span></td></tr>
                        <tr>
                            <td style="font-weight: bold; font-size: 16px">${sessionScope.admin["admin_name"]}</td></tr>
                        <tr>
                            <td>欢迎进入金风细雨楼网站管理中心！</td></tr></table></td></tr>
            <tr>
                <td colspan=3 height=10></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="95%" align=center border=0>
            <tr height=20>
                <td></td></tr>
            <tr height=22>
                <td style="padding-left: 20px; font-weight: bold; color: #ffffff" 
                    align=middle background=../img/title_bg2.jpg>您的相关信息</td></tr>
            <tr bgcolor=#ecf4fc height=12>
                <td></td></tr>
            <tr height=20>
                <td></td></tr></table>
        <table cellspacing=0 cellpadding=2 width="95%" align=center border=0>
            <tr>
                <td align=right width=100>登陆帐号：</td>
                <td style="color: #880000">${sessionScope.admin["admin_name"]}</td></tr>
            <tr>
                <td align=right>真实姓名：</td>
                <td style="color: #880000">${sessionScope.admin["name"]}</td></tr>
           
          
            <tr>
                <td align=right>上线时间：</td>
                <td style="color: #880000"><fmt:formatDate value='${sessionScope.admin["predate"]}' pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td></tr>
            <tr>
                <td align=right>ip地址：</td>
                <td style="color: #880000">${sessionScope.admin["address"]}</td></tr>
            
            <tr>
                <td align=right>开发qq：</td>
                <td style="color: #880000">648***</td></tr>
            
        </table>
    </body>
</html>