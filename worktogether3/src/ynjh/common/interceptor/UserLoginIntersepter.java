package ynjh.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ynjh.admin.entity.Admin;
import ynjh.company.entity.Company;
import ynjh.personal.entity.User;

/**
 * 检查用户是否登录的拦截器
 * @author mouyong
 *
 */
public class UserLoginIntersepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String[] ignorePathes={"thirdpart","fonts","codeValidate","logout","company_login","addUser","company/add","login","nologin","error","img","css","js"};
		HttpSession session=request.getSession();
		//获得请求路径
		StringBuffer path=request.getRequestURL();
		//忽略登录路径
		for(String ignorePath:ignorePathes){
			if(path.indexOf(ignorePath)!=-1){
				return true;
			}
		}
		request.setAttribute("errorInfo", "您尚未登录，请先登录");
		if(session.getAttribute("admin")!=null){
			//如果是管理员登录，则只能访问管理员的页面
			Admin admin=(Admin)session.getAttribute("admin");
			if(path.indexOf("admin")!=-1){
				return true;
			}
			request.setAttribute("errorInfo", "您是管理员，不能访问别的页面");
		}else if(session.getAttribute("user")!=null){
			//如果是用户登录，则只能访问用户相关的页面
			Object user=session.getAttribute("user");
			if(user instanceof User){//个人用户
				if(path.indexOf("personal")!=-1){
					return true;
				}
				request.setAttribute("errorInfo", "您是个人用户，不能访问别的页面");
			}else if(user instanceof Company){//企业用户
				if(path.indexOf("company")!=-1){
					return true;
				}
				request.setAttribute("errorInfo", "您是企业用户，不能访问别的页面");
			}
		}
		request.getRequestDispatcher("/notlogin.jsp").forward(request, response);
		return false;
	}
	
}
