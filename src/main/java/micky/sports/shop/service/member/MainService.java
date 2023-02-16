package micky.sports.shop.service.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class MainService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public MainService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("MainService@@@@@");
		
	
		Member dao = sqlSession.getMapper(Member.class);
		
		String m_id = (String)session.getAttribute("loginid");
		
		if(m_id==null) {
			m_id="";
		}
		System.out.println("MarinService//로그인중인아이디확인 : "+m_id);
		MemberDto dto = dao.getimg(m_id);
		
		model.addAttribute("dto",dto);
	}

}
