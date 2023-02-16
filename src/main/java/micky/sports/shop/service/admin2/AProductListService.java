package micky.sports.shop.service.admin2;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Admin;
import micky.sports.shop.dao.Admin2;
import micky.sports.shop.dto.ProductDto;
import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.vopage.SearchVO;

//관리자 주문관리 현황 리스트
@Service
public class AProductListService implements MickyServiceInter{
	private SqlSession sqlSession;
	
	public AProductListService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("---AOrderListService");
		

		Map<String , Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");

		SearchVO searchVO=
				(SearchVO)map.get("searchVO");
		
		Admin2 dao=sqlSession.getMapper(Admin2.class);

		String strPage=request.getParameter("page");
		if (strPage==null) {
			strPage="1";
		}
		System.out.println("page : "+strPage);
		
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
//		총 product list 갯수
		String search=request.getParameter("q");
		
		int total=0;	
		if (search==null || search.equals("상품명")) {
			search="";
		}
		model.addAttribute("search",search);
		search=search.toUpperCase().replace(" ", "_");	
		total=dao.selectAdminTotCount(search);			
		
		searchVO.pageCalculate(total);
		//출력확인
//		System.out.println("합계~~~~"+total);
//		System.out.println(page);
//		System.out.println(searchVO.getPageStart());
//		System.out.println(searchVO.getPageEnd());
//		System.out.println(searchVO.getTotPage());
//		System.out.println(searchVO.getRowStart());
//		System.out.println(searchVO.getRowEnd());
		
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		String price=request.getParameter("price");
		String size=request.getParameter("size");
		
		int num=0;
		//처음접속시 null
		if (price ==null || size == null ) {
			price="";
			size="";
		}
		if(price.equals("가격순") && size.equals("사이즈") ) {
			price="";
			size="";
		}else if (price.equals("가격높은순") && size.equals("사이즈")) {
			num=1;
			size="";
		}else if (price.equals("가격높은순") && !size.equals("사이즈")) {
			num=1;	
			
		}else if (price.equals("가격낮은순") && size.equals("사이즈")) {
			num=2;
			size="";
		}else if (price.equals("가격낮은순") && !size.equals("사이즈")) {
			num=2;
			
		}
		System.out.println("받아오는 num : "+num);
		System.out.println("price 가격순 : "+price);
		System.out.println("size 크기별로 구분 : "+size);
		ArrayList<ProductDto> plist=dao.plist(rowStart,rowEnd,search,size,num);		
		
		model.addAttribute("size",size);
		model.addAttribute("price",price);
					
		model.addAttribute("plist",plist);			
	
		model.addAttribute("totRowcnt",total);
		model.addAttribute("searchVo",searchVO);
	
		
		
	}
}
