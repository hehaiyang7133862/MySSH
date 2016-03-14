
<%
	String pathHead = request.getContextPath();
	String basePathHead = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ pathHead + "/";
%>
<%@ page language="java" pageEncoding="UTF-8"%>
<title><my:titleTag />校友综合服务管理平台</title>
<!-- EXT -->
<link href="<%=basePathHead%>UI/ext/resources/css/ext-all.css"
	type="text/css" rel="stylesheet" />
<script src="<%=basePathHead%>UI/ext/adapter/ext/ext-base.js"
	type="text/javascript"></script>
<script src="<%=basePathHead%>UI/ext/ext-all.js" type="text/javascript"></script>
<script
	src="<%=basePathHead%>UI/ext/adapter/treenodecheckui/TreeCheckNodeUI.js"
	type="text/javascript"></script>
<script src="<%=basePathHead%>UI/js/ext-my.js" type="text/javascript"></script>

<!-- 自定义 -->
<link href="<%=basePathHead%>UI/css/common.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePathHead%>UI/css/menu.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePathHead%>UI/css/com_nav.css" rel="stylesheet"
	type="text/css" />
<script src="<%=basePathHead%>UI/js/jquery.js" type="text/javascript"></script>
<script src="<%=basePathHead%>UI/js/common.js" type="text/javascript"></script>
<script src="<%=basePathHead%>UI/js/jquery.colorbox.js"
	type="text/javascript"></script>

<link href="<%=basePathHead%>UI/tableopt/css.css" rel="stylesheet"
	type="text/css" />
<script src="<%=basePathHead%>UI/tableopt/opt-all.js"
	type="text/javascript"></script>

<!-- TEMP -->
<link href="../UI/css/common.css" rel="stylesheet" type="text/css" />
<link href="../UI/css/menu.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	$(document).ready(function() {
		// 后台信息
		var tmpAlert = "<c:out value='${alert}' />";
		if (tmpAlert != "") {
			MyMsg.alert("<c:out value='${alert}' />");
		}
		//body后面添加标签---解决ext-all.js里的bug
		$("body").prepend("<span></span>");
	});
</script>