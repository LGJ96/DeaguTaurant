package comm.vo;

public class CommentReplyVO {
	private int comment_number;
	private int comment_ref;
	private int comment_re_step;
	private int comment_re_level;
	private String comment_user_id;
	private int comment_com_number;
	
	public int getComment_number() {
		return comment_number;
	}
	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
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
	public int getComment_ref() {
		return comment_ref;
	}
	public void setComment_ref(int comment_ref) {
		this.comment_ref = comment_ref;
	}
	public int getComment_com_number() {
		return comment_com_number;
	}
	public void setComment_com_number(int comment_com_number) {
		this.comment_com_number = comment_com_number;
	}

	
}
