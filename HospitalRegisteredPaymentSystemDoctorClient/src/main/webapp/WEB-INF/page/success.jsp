<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院-成功</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript">
		$(function() {
			layui.use(["element","layer"], function() {
				var element = layui.element,
				layer = layui.layer;
				layer.open({
					title: "成功",
					content: $(":hidden[name='success']").val(),
					btn: "确定",
					yes: function() {
						window.location.href="${pageContext.request.contextPath}" + $(":hidden[name='redirect']").val();
					}
				});
			});
		});
	</script>
</head>
<body>
	<input type="hidden" name="success" value="${success}" />
	<input type="hidden" name="redirect" value="${redirectpage}" />
	<div class="layui-layout layui-layout-admin">
		<%@ include file="/WEB-INF/master/head.jsp" %>
		<%@ include file="/WEB-INF/master/tail.jsp" %>
	</div>
</body>
</html>