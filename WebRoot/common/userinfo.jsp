<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userXinxi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
                           <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
								<tr>
									<td width="30%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
										用户名：
									</td>
									<td width="70%" bgcolor="#FFFFFF">
										&nbsp;
${requestScope.user.userName }
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
										密 码：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										${requestScope.user.userPw }
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
										真实姓名：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										${requestScope.user.userRealname }
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
										住址：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										${requestScope.user.userAddress }
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
										性别：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
									${requestScope.user.userSex }
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
										联系方式：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										${requestScope.user.userTel }
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
										E-mail：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										${requestScope.user.userEmail }
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
										QQ：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
							<a href='http://wpa.qq.com/msgrd?V=1&uin=${sessionScope.user.userQq }&Site=QQ咨询&Menu=yes' target='_blank'><img src='http://wpa.qq.com/pa?p=1:${sessionScope.user.userQq }:4' border='0' alt='QQ' />QQ</a>
									</td>
								</tr>
							</table>
  </body>
</html>
