package micky.sports.shop.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import micky.sports.shop.service.MickyCartAllDelete;
import micky.sports.shop.service.MickyCartDelete;
import micky.sports.shop.service.MickyCartList;
import micky.sports.shop.service.MickyCartSelectoption;
import micky.sports.shop.service.MickyCartinsertservice;
import micky.sports.shop.service.MickyDetailList;
import micky.sports.shop.service.MickyModifyCartOption;
import micky.sports.shop.service.MickyProductList;
import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.MickyminusCartcount;
import micky.sports.shop.service.MickyplusCartcount;

@Controller
@RequestMapping("/Cart")
public class CartController {
	
	MickyServiceInter mickyServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/before")
	public String before(HttpServletRequest request, Model model) {
		//제품리스트
		System.out.println("before");
		
		mickyServiceInter=new MickyProductList(sqlSession);
		mickyServiceInter.execute(model);
		return "Cart/before";
	}
	
	@RequestMapping("/detaillist")
	public String detaillist(HttpServletRequest request, Model model) {
		//제품상세조회
		System.out.println("DetailList");
		
		model.addAttribute("request",request);
		
		mickyServiceInter=new MickyDetailList(sqlSession);
		mickyServiceInter.execute(model);	
		return "Cart/detaillist";
	}
	//장바구니추가
	@RequestMapping("/insertCart")
	public String insertCart(HttpServletRequest request,Model model) {
		System.out.println("insertCart");
		String p_no=request.getParameter("p_no");
		model.addAttribute("request",request);
		
		mickyServiceInter=new MickyCartinsertservice(sqlSession);
		mickyServiceInter.execute(model);
		return "redirect:/Cart/detaillist?p_no="+p_no;
	}
	//장바구니 리스트
	@RequestMapping("/Cartlist")
	public String Cart(HttpServletRequest request,Model model) {
		//장바구니 화면 구성 
		model.addAttribute("request",request);
		
		mickyServiceInter=new MickyCartList(sqlSession);
		mickyServiceInter.execute(model);
		return "Cart/Cartlist";
	}
	//장바구니 리스트샘플
	@RequestMapping("/Cartlist2")
	public String Cart2(HttpServletRequest request,Model model) {
		//장바구니 화면 구성 
		model.addAttribute("request",request);
		
		mickyServiceInter=new MickyCartList(sqlSession);
		mickyServiceInter.execute(model);
		return "Cart/Cartlist2";
	}
	//장바구니 상품삭제
	@RequestMapping("/deleteCart")
	public String deleteCart(HttpServletRequest request,Model model) {
		//장바구니 화면 구성 
		String p_no=request.getParameter("p_no");
		model.addAttribute("request",request);
		
		mickyServiceInter=new MickyCartDelete(sqlSession);
		mickyServiceInter.execute(model);
		
		return "redirect:/Cart/Cartlist?p_no="+p_no;
	}
	//장바구니 상품삭제
		@RequestMapping("/alldeleteCart")
		public String alldeleteCart(HttpServletRequest request,Model model) {
			//장바구니 화면 구성 
			String p_no=request.getParameter("p_no");
			model.addAttribute("request",request);
			
			mickyServiceInter=new MickyCartAllDelete(sqlSession);
			mickyServiceInter.execute(model);
			
			return "redirect:/Cart/Cartlist?p_no="+p_no;
		}
	//장바구니 상품 갯수증가
	@RequestMapping("/plusCartcount")
	public String plusCartcount(HttpServletRequest request,Model model) {
		//장바구니 화면 구성 
		String p_no=request.getParameter("p_no");
		model.addAttribute("request",request);
		
		mickyServiceInter=new MickyplusCartcount(sqlSession);
		mickyServiceInter.execute(model);
		
		return "redirect:/Cart/Cartlist?p_no="+p_no;
	}
	//장바구니 상품 갯수감소
	@RequestMapping("/minusCartcount")
	public String minusCartcount(HttpServletRequest request,Model model) {
		//장바구니 화면 구성 
		String p_no=request.getParameter("p_no");
		model.addAttribute("request",request);
		
		mickyServiceInter=new MickyminusCartcount(sqlSession);
		mickyServiceInter.execute(model);
		
		return "redirect:/Cart/Cartlist?p_no="+p_no;
	}
	//장바구니 옵션변경창
	@RequestMapping("/changeoption")
	public String changeoption(HttpServletRequest request,Model model) {
		//장바구니 화면 구성 
		String c_no=request.getParameter("c_no");
		model.addAttribute("request",request);
		System.out.println("장바구니 넘버확인 : "+c_no);
		
		mickyServiceInter=new MickyCartSelectoption(sqlSession);
		mickyServiceInter.execute(model);
		
		
		return "Cart/changeoption";
	}
	//장바구니 옵션 변경
	@RequestMapping(value = "/modifycartoption",method = RequestMethod.GET)
	@ResponseBody
	public int modifycartoption(HttpServletRequest request,Model model) {
		
		System.out.println("modifycartoption컨트롤러");	
		String p_no=request.getParameter("p_no");
		model.addAttribute("request",request);
		mickyServiceInter=new MickyModifyCartOption(sqlSession);
		mickyServiceInter.execute(model);
		
		Map<String, Object> map= model.asMap();
		int num=(Integer)map.get("num");
		System.out.println("자자자자자자자자자넘버 : "+num);
		return num;
	}
}
