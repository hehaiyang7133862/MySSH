<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<script src="<%=basePath%>UI/js/calendar.js" type="text/javascript"></script>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<%-- <script src="<%=basePath%>UI/js/jquery-1.12.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var date = new Date();
				$("#tbDate").val(
						date.getFullYear() + "-" + date.getMonth() + "-"
								+ date.getDay());
			});
</script>
 --%>
</head>
<body>
	<form action="add.action" method="post">
		<table width="500" align="center">
			<caption>添加</caption>
			<tr height="26px">
				<td width="150px" align="right">发送日期</td>
				<td width="350px"><input name="tbDate" type="text"
					style="width: 180px;" value="${msg.date }"
					onClick="new Calendar('1900',  '<%=Calendar.getInstance().get(1)%>', 0).show(this)"
					class="ele_date" /> <input type="hidden" name="param" value="1" />
				</td>
			</tr>
			<tr height="26px">
				<td align="right">收信人</td>
				<td><input type="text" name="tbRecName" value="${msg.recName }" />
				</td>
			</tr>
			<tr height="26px">
				<td align="right">手机号码</td>
				<td><input type="text" name="tbTelNum" value="${msg.telNum }" />
				</td>
			</tr>
			<tr height="26px">
				<td align="right">届数</td>
				<td><input type="text" name="tbYear" value="${msg.year }" /></td>
			</tr>
			<tr height="26px">
				<td align="right">专业名称</td>
				<td><input type="text" name="tbSpecialty"
					value="${msg.specialty }" /></td>
			</tr>
			<tr height="26px">
				<td align="right">发送内容</td>
				<td><input type="text" name="tbContext" value="${msg.context }" />
				</td>
			</tr>
			<tr height="26px">
				<td colspan="2" align="center" width="500"><input type="submit"
					value="Save" /> <input type="button" value="Back"
					onclick="window.history.back(-1)" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
