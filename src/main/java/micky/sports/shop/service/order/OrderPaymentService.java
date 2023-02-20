package micky.sports.shop.service.order;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.dao.ProductDao;
import micky.sports.shop.dto.ProductDto;
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

		//로그인 세션
		httpsession = request.getSession();
		String loginId = (String)httpsession.getAttribute("loginid");
		//System.out.println("*********~~~~~~~~~~~~~~~~~"+loginId);
		//String mId="blue2"; 
		//String[] pNo=request.getParameterValues("p_no"); //상품번호
		//String[] cnt=request.getParameterValues("cnt"); //수량
		
		
		ArrayList<ProductDto> orderPSelectList=new ArrayList<ProductDto>();
		orderPSelectList=(ArrayList<ProductDto>)httpsession.getAttribute("orderPSelectList");		
		
		ArrayList<Integer> cntList=new ArrayList<Integer>();
		cntList=(ArrayList<Integer>)httpsession.getAttribute("cnt");
		
		ArrayList<String> pNo=new ArrayList<String>();
		ArrayList<Integer> cnt=new ArrayList<Integer>();
		
		String orderResult="주문성공";
		if(orderPSelectList==null) { //새로고침 했을때는 세션을 삭제했으므로 예외처리해야함
			orderResult="2";
		}else {			
			for (ProductDto orderPSelect : orderPSelectList) {
				pNo.add(orderPSelect.getP_no()); //상품번호
				//System.out.println(orderPSelect.getP_no()+"상품번호맞니");
			}
			for (Integer c : cntList) {
				cnt.add(c); //수량
				//System.out.println(c+"수량확인좀");
			}
			
			int totPrices=(Integer)httpsession.getAttribute("totPrices");
	
			//String totPrices=request.getParameter("totPrices"); // 구매총액
			//System.out.println("** 구매 총액~"+totPrices);
			
			OrderDao odao=sqlSession.getMapper(OrderDao.class);
			ProductDao pdao=sqlSession.getMapper(ProductDao.class);
			
				
			//수량이나 캐시가 없으면 결제가 진행되지 않도록하기
			int memberCach=odao.ordersMember(loginId).getM_cash();
			//System.out.println("캐시확인"+memberCach);
			if(memberCach<totPrices) {
				//캐시부족...
				orderResult="0";
			}else {
				for (int i = 0; i < pNo.size(); i++) {
					int checkCnt= pdao.checkPrdCnt(pNo.get(i)).getP_cnt();
					//System.out.println("checkCnt확인"+checkCnt+"ㅋㅋ");
					if (checkCnt<cnt.get(i)) {
						//재고부족...
						orderResult="1";
						break;
					}
				}	
			}
			//System.out.println("중간확인되니"+orderResult+"없");
			if (orderResult=="주문성공") {
				for (int i = 0; i < pNo.size(); i++) {
					//구매이력 추가 insert
					odao.payment(loginId,pNo.get(i),cnt.get(i));
					//구매한 수량 재고 삭제 update
					pdao.delpayment(pNo.get(i),cnt.get(i));						
				}		
				//구매한 금액 회원 캐시 차감 update
				odao.delcash(loginId,totPrices);
			}
			
			httpsession.removeAttribute("orderPSelectList");
			httpsession.removeAttribute("cnt");
			httpsession.removeAttribute("totPrices");
			
		//가장최근 주문번호확인
		String checkOmnum= odao.checkOmnum(loginId);
		//System.out.println("여기는"+orderResult+"없");
		//주문결과창
		model.addAttribute("checkOmnum",checkOmnum);
		}
		model.addAttribute("orderResult",orderResult);
	}

}
