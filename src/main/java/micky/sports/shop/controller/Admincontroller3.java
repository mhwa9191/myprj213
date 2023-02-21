package micky.sports.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.admin3.DecisionService;
import micky.sports.shop.service.admin3.DelivListService;
import micky.sports.shop.vopage.SearchVO;

@Controller
@RequestMapping("/admin3")
public class AdminController3 {
	MickyServiceInter mickyServiceInter;

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private HttpSession httpsession;
	
	//배송관리 주문 내역보기
	@RequestMapping("/delivList")
	public String delivList(HttpServletRequest request,SearchVO searchVO,Model model) {
		System.out.println("========delivList=======");
		
		model.addAttribute("request",request);
		mickyServiceInter=new DelivListService(sqlSession,searchVO,httpsession);
		mickyServiceInter.execute(model);
		
		return "/admin3_deliv/admindeliv";
	}
	//배송관리 주문 확정하기
	@RequestMapping("/decision")
	public String decision(HttpServletRequest request,Model model) {
		System.out.println("========decision=======");
		
		model.addAttribute("request",request);
		mickyServiceInter=new DecisionService(sqlSession,httpsession);
		mickyServiceInter.execute(model);
		
		return "redirect:delivList";
	}

	
}
