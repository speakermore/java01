package ynjh.common.exception;

public class ResumeExistsException extends Exception {
	public ResumeExistsException(){
		super("此用户简历已存在，不能再添加一份简历了");
	}

	@Override
	public String toString() {
		return "<center>错误： ["+this.getMessage()+"]<center>";
	}
	
	
}
