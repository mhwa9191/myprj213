package micky.sports.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.admin.ACancleModifyService;
import micky.sports.shop.service.admin.AContentViewService;
import micky.sports.shop.service.admin.AOrderListService;
import micky.sports.shop.service.admin.ASearchListService;
import micky.sports.shop.vopage.SearchVO;


@Controller
public class AdminController {
	MickyServiceInter mickyServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	
	//관리자 주문관리 현황 리스트
	 @RequestMapping("/admin_olist") //url 주소줄 
	 public String olist(HttpServletRequest request,SearchVO searchVO,Model model) { 
		 System.out.println(">>>>>>>>>olist<<<<<<<<<<");
		 
		 //DB 
		 model.addAttribute("request",request);
		 model.addAttribute("searchVo",searchVO);
		 		 
		 mickyServiceInter=new AOrderListService(sqlSession);
		 mickyServiceInter.execute(model);

		 return "admin/admin_olist"; //spring jsp 파일 위치
	 }
	 
	 
	//주문취소 목록 검색 기능-시작날짜~종료날짜+취소요청Y 기준
	 @RequestMapping("/search_olist") 
	 public String slist(HttpServletRequest request,Model model) { 
		 System.out.println(">>>>>>>>>search_olist<<<<<<<<<<");
		 String som_cdate=request.getParameter("som_cdate");
		 String eom_cdate=request.getParameter("eom_cdate");
		 String searchKeyword=request.getParameter("om_cancle");
			
		 System.out.println("som_cdate : "+som_cdate);		 
		 System.out.println("eom_cdate : "+eom_cdate);		 
		 System.out.println("Keyword : "+searchKeyword);
		  //DB 
		 model.addAttribute("request",request);
		 
		 mickyServiceInter=new ASearchListService(sqlSession);
		 mickyServiceInter.execute(model);

		 return "admin/search_olist"; 
	 }
	 
	 
	//관리자 주문내역 상세
	 @RequestMapping("/admin_contentview")  
	 public String acontentupdate(HttpServletRequest request, Model model) {
		 System.out.println(">>>>>>>>>acontentview<<<<<<<<<<");
	
		 //DB 
		 model.addAttribute("request",request);
		 
		 mickyServiceInter=new AContentViewService(sqlSession);
		 mickyServiceInter.execute(model);	
		 
		 return "admin/admin_contentview"; 
	}
		 
		 
	//관리자 주문내역 상세 : 결제완료 → 주문취소 변경
	 @RequestMapping(method = RequestMethod.POST, value = "/modify") 
	 public String amodify(HttpServletRequest request, Model model) {
		 System.out.println(">>>>>>>>>amodify<<<<<<<<<<");
		 request.getParameter("om_state");
		 //DB 
		 model.addAttribute("request",request);
		 
		 //확인--null
		 System.out.println(request.getParameter("inputValue"));
		 
		 mickyServiceInter=new ACancleModifyService(sqlSession);
		 mickyServiceInter.execute(model);	
		 
		 return "redirect:admin_olist"; 
	} 
		 
		
}
