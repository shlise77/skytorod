package com.test.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.domain.CategoryVO;
import com.test.domain.CountryVO;
import com.test.domain.JoinOne;
import com.test.domain.JoinThree;
import com.test.domain.JoinTwo;
import com.test.service.AdminService;
import com.test.service.CategoryService;
import com.test.service.CboardService;
import com.test.service.CountryService;
import com.test.service.FollowService;
import com.test.service.JoinService;
import com.test.service.ScrollBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private ScrollBoardService servicescroll;
	@Inject
	private CategoryService service3;
	@Inject
	private FollowService service4;
	@Inject
	private CboardService servicecompany;
	@Inject
	private JoinService service;
	@Inject
	private CategoryService service1;
	@Inject
	private CountryService service2;
	@Inject
	private AdminService admin;
	
	private JoinOne jo;
	private JoinTwo jt;
	private JoinThree jit;

	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(CategoryVO vo, Locale locale, HttpServletRequest request, Model model, HttpSession session)
			throws Exception {
		model.addAttribute("list", service1.categoryget(vo));
		return "namepage";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String namePost(JoinOne jo, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = jo.getEmail();
		List<JoinOne> one = service.getid(id);
			for (int i = 0; i < one.size(); i++) {
				if (id.equals(one.get(i).getEmail())) {
					response.setCharacterEncoding("EUC-KR");
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>");
					writer.println("alert('이미 가입된 아이디입니다.');");
					writer.println("history.back();");
					writer.println("</script>");
					writer.flush();
					return home(null, null, request, model, null);
				}
			}
			this.jo = jo;
			String password =jo.getPassword();
			String salt =password;
			salt = SHA256Util.generateSalt();
			String newPassword = SHA256Util.getEncrypt(password, salt);
			jo.setPassword(newPassword);
			jo.setSalt(salt);
			return "redirect:./company";
		

		

	}

	/*
	 * 2page view controller
	 */

	@RequestMapping(value = "/company", method = RequestMethod.GET)
	public void companyGet(CategoryVO vo, Locale locale, Model model) throws Exception {
		model.addAttribute("list", service1.categoryget(vo));

	}

	@RequestMapping(value = "/company/{mc_number}", method = RequestMethod.GET)
	@ResponseBody
	public List<CategoryVO> categoryget1(@PathVariable("mc_number") Integer mc_number) throws Exception {

		return service1.smallcate(mc_number);
	}

	@RequestMapping(value = "/company", method = RequestMethod.POST)
	public String companyPost(JoinTwo jt, Model model) throws Exception {
		
		this.jt = jt;

		return "redirect:./countrypage";
	}

	/*
	 * 3page view controller
	 */

	@RequestMapping(value = "/countrypage", method = RequestMethod.GET)
	public void countryGet(CountryVO vo, Model model) throws Exception {
		model.addAttribute("clist", service2.countryget(vo));

	}

	@RequestMapping(value = "/country/{country}", method = RequestMethod.GET)
	@ResponseBody
	public List<CountryVO> cityGet(@PathVariable("country") String country) throws Exception {

		return service2.cityGet(country);
	}

	@RequestMapping(value = "/countrypage", method = RequestMethod.POST)
	public String countryPost(JoinThree jit, Model model) throws Exception {

		this.jit = jit;

		return "redirect:./signhap";
	}

	/*
	 * 5page view controller
	 */

	@RequestMapping(value = "/signhap", method = RequestMethod.GET)
	public void signhapGet(Model model) throws Exception {
		
		model.addAttribute("jo", this.jo);
		model.addAttribute("jt", this.jt);
		model.addAttribute("jit", this.jit);

	}

	@RequestMapping(value = "/signhap", method = RequestMethod.POST)
	public String signhapPost(Model model) throws Exception {
		
		String companyCode = jt.getCompanyCode();
		if(servicecompany.getaddress(companyCode).size() !=0){
		Map<String, String> map = new HashMap<String, String>();
		map.put("companyCode", companyCode);
		map.put("userid",jo.getEmail());
		map.put("first", jo.getFirst());
		map.put("last", jo.getLast());
		map.put("title", jt.getTitle());
		map.put("repname", servicecompany.getaddress(companyCode).get(0).getRepname());
		map.put("country", servicecompany.getaddress(companyCode).get(0).getCountry());
		servicecompany.insert_companyuser(map);
		}
		  service.insertOne(jo); 
		  service.insertTwo(jt);
		  service.insertThree(jit);
		 

		return "redirect:./";
	}

	@RequestMapping(value = "/home", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginhome(CategoryVO vo, Locale locale, HttpServletRequest request, Model model, HttpSession session)
			throws Exception {
		String id = (String) request.getSession().getAttribute("login");
		model.addAttribute("list", service3.categoryget(vo));
		model.addAttribute("followlist", service4.listSearchCriteriasearch(id));
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", id);
		model.addAttribute("followcompanylist", service4.listSearchCriteriaCompany(map));
		model.addAttribute("updatenewpost", servicescroll.updatenewpost(id));
		model.addAttribute("mlist", admin.getlist());
		return "/home";
	}

	@RequestMapping(value = "/home/{mc_number}", method = RequestMethod.GET)
	@ResponseBody
	public List<CategoryVO> categoryget(@PathVariable("mc_number") Integer mc_number) throws Exception {

		return service3.smallcate(mc_number);
	}
	@RequestMapping(value = "/companylist", method = RequestMethod.GET)
	public void companylist(Model model) throws Exception{
		model.addAttribute("companylist",servicecompany.selectcompany());

	}

}
