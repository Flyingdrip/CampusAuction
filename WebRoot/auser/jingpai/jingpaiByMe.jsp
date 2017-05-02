<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="6" background="<%=path %>/images/tbg.gif">&nbsp;我的竞拍&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="23%">时间</td>
					<td width="16%">竞拍价格</td>
					<td width="16%">竞拍商品</td>
					<td width="23%">竞拍状态</td>
		        </tr>	
				<s:iterator value="#request.jingpaiList" id="jingpai">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td  bgcolor="#FFFFFF" align="center">
						<s:property value="#jingpai.jingpaiShijian"/>
					</td>
					<td  bgcolor="#FFFFFF" align="center">
						<s:property value="#jingpai.jingpaiJiage"/>
					</td>
					<td  bgcolor="#FFFFFF" align="center">
					    <s:property value="#jingpai.jingpaiGoodsName"/>
					</td>
					<td  bgcolor="#FFFFFF" align="center">
					    
					      <s:if test="#jingpai.del=='no'">
                  您最高价！
                      </s:if><s:else>
                      <a href="<%=path %>/goodsDetailQian.action?goodsId=<s:property value="#jingpai.del" />" target="_blank">前往拍卖</a>
                      
                      
                      </s:else>
					</td>
				
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
