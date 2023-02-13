package micky.sports.shop.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewPopupcontentupdateService implements MickyServiceInter{

	SqlSession sqlSession;
	
	public ReviewPopupcontentupdateService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewPopupcontentupdateService");
		
		
//		model에서 request를 풀어내는 방법
//		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
//		HttpServletRequest request=
//				(HttpServletRequest) map.get("request");
//		
//		String r_no=request.getParameter("r_no");
//		
//		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
//		ReviewDto popupupdate=rdao.popupupdate(r_no);
//		
//		model.addAttribute("popupupdate",popupupdate);
	}

}
