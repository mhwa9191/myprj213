package micky.sports.shop.service.admin;
//관리자 주문내역 상세
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Admin;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class AContentViewService implements MickyServiceInter{
	
	private SqlSession sqlSession;
	
	public AContentViewService(SqlSession sqlSession) {
	   this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("---AContentViewService");
		
			
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		String om_cntnum=request.getParameter("om_cntnum");
		
		
		Admin dao=sqlSession.getMapper(Admin.class);
		
		OrderMemberDto dto=dao.acontentview(om_cntnum);
		model.addAttribute("acontent_view",dto);
		
		
	}
}
