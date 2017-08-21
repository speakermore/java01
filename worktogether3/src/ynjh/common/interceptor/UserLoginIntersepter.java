package ynjh.common.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ynjh.company.entity.Company;
import ynjh.personal.entity.User;

/**
 * 检查用户权限的拦截器
 * @author 牟勇
 *
 */
public class UserLoginIntersepter extends HandlerInterceptorAdapter {
	Logger logger=Logger.getLogger(UserLoginIntersepter.class);
	private static StringBuffer basePath=null;
	//不作任何处理的拦截路径(只要含有这个路径，就不做处理)
	private static String[] ignorePathes={"common/article","userMoreInfo","crowdfundAllList","admin/news/news","find_news_10","thirdpart","findAllProvinceName","fonts","gotoSoft","codeValidate","logout","company_login","addUser","company/add","login","nologin","error","img","css","js"};
	//登录之后，不作处理的公共路径
	private static String[] commonPathes={"common","ajax","expenses","findJobs2","ckeditor/upload","findAllNationName"};
	private static String[] userIgnorePathes={"company/cmprs/find_recruit_detail"};
	private static String[] companyIgnorePathes={"offer","personal/follow/addFollow/","personal/follow/cancelFollow/"};
	private static String[] basePathes={"http://www.phasejob.com","http://www.phasejob.cn","http://www.phasejob.cn/#","http://www.phasejob.com/#","http://www.phasejob.cn/","http://www.phasejob.com/"};
			
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		//获得请求路径
		
		StringBuffer path=request.getRequestURL();
		//如果是首页，则允许访问
		if(basePath==null){
			basePath=new StringBuffer(request.getScheme()+"://");
			basePath.append(request.getServerName());
			if(request.getServerPort()!=80){
				basePath.append(":"+request.getServerPort());
			}
			basePath.append(request.getContextPath()+"/");
		}
		logger.debug("拦截器BasePath："+basePath);
		logger.debug("Path:"+path);
		if(path.toString().equals(basePath.toString())){
			logger.debug("该路径属于根路径，放行");
			return true;
		}
		//根路径的判断，根路径是所有人都可以访问的。
		for(String base:basePathes){
			if(path.toString().equals(base)){
				logger.debug("该路径属于根路径，放行");
				return true;
			}
		}
		//查找不登录也允许访问的路径
		for(String ignorePath:ignorePathes){
			if(path.indexOf(ignorePath)!=-1){
				logger.debug("该路径属于公共路径，放行");
				return true;
			}
		}
		//判断用户如果没登录，则保存
		if(session.getAttribute("admin")==null&&session.getAttribute("user")==null){
			request.setAttribute("errorInfo", "<center>您尚未登录，请先登录:<a href='personal/user/login'>个人登录</a>|<a href='company/company/company_login'>企业登录</a></center>");
		}else{
			//查找登录之后就可以允许访问的通用路径
			for(String ignorePath:commonPathes){
				if(path.indexOf(ignorePath)!=-1){
					logger.debug("该路径属于登录后的公共路径，放行");
					return true;
				}
			}
		}
		if(session.getAttribute("user")!=null){
			//如果是用户登录，则只能访问用户相关的页面
			Object user=session.getAttribute("user");
			if(user instanceof User){//个人用户
				if(path.indexOf("personal")!=-1){
					return true;
				}
				for(String userIgnorePathe:userIgnorePathes){
					if(path.indexOf(userIgnorePathe)!=-1){
						logger.debug("该路径属于个人用户特别允许路径，放行");
						return true;
					}
				}
				logger.debug("个人用户不能访问，限行");
				request.setAttribute("errorInfo", "您是个人用户，不能访问别的页面");
			}else if(user instanceof Company){//企业用户
				if(path.indexOf("company")!=-1){
					return true;
				}
				for(String companyIgnorePath:companyIgnorePathes){
					if(path.indexOf(companyIgnorePath)!=-1){
						logger.debug("该路径属于企业用户特别允许路径，放行");
						return true;
					}
				}
				logger.debug("企业用户不能访问，限行");
				request.setAttribute("errorInfo", "您是企业用户，不能访问别的页面");
			}
			
		}else if(session.getAttribute("admin")!=null){
			//如果是管理员登录，则只能访问管理员的页面
			if(path.indexOf("admin")!=-1||path.indexOf("superAdmin")!=-1){
				return true;
			}
			logger.debug("管理员不能访问，限行");
			request.setAttribute("errorInfo", "您是管理员，不能访问别的页面");
		}
		request.getRequestDispatcher("/notlogin.jsp").forward(request, response);
		return false;
	}
	
	
	
}
