var displayDiv=function(id){
	$(id).css("display","block");
};

var hiddenDiv=function(id){
	$(id).css("display","none");
}
/**
 * 牟勇：自动完成特效的函数
 * 需要导入typehead.js文件
 * ajaxMethod:ajax提交的url
 * controlId:需要实现自动完成特效的控件ID名称，需要加#号前缀
 */
var myAutoComplete=function(ajaxUrl,controlId){
	//民族的自动完成特效
	$.post(ajaxUrl, function(data) {
		$(controlId).typeahead({
			source : JSON.parse(data),
			minLength:0,
			showHintOnFocus:true,
			fitToElement:true});
	});
}
