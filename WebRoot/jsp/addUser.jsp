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

<script src="<%=basePath%>UI/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#id_btnSave").click(function() {
			init();
			
			var result_date = true;
			var result_recName = true;
			var result_telNum = true;
			var result_year = true;
			var result_specialty = true;
			var result_context = true;
			
			var date = $("#id_date_input").val();
			var recName = $("#id_recName_input").val();
			var telNum = $("#id_telNum_input").val();
			var year = $("#id_year_input").val();
			var specialty = $("#id_specialty_input").val();
			var context = $("#id_context_input").val();
			
			if (date == "") {
				result_date = false;
				$("#id_date_tip").css("display","inline");}
			if (recName == "") {
				result_recName = false;
				$("#id_recName_tip").css("display","inline");}
			if (telNum == "") {
				result_telNum = false;
				$("#id_telNum_tip").css("display","inline");}
			if (year == "") {
				result_year = false;
				$("#id_year_tip").css("display","inline");}
			if (specialty == "") {
				result_specialty = false;
				$("#id_specialty_tip").css("display","inline");}
			if (context == "") {
				result_context = false;
				$("#id_context_tip").css("display","inline");}
				
			if (result_date && result_recName&& result_telNum&& result_specialty && result_year&& result_context) {
				$("id_form").submit();} 
			else {
				return false;}
		});
			
		init();
	});

	function init() {
		$("#id_date_tip").css("display", "none");
		$("#id_recName_tip").css("display", "none");
		$("#id_telNum_tip").css("display", "none");
		$("#id_year_tip").css("display", "none");
		$("#id_specialty_tip").css("display", "none");
		$("#id_context_tip").css("display", "none");
	}
	
	function doUser(){
    	var url ="ajax!doUser.action";
		var id1=document.getElementById("userCardId").value;
		if(id1==""){
			alert("请输入帐号!");
			return;}
		$("#showId").html("");
		var pars ={id1:id1};
		jQuery.get(url,pars,function(xml){
			document.getElementById("showId").innerHTML=xml;
		},
		"text"
	);
}
</script>
</head>
<body>
	<form id="id_form" action="add.action" method="post">
		<table width="500" align="center">
			<tr>
				<td><input type="hidden" name="param" value="1" />
				</td>
			</tr>
			<tr height="35px">
				<td width="150px" align="right">发送日期&nbsp;&nbsp;</td>
				<td width="150px"><input id="id_date_input" name="tbDate"
					type="text" value="${msg.date }" readonly="readonly"
					onClick="new Calendar('1900',  '<%=Calendar.getInstance().get(1)%>', 0).show(this)" />
				</td>
				<td width="300px" align="left"><div id="id_date_tip"
						style="width: 150px;font-size: 16px;color:red;display:inline">发送日期不能为空</div>
				</td>
			</tr>
			<tr height="35px">
				<td width="150px" align="right">收信人&nbsp;&nbsp;</td>
				<td><input id="id_recName_input" type="text" name="tbRecName"
					value="${msg.recName }" />
				</td>
				<td align="left"><div id="id_recName_tip"
						style="color:red;display:inline">收信人不能为空</div>
				</td>
			</tr>
			<tr height="35px">
				<td width="150px" align="right">手机号码&nbsp;&nbsp;</td>
				<td><input id="id_telNum_input" name="tbTelNum" type="text"
					value="${msg.telNum }" />
				</td>
				<td align="left"><div id="id_telNum_tip"
						style="color:red;display:inline">手机号码不能为空</div>
				</td>
			</tr>
			<tr height="35px">
				<td width="150px" align="right">届数&nbsp;&nbsp;</td>
				<td><input id="id_year_input" name="tbYear" type="text"
					value="${msg.year }" />
				</td>
				<td align="left"><div id="id_year_tip"
						style="color:red;display:inline">届数不能为空</div>
				</td>
			</tr>
			<tr height="35px">
				<td width="150px" align="right">专业名称&nbsp;&nbsp;</td>
				<td><input id="id_specialty_input" name="tbSpecialty"
					type="text" value="${msg.specialty }" />
				</td>
				<td align="left"><div id="id_specialty_tip"
						style="color:red;display:inline">专业名称不能为空</div>
				</td>
			</tr>
			<tr height="35px">
				<td width="150px" align="right">发送内容&nbsp;&nbsp;</td>
				<td><input id="id_context_input" name="tbContext"
					style="height:100px" type="text" value="${msg.context }" />
				</td>
				<td align="left" valign="bottom"><div id="id_context_tip"
						style="color:red;display:inline">内容不能为空</div>
				</td>
			</tr>
			<tr height="35px">
				<td colspan="2" align="center" width="500"><input
					id="id_btnSave" type="submit" value="保存" /> <input id="id_btnBack"
					type="button" value="返回" onClick="parent.MyFormWin.close();" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
