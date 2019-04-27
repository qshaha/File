<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院-修改密码</title>
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iconfont.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/resetPassword.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<%@ include file="/WEB-INF/master/head.jsp" %>
		<div id="headtable" class="layui-header" style="background-color: white;">
			<table class="layui-table" lay-skin="nob">
				<colgroup>
					<col width="150px" />
					<col width="500px" />
					<col width="" />
					<col width="150px" />
				</colgroup>
				<tbody>
					<tr>
						<td></td>
						<td><p>当前位置：<a href="${pageContext.request.contextPath}/index2">首页</a>>>修改密码</p></td>
						<td><p name="nowtime" style="float: right;"></p></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="layui-main" style="width: 500px; margin: 0 auto; margin-top: 100px;">
			<form class="layui-form" action="${pageContext.request.contextPath}/patient/resetPassword" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-password" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline" style="float: none;">
						<input type="text" name="oldPassword" required lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input" />
					</div>
					<div id="oldPasswordErro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;"></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><span class="iconfont icon-mima1" style="font-size: 38px;"></span></label>
					<div class="layui-input-inline">
						<input type="password" name="password" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input" />
					</div>
					<div id="passworderro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;"></div>
				</div>
				<input type="hidden" value="${patientinfo.id}" name="id" />
				<div class="layui-form-item">
				    <div class="layui-input-block">
				      <input type="button" value="提交"  class="layui-btn" />
				    </div>
				</div>
			</form>
		</div>
		<%@ include file="/WEB-INF/master/tail.jsp" %>
	</div>
</body>
</html>