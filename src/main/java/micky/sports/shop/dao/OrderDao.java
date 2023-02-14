package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.dto.ProductDto;

public interface OrderDao {

	public void payment(String mId,String pNo,int cCnt);
	
	//주문페이지 정보보기
	public ArrayList<ProductDto> orderSelect(String pno);
	
	//나의 주문내역에서 주문목록 확인
	public ArrayList<OrderMemberDto> mtOrderList(String mIdd,int rowStart,int rowEnd);
	
	//주문페이지에서 회원 정보확인
	public MemberDto ordersMember(String loginId);
	
	//구매한 금액 회원 캐시 차감
	public void delcash(String mId,int totPrices);

	//나의주문내역보기 페이징 접속한 회원아이디의 전체내역수
	public int selectBoardTotCount(String mId);
	
	//나의주문내역에서 취소요청 클릭시 화면전환
	public OrderMemberDto myOrderCancelOffer(String omnum);
	
	//취소사유 적은후 취소요청하기 
	public void myOCancelOffersubmit(String calcleOfferomcntnum,String myOrderCancelReason);
}
