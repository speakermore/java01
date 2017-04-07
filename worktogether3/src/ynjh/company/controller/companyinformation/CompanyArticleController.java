package ynjh.company.controller.companyinformation;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
import ynjh.company.service.CompanyArticleService;
import ynjh.personal.entity.Article;


@Controller
@RequestMapping("/article")
public class CompanyArticleController {
	@Resource
	private CompanyArticleService companyArticleService;
	
	@RequestMapping(value="/add_article",method=RequestMethod.GET)
	public String addArticle(){
		return "add_article";
	}
	
	@RequestMapping(value="/add_article",method=RequestMethod.POST)
	public ModelAndView addArticle(Article article,HttpSession session){
		Company company=(Company)session.getAttribute("company");
		article.setArticleId(company.getCompanyId());
		article.setArticleTime(new Timestamp(System.currentTimeMillis()));
		
		int result=companyArticleService.addArticle(article);
		ModelAndView mView=new ModelAndView();
		if (result>0) {
			mView.setViewName("info");
			mView.addObject("operatorInfo", "文章添加成功！");
			mView.addObject("toPage","find/1");
		}else {
			mView.addObject("operatorInfo", "文章添加失败！");
			mView.setViewName("redirect:add_article");//用视图的方式调用方法
		}
		return mView;
	}
}
