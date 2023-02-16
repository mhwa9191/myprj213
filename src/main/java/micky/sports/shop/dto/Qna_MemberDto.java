package micky.sports.shop.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
	//-------QnA(회원)---------
@Getter
@Setter
public class Qna_MemberDto {

	private int q_mno; //문의번호 (문의번호는 sequence로 처리할예정)
	private String q_mtitle; //문의제목
	private String q_mcontent; //문의내용
	private String q_mreply; //답변내용
	private String q_mid; //문의한고객의id
	private String q_mynn; //답변유무
	private Date q_mdate; //문의날짜
	private int q_mgroup; //그룹
	private int q_mstep; //스텝
	private int q_mindent; //인덴트
	
	public Qna_MemberDto() {
		// TODO Auto-generated constructor stub
	}

	public Qna_MemberDto(int q_mno, String q_mtitle, String q_mcontent, String q_mreply, String q_mid, String q_mynn,
			Date q_mdate, int q_mgroup, int q_mstep, int q_mindent) {
		super();
		this.q_mno = q_mno;
		this.q_mtitle = q_mtitle;
		this.q_mcontent = q_mcontent;
		this.q_mreply = q_mreply;
		this.q_mid = q_mid;
		this.q_mynn = q_mynn;
		this.q_mdate = q_mdate;
		this.q_mgroup = q_mgroup;
		this.q_mstep = q_mstep;
		this.q_mindent = q_mindent;
	}
}
