package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.dto.Qna_MemberDto;

public interface Member {
	
	public void join(String m_id,String m_pw,String m_name,String m_tel,String m_name2,String m_email,
			String m_grade,int m_age,String m_gender,int m_cash,String m_filesrc);
	public int login(String loginform_inputid,String loginform_inputpw);
	public int joinidcheck(String m_id);
	public ArrayList<MemberDto> getmemberlist();
	public MemberDto memberupdateform(String m_id);
	public void memberupdate(String m_id, String m_pw, String m_name, String m_tel, String m_name2, String m_email, String m_grade,
			int m_age, String m_gender, int m_cash, String m_filesrc);
	public void memberdelete(String m_id);
	public ArrayList<Qna_MemberDto> getqnalist(String m_id);
	public void qnawrite(String q_mtitle,String q_mcontent,String q_mid);
	public Qna_MemberDto qnadetail(int q_mno);
	public int joinnicknamecheck(String m_name2);
	public MemberDto getimg(String m_id);
	public void infoupdate(String m_id,String m_pw,String m_tel,String m_name2,String m_email,String m_filesrc);
	public int memberdropcheck(String m_id,String m_pw);
	public ArrayList<Qna_MemberDto> getadminqnalist();
	public void qnareplyupdate(String q_mno);
	public void qnareply(String q_mtitle,String q_mcontent,
			String q_mreply,String q_mid,int q_mgroup,int q_mstep,int q_mindent);
	public void qnareplyshape(int q_mgroup,int q_mstep);
	public void qnadelete(String q_mno);
	public int emailoverlapcheck(String m_email);
	public void temporarypw(int check_num,String m_email);
	public int findpw(String m_id,String m_email);
	public String findid(String m_name,String m_email);
}
