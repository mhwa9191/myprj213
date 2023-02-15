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
		for (int i = 0; i < pNo.length; i++) {
			//System.out.println("**********"+cnt[i]);
			//구매이력 추가 insert
			odao.payment(loginId,pNo[i],Integer.parseInt(cnt[i]));
			//구매한 수량 재고 삭제 update
			pdao.delpayment(pNo[i],Integer.parseInt(cnt[i]));		
		}		
		//구매한 금액 회원 캐시 차감 update
		odao.delcash(loginId,Integer.parseInt(totPrices));
		
		//model.addAttribute("mId",loginId);
		
		//결제완료후 뒤로가기로 했을때 내용을 지우기 위해 세션에 넣기 결제완료후에는 세션값삭제
		httpsession.removeAttribute("orderPSelectList");
		httpsession.removeAttribute("cnt");
		System.out.println("확인이되는가");
		httpsession.removeAttribute("orderPSelectList");
		httpsession.removeAttribute("cnt");
		
		httpsession.setAttribute("ccccc","98989");
		System.out.println("ccccc확인이되는가");
		String ccccc = (String)httpsession.getAttribute("ccccc");
		System.out.println("*********~~~~~~~~~~~~~~~~~"+ccccc);
		
	}

}
