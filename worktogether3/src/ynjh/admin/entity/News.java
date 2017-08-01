package ynjh.admin.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 最新资讯用到的新闻实体类
 * @author 牟勇
 *
 */
public class News implements Serializable {
	private static final long serialVersionUID = -320907160771180793L;
	private int id;
	private String newsTitle;//资讯标题
	private String newsContent;//资讯内容
	private Timestamp newsDate;//资讯创建时间
	private int adminId;//发表资讯的管理员id
	private int newsStatus;//资讯的状态：1.正常，2禁用
	private int newsClickNum;//点击数
	private int newsLikeNum;//点赞数
	private String adminName;//管理员的姓名
	private String newsType;
	
	public News() {
	}
	public News(String newsTitle, String newsContent, Timestamp newsDate, int adminId, int newsStatus) {
		this.newsTitle = newsTitle;
		this.newsContent = newsContent;
		this.newsDate = newsDate;
		this.adminId = adminId;
		this.newsStatus = newsStatus;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNewsType() {
		return newsType;
	}
	public void setNewsType(String newsType) {
		this.newsType = newsType;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	
	public Timestamp getNewsDate() {
		return newsDate;
	}
	public void setNewsDate(Timestamp newsDate) {
		this.newsDate = newsDate;
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public int getNewsStatus() {
		return newsStatus;
	}
	public void setNewsStatus(int newsStatus) {
		this.newsStatus = newsStatus;
	}
	
	
	public int getNewsClickNum() {
		return newsClickNum;
	}
	public void setNewsClickNum(int newsClickNum) {
		this.newsClickNum = newsClickNum;
	}
	public int getNewsLikeNum() {
		return newsLikeNum;
	}
	public void setNewsLikeNum(int newsLikeNum) {
		this.newsLikeNum = newsLikeNum;
	}
	
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	@Override
	public String toString() {
		return "News [id=" + id + ", newsTitle=" + newsTitle + ", newsContent=" + newsContent + ", newsDate=" + newsDate
				+ ", adminId=" + adminId + ", newsStatus=" + newsStatus + ", newsClickNum=" + newsClickNum
				+ ", newsLikeNum=" + newsLikeNum + ", adminName=" + adminName + ", newsType=" + newsType + "]";
	}
}
