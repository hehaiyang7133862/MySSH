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
<script type="text/javascript">
	function formReset() {
		document.getElementById("frmfindId").reset();
	}
</script>
<title>user list page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<form action="query.action" method="post" id="frmfindId">
		<table align="center">
			<tr>
				<td align="right">收信人</td>
				<td align="left"><input name="txtRecipient" type="text"
					style="width: 180px;" value="${recipient }" /></td>
				<td align="right">发送日期</td>
				<td align="left"><input name="txtDateStart" type="text"
					style="width: 180px;" value="${dateStart }"
					onClick="new Calendar('1900',  '<%=Calendar.getInstance().get(1)%>', 0).show(this)"
					class="ele_date" /></td>
				<td align="right">至</td>
				<td align="left"><input name="txtDateEnd" type="text"
					style="width: 180px;" value="${dateEnd }"
					onClick=" new Calendar('1900',  '<%=Calendar.getInstance().get(1)%>', 0).show(this)"
					class="ele_date" /></td>
				<td align="right">发送内容</td>
				<td align="left"><input name="txtContext" type="text"
					style="width: 180px;" value="${Context }" /></td>
				<td><input type="submit" value="查询"
					style="width: 100px;height: 30px;font-size: 16px" /></td>
				<td><input type="button" value="重置" onclick="formReset()" /></td>
			</tr>
		</table>
	</form>

	<table align="center" border="1" cellpadding="0" cellspacing="0"
		bordercolor="#3366cc">
		<tr align="center" bgcolor="#3399cc" height="26px">
			<td width="30">序号</td>
			<td width="100">发送日期</td>
			<td width="100">收信人</td>
			<td width="100">手机号码</td>
			<td width="300">发送内容</td>
			<td width="100">操作</td>
		</tr>

		<c:forEach var="msg" items="${mList }">
			<tr align="center" height="24px">
				<td width="30">${msg.id}</td>
				<td width="100">${msg.date}</td>
				<td width="100">${msg.recName}</td>
				<td width="100">${msg.telNum}</td>
				<td width="100">${msg.context}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
