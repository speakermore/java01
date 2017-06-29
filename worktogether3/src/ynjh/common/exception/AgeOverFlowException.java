package ynjh.common.exception;

public class AgeOverFlowException extends Exception {
	
	private static final long serialVersionUID = 5260376309335026508L;

	public AgeOverFlowException(){
		super("年龄不能超过当前日期");
	}
}
