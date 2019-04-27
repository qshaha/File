$(function() {
	layui.use(["element","form"], function(){
		var element = layui.element,
		form = layui.form;
	});
});
$(function() {
	$("p").on("click", ":button[value='编辑信息']", function() {
		var address = $("td:contains(家庭住址)").next().text();
		var number = $("td:contains(手机号码)").next().text();
		$("td:contains(家庭住址)").next().html("<input type=\"text\" name=\"address\" placeholder=\""+ address +"\" autocomplete=\"off\" style=\"width: 100%; height: 100%;\" />");
		$("td:contains(手机号码)").next().html("<input type=\"text\" name=\"number\" placeholder=\""+ number +"\" autocomplete=\"off\" style=\"width: 100%; height: 100%;\" />");
		$(this).after("<input type=\"button\" value=\"取消\" class=\"layui-btn\" />");
		$(this).attr("value", "立即修改");
	});
});
$(function() {
	$("p").on("click", ":button[value='立即修改']", function() {
		var pattern = /^1[34578]\d{9}$/;
		if($(":text[name='number']").val() != "" && !pattern.test($(":text[name='number']").val())) {
			layui.use("layer", function() {
				var layer = layui.layer;
				layer.msg("手机号格式不正确");
			});
		}
		else {
			if($(":text[name='address']").val() === "") {
				$(":text[name='address']").val($(":text[name='address']").attr("placeholder"));
			}
			if($(":text[name='number']").val() === "") {
				$(":text[name='number']").val($(":text[name='number']").attr("placeholder"));
			}
			$("form").submit();
		}
	});
	$("p").on("click", ":button[value='取消']", function() {
		window.location.href="/OnlneSelf-serviceHospitalRegisteredPaymentSystem/personalInformation";
	});
});