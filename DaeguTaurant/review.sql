create table review(

	rev_id INTEGER PRIMARY KEY,
	res_score float NOT NULL,
	rev_notice_date TIMESTAMP NOT NULL,
	rev_like integer null,
	rev_pic VARCHAR2(80) NOT NULL,
	rev_content VARCHAR2(150) NOT NULL,

	rev_re_step NUMBER not null,			/*식당 리뷰출력순서 */
	
	rev_user_id VARCHAR2(30),
	CONSTRAINT FK_userrev
	FOREIGN KEY(rev_user_id)
	REFERENCES user_Info(user_id),
	
	rev_res_id NUMBER,
	CONSTRAINT FK_resrev
	FOREIGN KEY(rev_res_id)
	REFERENCES restaurant(res_id)
)

select * from review;

drop table review;

CREATE SEQUENCE review_seq;

drop SEQUENCE review_seq;


