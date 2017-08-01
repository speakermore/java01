

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
/**
 * 牟勇：修改扣费状态的函数
 * btn：点击的按钮（不一定是button，也可以是a，input等等标签）
 * column:要修改状态的字段名，userIsRecruit/userIscrowdFun/userIspartner之一
 * value:1表示开始，0表示结束
 * baseMoney：应聘是1额度/天，发布众筹和发布合伙创业是10额度/天
 * emId:是修改我的头像下面的状态文字的标签id，recruit-status/crowdfund-status/partner-status之一
 * userId:登录用户的主键id
 */
var ajaxStatus=function(btn,column,value,baseMoney,emId,userId){
	if(value==0||confirm('将从你的账户中扣除'+baseMoney+'额度/天,确定么？')){
		$.ajax({
			url:'common/expenses/charging',
			data:{'column':column,'value':value,'userId':userId},
			type:'POST',
			dataType:'json',
			success:function(data){
				if(data.success){
					$(btn).html(data.status);
					//更换触发函数的值,不知道什么原因，不能成功
//					$(btn).unbind('click');//先移除原先的click事件
//					$(btn).bind('click',function(){ajaxStatus(btn,column,value==1?0:1,baseMoney,emId);});
					$(btn).removeClass(data.btnRemoveClass);
					$(btn).addClass(data.btnAddClass);
					//更新用户头像下方的状态信息
					$('#'+emId).html(data.emStatus);
				}
				alert(data.info);
				//因为不能成功更换函数的参数值，只好直接刷新页面了
				location.href='personal/common/initIndex?userId='+userId
			}
		});
	}
};
/**
 * 牟勇：刘志浩写的ajax跳转页面的方法，这样可以不用刷新整个页面，把右侧的内容给刷新了。
 * 觉得挺好，就拿过来用喽。
 */
var ajaxPage = function(page) {
	$.ajax({
		url : "ajax",
		data : "page=" + page,
		type : "POST",
		dataType : "html",
		success : function(data) {
			$("#my-content").html(data);
		}
	});
}
