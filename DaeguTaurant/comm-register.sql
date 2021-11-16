create table comm_register(

	com_title VARCHAR2(50) NOT NULL,
	com_number INTEGER PRIMARY KEY,
	user_nickname VARCHAR2(10) NOT NULL,
	com_count INTEGER NOT NULL,
	com_date TIMESTAMP NOT NULL,
	com_ref_step INTEGER NOT NULL,
	com_content VARCHAR2(500) NOT NULL,
	com_ref_number INTEGER NOT NULL,
	com_list_number INTEGER NOT NULL,
	comment_content VARCHAR2(50) NOT NULL,
	comment_date TIMESTAMP NOT NULL,
	com_user_id VARCHAR2(30),
	FOREIGN KEY(com_user_id)
	REFERENCES user_Info(user_id) 

)


CREATE SEQUENCE comm_register_seq;
/* sequence : 숫자 1씩 자동증가 기능
 * 			게시글 번호를 순차적으로 할당*/

