package micky.sports.shop.service.member;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.service.MickyServiceInter;

public class QnaWriteService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public QnaWriteService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("QnaWriteService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		String q_mtitle = request.getParameter("q_mtitle");
		String q_mcontent = request.getParameter("q_mcontent");
		String q_mid = request.getParameter("q_mid");
		System.out.println("문의하기 제목값 확인 : "+q_mtitle);
		System.out.println("문의하기 내용값 확인 : "+q_mcontent);
		System.out.println("문의 하고있는 아이디는 : "+q_mid);
		Member dao = sqlSession.getMapper(Member.class);
		
		dao.qnawrite(q_mtitle,q_mcontent,q_mid);
		
	}

}
