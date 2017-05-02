<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>校园拍卖网</title>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet"
			href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
			<script
				src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
			<script
				src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link href="css/sitegeneric08.css" rel="stylesheet" type="text/css" />
		<link href="css/Common.css" rel="stylesheet" type="text/css" />
		<script
			src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script
			src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script language="JavaScript" type="text/javascript"></script>
	</head>

	<body>
		<!-- head如果图片高度不合适。请修改Common.css里面的".Header .HeaderTop"的高度。和".Header"的高度-->
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		<!-- head-->

		<!--body-->
		<div align="center" class="Wrapper">
			<div class="col category">
				<ul>
					<li id="all-type">
						<b>所有分类</b>
					</li>
					<!-- <s:iterator value="#request.cateLogList" id="cateLog"> -->
					
						<li>
							<!-- <s:property value="#cateLog.catelogName" /> -->						
							学习用品&gt
						</li>
					<!-- </s:iterator> -->  
				</ul>
			</div>

		</div>
		<div class="Wrapper main-container">
			<div class="">
				<!--轮播-->
				<div id="myCarousel" class="col carousel slide main-container"
					data-ride="carousel" data-interval="3000">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="images/carousel01.jpg" alt="First slide">
						</div>
						<div class="item">
							<img src="images/carousel02.png" alt="Second slide">
						</div>
						<div class="item">
							<img src="images/carousel03.png" alt="Third slide">
						</div>
					</div>
				</div>
			</div>
			<div id="content" class="Sub dis-goods">
				<s:iterator value="#request.cateLogList" id="cateLog">
					<div class="row type-bar">
						<b><s:property value="#cateLog.catelogName" />
						</b>
						<a href=""> >>>MORE </a>
					</div>
					<div class="row display">
						<s:iterator value="#cateLog.goodsList" id="goods">
							<div class="dis-col">
								<a href="<%=path%>/goodsDetailQian.action?goodsId=<s:property value="#goods.goodsId"/>">
									<img src="<%=path%><s:property value="#goods.fujian"/>" alt="">
								</a>
								<p>
									<a
										href="<%=path%>/goodsDetailQian.action?goodsId=<s:property value="#goods.goodsId"/>"><s:property
											value="#goods.goodsName" escape="false" />
									</a>
								</p>
								<p>
									￥
									<span><s:property value="#goods.goodsDijia" />
									</span>
								</p>
							</div>
						</s:iterator>
					</div>
				</s:iterator>
			</div>
		</div>

		<!--body-->

		<!--foot -->
		<div>
			<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
		</div>

		<!--foot -->
	</body>
</html>
