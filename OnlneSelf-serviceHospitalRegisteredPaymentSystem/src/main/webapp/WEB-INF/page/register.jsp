<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院-注册</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>
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
						<td><p>当前位置：<a href="${pageContext.request.contextPath}/index2">首页</a>>>注册</p></td>
						<td><p name="nowtime" style="float: right;"></p></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="layui-main" style="width: 500px; margin: 0 auto; margin-bottom: 100px;">
			<form class="layui-form" action="${pageContext.request.contextPath}/patient/register" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-friends" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline" style="float: none;">
						<input type="text" name="name" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input" />
					</div>
					<div id="nameerro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;">*设置后无法更改！请谨慎填写</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i name="idCardIcon" class="layui-icon layui-icon-list" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline">
						<input type="text" name="idCard" required lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input" />
					</div>
					<div id="idcarderro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;">*设置后无法更改！请谨慎填写</div>
				</div>
				<input type="hidden" name="sex" value="" />
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-date" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline" style="float: none;">
						<input id="birth" type="text" name="birth" placeholder="出生日期" autocomplete="off" readonly="readonly" class="layui-input" />
					</div>
					<div id="birtherro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;">*填写正确身份证后自动显示</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-cellphone" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline">
						<input type="text" name="number" placeholder="请输入手机号" autocomplete="off" class="layui-input" />
					</div>
					<div id="numbererro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;"></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-home" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline">
						<input type="text" name="address" placeholder="请输入家庭住址" autocomplete="off" class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-survey" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline">
						<select name="safetyProblem" lay-verify="required">
							<option value="">请选择安全问题</option>
							<option value="1">您父亲的名字？</option>
							<option value="2">您小学时候的班主任？</option>
							<option value="3">您最爱吃的食物？</option>
						</select>
					</div>
					<div id="problemerro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;"></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-read" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline">
						<input type="text" name="answer" required lay-verify="required" placeholder="请输入问题答案" autocomplete="off" class="layui-input" disabled="disabled" />
					</div>
					<div id="answererro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;"></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-password" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline">
						<input type="password" name="password" required lay-verify="required" placeholder="请设置密码" autocomplete="off" class="layui-input" />
					</div>
					<div id="passworderro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;"></div>
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