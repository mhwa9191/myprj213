package micky.sports.shop.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
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
		SearchVO searchVO=
				(SearchVO) map.get("searchVO");
		
		String r_no=request.getParameter("r_no");
		
//selectType@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		String[] selectType=request.getParameterValues("selectType");
		
		String r_recently="";
		String r_score="";
		
		if (selectType!=null) {
			for (String val : selectType) {
				if(val.equals("r_recently")) {
					model.addAttribute("r_recently", "true");
					r_recently="r_recently";
				}else if(val.equals("r_score")) {
					model.addAttribute("r_score", "true");
					r_score="r_score";
				}
			}
		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@selectType
//searchType @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//		String[] searchType=request.getParameterValues("searchType");
//		
//		if (searchType!=null) {
//			for (int i = 0; i < searchType.length; i++) {
//				System.out.println("searchType[i] : "+searchType[i]);
//			}
//		}
//		
//		String r_recently="";
//		String r_score="";
//		if (searchType!=null){
//			for (String val : searchType){
//				if (val.equals("r_score")) {
//						model.addAttribute("r_score", "true");
//						r_score="r_score";
//				}else if (val.equals("r_recently")) {
//						model.addAttribute("r_recently", "true");
//						r_recently="r_recently";
//				}
//			}
//		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ searchType
		
//		rb_recently, rb_score
		String rb_recently=request.getParameter("rb_recently");
		String rb_score=request.getParameter("rb_score");
		if (rb_recently!=null || rb_score!=null) {
			if (rb_recently.equals("true")) {
				r_recently="r_recently";
			}
			if (rb_score.equals("true")) {
				r_score="r_score";
			}
		}
		
//		searchKeyword 가져오기
		String searchKeyword=request.getParameter("searchKeyword");
		if (searchKeyword==null) {
			searchKeyword="";
		}
		System.out.println("sk : "+searchKeyword);
		
//		검색어 유지기능
		model.addAttribute("resk",searchKeyword);
		
//		페이지 가져오기
		String strPage=request.getParameter("page");
		if (strPage==null) {
			strPage="1";
		}		
		
//		setPage 통해 보내기
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);

		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);

//		총 글의 개수 구하기
		int total=0;
		if (r_recently.equals("r_recently") && r_score.equals("")) {
			total=rdao.selectReviewboardTotCount1(searchKeyword);
		}else if (r_recently.equals("") && r_score.equals("r_score")) {
			total=rdao.selectReviewboardTotCount2(searchKeyword);
		}else if (r_recently.equals("r_recently") && r_score.equals("r_score")) {
			total=rdao.selectReviewboardTotCount3(searchKeyword);
		}else if (r_recently.equals("") && r_score.equals("")) {
			total=rdao.selectReviewboardTotCount4(searchKeyword);
		}
		
		searchVO.pageCalculate(total);
		
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		if (r_recently.equals("r_recently") && r_score.equals("")) {
			model.addAttribute("review_list", rdao.reviewboard(rowStart,rowEnd,searchKeyword,"1"));
		}else if (r_recently.equals("") && r_score.equals("r_score")) {
			model.addAttribute("review_list", rdao.reviewboard(rowStart,rowEnd,searchKeyword,"2"));
		}else if (r_recently.equals("r_recently") && r_score.equals("r_score")) {
			model.addAttribute("review_list", rdao.reviewboard(rowStart,rowEnd,searchKeyword,"3"));
		}else if (r_recently.equals("") && r_score.equals("")) {
			model.addAttribute("review_list", rdao.reviewboard(rowStart,rowEnd,searchKeyword,"4"));
		}
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
	}

}
