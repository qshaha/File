<%@page import="com.bilibilimao.po.Administrators"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="layui-header">
		<div class="layui-logo"><p style="font-family: 华文行楷; font-size: 20px; font-weight: bold;">武汉文理医院</p></div>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/index">欢迎来到文理医院医院客户端</a>
			</li>
			<%
				if(request.getAttribute("user") == null) {		
			%>
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/login">登录</a>
			</li>
			<%
				}
				else if(request.getAttribute("user") instanceof Administrators) {
			%>
			<li class="layui-nav-item">
				<a href="javascript:void(0);">管理员</a>
			</li>
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/logout">退出登录</a>
			</li>
			<%
				}
				else {
			%>
			<li class="layui-nav-item">
				<a href="javascript:void(0);">${user.name}</a>
			</li>
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/logout">退出登录</a>
			</li>
			<% } %>
		</ul>
	</div>
	<div class="layui-side layui-bg-black">
	    <div class="layui-side-scroll">
	      <ul class="layui-nav layui-nav-tree">
	        <li class="layui-nav-item layui-nav-itemed">
	          <a href="javascript:void(0);">信息管理</a>
	          <dl class="layui-nav-child">
	            <dd><a href="${pageContext.request.contextPath}/infoSearch">信息查询</a></dd>
	            <dd><a href="${pageContext.request.contextPath}/resetPassword">修改密码</a></dd>
	            <dd><a href="javascript:;">患者评价</a></dd>
	          </dl>
	        </li>
	        <li class="layui-nav-item">
	          <a href="javascript:;">消息通知</a>
	          <dl class="layui-nav-child">
	            <dd><a href="${pageContext.request.contextPath}/indexPhoto">发布首页图片</a></dd>
	            <dd><a href="javascript:;">发布医院动态</a></dd>
	            <dd><a href="javascript:;">内部公告</a></dd>
	          </dl>
	        </li>
			<li class="layui-nav-item">
				<a href="javascript:;">门诊</a>
				<dl class="layui-nav-child">
				  <dd><a href="javascript:;">叫号</a></dd>
				  <dd><a href="javascript:;">开具检查</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">账号注册与注销</a>
				<dl class="layui-nav-child">
				  <dd><a href="${pageContext.request.contextPath}/register">注册账号</a></dd>
				  <dd><a href="${pageContext.request.contextPath}/cancellation">注销账号</a></dd>
				</dl>
			</li>
	      </ul>
	    </div>
	  </div>
</body>
</html>