package ynjh.common.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 各种状态值常量数组,用于在页面显示状态的内容，省去判断语句
 * @author 牟勇
 *
 */
public class CommonStatus {
	/**
	 * 0：企业基本信息激活，用于页面手风琴切换时，哪一栏设置active的标志
	 */
	public static final Integer EDIT_COMPANY_BASE_INFO=0;
	/**
	 * 1：企业环境图片激活，用于页面手风琴切换时，哪一栏设置active的标志
	 */
	public static final Integer EDIT_COMPANY_ENVRIMENT_PIC=1;
	/**
	 * 2:企业详细资料激活,用于页面手风琴切换时，哪一栏设置active的标志
	 */
	public static final Integer EDIT_COMPANY_DETIAL_INFO=2;
	/**
	 * 性别
	 * 0."女",1."男"
	 */
	public static final String[] SEX={"女","男"};
	
	/**
	 * 审核状态
	 * 0."",1."待审核",2."审核通过",3."审核不通过",4."已删除"
	 */
	public static final String[] AUDIT_STATUS={"","待审核","审核通过","审核不通过","已删除/隐藏"};
	
	/**
	 * 用户类型
	 * 0."",1."企业",2."个人"
	 */
	public static final String[] USER_TYPE={"","企业","个人"};
	
	/**
	 * 婚配
	 * 0."未婚",1."已婚"
	 */
	public static final String[] MARRY={"未婚","已婚"};
	//婚姻状况2
	public static final String[] MARRIAGE={"未婚","已婚"};
	/**
	 * 企业类型
	 * 0."",1."政府机构",2."国有企业",3."民营企业",4."其他"
	 */
	public static final String[] COMPANY_TYPE={"","政府机构","国有企业","民营企业","其他"};
	//
	/**
	 * 企业规模
	 * 0."",1."20人",2."50人",3."80人",4."100人",5."150人",6."200人",7."200人以上"
	 */
	public static final String[] COMPANY_SIZE={"","20人","50人","80人","100人","150人","200人","200人以上"};
	//外语水平
	public static final String[] FL_ABILITY={"","入门","一般","熟练","精通"};
	//外语类型
	public static final String[] FL_TYPE={"","英语","日语","德语","法语","俄语","西班牙语","丹麦语","其他"};
	//外语等级
	public static final String[] ENGLISH_GRADE={"","国家英语考试3级","国家英语考试4级","国家英语考试6级","专业4级","专业8级","未参加","未通过"};
	//计算机水平
	public static final String[] COMPUTER_ABILITY={"","入门","一般","熟练","精通"};
	//账号状态
	public static final String[] USER_STATUS={"","正常","禁用"};
	//管理员帐号状态
	public static final String[] ADMIN_STATUS={"已禁用","正常"};
	//管理员在线状态
	public static final String[] ADMIN_STATUS_NOW={"下线","在线"};
	//
	/**
	 * 新闻资讯状态
	 * "","",2."禁用","","","","","","",9."正常",10."置顶"
	 */
	public static final String[] NEWS_STATUS={"","","禁用","","","","","","","正常","置顶"};
	/**
	 * 投递简历的状态
	 * 1.尚未阅读 2.接受简历 3.拒绝简历 4.已阅读
	 */
	public static final String[] RESUME_STATUS={"","尚未阅读","接受简历","拒绝简历","已阅读"};
	/**
	 * 应聘状态：{"未应聘","应聘中"}
	 */
	public static final String[] USER_RECRUIT_STATUS={"未应聘","应聘中"};
	/**
	 * 招聘状态：{"未招聘","招聘中"}
	 */
	public static final String[] COMPANY_RECRUIT_STATUS={"未招聘","招聘中"};
	/**
	 * 众筹状态：{"未众筹","发布众筹中"}
	 */
	public static final String[] USER_CROWDFUND_STATUS={"未众筹","众筹中"};
	/**
	 * 合伙状态：{"未合伙","发布合伙中"}
	 */
	public static final String[] USER_PARTNER_STATUS={"未合伙","合伙中"};
	
	/**
	 * 字段名称转说明文字：开始状态
	 */
	public static final Map<String,String> USER_START_STATUS_DISCRIPTION=new HashMap<String,String>();
	/**
	 * 字段名称转说明文字：状态名称
	 */
	public static final Map<String, String> USER_STATUS_DISCRIPTION=new HashMap<String,String>();
	/**
	 * 字段名称转说明文字：结束状态
	 */
	public static final Map<String, String> USER_END_STATUS_DISCRIPTION=new HashMap<String,String>();
	/**
	 * 计算规则：每种扣费的基本额度，按天计费
	 */
	public static final Map<String, Integer> EXPENSES_CALC_BASE_MONEY=new HashMap<String,Integer>();
	/**
	 * 操作类型：两个操作类型，0.发布，1.参与，2.充值
	 */
	public static final Map<String, Integer> USER_OP_TYPE=new HashMap<String,Integer>();
	static{
		USER_STATUS_DISCRIPTION.put("userIsRecruit", "应聘");
		USER_STATUS_DISCRIPTION.put("userIsCrowdFund", "众筹");
		USER_STATUS_DISCRIPTION.put("userIsPartner", "合伙");
		
		USER_START_STATUS_DISCRIPTION.put("userIsRecruit", "开始应聘");
		USER_START_STATUS_DISCRIPTION.put("userIsCrowdFund", "开始发布众筹");
		USER_START_STATUS_DISCRIPTION.put("userIsPartner", "开始发布合伙");
		
		USER_END_STATUS_DISCRIPTION.put("userIsRecruit", "结束应聘");
		USER_END_STATUS_DISCRIPTION.put("userIsCrowdFund", "结束发布众筹");
		USER_END_STATUS_DISCRIPTION.put("userIsPartner", "结束发布合伙");
		
		EXPENSES_CALC_BASE_MONEY.put("userIsRecruit", 1);
		EXPENSES_CALC_BASE_MONEY.put("userIsCrowdFund", 10);
		EXPENSES_CALC_BASE_MONEY.put("userIsPartner", 10);
		
		USER_OP_TYPE.put("userIsRecruit", 1);
		USER_OP_TYPE.put("userIsCrowdFund", 0);
		USER_OP_TYPE.put("userIsPartner", 0);
		USER_OP_TYPE.put("管理员充值", 2);
		
		
	}
}
