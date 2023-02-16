package micky.sports.shop.service.admin2;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Admin2;
import micky.sports.shop.service.MickyServiceInter;

//관리자 주문관리 현황 리스트
@Service
public class AProductDeleteService implements MickyServiceInter{
	private SqlSession sqlSession;
	
	public AProductDeleteService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("---AProductDeleteService");
		
		Map<String , Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		// service단말고 AdminController2에서 사용해보기 (가져와지긴함)
		List<String> checkBoxArr=(List<String>)map.get("checkBoxArr");
		Admin2 dao=sqlSession.getMapper(Admin2.class);
	
		for (String str : checkBoxArr) {
			System.out.println("삭제할 checkbox 서비스단 : "+str);
			dao.Checkdelete(str);				
		}

	}
}
