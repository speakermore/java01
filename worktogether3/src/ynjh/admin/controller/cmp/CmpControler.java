package ynjh.admin.controller.cmp;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ynjh.company.entity.Company;
import ynjh.company.service.CompanyService;

/**
 * 用于后台公司信息管理员的控制器
 * 充值，扣费都是在这里完成
 * @author 牟勇
 *
 */
@Controller
@RequestMapping("/admin/cmp")
public class CmpControler {
	@Resource
	private CompanyService companyService;
	/**
	 * 公司信息管理页面，目前在这个页面可以进行充值
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/find_all",method=RequestMethod.GET)
	public String findAll(HttpServletRequest request){
		List<Company> companies=companyService.findAllCompany();
		request.setAttribute("companies", companies);
		return "admin/cmp/company_manage_index";
	}
	/**
	 * 完成充值的计算，并对用户的充值行为进行了记录
	 * @param money 需要充值的金额
	 * @param companyId 企业用户的主键
	 * @param adminId 做此操作的管理员主键
	 * @return ajax方法，提交充值成功与否的提示信息
	 */
	@RequestMapping(value="/charge")
	@ResponseBody
	public String charge(Integer money,Integer companyId,Integer adminId){
		Integer result=companyService.updateAdminCharging(money, companyId,adminId);
		StringBuffer info=new StringBuffer();
		if(result>0){
			info.append("充值"+money+"成功！请用户检查余额");
		}else{
			info.append("充值失败，请联系技术人员！");
		}
		return info.toString();
	}
}
