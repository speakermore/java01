package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class UserCharge implements Serializable {
	private Integer id;// id
	private Integer userId;// 用户id
	private Timestamp userChargeTime;// 充值时间
	private Double userChargeMoney;// 充值金额
	private Integer userChargeType;// 消费类型1.收入2.支出
	private String userChargeContent;// 充值说明

	public UserCharge() {

	}

	public UserCharge(Integer id, Integer userId, Timestamp userChargeTime, Double userChargeMoney, Integer userChargeType,
			String userChargeContent) {
		super();
		this.id = id;
		this.userId = userId;
		this.userChargeTime = userChargeTime;
		this.userChargeMoney = userChargeMoney;
		this.userChargeType = userChargeType;
		this.userChargeContent = userChargeContent;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Timestamp getUserChargeTime() {
		return userChargeTime;
	}

	public void setUserChargeTime(Timestamp userChargeTime) {
		this.userChargeTime = userChargeTime;
	}

	public Double getUserChargeMoney() {
		return userChargeMoney;
	}

	public void setUserChargeMoney(Double userChargeMoney) {
		this.userChargeMoney = userChargeMoney;
	}

	public Integer getUserChargeType() {
		return userChargeType;
	}

	public void setUserChargeType(Integer userChargeType) {
		this.userChargeType = userChargeType;
	}

	public String getUserChargeContent() {
		return userChargeContent;
	}

	public void setUserChargeContent(String userChargeContent) {
		this.userChargeContent = userChargeContent;
	}

	@Override
	public String toString() {
		return "UserCharge [id=" + id + ", userId=" + userId + ", userChargeTime=" + userChargeTime
				+ ", userChargeMoney=" + userChargeMoney + ", userChargeType=" + userChargeType + ", userChargeContent="
				+ userChargeContent + "]";
	}

}
