package comm.vo;

import java.sql.Timestamp;

public class CommVO {
	private String com_title;
	private int com_number;
	private String user_nickname;
	private int com_readcount;
	private int com_count;
	private Timestamp com_date;
	private int com_ref_step;
	private String com_content;
	private String com_pic;
	private String com_subject;	
	private int com_ref_number;
	private int com_list_number;
	private String comment_content;
	private Timestamp comment_date;
	private String com_user_id;
	
	public String getCom_title() {
		return com_title;
	}
	public void setCom_title(String com_title) {
		this.com_title = com_title;
	}
	public int getCom_number() {
		return com_number;
	}
	public void setCom_number(int com_number) {
		this.com_number = com_number;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public int getCom_count() {
		return com_count;
	}
	public void setCom_count(int com_count) {
		this.com_count = com_count;
	}
	public Timestamp getCom_date() {
		return com_date;
	}
	public void setCom_date(Timestamp com_date) {
		this.com_date = com_date;
	}
	public int getCom_ref_step() {
		return com_ref_step;
	}
	public void setCom_ref_step(int com_ref_step) {
		this.com_ref_step = com_ref_step;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public int getCom_ref_number() {
		return com_ref_number;
	}
	public void setCom_ref_number(int com_ref_number) {
		this.com_ref_number = com_ref_number;
	}
	public int getCom_list_number() {
		return com_list_number;
	}
	public void setCom_list_number(int com_list_number) {
		this.com_list_number = com_list_number;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Timestamp getComment_date() {
		return comment_date;
	}
	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}
	public String getCom_user_id() {
		return com_user_id;
	}
	public void setCom_user_id(String com_user_id) {
		this.com_user_id = com_user_id;
	}
	public String getCom_subject() {
		return com_subject;
	}
	public void setCom_subject(String com_subject) {
		this.com_subject = com_subject;
	}
	public String getCom_pic() {
		return com_pic;
	}
	public void setCom_pic(String com_pic) {
		this.com_pic = com_pic;
	}
	public int getCom_readcount() {
		return com_readcount;
	}
	public void setCom_readcount(int com_readcount) {
		this.com_readcount = com_readcount;
	}
	
	
}
