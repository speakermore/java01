package ynjh.personal.entity;

import java.io.Serializable;
/**
 * 教育记录的外键查询
 * @author dage
 *
 */
public class ForeignKeyEducation extends Education implements Serializable{
	private static final long serialVersionUID = 922436020141943884L;
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
		return "ForeignKeyEducation [resumeTitle=" + resumeTitle + "]";
	}
	
	
}
