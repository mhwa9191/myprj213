package micky.sports.shop.service.admin3;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Admin3;
import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.service.MickyServiceInter;

public class DecisionService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;
	public DecisionService(SqlSession sqlSession,HttpSession httpsession) {
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
		
		String od_num=request.getParameter("od_num");
		
		System.out.println("*****///"+od_num);
		
		Admin3 admin3 =sqlSession.getMapper(Admin3.class);
		admin3.decisionDeliv(od_num);
		
		//배송일자넣기
		admin3.dateDeliv(od_num);
		
	}

}
