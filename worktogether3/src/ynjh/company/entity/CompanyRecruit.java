package ynjh.company.entity;

import java.sql.Timestamp;

public class CompanyRecruit {
	private Integer id;//����
	private Integer companyId;//��˾���
	private String cpmRecTitle;//��˾����
	private String cpmRecWage;//��˾н��
	private String cpmRecEducation;//��˾ѧ������
	private String cmpRecExperience;//�������輼�ܼ�ˮƽ����
	private Integer cmpRecPeople;//��������
	private Timestamp cmpRecTime;//����ʱ��
	private Integer cmpRecStatus;//������Ƹ��Ϣ״̬1:���� 2�����ͨ�� 3����˲�ͨ��
	public CompanyRecruit(){
		
	}
	
	public CompanyRecruit(Integer id, Integer companyId, String cpmRecTitle,
			String cpmRecWage, String cpmRecEducation, String cmpRecExperience,
			Integer cmpRecPeople, Timestamp cmpRecTime, Integer cmpRecStatus) {
		super();
		this.id = id;
		this.companyId = companyId;
		this.cpmRecTitle = cpmRecTitle;
		this.cpmRecWage = cpmRecWage;
		this.cpmRecEducation = cpmRecEducation;
		this.cmpRecExperience = cmpRecExperience;
		this.cmpRecPeople = cmpRecPeople;
		this.cmpRecTime = cmpRecTime;
		this.cmpRecStatus = cmpRecStatus;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getCpmRecTitle() {
		return cpmRecTitle;
	}
	public void setCpmRecTitle(String cpmRecTitle) {
		this.cpmRecTitle = cpmRecTitle;
	}
	public String getCpmRecWage() {
		return cpmRecWage;
	}
	public void setCpmRecWage(String cpmRecWage) {
		this.cpmRecWage = cpmRecWage;
	}
	public String getCpmRecEducation() {
		return cpmRecEducation;
	}
	public void setCpmRecEducation(String cpmRecEducation) {
		this.cpmRecEducation = cpmRecEducation;
	}
	public String getCmpRecExperience() {
		return cmpRecExperience;
	}
	public void setCmpRecExperience(String cmpRecExperience) {
		this.cmpRecExperience = cmpRecExperience;
	}
	public Integer getCmpRecPeople() {
		return cmpRecPeople;
	}
	public void setCmpRecPeople(Integer cmpRecPeople) {
		this.cmpRecPeople = cmpRecPeople;
	}
	public Timestamp getCmpRecTime() {
		return cmpRecTime;
	}
	public void setCmpRecTime(Timestamp cmpRecTime) {
		this.cmpRecTime = cmpRecTime;
	}
	public Integer getCmpRecStatus() {
		return cmpRecStatus;
	}
	public void setCmpRecStatus(Integer cmpRecStatus) {
		this.cmpRecStatus = cmpRecStatus;
	}
	@Override
	public String toString() {
		return "Company [id=" + id + ", companyId=" + companyId
				+ ", cpmRecTitle=" + cpmRecTitle + ", cpmRecWage=" + cpmRecWage
				+ ", cpmRecEducation=" + cpmRecEducation
				+ ", cmpRecExperience=" + cmpRecExperience + ", cmpRecPeople="
				+ cmpRecPeople + ", cmpRecTime=" + cmpRecTime
				+ ", cmpRecStatus=" + cmpRecStatus + "]";
	}
	
}
