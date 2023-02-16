package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.ReviewDto;

public interface ReviewDao {
	public ArrayList<ReviewDto> reviewboard(String selectType, String searchKeyword, String p_name);
	
	public void write(String m_id,String r_title,String r_content,String r_filesrc,String r_point);
	public void delete(String r_no);
	
	public ArrayList<ReviewDto> mylistview(String account);
	
	public ReviewDto popupview(String r_no);
	
	public void modify(String r_no, String r_title, String r_content, String r_score, String r_filesrc);
	
	public ReviewDto replyview(String r_no);
	
	public void replyUpdate(String r_no, String r_id, String r_retitle, String r_recontent);
	
	public ReviewDto getReview(String r_no);
	
	public int totalCount();
//	public int replyTotalCount(String r_no);
}
