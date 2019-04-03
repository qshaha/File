<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="layui-header">
		<div class="layui-logo"><p style="font-family: 华文行楷; font-size: 20px; font-weight: bold;">武汉文理医院</p></div>
		<ul class="layui-nav layui-layout-left">
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/index2">首页</a>
			</li>
			<li class="layui-nav-item">
				<a name="heada" href="${pageContext.request.contextPath}/index2">医院介绍</a>
				<dl class="layui-nav-child">
					<dd><a href="">医院介绍</a></dd>
					<dd><a href="">消息公告</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/index2">个人信息</a>
			</li>
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/index2">预约挂号</a>
			</li>
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/index2">挂号记录</a>
			</li>
		</ul>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">欢迎来到文理医院</a>
			</li>
			<%
				if(request.getAttribute("patientinfo") == null) {					
			%>
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/login">登录</a>
			</li>
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/register">注册</a>
			</li>
			<%
				}
				else {
			%>
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/login">个人中心</a>
			</li>
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/register">退出登录</a>
			</li>
			<% } %>
		</ul>
	</div>
</body>
</html>