package micky.sports.shop.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewReplyService implements MickyServiceInter{
	private SqlSession sqlSession;

	public ReviewReplyService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewReplyService");
		
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		String r_no=request.getParameter("r_no");
		String r_id=request.getParameter("r_id");
		String r_retitle=request.getParameter("r_retitle");
		String r_recontent=request.getParameter("r_recontent");
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		ReviewDto replyview=rdao.reply(r_no,r_id,r_retitle,r_recontent);
	}

}
