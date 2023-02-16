package micky.sports.shop.service.admin2;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import micky.sports.shop.dao.Admin2;
import micky.sports.shop.service.MickyServiceInter;

//관리자 주문관리 현황 리스트
@Service
public class AProductInsertService implements MickyServiceInter{
	private SqlSession sqlSession;
	
	public AProductInsertService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("---AProductInsertService");
		
		Map<String , Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		Admin2 dao=sqlSession.getMapper(Admin2.class);
		
		String path="C:\\2022spring\\springwork1\\micky_SportsWear\\src\\main\\webapp\\resources\\upload";
		MultipartRequest req=null;
		try {
			req=new MultipartRequest(request, path, 1024*1024*20, "utf-8",
					new DefaultFileRenamePolicy());

		} catch (Exception e) {
			e.printStackTrace();
		}
//		String p_no=request.getParameter("p_no");
		String p_name=req.getParameter("p_name");
		String p_price=req.getParameter("p_price");
		String p_cnt=req.getParameter("p_cnt");
//		String p_date=request.getParameter("p_date");
		String p_color=req.getParameter("p_color");
		String p_size=req.getParameter("p_size");
		String p_filesrc=req.getFilesystemName("p_filesrc");
		String p_category=req.getParameter("p_category");
		String p_info=req.getParameter("p_info");
		System.out.println("파일 확인      : "+p_filesrc);
		dao.produectInsert(p_name,p_price,p_cnt,p_color,p_size,
				p_filesrc,p_category,p_info);
	}
}
