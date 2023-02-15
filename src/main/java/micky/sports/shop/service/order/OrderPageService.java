package micky.sports.shop.service.order;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.dto.ProductDto;
import micky.sports.shop.service.MickyServiceInter;

public class OrderPageService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;
	public OrderPageService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpsession=httpsession;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");	
		
		//로그인 세션
		httpsession = request.getSession();
		String loginId = (String)httpsession.getAttribute("loginid");
		System.out.println("*********~~~~~~~~~~~~~~~~~"+loginId);

//		String[] no=request.getParameterValues("choice_pno"); 
//		String[] cnt=request.getParameterValues("choice_cnt"); 
//		OrderDao odao = sqlSession.getMapper(OrderDao.class);
//		
//		ArrayList<ProductDto> orderPSelect =new ArrayList<ProductDto>();
//		ArrayList<Integer> cnts=new ArrayList<Integer>();
//		for (int i = 0; i < no.length; i++) {
//			//System.out.println("**********"+no[i]);
//			//System.out.println("**********"+cnt[i]);
//			orderPSelect.addAll(odao.orderSelect(no[i]));
//			cnts.add(Integer.parseInt(cnt[i]));
//		}
		
		OrderDao odao = sqlSession.getMapper(OrderDao.class);
		
		ArrayList<ProductDto> orderPSelect =new ArrayList<ProductDto>();
		ArrayList<Integer> cnts=new ArrayList<Integer>();
		
		httpsession.setAttribute("choice_pno",request.getParameterValues("choice_pno"));
		for (String ele : (String[])httpsession.getAttribute("choice_pno")) {
			orderPSelect.addAll(odao.orderSelect(ele));
			
		}
	
		httpsession.setAttribute("choice_cnt",request.getParameterValues("choice_cnt"));
		for (String elecnt : (String[])httpsession.getAttribute("choice_cnt")) {

			cnts.add(Integer.parseInt(elecnt));
		}
		
		//결제완료후 뒤로가기로 했을때 내용을 지우기 위해 세션에 넣기 결제완료후에는 세션값삭제
		httpsession.setAttribute("orderPSelectList",orderPSelect);
		httpsession.setAttribute("cnt",cnts);
		httpsession.setAttribute("ccccc","안나오면좋겠는데...");
		
		
		//model.addAttribute("orderPSelectList",orderPSelect);
		//model.addAttribute("cnt",cnts);
		System.out.println("*********?"+loginId);
		//주문페이지에서 회원 정보확인
		model.addAttribute("ordersMember",odao.ordersMember(loginId));

	}

}
