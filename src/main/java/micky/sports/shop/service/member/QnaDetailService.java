package micky.sports.shop.service.member;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;

import micky.sports.shop.dto.Qna_MemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class QnaDetailService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public QnaDetailService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("QnaDetailService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int q_mno = Integer.parseInt(request.getParameter("q_mno")); //qnalist에서 클릭한 문의글의 고유번호
		
		Member dao = sqlSession.getMapper(Member.class);
		
		
		
		Qna_MemberDto dto = dao.qnadetail(q_mno); //
		
		model.addAttribute("qnadetail",dto);
	}

}
