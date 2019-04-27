$(function() {
	layui.use(["element","form"], function(){
		var element = layui.element,
		form = layui.form;
	});
});
$(function() {
	var isCorrect = [0, 0];
	$(":text[name='oldPassword']").on("change", function() {
		if($(this).val().trim() === "") {
			$("#oldPasswordErro").html("*密码不能为空");
			isCorrect[0] = 0;
		}
		else {
			var cookies = document.cookie;
			var cookie_start = cookies.indexOf("patient");
			cookie_start = cookie_start + 8;
			var cookie_end = cookies.indexOf(";", cookie_start);
			if (cookie_end == -1) {
				cookie_end = cookies.length;
			}
			var patient = unescape(cookies.substring(cookie_start, cookie_end));
			$.ajax({
				url: "/OnlneSelf-serviceHospitalRegisteredPaymentSystem/getOldPassword",
				data: {"uuid": patient},
				dataType: "text",
				type: "POST",
				success: function(data) {
					if($(":text[name='oldPassword']").val() != data) {
						$("#oldPasswordErro").html("*密码错误");
						isCorrect[0] = 0;
					}
					else {
						$("#oldPasswordErro").html("");
						isCorrect[0] = 1;
					}
				}
			});
		}
	});
	$(":password[name='password']").on("change", function() {
		var pattern2 = /^[a-zA-Z0-9]{6,12}$/;
		if($(this).val().trim() === "") {
			$("#passworderro").html("*请输入密码");
			isCorrect[1] = 0;
		}
		else if($(this).val().length < 6 || $(this).val().length > 12) {
			$("#passworderro").html("*请输入大于6位小于12位的密码");
			isCorrect[1] = 0;
		}
		else if(!pattern2.test($(this).val())) {
			$("#passworderro").html("*密码只允许输入英文和数字");
			isCorrect[1] = 0;
		}
		else {
			$("#passworderro").html("");
			isCorrect[1] = 1;
		}
	});
	$(":button[value='提交']").click(function() {
		for(var i = 0; i < isCorrect.length; i += 1) {
			if(isCorrect[i] === 0) {
				layui.use("layer", function() {
					var layer = layui.layer;
					layer.msg("注册信息填写有误请按提示修正后再提交");
				});
				break;
			}
			if(i === isCorrect.length - 1) {
				$("form").submit();
			}
		}
	});
});