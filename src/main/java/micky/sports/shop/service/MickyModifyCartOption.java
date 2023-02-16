package micky.sports.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.CartDao;


public class MickyModifyCartOption implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public MickyModifyCartOption(SqlSession sqlsession) {
		this.sqlSession=sqlsession;
	}

	@Override
	public void execute(Model model) {
				
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String p_color=request.getParameter("p_color");
		String p_size=request.getParameter("p_size");
		String c_cnt=request.getParameter("c_cnt");
		String c_no=request.getParameter("c_no");
		CartDao dao=sqlSession.getMapper(CartDao.class);
		
		
		int num=dao.CartOptionModify(p_color,p_size,c_cnt,c_no);
		System.out.println("결과값@@@@@@@@@@@@@@@@@@@@@@@    :    "+num);
		System.out.println("옵션 서비스 체크 ~~~~~~~~~~~~~");
		model.addAttribute("num",num);
//		System.out.println("1.색  : "+p_color);
//		System.out.println("2.사이즈 : "+p_size);
//		System.out.println("3.갯수 : "+c_cnt);
//		System.out.println("4.번호확인 : "+c_no);
//		model.addAttribute("list",list);
	}
	
}
