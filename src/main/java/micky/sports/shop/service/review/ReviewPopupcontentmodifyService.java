package micky.sports.shop.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewPopupcontentmodifyService implements MickyServiceInter{

	SqlSession sqlSession;
	
	public ReviewPopupcontentmodifyService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewPopupcontentmodifyService");
		
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		
//		modifyupload code=================
		String attachPath="resources\\reviewupload\\";
		String uploadPath=request.getSession().getServletContext().getRealPath("/");
		
//		학원에서 작업
		String path="C:\\2022spring\\springwork1\\micky_SportsWear_review\\src\\main\\webapp\\resources\\reviewupload";
//		노트북에서 작업
//		String path="C:\\2023spring\\springwork1\\micky_SportsWear_review\\src\\main\\webapp\\resources\\reviewupload";
		
		MultipartRequest req=null;
		try {
			req=new MultipartRequest(request, path, 1024*1024*20,"utf-8",
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		String r_no=req.getParameter("r_no");
//		String m_id=request.getParameter("m_id");
		String r_title=req.getParameter("r_title");
		String r_content=req.getParameter("r_content");
		String r_score=req.getParameter("r_score");
		String r_filesrc=req.getFilesystemName("r_filesrc");
		
		
		if (r_filesrc==null) {
			r_filesrc="";
		}
		
		HttpSession session=request.getSession();
		session.removeAttribute("r_score");
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		rdao.modify(r_no,r_title,r_content,r_score,r_filesrc);
				
				
	}

}
