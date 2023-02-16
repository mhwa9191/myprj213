package micky.sports.shop.service.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.service.MickyServiceInter;

public class FindPwService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public FindPwService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("FindPwService");
		
		int overlapcheck_result = -1; //오류발생
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_id = request.getParameter("m_id");
		String m_email = request.getParameter("email");
		
		Member dao = sqlSession.getMapper(Member.class);
		
		
		
		
		overlapcheck_result = dao.findpw(m_id,m_email);
		
		model.addAttribute("overlapcheck_result",overlapcheck_result);

	}

}
