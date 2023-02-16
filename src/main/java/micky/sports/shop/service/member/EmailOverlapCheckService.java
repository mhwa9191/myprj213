package micky.sports.shop.service.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.service.MickyServiceInter;

public class EmailOverlapCheckService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public EmailOverlapCheckService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("EmailOverlapCheckService");
		
		int overlapcheck_result = -1; //오류발생
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		Member dao = sqlSession.getMapper(Member.class);
		
		String m_email = request.getParameter("email");
		
		overlapcheck_result = dao.emailoverlapcheck(m_email);
		
		model.addAttribute("overlapcheck_result",overlapcheck_result);

	}

}
