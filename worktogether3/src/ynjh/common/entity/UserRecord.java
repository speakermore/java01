package ynjh.common.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
/**
 * 为了完成扣费，设计的用户记录实体类<br />
 * 这个表将记录个人用户和企业用户关于招应聘，技术众筹，合伙创业的操作信息<br />
 * 操作类型分为发布（0）和参与（1）还有管理员充值(2)<br />
 * recruitId是招聘表的id，用来分岗位记录招聘的开始和结束
 * userId必须是企业和个人用户的id号<br />
 * 技术众筹是crowdfund的id<br />
 * 合伙创业是partner的id<br />
 * @author 牟勇
 *
 */
public class UserRecord implements Serializable {
	private static final long serialVersionUID = -346471259908126907L;
	private Integer id;
	//用户ID，大于1234567890为个人用户，小于则为企业用户,只能是个人和企业，不要记录管理员
	private Integer userId;
	//用户操作有以下的系统固定字符：开始应聘，开始招聘，结束应聘，结束招聘，开始发布众筹，结束发布众筹，开始发布合伙，结束发布合伙，开始参与众筹，结束参与众筹，开始参与合伙，结束参与众筹
	private String userrOperator;
	//招聘信息主键
	private Integer recruitId;
	//此操作执行的时间
	private Timestamp userrTime;
	
	//用户操作的类型：0.发布，1.参与
	private Integer userrOpType;
	//扣费额度
	private Integer userrMoney;
	//用户操作的说明，如果有管理员的操作（比如管理员充值），则把管理员的id放到说明中
	private String userrMem;
	public UserRecord() {
		
	}
	
	public UserRecord(Integer userId, String userrOperator, Integer recruitId, Timestamp userrTime, Integer userrOpType,
			Integer userrMoney, String userrMem) {
		super();
		this.userId = userId;
		this.userrOperator = userrOperator;
		this.recruitId = recruitId;
		this.userrTime = userrTime;
		this.userrOpType = userrOpType;
		this.userrMoney = userrMoney;
		this.userrMem = userrMem;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRecruitId() {
		return recruitId;
	}
	public void setRecruitId(Integer recruitId) {
		this.recruitId = recruitId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserrOperator() {
		return userrOperator;
	}
	public void setUserrOperator(String userrOperator) {
		this.userrOperator = userrOperator;
	}
	public Timestamp getUserrTime() {
		return userrTime;
	}
	public void setUserrTime(Timestamp userrTime) {
		this.userrTime = userrTime;
	}
	
	public Integer getUserrOpType() {
		return userrOpType;
	}
	public void setUserrOpType(Integer userrOpType) {
		this.userrOpType = userrOpType;
	}
	
	public Integer getUserrMoney() {
		return userrMoney;
	}
	public void setUserrMoney(Integer userrMoney) {
		this.userrMoney = userrMoney;
	}
	
	public String getUserrMem() {
		return userrMem;
	}
	public void setUserrMem(String userrMem) {
		this.userrMem = userrMem;
	}
	/**
	 * 按yyyy-MM-dd HH时mm分ss秒格式返回的时间
	 * @return 指定格式的用户操作时间
	 */
	public String getTextedUserrTime(){
		return new SimpleDateFormat("yyyy-MM-dd HH时mm分ss秒").format(userrTime);
	}
	@Override
	public String toString() {
		return "UserRecord [id=" + id + ", userId=" + userId + ", userrOperator=" + userrOperator + ", recruitId="
				+ recruitId + ", userrTime=" + userrTime + ", userrOpType=" + userrOpType + ", userrMoney=" + userrMoney
				+ ", userrMem=" + userrMem + "]";
	}
	
}
