<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript " src="personal/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js "></script>
<script type="text/javascript" src="thirdpart/ckeditor/ckeditor.js" charset="UTF-8"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script type="text/javascript" src="thirdpart/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="thirdpart/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="thirdpart/dist/js/bootstrapValidator.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="thirdpart/dist/js/language/zh_CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="thirdpart/fileupload/js/fileinput.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="thirdpart/fileupload/language/zh.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-typeahead.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/main.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript">				
	$(function(){
	var thisTime;
	$('.nav-ul li').mouseleave(function(even){
			thisTime	=	setTimeout(thisMouseOut,1000);
	})

	$('.nav-ul li').mouseenter(function(){
		clearTimeout(thisTime);
		var thisUB	=	$('.nav-ul li').index($(this));
		if($.trim($('.nav-slide-o').eq(thisUB).html()) != "")
		{
			$('.nav-slide').addClass('hover');
			$('.nav-slide-o').hide();
			$('.nav-slide-o').eq(thisUB).show();
		}
		else{
			$('.nav-slide').removeClass('hover');
		}
		
	})
	
	function thisMouseOut(){
		$('.nav-slide').removeClass('hover');
	}
	 
	$('.nav-slide').mouseenter(function(){
		clearTimeout(thisTime);
		$('.nav-slide').addClass('hover');
	})
	$('.nav-slide').mouseleave(function(){
		$('.nav-slide').removeClass('hover');
	})

})
</script>
<!-- <div class="navi_head" style="text-align:center;margin:50px 0; font:normal 14px/20px 'MicroSoft YaHei';">
	<p>欢迎使用管理员系统，有任何疑问欢迎致电：400-1234-1234,本系统所有解释权由本公司所有！</p>
	<p>来源：<a href="http://sc.chinaz.com/" target="_blank">由Zzzz团队创作</a></p>
</div> -->
