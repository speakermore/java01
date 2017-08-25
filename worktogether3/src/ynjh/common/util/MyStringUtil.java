package ynjh.common.util;

/**
 * 我自己总结的，一些关于字符串处理的通用方法
 * @author 牟勇
 *
 */
public class MyStringUtil {
	/**
	 * 将一个字符串的中间指定部分替换为星号的方法<br />
	 * 替换开始的位置应该从0开始，不应该是负数。<br />
	 * 替换结束的位置应该小于字符字符串本身的长度<br />
	 * @param old 需要被替换的字符串
	 * @param start 替换开始的位置，从0开始（此位置也会被替换为星号）
	 * @param end 替换结束的位置，此位置应该小于字符串本身的长度
	 * @return 替换之后的结果字符串
	 */
	public static String replaceStart(String old,Integer start,Integer end){
		StringBuffer sb=new StringBuffer(old);
		for(int i=start;i<=end;i++){
			sb.replace(i, i+1, "*");
		}
		return sb.toString();
	}
}
