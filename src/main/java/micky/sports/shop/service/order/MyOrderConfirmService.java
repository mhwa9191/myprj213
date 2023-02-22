package micky.sports.shop.service.order;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.service.MickyServiceInter;

public class MyOrderConfirmService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;
	public MyOrderConfirmService(SqlSession sqlSession,HttpSession httpsession) {
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
		// TODO 세션 중간 끊김 해결해야함...
		//if (loginId==null) {
		//} 
		System.out.println("*********~~~~~~~~~~~~~~~~~"+loginId);

		String omcntnum=request.getParameter("omcntnum");
		System.out.println("*****///"+omcntnum);
		OrderDao odao = sqlSession.getMapper(OrderDao.class);
		odao.myOrderConfirm(omcntnum);
		
		//model.addAttribute("myList",odao.ordersMember(loginId));
		
	}

}
