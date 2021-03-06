package ynjh.personal.entity;

import java.io.Serializable;
/**
 * 项目记录的外键查询
 * @author dage
 *
 */
public class ForeignKeyProject extends Project implements Serializable{
	private static final long serialVersionUID = 6537944467613059865L;
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
		return "ForeignKeyProject [resumeTitle=" + resumeTitle + "]";
	}
	
	
}
