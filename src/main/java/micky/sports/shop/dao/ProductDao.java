package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.ProductDto;

public interface ProductDao {

	//상품목록
	public ArrayList<ProductDto> productlist();
	
	public ArrayList<ProductDto> productMain(String pname);
	public ArrayList<ProductDto> product(String pname, String pfilesrc);
	
	//public ArrayList<ProductDto> productSelect(String pname, String pcolor);
	
	//수량이나 캐시가 없으면 결제가 진행되지 않도록하기
	public ProductDto checkPrdCnt(String pno);
	
	//구매한 수량 재고 삭제
	public void delpayment(String pno,int cnt);
}
