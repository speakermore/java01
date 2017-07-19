package ynjh.common.exception;

public class ResumeExistsException extends BaseException {
	private static final long serialVersionUID = -4648706913370563875L;

	public ResumeExistsException(){
		super("此用户简历已存在，不能再添加一份简历了");
	}

	
	
	
}
