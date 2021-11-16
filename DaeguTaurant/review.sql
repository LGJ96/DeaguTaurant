create table review(

	rev_id INTEGER PRIMARY KEY,
	res_score NUMBER(20) NOT NULL,
	rev_notice_date TIMESTAMP NOT NULL,
	rev_like INTEGER NULL,
	rev_pic VARCHAR2(30) NOT NULL,
	rev_content VARCHAR2(150) NOT NULL,
	res_id INTEGER NOT NULL,
	user_nickname VARCHAR2(15) NOT NULL,
	
	rev_user_id VARCHAR2(30),
	FOREIGN KEY(rev_user_id)
	REFERENCES user_Info(user_id)
)

