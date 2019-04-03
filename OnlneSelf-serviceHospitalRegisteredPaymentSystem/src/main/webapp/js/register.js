$(function() {
	layui.use(["element","form"], function(){
		var element = layui.element,
		form = layui.form;
	});
});
$(function() {
	var isCorrect = [0, 0, 1, 1, 0, 0, 0];
	$(":text[name='name']").change(function() {
		var myReg = /^[\u4e00-\u9fa5]+$/;
		if($(this).val() === "") {
			$("#nameerro").html("*请输入名字！");
			isCorrect[0] = 0;
		}
		else {
			if($(this).val().length > 5) {
				$("#nameerro").html("*请输入小于5个汉字");
				isCorrect[0] = 0;
			}
			else {
				if(!myReg.test($(this).val())) {
					$("#nameerro").html("*请输入汉字");
					isCorrect[0] = 0;
				}
				else {
					$("#nameerro").html("*设置后无法更改！请谨慎填写");
					isCorrect[0] = 1;
				}
			}
		}
	});
	$(":text[name='idCard']").change(function() {
		var idCard = /(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		if(!idCard.test($.trim($(this).val()))) {
			$("#idcarderro").html("*身份证号格式错误");
			$("i[name='idCardIcon']").attr("class", "layui-icon layui-icon-list");
			isCorrect[1] = 0;
		}
		else {
			$.ajax({
				url: "/OnlneSelf-serviceHospitalRegisteredPaymentSystem/idCardIsRegistered",
				data: {"idCard": $(this).val()},
				dataType: "text",
				type: "POST",
				success: function(data) {
					if(data === "true") {
						$("#idcarderro").html("*该身份证已经注册");
						isCorrect[1] = 0;
					}
					else {
						$("#idcarderro").html("*设置后无法更改！请谨慎填写");
						if (parseInt($(":text[name='idCard']").val().substr(16, 1)) % 2 == 1) {
							$("i[name='idCardIcon']").attr("class", "layui-icon layui-icon-male");
							$(":hidden[name='sex']").val("男");
						}
						else {
							$("i[name='idCardIcon']").attr("class", "layui-icon layui-icon-female");
							$(":hidden[name='sex']").val("女");
						}
						var birth = $(":text[name='idCard']").val().substr(6,4) + "-" + $(":text[name='idCard']").val().substr(10, 2) + "-" + $(":text[name='idCard']").val().substr(12, 2);
						$(":text[name='birth']").val(birth);
						isCorrect[1] = 1;
					}
				}
			});
		}
	});
	$(":text[name='number']").change(function() {
		var pattern = /^1[34578]\d{9}$/;
		if($(this).val() === "" || pattern.test($(this).val())) {
			$("#numbererro").html("");
			isCorrect[2] = 1;
		}
		else {
			$("#numbererro").html("*手机号格式不正确");
			isCorrect[2] = 0;
		}
	});
	setInterval(function() {
		if($("select[name='safetyProblem'] option:selected").val() === "") {
			$("#problemerro").html("*请选择安全问题");
			$(":text[name='answer']").val("");
			$(":text[name='answer']").attr("disabled", "disabled");
			isCorrect[4] = 0;
		}
		else {
			$("#problemerro").html("");
			$(":text[name='answer']").removeAttr("disabled");
			isCorrect[4] = 1;
		}
		if(isCorrect[4] === 1) {
			if($(":text[name='answer']").val().trim() === "") {
				$("#answererro").html("*请输入问题答案");
				isCorrect[5] = 0;
			}
			else {
				$("#answererro").html("");
				isCorrect[5] = 1;
			}
		}
		else {
			$("#answererro").html("");
			isCorrect[5] = 0;
		}
	}, 500);
	$(":password[name='password']").on("change", function() {
		var pattern2 = /^[a-zA-Z0-9]{6,12}$/;
		if($(this).val().trim() === "") {
			$("#passworderro").html("*请输入密码");
			isCorrect[6] = 0;
		}
		else if($(this).val().length < 6 || $(this).val().length > 12) {
			$("#passworderro").html("*请输入大于6位小于12位的密码");
			isCorrect[6] = 0;
		}
		else if(!pattern2.test($(this).val())) {
			$("#passworderro").html("*密码只允许输入英文和数字");
			isCorrect[6] = 0;
		}
		else {
			$("#passworderro").html("");
			isCorrect[6] = 1;
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