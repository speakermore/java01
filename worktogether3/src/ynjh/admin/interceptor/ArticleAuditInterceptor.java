package ynjh.admin.interceptor;

import java.sql.Timestamp;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ynjh.admin.entity.Admin;
import ynjh.admin.entity.AdminLog;
import ynjh.admin.service.AdminService;

/**
 * 该拦截器用于生成文章审核的日志记录
 * @author 朱吉
 *
 */
public class ArticleAuditInterceptor extends HandlerInterceptorAdapter {
	
	@Resource
	AdminService adminService;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	//获得操作人信息
		HttpSession session=request.getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		if(admin==null){
			request.getRequestDispatcher("/loseAdmin").forward(request, response);
			//response.sendRedirect(request.getContextPath()+"/loseAdmin");
			return false;
		}else{		
	//构建AdminLog实体
			//获得操作者账号
			String adminLoginId=admin.getAdminLoginId();
			//获得操作对象类型和id
			StringBuffer url=request.getRequestURL();	
			int index1=url.lastIndexOf("/");//审核结果与文章作者类型之间的分隔符
			String articleUsersType=url.substring(index1+1);
			int index2=index1-2;//文章id号与审核结果之间的分隔符
			String leftUrl=url.substring(0,index2);
			int index3=leftUrl.lastIndexOf("/");
			String articleId=leftUrl.substring(index3+1);
			//把操作对象类型和id转换成int
			int articleUsersTypeInt=0;
			int articleIdInt=0;
			AdminLog adminLog=new AdminLog();
			try{
				articleUsersTypeInt=Integer.parseInt(articleUsersType);
				articleIdInt=Integer.parseInt(articleId);
				adminLog.setAdminAid(articleIdInt);
				adminLog.setAdminDo(1);
				adminLog.setAdminLoginId(adminLoginId);
				adminLog.setAdminTargetType(articleUsersTypeInt);
				adminLog.setAdminTime(new Timestamp(new Date().getTime()));
				//写入日志
				adminService.addAdminLog(adminLog);
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}
		}
		
		return super.preHandle(request, response, handler);
	}
	
}
