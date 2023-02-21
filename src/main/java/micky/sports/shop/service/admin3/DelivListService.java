package micky.sports.shop.service.admin3;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Admin3;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.vopage.SearchVO;

public class DelivListService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;
	private SearchVO searchVO;

	public DelivListService(SqlSession sqlSession,SearchVO searchVO,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpsession = httpsession;
		this.searchVO = searchVO;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");	
		

		System.out.println("===DelivListService=====delivery=======");
		//로그인 세션
		httpsession = request.getSession();
		String loginId = (String)httpsession.getAttribute("loginid");
		//System.out.println("*********~~~~~~~~~~~~~~~~~"+loginId);

		Admin3 admin3=sqlSession.getMapper(Admin3.class);
		
		//페이징
		String strPage=request.getParameter("page");
		if(strPage==null) {
			strPage="1";
		}
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		int total=admin3.adminDelivListTotCount();	
		searchVO.pageCalculate(total);
		//System.out.println("---------/"+total);
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		ArrayList<OrderMemberDto> delivList=admin3.adminDelivList(rowStart,rowEnd);
		
		model.addAttribute("delivList",delivList);
		model.addAttribute("totRowcnt",total);
		model.addAttribute("searchVO",searchVO);
		
		
		
	}

}
