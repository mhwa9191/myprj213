package micky.sports.shop.service.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.service.MickyServiceInter;

public class JoinIdCheckService implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public JoinIdCheckService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("JoinIdCheckService");
		
		int overlapcheck_result = -1; //id중복체크 결과 기본값은-1
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String overlapcheck_id = request.getParameter("overlapcheck"); //중복체크할 아이디값
		
		Member dao = sqlSession.getMapper(Member.class);
		
		overlapcheck_result = dao.joinidcheck(overlapcheck_id);	//중복체크진행
		
		//int count=0;
		if(overlapcheck_result==1) { //중복일때
			System.out.println("아이디중복O / 중복된아이디 : "+overlapcheck_id); //확인용
			//count=1;
		}else if(overlapcheck_result==0) { //중복하지않을때
			System.out.println("아이디중복X / 입력한아이디 : "+overlapcheck_id); //확인용
		}
		
		//String result = ""+overlapcheck_result;
		
		System.out.println("중복아이디체크결과 0/중복X , 1/중복O : "+overlapcheck_result); //확인용
		System.out.println("검사진행한 아이디 : "+overlapcheck_id); //확인용
		
		model.addAttribute("overlapcheck_result",overlapcheck_result);
		//model.addAttribute("overlapcheck_id",overlapcheck_id);
		//model.addAttribute("count",count);
	}

}
