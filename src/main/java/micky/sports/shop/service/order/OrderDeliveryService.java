package micky.sports.shop.service.order;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.dao.ProductDao;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.dto.ProductDto;
import micky.sports.shop.service.MickyServiceInter;

public class OrderDeliveryService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;

	public OrderDeliveryService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpsession = httpsession;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");	
		

		System.out.println("===OrderDeliveryService=====delivery=======");
		//로그인 세션
		httpsession = request.getSession();
		String loginId = (String)httpsession.getAttribute("loginid");
		//System.out.println("*********~~~~~~~~~~~~~~~~~"+loginId);
		//String mId="blue2"; 
		//String[] pNo=request.getParameterValues("p_no"); //상품번호
		//String[] cnt=request.getParameterValues("cnt"); //수량
		
		//배송
		String receipt_name=request.getParameter("receipt_name");
		String receipt_phone=request.getParameter("receipt_phone");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String addr3=request.getParameter("addr3");
		System.out.println("****receipt_name~~~~"+receipt_name);
		System.out.println("****receipt_phone~~~~"+receipt_phone);
		System.out.println("****addr1~~~~"+addr1);
		System.out.println("****addr2~~~~"+addr2);
		System.out.println("****addr3~~~~"+addr3);
	

	}

}
