<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="ynjh.personal.entity.Article"%>
 <%@page import="java.util.List"%>
 
<html>  
<head>
<title>热门文章 </title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />

<script type='text/javascript' src='http://blog.jobbole.com/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/plugins/jobbole-wp-plugin/js/jquery.fancybox.pack.js?ver=2.1.5'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/plugins/jobbole-wp-plugin/js/superfish.js?ver=1.4.8'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/plugins/jobbole-wp-plugin/js/menu-effects.js?ver=1.5.1'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var JobboleAjax = {"ajaxurl":"http:\/\/blog.jobbole.com\/wp-admin\/admin-ajax.php"};
/* ]]> */
</script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/plugins/jobbole-wp-plugin/js/jobbole-wp-plugin.js?ver=1.0.61'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/plugins/crayon-syntax-highlighter/util/tag-editor/colorbox/jquery.colorbox-min.js?ver=2.7.1.1'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var CrayonSyntaxSettings = {"version":"2.7.1.1","is_admin":"0","ajaxurl":"http:\/\/blog.jobbole.com\/wp-admin\/admin-ajax.php","prefix":"crayon-","setting":"crayon-setting","selected":"crayon-setting-selected","changed":"crayon-setting-changed","special":"crayon-setting-special","orig_value":"data-orig-value","debug":""};
var CrayonSyntaxStrings = {"copy":"\u4f7f\u7528 %s \u590d\u5236\uff0c\u4f7f\u7528 %s \u7c98\u8d34\u3002","minimize":"\u70b9\u51fb\u5c55\u5f00\u4ee3\u7801"};
/* ]]> */
</script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/plugins/crayon-syntax-highlighter/js/src/util.js?ver=2.7.1.1'></script>
    <script type="text/javascript">
        jQuery(function($){
            $('.comment-reply-link').click(function(e){
                e.preventDefault();
                var args = $(this).data('onclick');
                args = args.replace(/.*\(|\)/gi, '').replace(/\"|\s+/g, '');
                args = args.split(',');
                tinymce.EditorManager.execCommand('mceRemoveEditor', true, 'comment_editor');
                addComment.moveForm.apply( addComment, args );
                tinymce.EditorManager.execCommand('mceAddEditor', true, 'comment_editor');
            });

            $('#cancel-comment-reply-link').click(function(e){
                e.preventDefault();
                tinymce.EditorManager.execCommand('mceRemoveEditor', true, 'comment_editor');
                tinymce.EditorManager.execCommand('mceAddEditor', true, 'comment_editor');
            });
        });
    </script>
	
	<!-- CSS -->
    <link rel="stylesheet" type="text/css" media="screen" href="http://blog.jobbole.com/wp-content/themes/jobboleblogv3/style.css?ver=1.0.66">
	<style>
		body {
            background:#fffff;        }
        a,
        .tabs ul.nav li a:hover,
        .tabs ul.nav li.active a,
        li.comment cite a:hover,
        h3.widget-title,
        .post-meta .meta-title:hover,
        .the-latest a:hover h4,
        .aw_socialcounter_widget li a:hover,
        .aw_tabbed_widget #tab-latest-comments a:hover
        {
            color: #fa941b;
        }
        a{
	cursor: pointer;
	
	}
		a:hover { color: #fa941b; }
		input:focus, textarea:focus { border-color: #fa941b; }
		.numb { background-color: #fa941b; border-color: #fa941b; }
		.post-meta:hover { background-color: #fa941b; border-color: #fa941b; }
	</style>

	</head>
	<body>
		<div class="tabs tabbed_widget"><ul class="nav clearfix"><li><a id="link-tab1" href="#tab1" title="企业">企业</a></li><li><a id="link-tab2" href="#tab2" title="个人">个人</a></li></ul>
			<div id="tab1" class="tab"><div class="floated-thumb">
                <div class="dropdown" >
</div>
<table class="table table-striped">
	
	<thead>
		<tr>
			<th>用户</th>
			<th>文章id</th>
			<th>文章标题</th>
			<th>点击数</th>
			<th>点赞数</th>
			<th>关键字</th>
			<th>发表日期</th>
		</tr>
	</thead>
	<tbody>
		<%
				List<Article> newsList = (List<Article>) request.getAttribute("article");
				if (newsList != null) {
					int i = 0;
					for (Article art : newsList) {
						i++;
			%>
			<tr <%if (i % 2 == 0) {%> class="admin-list-td-h2" <%}%>>
				<td><%=art.getId()%></td>
				<td><%=art.getArticleTitle()%></td>
				<td><%=art.getArticleTime()%></td>
				<td><%=art.getArticleContent()%></td>
				<td><%=art.getArticleLikeNum()%></td>
				<td><%=art.getArticleReadNum()%></td>
				<td><%=art.getArticleLikeNum()%></td>
				<td><%=art.getArticleReadNum()%></td>
				<td><%=art.getArticleKey()%></td>
				

				<%
					}
					}
				%>
	</tbody>
</table>    
      
		</div>
         <div class="clear"></div>
                </div><div id="tab2" class="tab"><div class="floated-thumb">
	<table class="table table-striped">
	
		
		
	
	<thead>
		<tr>
			<th>用户</th>
			<th>文章id</th>
			<th>文章标题</th>
			<th>点击数</th>
			<th>点赞数</th>
			<th>关键字</th>
			<th>发表日期</th>
		</tr>
	</thead>
	<tbody>
		<%
				List<Article> newsList1 = (List<Article>) request.getAttribute("article");
				if (newsList != null) {
					int i = 0;
					for (Article art : newsList1) {
						i++;
			%>
			<tr <%if (i % 2 == 0) {%> class="admin-list-td-h2" <%}%>>
				<td><%=art.getId()%></td>
				<td><%=art.getArticleTitle()%></td>
				<td><%=art.getArticleTime()%></td>
				<td><%=art.getArticleContent()%></td>
				<td><%=art.getArticleLikeNum()%></td>
				<td><%=art.getArticleReadNum()%></td>
				<td><%=art.getArticleLikeNum()%></td>
				<td><%=art.getArticleReadNum()%></td>
				<td><%=art.getArticleKey()%></td>
				

				<%
					}
					}
				%>
	</tbody>	
</table>  
</div>
<script type='text/javascript' src='http://blog.jobbole.com/wp-includes/js/quicktags.min.js?ver=4.5.7'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/plugins/crayon-syntax-highlighter/util/tag-editor/crayon_qt.js?ver=2.7.1.1'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/themes/jobboleblogv3/_assets/js/ready.js?ver=1.0'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/themes/jobboleblogv3/_assets/js/easing.js?ver=1.3'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/themes/jobboleblogv3/_assets/js/validate.js?ver=1.9.0'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/themes/jobboleblogv3/_assets/js/touchwipe.js?ver=1.1.1'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/themes/jobboleblogv3/_assets/js/caroufredsel.js?ver=5.5.0'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/themes/jobboleblogv3/_assets/js/flexslider.js?ver=2.0'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/themes/jobboleblogv3/_assets/js/jplayer.js?ver=2.1.0'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/themes/jobboleblogv3/_assets/js/fitvids.js?ver=1.0'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/themes/jobboleblogv3/_assets/js/selectnav.js?ver=0.11'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-content/themes/jobboleblogv3/_assets/js/effects.js?ver=1.11'></script>
<script type='text/javascript' src='http://blog.jobbole.com/wp-includes/js/wp-embed.min.js?ver=4.5.7'></script>

</body>
</html>
