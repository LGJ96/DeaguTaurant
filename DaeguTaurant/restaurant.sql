create table restaurant(

	res_id integer primary key,
	res_name varchar2(45) not null,
	res_score number(20) null,
	res_readcount integer not null,
	res_pic VARCHAR2(30) NOT NULL,
	res_category varchar2(15) not null,
	res_mainmenu varchar2(30) not null,
	res_menu varchar2(30) not null,
	res_number varchar2(15) not null,
	res_Addr1 varchar2(9) not null,
	res_Addr2 varchar2(50) not null,
	res_hours varchar2(15) not null,
	res_price integer not null,
	res_ref integer not null,
	res_re_step integer not null,
	res_notice_date timestamp not null,
	
	res_user_id VARCHAR2(30),
	FOREIGN KEY(res_user_id)
	REFERENCES user_Info(user_id)
)