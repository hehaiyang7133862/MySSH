<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<!-- EXT -->
<link href="<%=basePath%>UI/ext/resources/css/ext-all.css"
	type="text/css" rel="stylesheet" />
<script src="<%=basePath%>UI/ext/adapter/ext/ext-base.js"
	type="text/javascript"></script>
<script src="<%=basePath%>UI/ext/ext-all.js" type="text/javascript"></script>
<script
	src="<%=basePath%>UI/ext/adapter/treenodecheckui/TreeCheckNodeUI.js"
	type="text/javascript"></script>
<script src="<%=basePath%>UI/js/ext-my.js" type="text/javascript"></script>
<script src="<%=basePath%>UI/js/jquery.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
	$(document).ready(function() {
		if (typeof (window.parent.myRefresh) != "undefined") {
			window.parent.myRefresh();
			return;
		} else if (typeof (window.parent.refresh) != "undefined") {
			window.parent.refresh();
			return;
		} else {
			window.parent.location.href = basePath + "login.action";
			window.parent.MyFormWin.close();
		}
	});
</script>
<title>My JSP 'closing.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body style="text-align: center">
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<span style="font-size:14px;">请稍候...</span>
</body>
</html>
