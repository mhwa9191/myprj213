package micky.sports.shop.service.order;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.service.MickyServiceInter;

public class MyOCancelOfferService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;
	public MyOCancelOfferService(SqlSession sqlSession,HttpSession httpsession) {
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
		System.out.println("*********~~~~~~~~~~~~~~~~~"+loginId);
		
		String calcleOfferomcntnum=request.getParameter("calcleOfferomcntnum");
		String myOrderCancelReason=request.getParameter("myOrderCancelReason");
		System.out.println("*****///"+calcleOfferomcntnum);
		System.out.println("*****///"+myOrderCancelReason);
		OrderDao odao = sqlSession.getMapper(OrderDao.class);
		odao.myOCancelOffersubmit(calcleOfferomcntnum,myOrderCancelReason);

	}

}
