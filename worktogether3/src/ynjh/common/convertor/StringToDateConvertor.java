package ynjh.common.convertor;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.core.convert.converter.Converter;

/**
 * 完成字符串到Timestamp的类型转换器
 * @author 牟勇
 *
 */
public class StringToDateConvertor implements Converter<String, Timestamp> {
	private String[] datePattners;
	
	
	public StringToDateConvertor(String[] datePattners) {
		this.datePattners = datePattners;
	}


	@Override
	public Timestamp convert(String stringDate) {
		
		try {
			for(String datePattner:datePattners){
				return new Timestamp(new SimpleDateFormat(datePattner).parse(stringDate).getTime());
			}
		} catch (ParseException e) {
			e.printStackTrace();
			throw new RuntimeException("日期字符串的格式不对"+stringDate);
		}
		return new Timestamp(System.currentTimeMillis());
	}

}
