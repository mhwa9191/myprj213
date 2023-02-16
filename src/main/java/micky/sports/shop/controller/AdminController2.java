package micky.sports.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.admin2.AProductDeleteService;
import micky.sports.shop.service.admin2.AProductInsertService;
import micky.sports.shop.service.admin2.AProductListService;
import micky.sports.shop.vopage.SearchVO;

@Controller
public class AdminController2 {
	MickyServiceInter mickyServiceInter;

	@Autowired
	private SqlSession sqlSession;

	// 관리자 상품관리 현황 리스트
	@RequestMapping("/admin_product")
	public String adminproduct(HttpServletRequest request, SearchVO searchVO, Model model) {

		model.addAttribute("request", request);
		model.addAttribute("searchVo", searchVO);

		mickyServiceInter = new AProductListService(sqlSession);
		mickyServiceInter.execute(model);

		return "admin2/admin_product";
	}
	// 관리자 상품관리 현황 리스트 삭제
	@RequestMapping(value = "/adminProductDelete", method = RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	public String admin_productDelete(HttpServletRequest request, 
			@RequestParam(value="checkBoxArr[]") List<String> checkBoxArr, Model model)  {

		model.addAttribute("request", request);
	    model.addAttribute("checkBoxArr",checkBoxArr);

		mickyServiceInter = new AProductDeleteService(sqlSession);
		mickyServiceInter.execute(model);
	  return "redirect:/admin_product";
	}
	// 관리자 상품관리 상품수정
	@RequestMapping("/admin_productModify")
	public String admin_productModify(HttpServletRequest request, Model model) {
		
//		model.addAttribute("request", request);
//
//		mickyServiceInter = new AProductInsertService(sqlSession);
//		mickyServiceInter.execute(model);  

		return "redirect:/admin_product";
	}
	// 관리자 상품관리 상품등록란
	@RequestMapping("/admin_addproduct")
	public String admin_addproduct(Model model) {

		return "admin2/admin_addproduct";
	}
	// 관리자 상품관리 상품등록
	@RequestMapping(value = "/adminProductInsert", method = RequestMethod.POST)
	public String adminProductInsert(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);

		mickyServiceInter = new AProductInsertService(sqlSession);
		mickyServiceInter.execute(model);  

		return "redirect:/admin_product";
	}

}
