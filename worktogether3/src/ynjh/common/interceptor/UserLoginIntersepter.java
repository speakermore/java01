package ynjh.common.interceptor;

import java.sql.Connection;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ynjh.admin.entity.Admin;
import ynjh.company.entity.Company;
import ynjh.personal.entity.User;

/**
 * 检查用户是否登录的拦截器
 * @author 牟勇
 *
 */
public class UserLoginIntersepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//不作任何处理的拦截路径(只要含有这个路径，就不做处理)
		String[] ignorePathes={"thirdpart","findAllProvinceName","fonts","gotoSoft","codeValidate","logout","company_login","addUser","company/add","login","nologin","error","img","css","js"};
		HttpSession session=request.getSession();
		//获得请求路径
		StringBuffer path=request.getRequestURL();
		//如果最后结尾是一个斜杠，则忽略该路径(理论上，结尾是斜杠的情况只能是访问首页的链接)
		if(path.lastIndexOf("/")==path.length()-1){
			return true;
		}
		//忽略登录路径
		for(String ignorePath:ignorePathes){
			if(path.indexOf(ignorePath)!=-1){
				return true;
			}
		}
		request.setAttribute("errorInfo", "<center>您尚未登录，请先登录:<a href='personal/user/login'>个人登录</a>|<a href='company/company_login'>企业登录</a></center>");
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
				//允许个人用户访问的路径
				String[] allowPages={"findAllNationName"};
				for(String allow:allowPages){
					if(path.indexOf(allow)!=-1){
						return true;
					}
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
