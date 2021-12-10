create table restaurant(

	res_id NUMBER primary key,				/*식당 고유번호 */
	res_name varchar2(45) not null,			/*식당 이름 */
	res_score NUMBER,						/*식당 평점 */
	res_readcount NUMBER DEFAULT 0,			/*식당 조회수 */
	res_category varchar2(15) not null,		/*식당 카테고리 */
	res_mainmenu varchar2(300) not null,	/*식당 메뉴 */
	res_number varchar2(15) not null,		/*식당 전화번호 */
	res_Addr1 varchar2(20) not null,		/*식당 지역 */
	res_Addr2 varchar2(50) not null,		/*식당 상세주소 */
	res_hours varchar2(50) not null,		/*식당 영업시간 */
	res_ref NUMBER not null,				/*식당 카테고리 번호 */
	res_re_step NUMBER not null,			/*식당 맛집출력순서 */
	res_notice_date TIMESTAMP(9) NOT null,	/*식당 등록시간 */
	res_Addr1_ref NUMBER NOT NULL,			/*식당 지역 번호 */
	res_pic varchar2(100) not null,			/*식당 이미지1 */
	
	res_user_id VARCHAR2(30),
	FOREIGN KEY(res_user_id)
	REFERENCES user_Info(user_id)
);



alter table restaurant rename column res_score to res_totalscore;   /*res_score 이름 변경*/




CREATE SEQUENCE restaurant_seq;
/* sequence : 숫자 1씩 자동증가 기능*/

drop table restaurant;
drop SEQUENCE restaurant_seq;

select * from RESTAURANT;

alter table restaurant modify (res_Addr2 varchar2(100));
alter table restaurant modify (res_name varchar2(80));
alter table restaurant modify (res_hours varchar2(80));




/*테이블 백업함*/
CREATE TABLE restaurant_back AS 
SELECT * FROM restaurant;
SELECT * FROM restaurant_back;