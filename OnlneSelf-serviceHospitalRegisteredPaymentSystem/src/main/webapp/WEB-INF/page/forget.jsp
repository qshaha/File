<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院-找回密码</title>
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/forget.js"></script>
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
						<td><p>当前位置：<a href="${pageContext.request.contextPath}/index2">首页</a>>><a href="${pageContext.request.contextPath}/login">登录</a>>>找回密码</p></td>
						<td><p name="nowtime" style="float: right;"></p></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="layui-main" style="width: 500px; margin: 0 auto; margin-top: 100px;">
			<form class="layui-form" action="${pageContext.request.contextPath}/patient/forget" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-username" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline" style="float: none;">
						<input type="text" name="idCard" required lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input" />
					</div>
					<div id="idcarderro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;"></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-survey" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline" style="float: none;">
						<input type="text" name="safetyProblem" autocomplete="off" placeholder="点击获取安全问题" readonly="readonly" class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-read" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline">
						<input type="text" name="answer" required lay-verify="required" placeholder="请输入问题答案" autocomplete="off" disabled="disabled" class="layui-input" />
					</div>
					<div id="answererro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;"></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-vercode" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline" style="width: 100px;">
						<input type="text" name="code" required lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input" />
					</div>
					<img alt="点击刷新" title="点击刷新" src="${pageContext.request.contextPath}/validcode?codeName=forgetCode" style="float: left;">
					<div id="codeerro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;"></div>
				</div>
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