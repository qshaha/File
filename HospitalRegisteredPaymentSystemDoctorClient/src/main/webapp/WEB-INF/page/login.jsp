<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院-登录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<%@ include file="/WEB-INF/master/head.jsp" %>
		<div class="layui-body layui-tab-content site-demo site-demo-body">
			<div class="layui-tab-item layui-show">
				<div class="layui-main">
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
						<legend>账号登录</legend>
					</fieldset>
					<form class="layui-form" action="" method="post">
						<div class="layui-form-item">
							<label class="layui-form-label">账号：</label>
							<div class="layui-input-block">
								<input class="layui-input" type="text" name="account" required="required" lay-verify="required" placeholder="请输入账号" autocomplete="off" />
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">密码：</label>
							<div class="layui-input-block">
								<input class="layui-input" type="password" name="password" required="required" lay-verify="required" placeholder="请输入密码" autocomplete="off" />
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<input type="radio" name="leve" value="2" title="医生" checked="checked" lay-filter="leve" />
								<input type="radio" name="leve" value="1" title="管理员" lay-filter="leve" />
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="login">立即提交</button>
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