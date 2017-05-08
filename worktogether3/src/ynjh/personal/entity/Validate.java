package ynjh.personal.entity;

import java.util.Date;

/**
 * 验证码
 * @author 朱吉
 *
 */
public class Validate {
	
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
