package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.OrderMemberDto;

//orderDelivery
public interface Admin3 {

	//주문 배송 목록 전체 내역수
	public int adminDelivListTotCount();
	//주문 배송 목록 조회
	public ArrayList<OrderMemberDto> adminDelivList(int rowStart,int rowEnd);
	//주문 확정 상품준비중변경
	public void decisionDeliv(String odNum);
	//배송일자
	public void dateDeliv(String odNum);
}


