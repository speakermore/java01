package ynjh.company.controller.company;

import java.io.File;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ynjh.common.util.MD5Util;
import ynjh.company.entity.Company;
import ynjh.company.service.CompanyService;

@Controller
@RequestMapping(value="/company/company")
public class CompanyController {

	@Resource
	private CompanyService companyService;
	
	//登录验证
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView companyLogin(String companyLoginId,String companyPassword,HttpSession session){
		String superPassword=null;
		try {
			superPassword=MD5Util.md5Encode(companyPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Company company=companyService.login(companyLoginId, superPassword);
		ModelAndView mv=new ModelAndView();
		if(company==null){
			mv.addObject("operatorInfo","登录失败");
			mv.addObject("toPage", "company/company/company_login");
			mv.setViewName("company/info");
		}else{
//				mv.addObject("operatorInfo","登录成功");
//				mv.addObject("company",company);
				session.setAttribute("user",company);
				mv.setViewName("company/artanddis/company_index");
		}
		return mv;
	}
	
	@RequestMapping(value="/companyIndex")
	public String main(){
		return "company/artanddis/company_index";
		
	}
	
	@RequestMapping(value={"/company_login","/"})
	public String index(){
		return "company/company/company_login";
	}
	
	
	//点击注册跳转
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addCompany(){
		return "company/company/add_company";
	}
	//注册用户
	@RequestMapping(value="/addCompany",method=RequestMethod.POST)
	public ModelAndView addCompany(Company company){
		ModelAndView mv=new ModelAndView("company/info");
		
		
		
		int companyResult=companyService.addCompany(company);
		if(companyResult>0){
			mv.addObject("operatorInfo","用户添加成功");
			mv.addObject("toPage", "company/company/"); 
//			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo","用户添加失败");
			mv.addObject("toPage", "company/company/add");
//			mv.setViewName("company/info");
		}
		return mv;
	}
	
	//跳转修改界面
	@RequestMapping(value="/updateCompany",method=RequestMethod.GET)
	public String updatecompany(){
//		ModelAndView mv=new ModelAndView("company/company/update_company");
//		Company company=(Company)session.getAttribute("company");
//		mv.addObject("company", company);
		
		return "company/company/update_company";
	}
	
	//修改用户资料
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ModelAndView updateCompany(Company company,HttpSession session,HttpServletResponse response,MultipartFile upload){
		ModelAndView mv=new ModelAndView();
		String newFileName="";
		try {
			//重命名文件名
			String path=session.getServletContext().getRealPath("WEB-INF/resources/company/img");
			String oldFileName=upload.getOriginalFilename();
			String suffix="."+FilenameUtils.getExtension(oldFileName);
			newFileName=System.currentTimeMillis()+RandomUtils.nextInt(1000)+suffix;
			String uploadContentType=upload.getContentType(); // 文件类型
//			String callback = request.getParameter("CKEditorFuncNum");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			
			if (uploadContentType.equals("image/pjpeg")
					|| uploadContentType.equals("image/jpeg")) {
				// IE6上传jpg图片的headimageContentType是image/pjpeg，而IE 9以及火狐上传的jpg图片是image/jpeg
				oldFileName = ".jpg";
			} else if (uploadContentType.equals("image/png")
					|| uploadContentType.equals("image/x-png")) {
				// IE6上传的png图片的headimageContentType是"image/x-png"
				oldFileName = ".png";
			} else if (uploadContentType.equals("image/gif")) {
				oldFileName = ".gif";
			} else if (uploadContentType.equals("image/bmp")) {
				oldFileName = ".bmp";
			} else {
				out.println("<script type=\"text/javascript\">");  
				out.println("window.parent.CKEDITOR.tools.callFunction("  
				+ oldFileName + ",'',"  
				+ "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");  
				out.println("</script>"); 
				
			}
			if (upload.getSize() > 1024 * 1024 * 2) {  
				out.println("<script type=\"text/javascript\">");  
				out.println("window.parent.CKEDITOR.tools.callFunction("  
				+ ",''," + "'文件大小不得大于2M');");  
				out.println("</script>");  
				
			}
			//创建File,并且服务器上创建实际存在的文件
			File newupload=new File(path+"/"+newFileName);
			if(!newupload.exists()){
				System.out.println(newupload.mkdirs());
			}
			
			//将imgpath写到磁盘上
			upload.transferTo(newupload);
//			out.println("<script type=\"text/javascript\">");
//			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
//					+ ",'"+request.getContextPath()+"/company/img/" + newFileName + "','')");
//			out.println("</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int resultDetail=companyService.addCompanyDetailId(company.getId(), newFileName);
		int result=companyService.updateCompany(company);
		if(result>0){
			mv.addObject("operatorInfo","用户修改成功");
			session.setAttribute("company", company);
			mv.addObject("toPage", "company/company/findById/"+company.getId());
			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo","用户修改失败");
			mv.addObject("toPage", "company/company/update_company");
			mv.setViewName("company/info");
		}
		return mv;
	}
	
	
	//退出
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "company/company/company_login";
	}
	
	/**
	 * 牟勇：跳转到公司资料页面
	 * @return
	 */
	@RequestMapping("/company_data")
	public String companyData(){
		return "company/company/company_data";
	}
}
