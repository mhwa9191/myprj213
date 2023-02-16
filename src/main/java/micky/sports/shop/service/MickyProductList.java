package micky.sports.shop.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.CartDao;
import micky.sports.shop.dto.ProductDto;


public class MickyProductList implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public MickyProductList(SqlSession sqlsession) {
		this.sqlSession=sqlsession;
	}

	@Override
	public void execute(Model model) {
				
		CartDao dao=sqlSession.getMapper(CartDao.class);
		
		ArrayList<ProductDto> list=dao.Productlist();
		
		model.addAttribute("list",list);	
	}
	
}
