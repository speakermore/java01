<%@ page import="ynjh.common.util.CommonStatus" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--左侧状态栏位-->
<article id="my-content"
	class="col-md-12  work-together-shadow work-together-shallow">
	<!--发表状态小节-->
	<section class="panel">
		<div class="tab-content">
			<div class="tab-pane active" id="panel-myNewly">
				<section class="panel">
					<div class="panel-heading">发表状态</div>
					<div class="panel-body">
						<form action="personal/mood/addMood" id="moodForm">
							<div class="form-group">
								<textarea style="resize: none;" name="moodContent" class="form-control" rows="5"
									placeholder="说点什么呗"></textarea>
							</div>
							<div class="form-group">
								<div class="col-sm-5">
									<span class="emotion">表情</span>
								</div>
								<div class="col-sm-offset-10">
									<input type="submit" class="btn btn-success" value="发表" />
								</div>
							</div>
						</form>
					</div>
				</section>
				<!--//发表状态 -->
				<!--最新状态信息组-->
				<div class="row">
					<section class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title">最新动态</div>
						</div>
						<div class="panel-body">
							<!-- 我的应聘 -->
							<div class="panel">
								<div class="panel-heading">
								<h5 class="panel-title">我感兴趣的招聘信息</h5>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled">
										<c:if test="${comanyRecruits.size()==0 }">
											<li>暂无新消息</li>
										</c:if>
										<c:forEach items="${comanyRecruits}" var="myIntrestCompany">
											<li>${myIntrestCompany.companySimpleName }于<fmt:formatDate value="${myIntrestCompany.cmpRecTime }" pattern="yyyy年MM月dd日"/>发布${myIntrestCompany.cmpRecTitle}岗位的招聘信息，<a href="company/cmprs/findById?id=${myIntrestCompany.id }&toPage=company/cmprs/companyRecruit_detail">快去看看吧</a>。</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<!-- 我的应聘结束 -->
							<!-- 我的应聘 -->
							<div class="panel">
								<div class="panel-heading">
									<h5 class="panel-title">我的应聘反馈</h5>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled">
										<c:if test="${mySendResumes.size()==0 }">
											<li>暂无消息</li>
										</c:if>
										<c:set var="RESUME_STATUS" value="${CommonStatus.RESUME_STATUS }"></c:set>
										<c:forEach items="${mySendResumes}" var="mySend">
										<li>我<fmt:formatDate value="${mySend.cmprTime }" pattern="yyyy年MM月dd日"/>发给${mySend.companyName}关于${mySend.cmpRecTitle}的简历,目前${RESUME_STATUS[mySend.cmprAction] }</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<!-- 我的应聘结束 -->
						
					
					<!-- 面试邀请开始 -->

						<section class="panel">
							<div class="panel-heading">
								<h5 class="panel-title">我收到的面试邀请</h5>
							</div>
							<div class="panel-body">
							<ul class="list-unstyled">
							<c:if test="${personal_offer.size()==0 }">
								<li>暂无消息</li>
							</c:if>
							<c:forEach items="${personal_offer}" var="myOffer">
								<li>
									收到@<a href="personal/common/gotoCompanyById?id=${myOffer.companyId}">${myOffer.companyName }</a>的职位邀请
									<a href="#">${myOffer.offerJob }</a>
									快去看看吧！
								</li>
							</c:forEach>
							</ul>
							</div>
							
						</section>
					<!-- 面试邀请结束-->
					<!-- 文章信息开始 -->
					
						
							<section class="panel">
								<div class="panel-heading">
									<h5 class="panel-title">我感兴趣的文章</h5>
								 </div>
								<div class="panel-body">
									<ul class="list-unstyled">
									<c:if test="${articleByFollows.size()==0 }">
										<li>暂无消息</li>
									</c:if>
									<c:forEach items="${articleByFollows}" var="abf">
										<li>
											@<a href="#">${abf.userName}</a>发表了&lt;&lt;<a href="personal/article/lookArticleById?id=${abf.articleId}">${abf.articleTitle}</a>&gt;&gt;
										</li>
									</c:forEach>
									</ul>
								</div>
							</section>
						
					
					<!-- 文章信息结束 -->
					<!-- 最新评论开始 -->
					<section class="panel">
						<div class="panel-heading">
							<h5 class="panel-title">别人对我的文章的评论</h5>
						</div>
						<div class="panel-body">
							<ul class="list-unstyled">
							<c:if test="${personal_comments==null }">
								<li>暂无消息</li>
							</c:if>
							<c:forEach items="${personal_comments}" var="articleByComment">
								<li>
									@<a href="#">${articleByComment.userName}</a>评论了&lt;&lt;<a href="personal/article/lookArticleById?id=${articleByComment.articleId}">${articleByComment.articleTitle }</a>&gt;&gt;
								</li>
							</c:forEach>
							</ul>
						</div>
					</section>
					
					<!-- 最新评论结束 -->
					
					</div>
					</section>
				</div>
			</div>
		</div>
	</section>
	<!--//最新状态信息组 -->
</article>
<script type="text/javascript">
	$(function() {
		$("#moodForm").bootstrapValidator({
			message : '这个值不能通过验证！！',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				moodContent : {
					validators : {
						stringLength : {
							min : 0,
							max : 100,
							message : '状态文字只能在100个字以内'
						}
					}
				}
			}
		});
	});
</script>