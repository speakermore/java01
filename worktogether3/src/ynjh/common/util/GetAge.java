package ynjh.common.util;

import java.util.Calendar;
import java.util.Date;

import ynjh.common.exception.AgeOverFlowException;
/**
 * 牟勇：可以用来做两个日期之间差几年的计算
 * @author 刘志浩
 *
 */
public class GetAge {
	/**
	 * 牟勇：让一个日期换算为到今天为止的年份
	 * @param dateOfBirth 传入的一个日期
	 * @return 年份的整数
	 * @throws AgeOverFlowException 日期不能大于今天，如果大于，会抛出此异常
	 */
	public static int getAgeTools(Date dateOfBirth) throws AgeOverFlowException {
        int age = 0;
        Calendar born = Calendar.getInstance();
        Calendar now = Calendar.getInstance();
        if (dateOfBirth != null) {
            now.setTime(new Date());
            born.setTime(dateOfBirth);
            //如果参数日期比今天大，则抛出异常
            if (born.after(now)) {
					throw new AgeOverFlowException();
            }
            age = now.get(Calendar.YEAR) - born.get(Calendar.YEAR);
            //牟勇：为防止年份计算出现负数，特增加这个判断
            if(age>0){
	            int nowDayOfYear = now.get(Calendar.DAY_OF_YEAR);
	            int bornDayOfYear = born.get(Calendar.DAY_OF_YEAR);
	            System.out.println("nowDayOfYear:" + nowDayOfYear + " bornDayOfYear:" + bornDayOfYear);
	            if (nowDayOfYear < bornDayOfYear) {
	                age -= 1;
	            }
            }
        }
        return age;
    }
}
