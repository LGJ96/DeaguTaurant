CREATE TABLE user_Info(

	user_id VARCHAR(30) primary key,
	user_pw VARCHAR(16) NOT NULL,
	user_name VARCHAR(15) NOT NULL,
	user_nickname VARCHAR(15) NOT NULL,
	user_level INTEGER NULL
)

DROP TABLE user_Info CASCADE CONSTRAINTS;  /*부모테이블만 삭제*/

drop table user_Info;

select * from user_Info;

update user_Info set user_level=9 where user_id='admin1@naver.com';
update user_Info set user_level=9 where user_id='admin2@naver.com';
update user_Info set user_level=9 where user_id='admin3@naver.com';
update user_Info set user_level=9 where user_id='admin4@naver.com';


