DROP TABLE oto;

CREATE TABLE oto (
	
	cus_oto_content varchar2(255) not null,
	cus_oto_number integer primary key,
	cus_oto_title VARCHAR(50) not null,
	user_nickname VARCHAR(15) not null,
	cus_oto_date timestamp not null,
	cus_oto_reply_content varchar2(255),
	cus_ref integer not null,
	cus_re_step integer not null,
	cus_re_level integer not null,
	cus_oto_reply_date timestamp,
	cus_oto_list_number integer,
	oto_user_id VARCHAR2(30),
	FOREIGN KEY(oto_user_id)
	REFERENCES user_Info(user_id) 
	
)

DROP SEQUENCE oto_seq;

CREATE SEQUENCE oto_seq;
/* sequence : 숫자 1씩 자동증가 기능
 * 			게시글 번호를 순차적으로 할당*/
select * from oto;

