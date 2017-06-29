package ynjh.common.exception;

public class BaseException extends Exception {
	private static final long serialVersionUID = -1063534979198149253L;
	public BaseException(String msg) {
		super(msg);
	}
	@Override
	public String toString() {
		return "<center>错误： ["+this.getMessage()+"]<center>";
	}
}
