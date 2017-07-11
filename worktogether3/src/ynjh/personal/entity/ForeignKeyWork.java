package ynjh.personal.entity;

import java.io.Serializable;
/**
 * 工作记录的外键查询
 * @author dage
 *
 */
public class ForeignKeyWork extends Work implements Serializable{
	private static final long serialVersionUID = -5405206386528653821L;
	//简历标题
	private String resumeTitle;

	public String getResumeTitle() {
		return resumeTitle;
	}

	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}

	@Override
	public String toString() {
		return "ForeignKeyWork [resumeTitle=" + resumeTitle + "]";
	}
	
	
}
