package micky.sports.shop.service.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import micky.sports.shop.dao.Member;
import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class InfoUpdateService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public InfoUpdateService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("InfoUpdateService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String attachPath="resources\\upload\\";
	    String uploadPath=request.getSession().getServletContext().getRealPath("/");
	    System.out.println("uploadpathhhhh:"+uploadPath);
	    String path = "C:\\2022spring\\springwork1\\micky_SportsWear\\src\\main\\webapp\\resources\\upload";
	    MultipartRequest req = null;
	    try {
	    	req=
	  	          new MultipartRequest(request, path, 1024*1024*20, "utf-8",
	  	                new DefaultFileRenamePolicy());
	    	System.out.println("req : "+req);
		} catch (Exception e) {
			// TODO: handle exception
		} 
		
//		String m_id = request.getParameter("m_id");
//		String m_pw = request.getParameter("m_pw");
//		String m_tel = request.getParameter("m_tel");
//		String m_name2 = request.getParameter("m_name2");
//		
//		String m_email = request.getParameter("m_email"); //이메일 앞주소
//		//String m_email2 = request.getParameter("m_email2"); //이메일 뒷주소
//		//String m_email = m_emaill+m_email2;
//		
//		String m_filesrc = request.getParameter("m_filesrc");
	    
	    String m_id = req.getParameter("m_id");
		String m_pw = req.getParameter("m_pw");
		String m_tel = req.getParameter("m_tel");
		String m_name2 = req.getParameter("m_name2");
		
		String m_email = req.getParameter("m_email"); //이메일 앞주소
		//String m_email2 = request.getParameter("m_email2"); //이메일 뒷주소
		//String m_email = m_emaill+m_email2;
		
		String m_filesrc = req.getFilesystemName("m_filesrc");
		System.out.println("확인좀하자@@@@@@@@@@@@@@@@@"+m_filesrc);
		
		
		if(m_filesrc==null) // 파일첨부안하면 null이라 오류떠서 null상황 배제를 위해 조건을 달아준다
			m_filesrc="";
		
		Member dao = sqlSession.getMapper(Member.class);
		
		dao.infoupdate(m_id,m_pw,m_tel,m_name2,m_email,m_filesrc);

	}

}
