DROP TABLE comm_register_comment;

create table comm_register_comment(

	comment_number INTEGER PRIMARY KEY,
	user_nickname VARCHAR2(10) NOT NULL,
	comment_content VARCHAR2(50) NOT NULL,
	comment_date TIMESTAMP,
	comment_ref INTEGER,
	comment_re_step INTEGER,
	comment_re_level INTEGER,
	com_number INTEGER NOT NULL,
	comment_user_id VARCHAR2(30),
	FOREIGN KEY(comment_user_id)
	REFERENCES user_Info(user_id)

)

DROP SEQUENCE comm_register_comment_seq;

CREATE SEQUENCE comm_register_comment_seq;
/* sequence : 숫자 1씩 자동증가 기능
 * 			게시글 번호를 순차적으로 할당*/

select * from comm_register_comment;