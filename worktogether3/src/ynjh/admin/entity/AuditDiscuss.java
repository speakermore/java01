package ynjh.admin.entity;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * 审核用户评价，与数据库无关联
 * @author 牟勇
 *
 */
public class AuditDiscuss implements Serializable {
		// id
		private Integer id;
		//发送者 1：企业id 2：个人用户id
		private Integer discussUsersId;
		// 评论内容
		private String discussContent;
		// 评论星级 1：1星 2：2星 3：3星 4：4星 5：5星
		private Integer discussLevel;
		// 评论时间
		private Timestamp discussTime;
		// 评论状态1:待审 2：正常 3：审核不通过 4：隐藏
		private Integer discussStatus;
		// 1：企业id 2：个人用户id
		private Integer discussUsersType;
		//被发送者id
		private Integer discussBySendId;
		//被评价用户姓名
		private String userName;
		//被评价公司名称
		private String companyName;
		//评价者姓名
		private String discussUserName;
		public AuditDiscuss() {
			super();
		}
		public AuditDiscuss(Integer discussUsersId, String discussContent, Integer discussLevel, Timestamp discussTime,
				Integer discussStatus, Integer discussUsersType, Integer discussBySendId, String userName,
				String companyName) {
			super();
			this.discussUsersId = discussUsersId;
			this.discussContent = discussContent;
			this.discussLevel = discussLevel;
			this.discussTime = discussTime;
			this.discussStatus = discussStatus;
			this.discussUsersType = discussUsersType;
			this.discussBySendId = discussBySendId;
			this.userName = userName;
			this.companyName = companyName;
		}
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public Integer getDiscussUsersId() {
			return discussUsersId;
		}
		public void setDiscussUsersId(Integer discussUsersId) {
			this.discussUsersId = discussUsersId;
		}
		public String getDiscussContent() {
			return discussContent;
		}
		public void setDiscussContent(String discussContent) {
			this.discussContent = discussContent;
		}
		public Integer getDiscussLevel() {
			return discussLevel;
		}
		public void setDiscussLevel(Integer discussLevel) {
			this.discussLevel = discussLevel;
		}
		public Timestamp getDiscussTime() {
			return discussTime;
		}
		public void setDiscussTime(Timestamp discussTime) {
			this.discussTime = discussTime;
		}
		public Integer getDiscussStatus() {
			return discussStatus;
		}
		public void setDiscussStatus(Integer discussStatus) {
			this.discussStatus = discussStatus;
		}
		public Integer getDiscussUsersType() {
			return discussUsersType;
		}
		public void setDiscussUsersType(Integer discussUsersType) {
			this.discussUsersType = discussUsersType;
		}
		public Integer getDiscussBySendId() {
			return discussBySendId;
		}
		public void setDiscussBySendId(Integer discussBySendId) {
			this.discussBySendId = discussBySendId;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getCompanyName() {
			return companyName;
		}
		public void setCompanyName(String companyName) {
			this.companyName = companyName;
		}
		
		
		public String getDiscussUserName() {
			return discussUserName;
		}
		public void setDiscussUserName(String discussUserName) {
			this.discussUserName = discussUserName;
		}
		@Override
		public String toString() {
			return "AuditDiscuss [id=" + id + ",discussUserName"+discussUserName+", discussUsersId=" + discussUsersId + ", discussContent="
					+ discussContent + ", discussLevel=" + discussLevel + ", discussTime=" + discussTime
					+ ", discussStatus=" + discussStatus + ", discussUsersType=" + discussUsersType
					+ ", discussBySendId=" + discussBySendId + ", userName=" + userName + ", companyName=" + companyName
					+ "]";
		}
		
		
		
}
