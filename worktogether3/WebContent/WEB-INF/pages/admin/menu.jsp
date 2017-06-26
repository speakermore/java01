<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="nav-main">
<nav class="navbar navbar-inverse navbar-fixed-top work-together-background">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">管理员系统,欢迎!${admin.adminLoginId}</a>
        </div>
</nav>
<div class="nav-box">
<div class="nav">
  <ul class="nav-ul">
  	<li><a href="admin/index" class="home"><span>首页</span></a></li>
  	<li><a href="admin/findAuditResume/${1}" class="develop"><span>审核管理</span></a></li>
  	<li><a href="" class="wechat"><span>信息管理</span></a></li>
  	<li><a href="admin/findUser/${1}" class="news"><span>热门信息</span></a></li>
  	<li><a href="admin/exit" class="home"><span>退出</span></a></li>
  	
  </ul>
</div>
<div class="nav-slide">
    <div class="nav-slide-o"></div>
    <div class="nav-slide-o">
    	<ul>
    		<li><a href=""><span>审核类型</span></a></li>
    		<li><a href="admin/findAuditResume/${1}"><span>审核简历</span></a></li>
    		<li><a href="admin/findAuditArticle/${1}"><span>审核文章</span></a></li>
    		<li><a href="admin/findAuditCommentsArticle/1"><span>审核文章评论</span></a></li>
    		<li><a href="admin/findAuditCommentsCompanyAndPeople/1"><span>审核个人企业互评</span></a></li>
    		<li><a href="admin/findAuditRecruitMent/1"><span>审核招聘信息</span></a></li>
    		<li><a href="admin/findCompanyIntro/1"><span>审核企业资质</span></a></li>
    		<li><a href="admin/auditNews/1"><span>审核新闻</span></a></li>
    		<li><a href="admin/findAuditOffer/1"><span>审核offer</span></a></li>
    	</ul>
    </div>
    <div class="nav-slide-o">
    	<ul>
    		<li><a href=""><span>功能类别</span></a></li>
    		<li><a href="admin/news/add"><span>添加资讯</span></a></li>
    		<li><a href="admin/maIntegerainAdmin"><span>信息维护</span></a></li>
    		<li><a href="admin/userMag" class="contact"><span>禁用用户</span></a></li>
    		<li><a href="admin/adminLog" class="news"><span>管理员日志</span></a></li>
  			<li><a href="#" class="contact"><span>访问量统计</span></a></li>
  			<li><a href="admin/addMessage" ><span>系统消息</span></a></li>
    	</ul>
    </div>
    <div class="nav-slide-o">
    	<ul>
    		<li><a href=""><span>热门类别</span></a></li>
    		<li><a href="admin/findBestArticle"><span>热门文章</span></a></li>
    		<li><a href="admin/"><span>最佳企业</span></a></li>
    	</ul>
    </div>
</div>
</div>
</div>


