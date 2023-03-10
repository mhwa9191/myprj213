package micky.sports.shop.service.order;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.dto.ProductDto;
import micky.sports.shop.service.MickyServiceInter;

public class OrderPageService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;
	public OrderPageService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpsession=httpsession;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");	
		
		//로그인 세션
		httpsession = request.getSession();
		String loginId = (String)httpsession.getAttribute("loginid");
		//System.out.println("*********~~~~~~~~~~~~~~~~~"+loginId);

		String[] no=request.getParameterValues("choice_pno"); 
		String[] cnt=request.getParameterValues("choice_cnt"); 
		OrderDao odao = sqlSession.getMapper(OrderDao.class);
		
		ArrayList<ProductDto> orderPSelect =new ArrayList<ProductDto>();
		
		ArrayList<Integer> cnts=new ArrayList<Integer>();
		
		int selectPrdPrice=0;
		int totPrices=0;
		
		for (int i = 0; i < no.length; i++) {
			//System.out.println("**********"+no[i]);
			//System.out.println("**********"+cnt[i]);
			orderPSelect.add(odao.orderSelect(no[i]));
			cnts.add(Integer.parseInt(cnt[i]));
			//선택상품의 가격
			selectPrdPrice=odao.orderSelect(no[i]).getP_price();
			//System.out.println("**********"+selectPrdPrice);
			//구매총액
			totPrices=totPrices+selectPrdPrice*(Integer.parseInt(cnt[i]));
		}
				
		//model.addAttribute("orderPSelectList",orderPSelect);
		//model.addAttribute("cnt",cnts);
		//세션이동			
		httpsession.setAttribute("orderPSelectList",orderPSelect);
		
		httpsession.setAttribute("cnt",cnts);
		httpsession.setAttribute("totPrices",totPrices);

		//주문페이지에서 회원 정보확인
		model.addAttribute("ordersMember",odao.ordersMember(loginId));
		
	}

}
