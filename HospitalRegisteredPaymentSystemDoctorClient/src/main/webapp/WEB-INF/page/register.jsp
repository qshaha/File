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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<%@ include file="/WEB-INF/master/head.jsp" %>
		<div class="layui-body layui-tab-content site-demo site-demo-body">
				<div class="layui-tab-item layui-show">
					<div class="layui-main">
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
							<legend>账号注册</legend>
						</fieldset>
						<form class="layui-form" action="${pageContext.request.contextPath}/doctor/register" method="post">
							<div class="layui-form-item">
								<label class="layui-form-label">姓名：</label>
								<div class="layui-input-block">
									<input class="layui-input" type="text" name="name" required="required" lay-verify="required|checkName" placeholder="请输入医生姓名" autocomplete="off" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">性别：</label>
								<div class="layui-input-block">
									<input type="radio" name="sex" value="男" title="男" checked="checked" />
									<input type="radio" name="sex" value="女" title="女" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">生日：</label>
								<div class="layui-input-block">
									<input id="date" class="layui-input" type="text" name="birth" required="required" lay-verify="required" placeholder="请选择出生日期" autocomplete="off" readonly="readonly" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">学历：</label>
								<div class="layui-input-block">
									<select name="education" lay-verify="required">
										<option value=""></option>
										<option value="专科">专科</option>
										<option value="本科">本科</option>
										<option value="硕士">硕士</option>
										<option value="博士">博士</option>
						    		</select>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">手机号码：</label>
								<div class="layui-input-block">
									<input class="layui-input" type="text" name="number" required="required" lay-verify="required|phone" placeholder="请输入医生手机号" autocomplete="off" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">入职日期：</label>
								<div class="layui-input-block">
									<input id="workdate" class="layui-input" type="text" name="workDate" required="required" lay-verify="required" placeholder="请选择入职日期" autocomplete="off" readonly="readonly" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">出诊时间：</label>
								<div class="layui-input-block">
									<input type="checkbox" name="weakList" value="周一上" title="周一上" />
									<input type="checkbox" name="weakList" value="周一下" title="周一下" />
									<input type="checkbox" name="weakList" value="周二上" title="周二上" />
									<input type="checkbox" name="weakList" value="周二下" title="周二下" />
									<input type="checkbox" name="weakList" value="周三上" title="周三上" />
									<input type="checkbox" name="weakList" value="周三下" title="周三下" />
									<input type="checkbox" name="weakList" value="周四上" title="周四上" />
									<input type="checkbox" name="weakList" value="周四下" title="周四下" />
									<input type="checkbox" name="weakList" value="周五上" title="周五上" />
									<input type="checkbox" name="weakList" value="周五下" title="周五下" />
									<input type="checkbox" name="weakList" value="周六上" title="周六上" />
									<input type="checkbox" name="weakList" value="周六下" title="周六下" />
									<input type="checkbox" name="weakList" value="周日上" title="周日上" />
									<input type="checkbox" name="weakList" value="周日下" title="周日下" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">职位：</label>
								<div class="layui-input-block">
									<select name="position" lay-verify="required">
										<option value=""></option>
										<option value="医师">医师</option>
										<option value="主治医师">主治医师</option>
										<option value="副主任医师">副主任医师</option>
										<option value="主任医师">主任医师</option>
						    		</select>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">科室：</label>
								<div class="layui-input-block">
									<select name="department" lay-verify="required">
										<option value=""></option>
										<option value="心血管科">心血管科</option>
										<option value="血液科">血液科</option>
										<option value="呼吸与危重症医学科">呼吸与危重症医学科</option>
										<option value="消化内科">消化内科</option>
										<option value="内分泌科">内分泌科</option>
										<option value="神经内科">神经内科</option>
										<option value="肾内科">肾内科</option>
										<option value="眼科">眼科</option>
										<option value="心血管外科">心血管外科</option>
										<option value="胃肠外科">胃肠外科</option>
										<option value="小儿外科">小儿外科</option>
										<option value="泌尿外科">泌尿外科</option>
										<option value="骨科">骨科</option>
										<option value="感染性疾病科">感染性疾病科</option>
										<option value="耳鼻喉头颈外科">耳鼻喉头颈外科</option>
										<option value="急诊科">急诊科</option>
										<option value="麻醉科">麻醉科</option>
										<option value="妇产科">妇产科</option>
						    		</select>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">擅长：</label>
								<div class="layui-input-block">
									<textarea class="layui-textarea" name="experience" required="required" lay-verify="required" placeholder="请输入"></textarea>
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