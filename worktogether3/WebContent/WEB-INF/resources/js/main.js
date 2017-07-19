

var displayDiv=function(id){
	$(id).css("display","block");
};

var hiddenDiv=function(id){
	$(id).css("display","none");
};
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
};
/**
 *  牟勇：完成当用户选择一级岗位类别之后，ajax查询二级岗位类别 
 *  在onchange事件调用
 *  parentId:一级岗位的id
 */
var findJob2=function(parentId){
	$.ajax({
		url:"findJobs2/"+parentId,
		type:"POST",
		dataType:"text",
		success:function(data){
			$("#job2").html(data);
		}
	});
};


