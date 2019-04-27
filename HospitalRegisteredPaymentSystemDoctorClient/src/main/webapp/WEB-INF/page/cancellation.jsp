<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院-注销</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/cancellation.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<%@ include file="/WEB-INF/master/head.jsp" %>
		<div class="layui-body layui-tab-content site-demo site-demo-body">
				<div class="layui-tab-item layui-show">
					<div class="layui-main">
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
							<legend>账号注销</legend>
						</fieldset>
						<form class="layui-form" action="" method="post">
							<div class="layui-form-item">
								<label class="layui-form-label">账号：</label>
								<div class="layui-input-block">
									<input class="layui-input" type="text" name="account" required="required" lay-verify="required" placeholder="请输入需要注销医生的账号" autocomplete="off" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label" style="font-size: 13px;">管理员密码：</label>
								<div class="layui-input-block">
									<input class="layui-input" type="password" name="adminPassword" required="required" lay-verify="required" placeholder="请输入管理员密码" autocomplete="off" />
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit lay-filter="cancellation">立即提交</button>
									<button type="reset" class="layui-btn layui-btn-primary">重置</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		<%@ include file="/WEB-INF/master/tail.jsp" %>
	</div>
</body>
</html>