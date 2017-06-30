package ynjh.admin.entity;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * 用户操作日志 
 * @author 朱吉
 *
 */
public class UserLog implements Serializable{
	
	private static final long serialVersionUID = 8602961827396215712L;
	private Integer id;
	private Integer userId;	//用户id
	private Integer userDo; //1:登录2：退出3：点赞4：评论 5：发表文章6：发表简历7：查看8：企业发表新闻9：企业发表招聘信息10：企业推送offer11：密码重置
	private Integer userTargetType;//对象类型 1：个人用户2：企业用户3：招聘信息4：文章5：新闻6：企业offer 7:评论8：点赞9：简历
	private Integer userAid;//操作对象id
	private Timestamp userTime;//操作时间
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getUserDo() {
		return userDo;
	}
	public void setUserDo(Integer userDo) {
		this.userDo = userDo;
	}
	public Integer getUserTargetType() {
		return userTargetType;
	}
	public void setUserTargetType(Integer userTargetType) {
		this.userTargetType = userTargetType;
	}
	public Integer getUserAid() {
		return userAid;
	}
	public void setUserAid(Integer userAid) {
		this.userAid = userAid;
	}
	public Timestamp getUserTime() {
		return userTime;
	}
	public void setUserTime(Timestamp userTime) {
		this.userTime = userTime;
	}
	public Integer getId() {
		return id;
	}
	@Override
	public String toString() {
		return "UserLog [id=" + id + ", userId=" + userId + ", userDo=" + userDo + ", userTargetType=" + userTargetType
				+ ", userAid=" + userAid + ", userTime=" + userTime + "]";
	}
	
	
}
