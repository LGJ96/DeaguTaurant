package servicecenter.vo;

import java.sql.Timestamp;

public class OtoReplyVO {
	private int cus_oto_number;
	private int cus_ref;
	private int cus_re_step;
	private int cus_re_level;
	private String cus_oto_reply_content;
	private Timestamp cus_oto_reply_date;

	public int getCus_oto_number() {
		return cus_oto_number;
	}

	public void setCus_oto_number(int cus_oto_number) {
		this.cus_oto_number = cus_oto_number;
	}

	public String getCus_oto_reply_content() {
		return cus_oto_reply_content;
	}

	public void setCus_oto_reply_content(String cus_oto_reply_content) {
		this.cus_oto_reply_content = cus_oto_reply_content;
	}

	public int getCus_re_level() {
		return cus_re_level;
	}

	public void setCus_re_level(int cus_re_level) {
		this.cus_re_level = cus_re_level;
	}

	public Timestamp getCus_oto_reply_date() {
		return cus_oto_reply_date;
	}

	public void setCus_oto_reply_date(Timestamp cus_oto_reply_date) {
		this.cus_oto_reply_date = cus_oto_reply_date;
	}

	public int getCus_ref() {
		return cus_ref;
	}

	public void setCus_ref(int cus_ref) {
		this.cus_ref = cus_ref;
	}

	public int getCus_re_step() {
		return cus_re_step;
	}

	public void setCus_re_step(int cus_re_step) {
		this.cus_re_step = cus_re_step;
	}

	

	
}
