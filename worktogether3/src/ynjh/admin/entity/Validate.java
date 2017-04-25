package ynjh.admin.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 用于传递验证码
 * @author 朱吉
 *
 */
public class Validate implements Serializable {
	
	private Date generateTime;//验证码生成时间
	private StringBuilder vCodeString;//验证码
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
