package micky.sports.shop.service.order;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.vopage.SearchVO;

public class MyOrderListService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;
	private SearchVO searchVO;
	public MyOrderListService(SqlSession sqlSession,SearchVO searchVO,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpsession=httpsession;
		this.searchVO=searchVO;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");	
		
		//로그인 세션
		httpsession = request.getSession();
		String loginId = (String)httpsession.getAttribute("loginid");
		//System.out.println("*********~~~~~~~~~~~~~~~~~"+loginId);
		
		OrderDao odao=sqlSession.getMapper(OrderDao.class);

		//페이징
		String strPage=request.getParameter("page");
		if(strPage==null) {
			strPage="1";
		}
		//System.out.println("---------/"+strPage);
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		int total=odao.selectBoardTotCount(loginId);	
		searchVO.pageCalculate(total);
		//System.out.println("---------/"+total);
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		ArrayList<OrderMemberDto> omdList=odao.mtOrderList(loginId,rowStart,rowEnd);
				
		//나의주문내역 주문건당 묶기 주문시간별
		//ArrayList<OrderMemberDto> mtOrderListGroup=odao.mtOrderListGroup(loginId,rowStart,rowEnd);
		
		model.addAttribute("omdList",omdList);
		model.addAttribute("totRowcnt",total);
		model.addAttribute("searchVO",searchVO);
		
		ArrayList<Integer> myOrdList= new ArrayList<Integer>();
		ArrayList<Date> myOrdListDate= new ArrayList<Date>();
		//omdList 구매시간확인
		for (OrderMemberDto orderMemberDto : omdList) {
			Date omDate=orderMemberDto.getOm_date();
			System.out.println(omDate);
			myOrdListDate.add(omDate);
		}

		for (int i = 0; i < myOrdListDate.size()-1; i++) {
			if (myOrdListDate.get(i).equals(myOrdListDate.get(i+1))) {
				
				System.out.println("같은가");
				myOrdList.add(0);
				
			}else {
				myOrdList.add(1);
				
			}
		}
		//1 2 0 2 0  이거나 1 0 2 0 2
		
		System.out.println(myOrdList);
		System.out.println(myOrdListDate);
		System.out.println(myOrdListDate.get(0));
		
		
		//나의주문내역에서 정보확인
		model.addAttribute("myList",odao.ordersMember(loginId));
		

		//model.addAttribute("myListGroup",mtOrderListGroup);
//		for (OrderMemberDto orderMemberDto : mtOrderListGroup) {
//			System.out.println(orderMemberDto.getGroupcnt()+"그룹ㄴ");
//			System.out.println(orderMemberDto.getOm_num()+"그룹getOm_numㄴ");
//		}
		
	}

}
