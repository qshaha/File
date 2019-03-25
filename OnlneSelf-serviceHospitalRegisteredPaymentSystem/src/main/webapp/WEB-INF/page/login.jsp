<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院-登录</title>
	<link rel="icon" type="image/x-icon" href="/OnlneSelf-serviceHospitalRegisteredPaymentSystem/favicon.ico" />
	<link rel="shortcut icon" type="image/x-icon" href="/OnlneSelf-serviceHospitalRegisteredPaymentSystem/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript">
		$(function() {
			layui.use(["element","form"], function(){
				var element = layui.element,
				form = layui.form
			});
		});
		$(function() {
			$("img[title='点击刷新']").click(function() {
				$(this).attr("src", "${pageContext.request.contextPath}/validcode?date=" + new Date());
			});
		});
	</script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<%@ include file="/WEB-INF/master/head.jsp" %>
		<div id="headtable" class="layui-header" style="background-color: white;">
			<table class="layui-table" lay-skin="nob">
				<colgroup>
					<col width="150px" />
					<col width="200px" />
					<col width="" />
					<col width="150px" />
				</colgroup>
				<tbody>
					<tr>
						<td></td>
						<td><p>当前位置：<a href="${pageContext.request.contextPath}/index2.jsp">首页</a>>>登录</p></td>
						<td><p name="nowtime" style="float: right;"></p></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="layui-main" style="width: 300px; margin: 0 auto; margin-top: 100px;">
			<form class="layui-form" action="${pageContext.request.contextPath}/patient/login" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-username" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline" style="float: none;">
						<input type="text" name="account" required lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input" />
					</div>
				</div>
				<div class="layui-row" style="margin-bottom: 20px;">
					<p style="float: right;"><a href="${pageContext.request.contextPath}/register" style="text-decoration: none;">点击注册</a></p>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-password" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline">
						<input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" />
					</div>
				</div>
				<div class="layui-row" style="margin-bottom: 20px;">
					<p style="float: right;"><a href="${pageContext.request.contextPath}/patient/forget" style="text-decoration: none;">忘记密码？</a></p>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-vercode" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline" style="width: 100px;">
						<input type="password" name="text" required lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input" />
					</div>
					<img alt="点击刷新" title="点击刷新" src="${pageContext.request.contextPath}/validcode" style="float: left;">
				</div>
				<div class="layui-form-item">
				    <div class="layui-input-block">
				      <input type="submit" value="提交"  class="layui-btn" />
				    </div>
				</div>
			</form>
		</div>
		<%@ include file="/WEB-INF/master/tail.jsp" %>
	</div>
</body>
</html>