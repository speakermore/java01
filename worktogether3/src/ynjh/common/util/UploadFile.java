package ynjh.common.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadFile {

	/**
	 * 上传文件公共类
	 * @param userPath:图片保存的文件夹路径
	 * @param files
	 * @param session
	 * @return
	 * 
	 * 		String
	 */
	public static String[] uploadFile(String userPath,MultipartFile[] files, HttpSession session) {
		// 重命名文件名
		String path = session.getServletContext().getRealPath(userPath);
		String[] newFileNames=new String[files.length];
		for(int i=0;i<files.length;i++){
		// 拿到后缀名
		String oldFileName = files[i].getOriginalFilename();
		String suffix = "." + FilenameUtils.getExtension(oldFileName);
		String newFileName = System.currentTimeMillis() + RandomUtils.nextInt(10000) + suffix;
		newFileNames[i]=new SimpleDateFormat("yyyyMMdd").format(new Date())+"/"+newFileName;
		// 创建file，并且服务器三创建实际存在的文件
		File upload = new File(path + "/" + newFileName);
		if (!upload.exists()) {
			upload.mkdirs();
		}
		// 将imgPath写到磁盘上
		try {
			files[i].transferTo(upload);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
		return newFileNames;
	}
	
	public static String getUserImgPath(String userPath,String userLoginId){
		return userPath+"/"+userLoginId+"/"+new SimpleDateFormat("yyyyMMdd").format(new Date());
	}
}
