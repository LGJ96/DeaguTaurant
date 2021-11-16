create table notice(

	cus_notice_number INTEGER PRIMARY KEY,
	cus_notice_title VARCHAR2(50) NOT NULL,
	cus_notice_date TIMESTAMP NOT NULL,
	cus_notice_count INTEGER NOT NULL,
	cus_notice_content VARCHAR2(400) NOT NULL,
	cus_notice_list_number INTEGER NOT NULL,
	
	notice_user_id varchar2(30),
	FOREIGN KEY(notice_user_id)
	REFERENCES user_Info(user_id)

)

CREATE SEQUENCE notice_seq;
/* sequence : 숫자 1씩 자동증가 기능
 * 			게시글 번호를 순차적으로 할당*/
