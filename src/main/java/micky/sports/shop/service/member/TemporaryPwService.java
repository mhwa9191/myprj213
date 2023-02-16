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

public class TemporaryPwService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public TemporaryPwService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("TemporaryPwService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int check_num = (Integer) map.get("check_num");
		String m_email = request.getParameter("email");
		
		Member dao = sqlSession.getMapper(Member.class);
		
		dao.temporarypw(check_num,m_email);

	}

}
