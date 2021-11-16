CREATE TABLE oto (
	
	cus_oto_content varchar2(255) not null,
	cus_oto_number integer primary key,
	user_nickname VARCHAR(15) not null,
	cus_oto_date timestamp not null,
	cus_oto_reply_content varchar2(255) not null,
	cus_re_level integer not null,
	cus_oto_reply_date timestamp not null,
	cus_oto_list_number integer not null,
	oto_user_id VARCHAR2(30),
	FOREIGN KEY(oto_user_id)
	REFERENCES user_Info(user_id) 
	
)

