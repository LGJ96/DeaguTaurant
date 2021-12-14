DROP TABLE comm_register;

create table comm_register(

	com_title VARCHAR2(50) NOT NULL,
	com_number INTEGER PRIMARY KEY,
	com_readcount NUMBER DEFAULT 0,
	user_nickname VARCHAR2(10) NOT NULL,
	com_count INTEGER,
	com_date TIMESTAMP NOT NULL,
	com_ref_step INTEGER,
	com_subject VARCHAR2 (10),
	com_content VARCHAR2(500) NOT NULL,
	com_pic VARCHAR2(100),
	com_ref_number INTEGER,
	com_list_number INTEGER,
	comment_content VARCHAR2(50),
	comment_date TIMESTAMP,
	com_user_id VARCHAR2(30),
	FOREIGN KEY(com_user_id)
	REFERENCES user_Info(user_id) 

)

DROP SEQUENCE comm_register_seq;

CREATE SEQUENCE comm_register_seq;
/* sequence : 숫자 1씩 자동증가 기능
 * 			게시글 번호를 순차적으로 할당*/

select * from comm_register;
