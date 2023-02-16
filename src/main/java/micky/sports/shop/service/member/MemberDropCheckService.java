package micky.sports.shop.service.member;

import java.lang.ProcessBuilder.Redirect;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class MemberDropCheckService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public MemberDropCheckService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("MemberDropCheckService");
		
		int memberdropcheck = -1; //회원탈퇴본인인증결과
		//String loginid = ""; 
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_id = (String)session.getAttribute("loginid");
		String m_pw = request.getParameter("m_pw"); 
		System.out.println("인증하는 아이디 : "+m_id);
		
		Member dao = sqlSession.getMapper(Member.class);
		
		memberdropcheck = dao.memberdropcheck(m_id,m_pw);
		
		if(memberdropcheck==1) { //본인인증완료
			System.out.println("본인인증완료"); //확인용
//			session = request.getSession();
//			session.setAttribute("loginid", m_id); //세션에 아이디등록
//			System.out.println("세션등록아이디 확인 : "+session.getAttribute("loginid")); //확인용
		}else if(memberdropcheck==0) { //본인인증실패
			System.out.println("본인인증실패");
			
		}else { //오류
			System.out.println("오류");
		}
		//loginid = (String)session.getAttribute("loginid");
		//model.addAttribute("loginid",loginid);
		model.addAttribute("memberdropcheck",memberdropcheck); //로그인확인결과
	}

}
