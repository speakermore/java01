package ynjh.admin.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
/**
 * 管理员日志，与adminLog表对应
 * @author 朱吉
 *
 */
public class AdminLog implements Serializable{
	private Integer id;
	private Integer adminLoginId;//管理员登录名
	private Integer adminDo;//操作类型：1:审核2:禁用3：密码重置4信息维护，5登录退出
	private Integer adminTargetType;//对象类型：1：个人用户2：企业用户3：招聘信息4：文章5：新闻6：企业offer 7:评论8：点赞9：简历
	private Integer adminAid;//操作对象ID
	private Timestamp adminTime;//操作时间
	public int getAdminLoginId() {
		return adminLoginId;
	}
	public void setAdminLoginId(int adminLoginId) {
		this.adminLoginId = adminLoginId;
	}
	public int getAdminDo() {
		return adminDo;
	}
	public void setAdminDo(int adminDo) {
		this.adminDo = adminDo;
	}
	public int getAdminTargetType() {
		return adminTargetType;
	}
	public void setAdminTargetType(int adminTargetType) {
		this.adminTargetType = adminTargetType;
	}
	public int getAdminAid() {
		return adminAid;
	}
	public void setAdminAid(int adminAid) {
		this.adminAid = adminAid;
	}
	public Date getAdminTime() {
		return adminTime;
	}
	public void setAdminTime(Timestamp adminTime) {
		this.adminTime = adminTime;
	}
	public int getId() {
		return id;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getAdminLoginId()+"--"+this.getAdminDo();
	}
	
	
	
}
