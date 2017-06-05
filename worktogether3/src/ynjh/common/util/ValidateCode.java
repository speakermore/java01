package ynjh.common.util;

import java.util.Date;

/**
 * 用于傳遞驗證碼
 * @author 朱吉
 *
 */
public class ValidateCode {
	
	private Date generateTime;
	private StringBuilder vCodeString;
	private byte[] vCodeBytes;
	
	public Date getGenerateTime() {
		return generateTime;
	}
	public void setGenerateTime(Date generateTime) {
		this.generateTime = generateTime;
	}
	public StringBuilder getvCodeString() {
		return vCodeString;
	}
	public void setvCodeString(StringBuilder vCodeString) {
		this.vCodeString = vCodeString;
	}
	public byte[] getvCodeBytes() {
		return vCodeBytes;
	}
	public void setvCodeBytes(byte[] vCodeBytes) {
		this.vCodeBytes = vCodeBytes;
	}
	
}
