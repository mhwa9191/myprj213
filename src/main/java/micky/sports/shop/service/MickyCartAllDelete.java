package micky.sports.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.CartDao;


public class MickyCartAllDelete implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public MickyCartAllDelete(SqlSession sqlsession) {
		this.sqlSession=sqlsession;
	}

	@Override
	public void execute(Model model) {
				
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");		
		CartDao dao=sqlSession.getMapper(CartDao.class);
		
		String c_no=request.getParameter("c_no");
		
//		해당 아이디의 장바구니 전체 삭제 아이디 뽑아오면 넣기
//		dao.AllDeletelist(c_no);
	}
	
}
