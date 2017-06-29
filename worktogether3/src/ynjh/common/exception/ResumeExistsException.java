package ynjh.common.exception;

public class ResumeExistsException extends BaseException {
	public ResumeExistsException(){
		super("此用户简历已存在，不能再添加一份简历了");
	}

	
	
	
}
