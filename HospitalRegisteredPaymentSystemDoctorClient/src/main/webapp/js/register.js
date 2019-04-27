$(function() {
	layui.use(["element", "form", "laydate"], function(){
		var element = layui.element,
		form = layui.form,
		laydate = layui.laydate;
		var now = new Date();
		form.verify({
			checkName: function(value, item) {
				if(value.length > 5) {
					return "请输入小于5个汉字";
				}
				if(!new RegExp("^[\u4e00-\u9fa5]+$").test(value)) {
					return "只能输入中文";
				}
			}
		});
		laydate.render({
			elem: "#date",
			min: (now.getFullYear() - 80) + "-01-01",
			max: now.getFullYear() + "-" + ((now.getMonth() + 1) < 10 ? "0" : "") + (now.getMonth() + 1) + "-" + (now.getDate() < 10 ? "0" : "") + now.getDate()
		});
		laydate.render({
			elem: "#workdate",
			min: (now.getFullYear() - 60) + "-01-01",
			max: (now.getFullYear() - 18) + "-" + ((now.getMonth() + 1) < 10 ? "0" : "") + (now.getMonth() + 1) + "-" + (now.getDate() < 10 ? "0" : "") + now.getDate()
		});
	});
});