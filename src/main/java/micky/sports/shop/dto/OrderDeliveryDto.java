package micky.sports.shop.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class OrderDeliveryDto {

	private String od_num; //배송번호
	private String om_num; //주문번호
	private Date om_date; //주문일자
	private String m_id; //아이디
	private String addr1; //배송지주소1(우편번호)
	private String addr2; //배송지주소2(주소)
	private String addr3; //배송지주소3(상세주소)
	private String receipt_name; //수령자이름
	private String receipt_phone; //수령자번호
	private Date od_date;
	
	public OrderDeliveryDto() {
		// TODO Auto-generated constructor stub
	}
}
