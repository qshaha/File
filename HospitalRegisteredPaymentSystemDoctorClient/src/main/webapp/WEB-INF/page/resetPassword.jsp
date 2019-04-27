<%@page import="com.bilibilimao.po.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院-修改密码</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/resetPassword.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<%@ include file="/WEB-INF/master/head.jsp" %>
		<div class="layui-body layui-tab-content site-demo site-demo-body">
			<div class="layui-tab-item layui-show">
				<div class="layui-main">
					<div class="layui-tab">
						<ul class="layui-tab-title">
							<%
								if(request.getAttribute("user") instanceof Doctor) {
							%>
								<li class="layui-this">修改密码</li>
							<% 
								}
								else {
							%>
								<li class="layui-this">修改密码</li>
								<li>重置密码</li>
							<%
								}
							%>
						</ul>
						<div class="layui-tab-content">
							<%
								if(request.getAttribute("user") instanceof Doctor) {
							%>
							<div class="layui-tab-item layui-show">
								<form class="layui-form" action="" method="post">
									<div class="layui-form-item">
										<label class="layui-form-label">旧密码：</label>
										<div class="layui-input-block">
											<input class="layui-input" type="text" name="oldPassword" placeholder="请输入旧密码" autocomplete="off" required="required" lay-verify="required" />
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">新密码：</label>
										<div class="layui-input-block">
											<input class="layui-input" type="password" name="password" placeholder="请输入新密码" autocomplete="off" required="required" lay-verify="required|pass" />
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">再次输入密码：</label>
										<div class="layui-input-block">
											<input class="layui-input" type="password" name="rePassword" placeholder="请再次输入密码" autocomplete="off" required="required" lay-verify="required|rePassword" />
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-input-block">
											<button class="layui-btn" lay-submit lay-filter="doctorReset">立即提交</button>
											<button type="reset" class="layui-btn layui-btn-primary">重置</button>
										</div>
									</div>
								</form>
							</div>
							<%
								}
								else {
							%>
							<div class="layui-tab-item layui-show">
								<form class="layui-form" action="" method="post">
									<div class="layui-form-item">
										<label class="layui-form-label">旧密码：</label>
										<div class="layui-input-block">
											<input class="layui-input" type="text" name="oldPassword" placeholder="请输入旧密码" autocomplete="off" required="required" lay-verify="required" />
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">新密码：</label>
										<div class="layui-input-block">
											<input class="layui-input" type="password" name="password" placeholder="请输入新密码" autocomplete="off" required="required" lay-verify="required|pass" />
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">再次输入密码：</label>
										<div class="layui-input-block">
											<input class="layui-input" type="password" name="rePassword" placeholder="请再次输入密码" autocomplete="off" required="required" lay-verify="required|rePassword" />
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-input-block">
											<button class="layui-btn" lay-submit lay-filter="adminReset">立即提交</button>
											<button type="reset" class="layui-btn layui-btn-primary">重置</button>
										</div>
									</div>
								</form>
							</div>
							<div class="layui-tab-item">
								<form class="layui-form" action="" method="post">
									<div class="layui-form-item">
										<label class="layui-form-label">医生账号：</label>
										<div class="layui-input-block">
											<input class="layui-input" type="text" name="doctorAccount" placeholder="请输入医生账号" autocomplete="off" required="required" lay-verify="required" />
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">管理员密码：</label>
										<div class="layui-input-block">
											<input class="layui-input" type="password" name="adminPassword" placeholder="请输入管理员密码" autocomplete="off" required="required" lay-verify="required" />
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-input-block">
											<button class="layui-btn" lay-submit lay-filter="adminResetDefault">立即提交</button>
											<button type="reset" class="layui-btn layui-btn-primary">重置</button>
										</div>
									</div>
								</form>
							</div>
							<% } %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>