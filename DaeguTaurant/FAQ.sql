DROP TABLE faq;

CREATE TABLE faq(


	cus_faq_number INTEGER PRIMARY KEY,
	cus_faq_title VARCHAR2(50) NOT NULL,
	cus_faq_date TIMESTAMP NOT NULL,
	cus_faq_content VARCHAR2(400) NOT NULL,
	cus_faq_list_number INTEGER,
	faq_user_id VARCHAR2(30),
 	FOREIGN KEY(faq_user_id)
	REFERENCES user_Info(user_id) 

)

CREATE SEQUENCE faq_seq;
/* sequence : 숫자 1씩 자동증가 기능
 * 			게시글 번호를 순차적으로 할당*/
