package micky.sports.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.CartDao;
import micky.sports.shop.dto.CartDto;


public class MickyCartSelectoption implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public MickyCartSelectoption(SqlSession sqlsession) {
		this.sqlSession=sqlsession;
	}

	@Override
	public void execute(Model model) {
				
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String c_no=request.getParameter("c_no");
		
		CartDao dao=sqlSession.getMapper(CartDao.class);
		
		//p_no(상품번호)를 토대로 product table의 레코드를 가져와서 그 레코드의 파람값을 Cart table에 인서트
		
//		ArrayList<CartDto> list=dao.CartSelectOptionlist(c_no);
		CartDto list=dao.CartSelectOptionlist(c_no);
		
		System.out.println("MickyCartSelectoption 서비스");
//		int sum=0;
//		for (CartDto cartDto : list) {
//			System.out.println("가격  : "+cartDto.getProductDto().getP_price());
//			
//			sum +=cartDto.getProductDto().getP_price()*cartDto.getC_cnt();
//			System.out.println("총합 : "+sum);
//			model.addAttribute("totalprice",sum);
//		}
		model.addAttribute("list",list);	
	}
	
}
