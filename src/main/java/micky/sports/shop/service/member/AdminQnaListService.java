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

public class AdminQnaListService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public AdminQnaListService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("AdminQnaListService");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		Member dao = sqlSession.getMapper(Member.class);		
		
		ArrayList<Qna_MemberDto> list = dao.getadminqnalist();
		
		model.addAttribute("adminqnalist",list);
		
	}

}
