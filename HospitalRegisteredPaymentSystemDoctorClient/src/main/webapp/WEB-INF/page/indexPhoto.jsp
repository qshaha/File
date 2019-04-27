<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/indexPhoto.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<%@ include file="/WEB-INF/master/head.jsp" %>
		<div class="layui-body layui-tab-content site-demo site-demo-body">
				<div class="layui-tab-item layui-show">
					<div class="layui-main">
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
							<legend>效果预览</legend>
						</fieldset>
						<div id="div1" class="layui-row" style="height: 298px; background-image: url('${pageContext.request.contextPath}/image/20181225164820_23840.jpg'); background-size: 100% 298px; background-repeat: no-repeat; cursor: pointer;">
							<button class="layui-btn-sm layui-bg-black" style="border: none; width: 33px; height: 49px; margin-top: 124.5px; display: none; cursor: pointer;">
								<i class="layui-icon layui-icon-left"></i>
							</button>
							<button class="layui-btn-sm layui-bg-black" style="border: none; width: 33px; height: 49px; margin-top: 124.5px; float: right; display: none; cursor: pointer;">
								<i class="layui-icon layui-icon-right"></i>
							</button>
						</div>
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
							<legend>选择图片</legend>
						</fieldset>
					</div>
				</div>
		</div>
		<%@ include file="/WEB-INF/master/tail.jsp" %>
	</div>
</body>
</html>