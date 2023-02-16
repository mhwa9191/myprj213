package micky.sports.shop.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDto {
	//-------------회원정보---------------
	
	private String m_id; //아이디
	private String m_pw; //패스워드
	private String m_name; //실명
	private String m_tel; //전화번호
	private String m_name2; //닉네임
	private String m_email; //이메일
	private String m_grade; //등급
	private int m_age; //나이
	private String m_gender; //성별
	private int m_cash; //캐시(현금)
	private String m_filesrc; //첨부파일(회원의프로필이미지)
	
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}

	public MemberDto(String m_id, String m_pw, String m_name, String m_tel, String m_name2, String m_email, String m_grade,
			int m_age, String m_gender, int m_cash, String m_filesrc) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_tel = m_tel;
		this.m_name2 = m_name2;
		this.m_email = m_email;
		this.m_grade = m_grade;
		this.m_age = m_age;
		this.m_gender = m_gender;
		this.m_cash = m_cash;
		this.m_filesrc = m_filesrc;
	}
	
	
}
