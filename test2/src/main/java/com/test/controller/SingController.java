package com.test.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.test.service.CategoryService;
import com.test.service.CountryService;
import com.test.service.JoinService;

@Controller
@RequestMapping("/signup/*")
public class SingController {
	private static final Logger logger = LoggerFactory.getLogger(SingController.class);
	
	@Inject
	private JoinService service;
	@Inject
	private CategoryService service1;
	@Inject
	private CountryService service2;
	
	private JoinOne jo;
	private JoinTwo jt;
	private JoinThree jit;


	/*
				1page view controller
	 											*/
	
	
	
	@RequestMapping(value="/namepage", method=RequestMethod.GET)
	public void nameGet( JoinOne jo,Model model) throws Exception{
		logger.info("get~");
		
		
	}	
	@RequestMapping(value="/namepage", method=RequestMethod.POST)
	public String namePost(JoinOne jo, Model model) throws Exception{
		
		this.jo=jo;
		model.addAttribute("result","success");
		return "redirect:./signup/company";
	}
	
	/*
				2page view controller
	 											*/

	
	@RequestMapping(value="/company", method=RequestMethod.GET)
	public void companyGet(CategoryVO vo,Locale locale,  Model model) throws Exception {
		model.addAttribute("list",service1.categoryget(vo));
		logger.info("get~");	
						
		
	}	
	
	@RequestMapping(value = "/{mc_number}", method = RequestMethod.GET)
	@ResponseBody
	public  List<CategoryVO> categoryget(@PathVariable("mc_number") Integer mc_number) throws Exception {
		
		return service1.smallcate(mc_number);
	}
	
	@RequestMapping(value="/company", method=RequestMethod.POST)
	public String companyPost(JoinTwo jt, Model model) throws Exception{
		
		this.jt =jt;
		
		
		return "redirect:./signup/countrypage";
	}
	

	/*
				3page view controller
	 											*/

	
	
	@RequestMapping(value="/countrypage", method=RequestMethod.GET)
	public void countryGet(CountryVO vo, Model model) throws Exception {
		model.addAttribute("clist",service2.countryget(vo));
		logger.info("get~");							
		
	}	
	
	@RequestMapping(value = "/country/{country}", method = RequestMethod.GET)
	@ResponseBody
	public  List<CountryVO> cityGet(@PathVariable("country") String country) throws Exception {
		
		return service2.cityGet(country);
	}
	
	@RequestMapping(value="/countrypage", method=RequestMethod.POST)
	public String countryPost( JoinThree jit, Model model) throws Exception{
		
		this.jit=jit;
		
		return "redirect:./signup/signhap";
	}	
	

	

	/*
				5page view controller
	 											*/
	
	
	
	@RequestMapping(value="/signhap", method=RequestMethod.GET)
	public void signhapGet( Model model) throws Exception {
		logger.info("get~");	
		
		model.addAttribute("jo", this.jo);
		model.addAttribute("jt", this.jt);
		model.addAttribute("jit", this.jit);
		
	
	}	
	
	@RequestMapping(value="/signhap", method=RequestMethod.POST)
	public String signhapPost( Model model) throws Exception{
	
		
		service.insertOne(jo);
		service.insertTwo(jt);
		service.insertThree(jit);
		
		
		return "redirect:./";
	}	
	
}
