<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">
.Header {
	height: 80px;
    margin-top: 80px;
    margin-bottom: 10px;
	CLEAR: both;
	DISPLAY: block;
	FLOAT: left;
	POSITION: relative;
}
.Header .HeaderTop {
	width: 50%;
    font-size: 36px;
    font-family: 楷体, serif;
}
.titleShadow{
    color: rgb(204, 204, 204);
}
.search{
    width: 45%;
}
.search input {
    line-height: 34px;
    white-space: nowrap;
    height: 35px;
    width: 70%;
    padding: 0 3% 0 3%;
    background-color: #fff;
    border: 2px solid #c40000;
    border-radius: 2px;
    font-family: "Microsoft YaHei", serif;
    font-weight: 400;
    font-size: 14px;
}
.search #searchSubmit {
    line-height: 34px;
    height: 38px;
    width: 20%;
    padding: 0 3% 0 3%;
    background-color: #c40000;
    border: 2px solid #c40000;
    border-radius: 2px;
    color: white;
    font-family: "Microsoft YaHei", serif;
    font-weight: 400;
    font-size: 16px;
}
</style>
		<script language="JavaScript" src="<%=path %>/js/public.js"
			type="text/javascript"></script>
		<script type="text/javascript">
        function liuyanAll()
        {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
			     var url="<%=path %>/liuyanAll.action";
			     window.open(url,"_blank");
            </s:else>
        }
        function userzhongxin()
        {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
			     window.location.href="<%=path %>/qiantai/userinfo/userzhongxin.jsp";
            </s:else>
        }
        
        
        function myXinxi()
        {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
                var url="<%=path %>/qiantai/userinfo/userXinxi.jsp";
                var n="";
                var w="480px";
                var h="500px";
                var s="resizable:no;help:no;status:no;scroll:yes";
			    openWin(url,n,w,h,s);
            </s:else>
        }
    </script>
	</head>

	<body>
		<div class="Wrapper">
			<div class="Header">
				<div class="col HeaderTop">
					<b>校园拍卖网 <span class="titleShadow">Campus Auction</span> </b>
				</div>
				<div class="col search">
					<form action="<%=path %>/goodSearch.action" method="post">
						<input type="text" name="goodsName" size="9" placeholder="请输入商品名称">
						<input id="searchSubmit" type="submit" value="搜索"/>
					</form>
					<p>
						T恤 牛仔裙 女装 旧书
					</p>
				</div>
				<div id="Menu" class="Menu">
					<div class="secMenu">
						<span id="secMenu0" class="row secMenu-center"> <a
							href="<%=path %>/qiantai/default.jsp">首页</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							<a href="#" onclick="liuyanAll()">留言板</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							<a href="#" onclick="myXinxi()">我的信息</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							<a href="#" onclick="userzhongxin()">会员中心</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							<a target="_blank" href="<%=path %>/login.jsp">进入后台</a> </span>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
