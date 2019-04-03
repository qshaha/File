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
				$(this).attr("src", "${pageContext.request.contextPath}/validcode?codeName=loginCode&data=" + new Date());
			});
		});
		$(function() {
			var a = [0, 0, 0];
			$(":text[name='idCard']").change(function() {
				var idCard = /(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
				if(!idCard.test($.trim($(this).val()))) {
					$("#idcarderro").html("*身份证号格式错误");
					a[0] = 0;
				}
				else {
					$("#idcarderro").html("");
					a[0] = 1;
				}
			});
			$(":password[name='password']").change(function() {
				if($.trim($(this).val()) === "") {
					$("#passworderro").html("*请输入密码");
					a[1] = 0;
				}
				else {
					$("#passworderro").html("");
					a[1] = 1;
				}
			});
			$(":text[name='code']").change(function() {
				$.ajax({
					url: "${pageContext.request.contextPath}/checkcode",
					data: {"code": $(this).val(), "codeName": "loginCode"},
					dataType: "text",
					type: "GET",
					success: function(data) {
						if(data === "no") {
							$("#codeerro").html("*验证码错误");
							a[2] = 0;
						}
						else {
							$("#codeerro").html("");
							a[2] = 1;
						}
					}
				});
			});
			$(":button[value='提交']").click(function() {
				if(a[0] === 0 || a[1] === 0 || a[2] === 0) {
					layui.use("layer", function() {
						var layer = layui.layer;
						layer.msg("登录信息不正确，请修改后再提交");
					});
				}
				else {
					$("form").submit();
				}
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
						<td><p>当前位置：<a href="${pageContext.request.contextPath}/index2">首页</a>>>登录</p></td>
						<td><p name="nowtime" style="float: right;"></p></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="layui-main" style="width: 500px; margin: 0 auto; margin-top: 100px;">
			<form class="layui-form" action="${pageContext.request.contextPath}/patient/login" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-username" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline" style="float: none;">
						<input type="text" name="idCard" required lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input" />
					</div>
					<div id="idcarderro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;"></div>
				</div>
				<div class="layui-row" style="margin-bottom: 20px;">
					<p style="float: right; margin-right: 210px;"><a href="${pageContext.request.contextPath}/register" style="text-decoration: none;">点击注册</a></p>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-password" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline">
						<input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" />
					</div>
					<div id="passworderro" class="layui-form-mid layui-word-aux" style="width: 200px; float: right;"></div>
				</div>
				<div class="layui-row" style="margin-bottom: 20px;">
					<p style="float: right; margin-right: 210px;"><a href="${pageContext.request.contextPath}/forget" style="text-decoration: none;">忘记密码？</a></p>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: auto;"><i class="layui-icon layui-icon-vercode" style="font-size: 38px;"></i></label>
					<div class="layui-input-inline" style="width: 100px;">
						<input type="text" name="code" required lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input" />
					</div>
					<img alt="点击刷新" title="点击刷新" src="${pageContext.request.contextPath}/validcode?codeName=loginCode" style="float: left;">
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