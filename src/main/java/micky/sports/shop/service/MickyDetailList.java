package micky.sports.shop.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.CartDao;
import micky.sports.shop.dto.ProductDto;


public class MickyDetailList implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public MickyDetailList(SqlSession sqlsession) {
		this.sqlSession=sqlsession;
	}

	@Override
	public void execute(Model model) {
				
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String p_no=request.getParameter("p_no");
		
		CartDao dao=sqlSession.getMapper(CartDao.class);
		
		ProductDto list=dao.Detaillist(p_no);
		
		model.addAttribute("list",list);	
	}
	
}
