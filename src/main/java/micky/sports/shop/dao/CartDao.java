package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.CartDto;
import micky.sports.shop.dto.ProductDto;

public interface CartDao {

	public ArrayList<ProductDto> Productlist();

	public ProductDto Detaillist(String p_no);

	public void insertCart(String p_no);

	public ArrayList<CartDto> Cartlist(String p_no);

	public void Deletelist(String c_no);

	public void plusCartcount(String c_no, String p_no);

	public void minusCartcount(String c_no);

//	public ArrayList<CartDto> CartSelectOptionlist(String c_no);
	public CartDto CartSelectOptionlist(String c_no);

	public int CartOptionModify(String p_color, String p_size, String c_cnt, String c_no);

	public void AllDeletelist(String c_no);

	

	

	

}
