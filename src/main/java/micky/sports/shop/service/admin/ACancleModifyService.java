package micky.sports.shop.service.admin;
//관리자 주문내역 상세 : 결제완료 → 주문취소 변경(Update)
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Admin;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class ACancleModifyService implements MickyServiceInter{
	private SqlSession sqlSession;
	
	public ACancleModifyService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("---ACancleModifyService");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		
		String om_cntnum=request.getParameter("om_cntnum");
		String om_state=request.getParameter("om_state");
		//sms 기능
		
		Admin dao=sqlSession.getMapper(Admin.class);
		dao.amodify(om_cntnum, om_state);
//		System.out.println(om_cntnum);
//		System.out.println(om_state);
		
	}
}
