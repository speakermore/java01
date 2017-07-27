package ynjh.common.controller.expenses;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import ynjh.common.entity.UserRecord;
import ynjh.common.service.UserRecordService;

/**
 * 费用的通用控制器
 * @author 牟勇
 *
 */
@Controller
@RequestMapping("/common/expenses")
public class ExpensesController {
	@Resource
	private UserRecordService userRecordService;
	/**
	 * ajax方法，完成应聘开始结束，众筹开始结束，创业合伙开始结束的业务调用<br />
	 * 收集相关信息,调用charging方法，完成用户状态的修改，余额的结算
	 * @param column 要修改状态的字段名
	 * @param value 要修改的值
	 * @return 显示给用户的信息
	 */
	@RequestMapping(value="/charging",method=RequestMethod.POST)
	@ResponseBody
	public Object charging(String column,Integer value,UserRecord userRecord,HttpSession session){
		Object user=session.getAttribute("user");
		Map<String,String> status=userRecordService.charging(column, value, userRecord,user);
		return JSON.toJSON(status);
	}
}
