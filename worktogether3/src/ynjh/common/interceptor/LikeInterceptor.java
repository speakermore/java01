package ynjh.common.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ynjh.company.entity.Company;
import ynjh.company.service.LikeNumService;
import ynjh.personal.entity.User;

/**
 * 
 * @author 黄冰雁
 * 企业动态的点赞数拦截
 *
 */
public class LikeInterceptor extends HandlerInterceptorAdapter{
	
	@Resource
	private LikeNumService likeService;
	
	@Override  
	public boolean preHandle(HttpServletRequest request,  HttpServletResponse response, Object handler 
	            ) throws Exception { 
		String id=request.getParameter("id");
		HttpSession session=request.getSession();
		Object user=session.getAttribute("user");
		Integer likeNum=null;
		if (user instanceof Company) {
			likeNum=likeService.islikeNum(new Integer(id), ((Company) user).getId());
		}else if (user instanceof User) {
			likeNum=likeService.islikeNum(new Integer(id), ((User) user).getId());
		}
		if(likeNum==0){
			return true;
		}else{
			request.getRequestDispatcher("/company/artanddis/article/findid?id="+new Integer(id)+"&toPage=company/artanddis/companyart_detail").forward(request, response);
			return false;
		}
	}
}
