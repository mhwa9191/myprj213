package micky.sports.shop.service.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Admin;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.service.MickyServiceInter;

//주문취소 목록 검색 기능-시작날짜~종료날짜+취소요청Y 기준
@Service
public class ASearchListService implements MickyServiceInter{
	private SqlSession sqlSession;
	
	public ASearchListService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("---ASearchListService");
		
		//model → map
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		
		String om_cancle=request.getParameter("om_cancle");
		System.out.println(om_cancle);
		String som_cdate=request.getParameter("som_cdate");
		System.out.println(som_cdate);
		String eom_cdate=request.getParameter("eom_cdate");
		System.out.println(eom_cdate);
		String selNum=request.getParameter("selNum");
		
		//DB select
		Admin dao=sqlSession.getMapper(Admin.class); //,som_cdate,eom_cdate
		ArrayList<OrderMemberDto> slist=dao.slist(om_cancle,som_cdate,eom_cdate,selNum);
		
		//취소요청이 Y인 경우, N인 경우
		if (om_cancle.equals("Y")) {
			slist=dao.slist(om_cancle,som_cdate,eom_cdate,"1");
		}else if (om_cancle.equals("N")) {
			slist=dao.slist(om_cancle,som_cdate,eom_cdate,"2");			
		}
		
		model.addAttribute("slist",slist);
		
		
		
		
		//출력확인
//		for (OrderMemberDto Dto : slist) {
//			System.out.println(Dto.getOm_cancle());
//		}

	
	}
	
	
}
