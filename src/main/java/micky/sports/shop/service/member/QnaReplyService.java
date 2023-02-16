package micky.sports.shop.service.member;


import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.service.MickyServiceInter;

public class QnaReplyService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public QnaReplyService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("QnaReplyService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String q_mno = request.getParameter("q_mno");
		String q_mtitle = request.getParameter("q_mtitle");
		String q_mcontent = request.getParameter("q_mcontent");
		String q_mreply = request.getParameter("q_mreply");
		String q_mid = request.getParameter("q_mid");
		//String q_mynn = request.getParameter("q_mynn");
		int q_mgroup = Integer.parseInt(request.getParameter("q_mgroup"));
		int q_mstep = Integer.parseInt(request.getParameter("q_mstep")+1);
		int q_mindent = Integer.parseInt(request.getParameter("q_mindent")+1);
		
		Member dao = sqlSession.getMapper(Member.class);
		
		dao.qnareplyupdate(q_mno);
		
		dao.qnareplyshape(q_mgroup,q_mstep);
		
		dao.qnareply(q_mtitle,q_mcontent,q_mreply,q_mid,q_mgroup,q_mstep,q_mindent);
		
	}

}
