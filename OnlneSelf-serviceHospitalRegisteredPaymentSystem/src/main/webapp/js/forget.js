var b = 0;
$(function() {
	layui.use(["element", "form"], function() {
		var element = layui.element,
		form = layui.form
	});
});
$(function() {
	$("img[title='点击刷新']").click(function() {
		$(this).attr("src", "/OnlneSelf-serviceHospitalRegisteredPaymentSystem/validcode?codeName=forgetCode&data=" + new Date());
	});
});
$(function() {
	var a = [0, 0, 0];
	var problem = ["您父亲的名字？", "您小学时候的班主任？", "您最爱吃的食物？"];
	var trueAnswer;
	var idCard = /(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	var idCardValue;
	$(":text[name='safetyProblem']").on("click", function() {
		$(":text[name='safetyProblem']").val("");
		$(":text[name='answer']").val("");
		if($(":text[name='idCard']").val() === "") {
			$("#idcarderro").html("*请先填写身份证号");
			$(":text[name='answer']").attr("disabled", "disabled");
			a[0] = 0;
		}
		else if(!idCard.test($(":text[name='idCard']").val())) {
			$("#idcarderro").html("*身份证号格式错误");
			$(":text[name='answer']").attr("disabled", "disabled");
			a[0] = 0;
		}
		else {
			$.ajax({
				url: "/OnlneSelf-serviceHospitalRegisteredPaymentSystem/idCardFindPassword",
				data: {"idCard": $(":text[name='idCard']").val()},
				dataType: "json",
				type: "POST",
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				success: function(data) {
					for(var key in data) {
						if(key != "false") {
							trueAnswer = data[key];
							$(":text[name='safetyProblem']").val(problem[parseInt(data[key].substr(0, 1)) - 1]);
							$("#idcarderro").html("");
							$(":text[name='answer']").removeAttr("disabled");
							idCardValue = key;
							a[0] = 1;
						}
						else {
							$("#idcarderro").html("*该身份证号没有被注册");
							$(":text[name='answer']").attr("disabled", "disabled");
							a[0] = 0;
						}
					}
				}
			});
		}
	});
	$(":text[name='answer']").on("change", function() {
		if($(this).val() === trueAnswer.substr(1, trueAnswer.length - 1)) {
			$("#answererro").html("");
			a[1] = 1;
		}
		else {
			$("#answererro").html("*答案错误！");
			a[1] = 0;
		}
	});
	$(":text[name='code']").change(function() {
		$.ajax({
			url: "/OnlneSelf-serviceHospitalRegisteredPaymentSystem/checkcode",
			data: {"code": $(":text[name='code']").val(), "codeName": "forgetCode"},
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
			$("form").empty();
			$("form").html("<input type=\"hidden\" name=\"id\" value=" +idCardValue + " /><div class=\"layui-form-item\"><label class=\"layui-form-label\" style=\"width: auto;\"><i class=\"layui-icon layui-icon-password\" style=\"font-size: 38px;\"></i></label><div class=\"layui-input-inline\"><input type=\"password\" name=\"password\" required lay-verify=\"required\" placeholder=\"请输入新密码\" autocomplete=\"off\" onchange=\"checkpassword()\" class=\"layui-input\" /></div><div id=\"passworderro\" class=\"layui-form-mid layui-word-aux\" style=\"width: 200px; float: right;\"></div></div><div class=\"layui-form-item\"><div class=\"layui-input-block\"><input type=\"button\" value=\"修改密码\" onclick=\"butoonclick()\"  class=\"layui-btn\" /></div></div>");
		}
	});
});
function checkpassword() {
	var pattern2 = /^[a-zA-Z0-9]{6,12}$/;
	if($(":password[name='password']").val().trim() === "") {
		$("#passworderro").html("*请输入密码");
		b = 0;
	}
	else if($(":password[name='password']").val().length < 6 || $(":password[name='password']").val().length > 12) {
		$("#passworderro").html("*请输入大于6位小于12位的密码");
		b = 0;
	}
	else if(!pattern2.test($(":password[name='password']").val())) {
		$("#passworderro").html("*密码只允许输入英文和数字");
		b = 0;
	}
	else {
		$("#passworderro").html("");
		b = 1;
	}
}
function butoonclick() {
	if(b === 0) {
		layui.use("layer", function() {
			var layer = layui.layer;
			layer.msg("密码信息不正确，请修改后再提交");
		});
	}
	else {
		$("form").submit();
	}
}