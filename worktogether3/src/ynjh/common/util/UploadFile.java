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
	 * @author 刘志浩
	 * 上传文件公共类
	 * 支持多文件上传，将一组文件保存在指定的文件夹路径下
	 * <p>牟勇：此方法可以完成对文件的上传，文件保存在一个指定的路径下面。
	 * 文件名取当前系统时间的毫秒数+四位随机数
	 * 为了更好的避免重名问题，本方法还会按年月日为每一组上传的文件添加一个yyyyMMdd为格式的文件夹
	 * 在页面上显示时，绝对路径应该是userPath/返回值[下标]</p>
	 * @param userPath:用户指定的图片保存的文件夹路径
	 * @param files 数组，已上传的文件
	 * @param session 用于获得服务器保存上传文件的路径
	 * @return 上传成功的一组文件名，包含一个yyyyMMdd为格式的文件夹路径
	 * 
	 *
	 */
	public static String[] uploadFile(String userPath,MultipartFile[] files, HttpSession session) {
		// 重命名文件名
		String path = session.getServletContext().getRealPath(userPath);
		String[] newFileNames=new String[files.length];
		for(int i=0;i<files.length;i++){
			//判断文件实际有没有传到服务器
			if(files[i].getSize()>0){
				// 拿到后缀名
				String oldFileName = files[i].getOriginalFilename();
				String suffix = "." + FilenameUtils.getExtension(oldFileName);
				String newFileName = System.currentTimeMillis() + RandomUtils.nextInt(10000) + suffix;
				newFileNames[i]=new SimpleDateFormat("yyyyMMdd").format(new Date())+"/"+newFileName;
				// 创建file，并且服务器上创建实际存在的文件
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
			}else{
				newFileNames[i]=null;//牟勇：如果没有文件上传，就把文件名置null
			}
		}
		return newFileNames;
	}
	/**
	 * 牟勇：自用的上传文件路径的拼接
	 * 按userPath/userLoginId/yyyyMMdd/获得文件前面部分的路径
	 * 其中yyyyMMdd是当前的日期格式
	 * @param userPath 用户指定的文件夹路径
	 * @param userLoginId 用户的登录名，在本系统中为手机号码
	 * @return 拼接好的文件路径
	 */
	public static String getUserImgPath(String userPath,String userLoginId){
		return userPath+"/"+userLoginId+"/"+new SimpleDateFormat("yyyyMMdd").format(new Date());
	}
}
