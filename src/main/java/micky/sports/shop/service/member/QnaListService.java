package micky.sports.shop.service.member;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.dto.Qna_MemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class QnaListService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public QnaListService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("QnaListService");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		Member dao = sqlSession.getMapper(Member.class);
		
		String m_id = (String)session.getAttribute("loginid"); //로그인중인 아이디
		
		//System.out.println("qnalistservice 아이디로그인유지확인용 : "+m_id);
		
		ArrayList<Qna_MemberDto> list = dao.getqnalist(m_id); //로그인중인 아이디를 조건으로 문의정보 select 후 결과(list)
		
		model.addAttribute("qnalist",list);
		
	}

}
