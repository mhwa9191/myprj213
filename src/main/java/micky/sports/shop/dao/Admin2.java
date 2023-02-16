package micky.sports.shop.dao;

import java.util.ArrayList;
import java.util.Date;

import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.dto.ProductDto;


public interface Admin2 {
//	상품관리리스트
	public ArrayList<ProductDto> plist(int rowStart, int rowEnd, String search, String size, int num);
//	상품관리 리스트 페이지
	public int selectAdminTotCount(String search);
//	체크상품삭제
	public void Checkdelete(String str);
//	상품등록
	public void produectInsert(String p_no, String p_name, String p_price, String p_cnt, String p_color, String p_size,
			String p_filesrc, String p_date);
}


