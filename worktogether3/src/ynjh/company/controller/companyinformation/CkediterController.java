package ynjh.company.controller.companyinformation;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import ynjh.admin.entity.Admin;
import ynjh.company.entity.Company;
import ynjh.personal.entity.User;

/**
 * 
 * @author 黄冰雁 Ckediter的图片上传
 *
 */

@Controller
public class CkediterController {
	@RequestMapping("ckeditor/upload")
	public void upload(MultipartFile upload, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");  
		try {
			// 重命名文件名
			Company company = null;
			User user = null;
			String path = session.getServletContext().getRealPath("WEB-INF/resources/img/");
			if (session.getAttribute("user") == null && session.getAttribute("admin") == null) {
				return;
			}
			if (session.getAttribute("user") instanceof Company) {
				company = (Company) session.getAttribute("user");
				path = path + "company/" + company.getId();
			} else if (session.getAttribute("user") instanceof User) {
				user = (User) session.getAttribute("user");
				path = path + "personal/" + user.getId();
			} else if (session.getAttribute("admin") != null) {
				Admin admin = (Admin) session.getAttribute("admin");
				path = path + "admin/" + admin.getId();
			}
			String oldFileName = upload.getOriginalFilename();
			String suffix = "." + FilenameUtils.getExtension(oldFileName);
			String newFileName = System.currentTimeMillis() + RandomUtils.nextInt(1000) + suffix;
			String uploadContentType = upload.getContentType(); // 文件类型
			String callback = request.getParameter("CKEditorFuncNum");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();

			if (uploadContentType.equals("image/pjpeg") || uploadContentType.equals("image/jpeg")) {
				// IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
				oldFileName = ".jpg";
			} else if (uploadContentType.equals("image/png") || uploadContentType.equals("image/x-png")) {
				// IE6上传的png图片的headimageContentType是"image/x-png"
				oldFileName = ".png";
			} else if (uploadContentType.equals("image/gif")) {
				oldFileName = ".gif";
			} else if (uploadContentType.equals("image/bmp")) {
				oldFileName = ".bmp";
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("window.parent.CKEDITOR.tools.callFunction(" + oldFileName + ",'',"
						+ "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");
				out.println("</script>");

			}
			if (upload.getSize() > 1024 * 1024 * 2) {
				out.println("<script type=\"text/javascript\">");
				out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件大小不得大于2M');");
				out.println("</script>");

			}
			// 创建File,并且服务器上创建实际存在的文件
			File newupload = new File(path + "/" + newFileName);
			if (!newupload.exists()) {
				System.out.println(newupload.mkdirs());
			}

			// 将imgpath写到磁盘上
			upload.transferTo(newupload);
			out.println("<script>");
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'"
					+path.substring(path.indexOf("/img/")) + "/" + newFileName + "','')");
			out.println("</script>");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
