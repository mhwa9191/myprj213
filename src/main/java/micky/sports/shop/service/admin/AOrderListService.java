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
import micky.sports.shop.vopage.SearchVO;

//관리자 주문관리 현황 리스트
@Service
public class AOrderListService implements MickyServiceInter{
	private SqlSession sqlSession;
	
	public AOrderListService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("---AOrderListService");
		
//		model → map
		Map<String , Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
//		page
		SearchVO searchVO=
				(SearchVO)map.get("searchVO");
		
//		DB select
		Admin dao=sqlSession.getMapper(Admin.class);

		
//		page
		String strPage=request.getParameter("page");
		if (strPage==null) {
			strPage="1";
		}
		//출력확인
		System.out.println("page : "+strPage);
		
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
//		총 관리자 admin_olist 갯수
		int total=dao.selectAdminTotCount();
		searchVO.pageCalculate(total);
		//출력확인
		System.out.println(total);
		System.out.println(page);
		System.out.println(searchVO.getPageStart());
		System.out.println(searchVO.getPageEnd());
		System.out.println(searchVO.getTotPage());
		System.out.println(searchVO.getRowStart());
		System.out.println(searchVO.getRowEnd());
		
		
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		ArrayList<OrderMemberDto> olist=dao.olist(rowStart,rowEnd);
		model.addAttribute("olist",olist);
		
		model.addAttribute("totRowcnt",total);
		model.addAttribute("searchVo",searchVO);
	
		
		
	}
}
