package comm.vo;

import java.sql.Timestamp;

public class CommentVO {
	private int comment_number;
	private String user_nickname;
	private String comment_content;
	private Timestamp comment_date;
	private int comment_ref;
	private int comment_re_step;
	private int comment_re_level;
	private String comment_user_id;
	private int com_number;
	
	public int getComment_number() {
		return comment_number;
	}
	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
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
	public int getComment_ref() {
		return comment_ref;
	}
	public void setComment_ref(int comment_ref) {
		this.comment_ref = comment_ref;
	}
	public int getComment_re_step() {
		return comment_re_step;
	}
	public void setComment_re_step(int comment_re_step) {
		this.comment_re_step = comment_re_step;
	}
	public int getComment_re_level() {
		return comment_re_level;
	}
	public void setComment_re_level(int comment_re_level) {
		this.comment_re_level = comment_re_level;
	}
	public String getComment_user_id() {
		return comment_user_id;
	}
	public void setComment_user_id(String comment_user_id) {
		this.comment_user_id = comment_user_id;
	}
	public int getCom_number() {
		return com_number;
	}
	public void setCom_number(int com_number) {
		this.com_number = com_number;
	}
	
	
	
}
