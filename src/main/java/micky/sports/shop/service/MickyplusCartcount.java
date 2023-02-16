package micky.sports.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.CartDao;


public class MickyplusCartcount implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public MickyplusCartcount(SqlSession sqlsession) {
		this.sqlSession=sqlsession;
	}

	@Override
	public void execute(Model model) {
				
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String c_no=request.getParameter("c_no");
		String p_no=request.getParameter("p_no");
		CartDao dao=sqlSession.getMapper(CartDao.class);
		
		dao.plusCartcount(c_no,p_no);
		System.out.println("번호확인 : "+c_no+" :  "+p_no);
//		model.addAttribute("list",list);
	}
	
}
