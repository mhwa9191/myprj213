package micky.sports.shop.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.vopage.SearchVO;

public class ReviewService implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public ReviewService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>>ReviewService");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		ServletContext application=request.getSession().getServletContext();
		String p_name=(String)application.getAttribute("pname");
		String p_filesrc=(String)application.getAttribute("pfilesrc");
		
		System.out.println("pname : "+p_name);
		System.out.println("pfilesrc : "+p_filesrc);
		
		String r_no=request.getParameter("r_no");
		
//		검색기능
		String selectType=request.getParameter("selectType");
		
		String r_group="";
		String r_score="";
		
		if (selectType==null||selectType.equals("")) {
			selectType="r_group";
		}
		
//		searchKeyword 가져오기
		String searchKeyword=request.getParameter("searchKeyword");
		if (searchKeyword==null||searchKeyword.equals("")) {
			searchKeyword="";
		}
		System.out.println("sk : "+searchKeyword);

		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		
//		총게시글
		int totalCount=rdao.totalCount();
//		int replyTotalCount=rdao.replyTotalCount(r_no);
//		System.out.println(totalCount);
		

		ArrayList<ReviewDto> review_list=rdao.reviewboard(selectType,searchKeyword,p_name);
		
		model.addAttribute("review_list", review_list);
//		검색어 유지기능
		model.addAttribute("resk",searchKeyword);
//		총게시글
		model.addAttribute("totalCount", totalCount);
//		게시글에 달린 답글 수
//		model.addAttribute("replyTotalCount", replyTotalCount);
	}

}
