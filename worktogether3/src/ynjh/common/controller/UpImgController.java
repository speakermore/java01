package ynjh.common.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import ynjh.company.entity.Company;
import ynjh.personal.entity.User;
/**
 * 
 * @author 黄冰雁
 * Ckediter的图片上传
 *
 */
@Controller
public class UpImgController {
	@RequestMapping("/upload")	
	public void upload(MultipartFile upload,HttpSession session,HttpServletRequest request,HttpServletResponse response){
		try {
		//重命名文件名
		Object user=session.getAttribute("user");
		String path=null;
		if (user instanceof User) {
			path=session.getServletContext().getRealPath("WEB-INF/resources/user/img/"
					+((User) user).getUserLoginId()+"/"+new SimpleDateFormat("yyyyMMdd").format(new Date()));
		}else if (user instanceof Company) {
			path=session.getServletContext().getRealPath("WEB-INF/resources/company/img/"
					+((Company) user).getCompanyLoginId()+"/"+new SimpleDateFormat("yyyyMMdd").format(new Date()));
		}
		String oldFileName=upload.getOriginalFilename();
		String suffix="."+FilenameUtils.getExtension(oldFileName);
		String newFileName=System.currentTimeMillis()+RandomUtils.nextInt(1000)+suffix;
		String uploadContentType=upload.getContentType(); // 文件类型
		String callback = request.getParameter("CKEditorFuncNum");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		
		if (uploadContentType.equals("image/pjpeg")
				|| uploadContentType.equals("image/jpeg")) {
			// IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
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
			+ callback + ",''," + "'文件大小不得大于2M');");  
			out.println("</script>");  
			
		}
		//创建File,并且服务器上创建实际存在的文件
		File newupload=new File(path+"/"+newFileName);
		if(!newupload.exists()){
			System.out.println(newupload.mkdirs());
		}
		
		//将imgpath写到磁盘上
		upload.transferTo(newupload);
		out.println("<script type=\"text/javascript\">");
		if (user instanceof User) {
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
					+ ",'"+request.getContextPath()+"/user/img/"+ ((User) user).getUserLoginId()+"/"
						+new SimpleDateFormat("yyyyMMdd").format(new Date())+"/" + newFileName + "','')");
		}else if (user instanceof Company) {
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
					+ ",'"+request.getContextPath()+"/company/img/"+ ((Company) user).getCompanyLoginId() +"/"
						+new SimpleDateFormat("yyyyMMdd").format(new Date())+"/"+ newFileName + "','')");
		}
		
		out.println("</script>");
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
}
