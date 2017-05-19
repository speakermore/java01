package ynjh.common.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ynjh.company.entity.Company;
import ynjh.company.entity.LikeNum;
import ynjh.company.service.LikeNumService;
import ynjh.personal.entity.User;


public class LikeInterceptor extends HandlerInterceptorAdapter{
	
	@Resource
	private LikeNumService likeService;
	
	@Override  
	public boolean preHandle(HttpServletRequest request,  HttpServletResponse response, Object handler 
	            ) throws Exception { 
		String id=request.getParameter("id");
		HttpSession session=request.getSession();
		Object user=session.getAttribute("user");
		LikeNum likeNum=null;
		if (user instanceof Company) {
			likeNum=likeService.findByArt(new Integer(id), ((Company) user).getId());
		}else if (user instanceof User) {
			likeNum=likeService.findByArt(new Integer(id), ((User) user).getId());
		}
		if(likeNum==null){
			
			return true;
		}else{
			request.getRequestDispatcher("/company/artanddis/article/findid?id="+new Integer(id)+"&toPage=company/artanddis/companyart_detail").forward(request, response);
			return false;
		}
	}
}
