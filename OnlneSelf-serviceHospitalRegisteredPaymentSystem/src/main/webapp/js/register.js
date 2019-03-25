$(function() {
	layui.use(["element","form","laydate"], function(){
		var element = layui.element,
		form = layui.form,
		laydate = layui.laydate;
		laydate.render({
			elem: "#birth"
		});
	});
});
$(function() {
	$("#sexdiv").click(function() {
		if($(":radio:checked").val() === "男") {
			$("#sexlabel").html("<i class=\"layui-icon layui-icon-male\" style=\"font-size: 38px;\"></i>");
		}
		else {
			$("#sexlabel").html("<i class=\"layui-icon layui-icon-female\" style=\"font-size: 38px;\"></i>");
		}
	});
});
$(function() {
	var isCorrect = [0, 0, 0, 0, 0, 0, 0, 0];
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
	$(":text[name='birth']").change(function() {
		if($(this).val() === "") {
			$("#birtherro").html("*请选择出生日期");
			isCorrect[1] = 0;
		}
		else {
			$("#birtherro").html("*设置后无法更改！请谨慎填写");
			isCorrect[1] = 1;
		}
	});
});