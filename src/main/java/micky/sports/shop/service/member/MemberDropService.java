package micky.sports.shop.service.member;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class MemberDropService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public MemberDropService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("MemberDropService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		Member dao = sqlSession.getMapper(Member.class);
		
		String m_id = (String)session.getAttribute("loginid");
		
		
		//session.invalidate();
		session.removeAttribute("loginid"); //회원탈퇴하면 해당아이디 세션제거
		dao.memberdelete(m_id);
		
	}

}
