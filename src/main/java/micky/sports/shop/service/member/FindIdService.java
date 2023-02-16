package micky.sports.shop.service.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.service.MickyServiceInter;

public class FindIdService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public FindIdService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("FindIdService");
		
		String overlapcheck_result = ""; //오류발생
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_name = request.getParameter("m_name");
		String m_email = request.getParameter("email");
		
		Member dao = sqlSession.getMapper(Member.class);
		
		
		
		
		overlapcheck_result = dao.findid(m_name,m_email);
		
		System.out.println("아이디찾은결과 : "+overlapcheck_result);
		
		model.addAttribute("overlapcheck_result",overlapcheck_result);

	}

}
