<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<style type="text/css">
.sortable {
	width: 823px;
	border: 1px solid #ccc;
	border-bottom: none
}

.sortable th {
	padding: 4px 6px 6px;
	background: #444;
	color: #fff;
	text-align: left;
	color: #ccc
}

.sortable td {
	padding: 2px 4px 4px;
	background: #fff;
	border-bottom: 1px solid #ccc
}

.sortable .head {
	background: #444 url(images/sort.gif) 6px center no-repeat;
	cursor: pointer;
	padding-left: 18px
}

.sortable .desc {
	background: #222 url(images/desc.gif) 6px center no-repeat;
	cursor: pointer;
	padding-left: 18px
}

.sortable .asc {
	background: #222 url(images/asc.gif) 6px center no-repeat;
	cursor: pointer;
	padding-left: 18px
}

.sortable .head:hover,.sortable .desc:hover,.sortable .asc:hover {
	color: #fff
}

.sortable .even td {
	background: #f2f2f2
}

.sortable .odd td {
	background: #fff
}
</style>

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

<script src="<%=basePath%>UI/js/calendar.js" type="text/javascript"></script>

<script type="text/javascript">
	function formReset() {
		document.getElementById("frmfindId").reset();
	}
</script>

<script language="JavaScript">
	
</script>

<script type="text/javascript">
	function load() {
		var tagOrder = document.getElementById('txtOrder');
		var thDate = document.getElementById('thDate');
		if (tagOrder.value == "ASC") {
			thDate.className = "asc";
		} else {
			thDate.className = "desc";
		}
	}
</script>

<script type="text/javascript">
	function order() {
		var tagOrder = document.getElementById('txtOrder');
		var thDate = document.getElementById('thDate');
		if (tagOrder.value == "ASC") {
			tagOrder.value = "DESC";
			thDate.className = "desc";
		} else {
			tagOrder.value = "ASC";
			thDate.className = "asc";
		}

		document.getElementById('frmfindId').submit();
	}
</script>

<script src="<%=basePath%>UI/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnQuery').click(function() {
			$("#tbStartTime").css("background-color", "none");
			$("tbEndTime").css("background-color", "none");
			
			var msg = "";
			var startTime = $("#tbStartTime").val();
			var endTime = $("#tbEndTime").val();
			
			if ((startTime == "" && endTime != "")|| (startTime != "" && endTime == "")) {
				msg += "发送日期必须成对出现!";
				$("#tbStartTime").css("background-color", "red");
				$("tbEndTime").css("background-color", "red");
				Ext.Msg.alert("错误信息", msg);}
			
			if (msg != "") {
				return false;}
			else {
				return true;}
		});
	});

	function refresh() {
		$("#frmfindId").submit();
	}
</script>

<title>user list page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body onload="load()">
	<form name="formQuery" action="query.action" method="get"
		id="frmfindId">
		<table align="center">
			<tr>
				<td><input type="hidden" name="tbOrder" id="txtOrder"
					value="${order }" /> <input type="hidden" name="page"
					value="${pageBean.currentPage}" />
				</td>
				<td align="right">收信人</td>
				<td align="left"><input name="txtRecipient" type="text"
					style="width: 180px;" value="${recipient }" />
				</td>
				<td align="right" style="h1">发送日期</td>
				<td align="left"><input id="tbStartTime" name="txtDateStart"
					type="text" style="width: 180px;" value="${dateStart }"
					onClick="new Calendar().show(this);" readonly="readonly" />
				</td>
				<td align="right">至</td>
				<td align="left"><input id="tbEndTime" name="txtDateEnd"
					type="text" style="width: 180px;" value="${dateEnd }"
					onClick="new Calendar().show(this);" readonly="readonly" />
				</td>
				<td align="right">发送内容</td>
				<td align="left"><input name="txtContext" type="text"
					style="width: 180px;" value="${Context }" />
				</td>
				<td><input id="btnQuery" type="submit" value="查询"
					style="width: 100px;height: 30px;font-size: 16px" />
				</td>
				<td><input id="btnReset" type="button" value="重置"
					style="width: 100px;height: 30px;font-size: 16px"
					onclick="formReset()" /></td>
				<td><input type="button" value="添加"
					style="width: 100px;height: 30px;font-size: 16px"
					onclick='MyFormWin.showMyWin("添加短信记录","add.action?param=0",600,500)' />
				</td>
			</tr>
		</table>
	</form>

	<table id="sorter" class="sortable">
		<tr>
			<th width="50">序号</th>
			<th id="thDate" width="100" class='asc' onclick="order()">发送日期</th>
			<th width="100">收信人</th>
			<th width="100">手机号码</th>
			<th width="300">发送内容</th>
			<th width="100">操作</th>
		</tr>

		<c:forEach var="msg" items="${mList }">
			<tr>
				<td width="30">${msg.id}</td>
				<td width="100"><fmt:formatDate type="date" value="${msg.date}"
						dateStyle="default" /></td>
				<td width="100">${msg.recName}</td>
				<td width="100">${msg.telNum}</td>
				<td width="100">${msg.context}</td>
				<td><a href="javascript:void(0)"
					onclick='MyFormWin.showMyWin("编辑","edit.action?param=0&id=${msg.id}",600,500)'>编辑</a>&nbsp;<a
					href="delete.action?id=${msg.id}&page=${pageBean.currentPage}"
					onclick="return confirm('确定要删除吗？')">删除</a></td>
			</tr>
		</c:forEach>
	</table>
	<table>
		<tr>
			<td colspan="6" align="center" bgcolor="#5BA8DE">共${pageBean.allRow
				}条记录 共${pageBean.totalPage }页 当前第${pageBean.currentPage }页<br>
				<c:choose>
					<c:when test="${pageBean.currentPage ==1}"> 第一页 上一页 </c:when>
					<c:otherwise>
						<a href="query.action?page=1">第一页</a>
						<a href="query.action?page=${pageBean.currentPage -1}">上一页</a>
					</c:otherwise>
				</c:choose> <c:choose>
					<c:when test="${pageBean.currentPage ==pageBean.totalPage}">
					下一页 最后一页
					</c:when>
					<c:otherwise>
						<a href="query.action?page=${pageBean.currentPage +1}">下一页</a>
						<a href="query.action?page=${pageBean.totalPage}">最后一页</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
</body>
</html>
