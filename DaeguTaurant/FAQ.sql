CREATE TABLE faq(


	cus_faq_number INTEGER PRIMARY KEY,
	cus_faq_title VARCHAR2(50) NOT NULL,
	cus_faq_date TIMESTAMP NOT NULL,
	cus_faq_content VARCHAR2(400) NOT NULL,
	cus_faq_list_number INTEGER NOT NULL,
	faq_user_id VARCHAR2(30),
 	FOREIGN KEY(faq_user_id)
	REFERENCES user_Info(user_id) 

)

