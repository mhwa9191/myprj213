package micky.sports.shop.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewMylistviewService implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public ReviewMylistviewService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewMylistService");
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
//		String account=request.getParameter("account");
//		System.out.println("account : "+account);
		
		/* String r_no=request.getParameter("r_no"); */
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		ArrayList<ReviewDto> review_mylist=rdao.mylistview();
//		ReviewDto review_mylist=rdao.mylistview();
		
		/* ReviewDto myaccount=rdao.mylistview(); */
		
		
		/*
		 * for (ReviewDto reviewDto : review_mylist) {
		 * System.out.println(reviewDto.getR_date());
		 * System.out.println(reviewDto.getMemberDto().getM_id()); }
		 */
		
		model.addAttribute("review_mylist", review_mylist);
	}

}
