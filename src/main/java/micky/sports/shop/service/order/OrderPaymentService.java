package micky.sports.shop.service.order;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.dao.ProductDao;
import micky.sports.shop.service.MickyServiceInter;

public class OrderPaymentService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;

	public OrderPaymentService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpsession = httpsession;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");	
		
		//String mId=request.getParameter("m_id"); //아이디
		// TODO 230203 mId 수정필요
		//로그인 세션
		httpsession = request.getSession();
		String loginId = (String)httpsession.getAttribute("loginid");
		//System.out.println("*********~~~~~~~~~~~~~~~~~"+loginId);
		//String mId="blue2"; 
		String[] pNo=request.getParameterValues("p_no"); //상품번호
		String[] cnt=request.getParameterValues("cnt"); //수량
		
		String totPrices=request.getParameter("totPrices"); // 구매총액
		//System.out.println("** 구매 총액~"+totPrices);
		
		OrderDao odao=sqlSession.getMapper(OrderDao.class);
		ProductDao pdao=sqlSession.getMapper(ProductDao.class);
		
		String orderResult="주문성공";
		
		//수량이나 캐시가 없으면 결제가 진행되지 않도록하기
		int memberCach=odao.ordersMember(loginId).getM_cash();
		if(memberCach<Integer.parseInt(totPrices)) {
			//캐시부족...
			orderResult="0";
		}			
		for (int i = 0; i < pNo.length; i++) {
			int checkCnt= pdao.checkPrdCnt(pNo[i]).getP_cnt();
			if (checkCnt<Integer.parseInt(cnt[i])) {
				//재고부족...
				orderResult="1";
				break;
			}
		}		
		if (orderResult=="주문성공") {
			for (int i = 0; i < pNo.length; i++) {
				//구매이력 추가 insert
				odao.payment(loginId,pNo[i],Integer.parseInt(cnt[i]));
				//구매한 수량 재고 삭제 update
				pdao.delpayment(pNo[i],Integer.parseInt(cnt[i]));						
			}		
		}
		//구매한 금액 회원 캐시 차감 update
		odao.delcash(loginId,Integer.parseInt(totPrices));
		
		//가장최근 주문번호확인
		String checkOmnum= odao.checkOmnum(loginId);

		//주문결과창
		model.addAttribute("checkOmnum",checkOmnum);
		model.addAttribute("orderResult",orderResult);
		//model.addAttribute("mId",loginId);

	}

}
