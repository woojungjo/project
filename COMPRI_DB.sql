CREATE TABLE goods
(
	goods_id NUMBER NOT NULL,
	goods_name VARCHAR2(30) NOT NULL,
	goods_pic VARCHAR2(50),
	goods_manufacturer VARCHAR2(20),
	capacity NUMBER,
	category_id NUMBER NOT NULL,
	goods_rpic BLOB,

	CONSTRAINT goods_goods_id_pk PRIMARY KEY(goods_id)
);

CREATE TABLE member_goods_cart
(
	member_goods_cart_id NUMBER NOT NULL,
	member_id NUMBER NOT NULL,
	goods_id NUMBER NOT NULL,
	cart_id NUMBER NOT NULL,

	CONSTRAINT member_goods_cart_member_goods_cart_id_pk PRIMARY KEY(member_goods_cart_id)
);


CREATE TABLE non_member_retail_cart
(
	non_member_retail_cart_id NUMBER NOT NULL,
	non_member_id NUMBER NOT NULL,
	cart_id NUMBER NOT NULL,
	retail_id NUMBER NOT NULL,

	CONSTRAINT non_member_retail_cart_non_member_retail_cart_id_pk PRIMARY KEY(non_member_retail_cart_id)
);

CREATE TABLE non_member_goods_cart
(
	non_member_goods_cart_id NUMBER NOT NULL,
	non_member_id NUMBER NOT NULL,
	goods_id NUMBER NOT NULL,
	cart_id NUMBER NOT NULL,

	CONSTRAINT non_member_goods_cart_non_member_goods_cart_id_pk PRIMARY KEY(non_member_goods_cart_id)
);


CREATE TABLE member_act_grade
(
	member_level_num NUMBER,
	standard_grade NUMBER NOT NULL,
	name_grade VARCHAR2(20) NOT NULL,

	CONSTRAINT member_act_grade_member_level_num_pk PRIMARY KEY(member_level_num)
);

CREATE TABLE category
(
	category_id NUMBER,
	category_name VARCHAR2(20) NOT NULL,

	CONSTRAINT category_category_id_pk PRIMARY KEY(category_id)
);

CREATE TABLE chatroom
(
	chat_room_id NUMBER,
	chat_room VARCHAR2(20),
	created_date TIMESTAMP(6) NOT NULL,
	chat_text VARCHAR2(1000),

	CONSTRAINT chatroom_chat_room_id_pk PRIMARY KEY(chat_room_id)
);

CREATE TABLE standard_value
(
	name_standard VARCHAR2(20),
	add_value NUMBER NOT NULL,

	CONSTRAINT standard_value_name_standard_pk PRIMARY KEY(name_standard)
);

ALTER TABLE goods
ADD CONSTRAINT category_id_fk FOREIGN KEY(category_id)
REFERENCES category(category_id) ON DELETE SET NULL;


ALTER TABLE member_goods_cart
ADD CONSTRAINT member_id_fk FOREIGN KEY(member_id)
REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE member_goods_cart
ADD CONSTRAINT goods_id_fk FOREIGN KEY(goods_id)
REFERENCES goods(goods_id) ON DELETE CASCADE;

ALTER TABLE member_goods_cart
ADD CONSTRAINT cart_id_fk FOREIGN KEY(cart_id)
REFERENCES cart(cart_id) ON DELETE CASCADE;

ALTER TABLE non_member_retail_cart
ADD CONSTRAINT non_member_id_fk FOREIGN KEY(non_member_id)
REFERENCES non_member(non_member_id) ON DELETE CASCADE;

ALTER TABLE non_member_retail_cart
ADD CONSTRAINT cart_id_fk FOREIGN KEY(cart_id)
REFERENCES cart(cart_id) ON DELETE CASCADE;

ALTER TABLE non_member_retail_cart
ADD CONSTRAINT retail_id_fk FOREIGN KEY(retail_id)
REFERENCES retail(retail_id) ON DELETE CASCADE;


ALTER TABLE non_member_goods_cart
ADD CONSTRAINT non_member_id_fk FOREIGN KEY(non_member_id)
REFERENCES non_member(non_member_id) ON DELETE CASCADE;

ALTER TABLE non_member_goods_cart
ADD CONSTRAINT goods_id_fk FOREIGN KEY(goods_id)
REFERENCES goods(goods_id) ON DELETE CASCADE;

ALTER TABLE non_member_goods_cart
ADD CONSTRAINT cart_id_fk FOREIGN KEY(cart_id)
REFERENCES cart(cart_id) ON DELETE CASCADE;

DROP table region_board;

CREATE TABLE region_board (
    post_no NUMBER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT region_board_post_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT region_board_member_id_fk REFERENCES member(member_id) ON DELETE CASCADE,
    title VARCHAR2(300) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    views NUMBER DEFAULT 0 NOT NULL,
    write_dt TIMESTAMP DEFAULT current_timestamp NOT NULL,
    like_cnt NUMBER DEFAULT 0 NOT NULL,
    hate_cnt NUMBER DEFAULT 0 NOT NULL,
    report_cnt NUMBER DEFAULT 0 NOT NULL,
    writing_area NUMBER NOT NULL
);

DROP TABLE sale_board;

CREATE TABLE sale_board (
    post_no NUMBER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT sale_board_post_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT sale_board_member_id_fk REFERENCES member(member_id) ON DELETE CASCADE,
    title VARCHAR2(300) NOT NULL,
    content VARCHAR2(4000) NOT NULL,

    -- test
    views NUMBER DEFAULT 0 NOT NULL,
    write_dt TIMESTAMP DEFAULT current_timestamp NOT NULL,
    like_cnt NUMBER DEFAULT 0 NOT NULL,
    hate_cnt NUMBER DEFAULT 0 NOT NULL,
    report_cnt NUMBER DEFAULT 0 NOT NULL,
    writing_area NUMBER NOT NULL
);

DROP TABLE region_board_comment;

CREATE TABLE region_board_comment (
    comment_no NUMBER GENERATED BY DEFAULT AS IDENTITY,
    post_no NUMBER
        CONSTRAINT region_board_comment_post_no_fk REFERENCES region_board(post_no) ON DELETE CASCADE,
    member_id NUMBER
        CONSTRAINT region_board_comment_member_id_fk REFERENCES member(member_id) ON DELETE CASCADE,
    secret_yn CHAR(1)
        CONSTRAINT region_board_comment_secret_yn_ck NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    like_cnt NUMBER DEFAULT 0 NOT NULL,
    high_comment_no NUMBER,
    write_dt TIMESTAMP DEFAULT current_timestamp NOT NULL,
    comment_lv NUMBER(1) DEFAULT 1 NOT NULL,
    
    CONSTRAINT region_board_comment_comment_no_post_no_pk PRIMARY KEY(comment_no, post_no)
);   

DROP TABLE sale_board_comment;
    
CREATE TABLE sale_board_comment (
    comment_no NUMBER GENERATED BY DEFAULT AS IDENTITY,
    post_no NUMBER
        CONSTRAINT sale_board_comment_post_no_fk REFERENCES sale_board(post_no) ON DELETE CASCADE,
    member_id NUMBER
        CONSTRAINT sale_board_comment_member_id_fk REFERENCES member(member_id) ON DELETE CASCADE,
    content VARCHAR2(4000) NOT NULL,
    like_cnt NUMBER DEFAULT 0 NOT NULL,
    high_comment_no NUMBER,
    write_dt TIMESTAMP DEFAULT current_timestamp NOT NULL,
    comment_lv NUMBER(1) DEFAULT 1 NOT NULL,
    
    CONSTRAINT sale_board_comment_comment_no_post_no_pk PRIMARY KEY(comment_no, post_no)
);    

DROP TABLE region_board_file;

CREATE TABLE region_board_file (
    file_id VARCHAR2(200),
    post_no NUMBER
        CONSTRAINT region_board_file_post_no_fk REFERENCES region_board(post_no) ON DELETE CASCADE,
    file_name VARCHAR2(200) NOT NULL,
    file_path VARCHAR2(1000) NOT NULL,
    file_size NUMBER NOT NULL,
    create_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    
    CONSTRAINT region_board_file_file_id_post_no_pk PRIMARY KEY(file_id, post_no)
);

DROP TABLE sale_board_file;

CREATE TABLE sale_board_file (
    file_id VARCHAR2(200),
    post_no NUMBER
        CONSTRAINT sale_board_file_post_no_fk REFERENCES sale_board(post_no) ON DELETE CASCADE,
    file_name VARCHAR2(200) NOT NULL,
    file_path VARCHAR2(1000) NOT NULL,
    file_size NUMBER NOT NULL,
    create_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    
    CONSTRAINT sale_board_file_file_id_post_no_pk PRIMARY KEY(file_id, post_no)
);

DROP TABLE member_keyword;

CREATE TABLE member_keyword (
    keyword VARCHAR2(30) NOT NULL,
    member_id NUMBER
        CONSTRAINT member_keyword_member_id_fk REFERENCES member(member_id) ON DELETE CASCADE,
       
    CONSTRAINT member_keyword_keyword_member_id_pk PRIMARY KEY(keyword, member_id)
);

DROP TABLE region_board_keyword_not;

CREATE TABLE region_board_keyword_not (
    not_no NUMBER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT region_board_keyword_not_not_no_pk PRIMARY KEY NOT NULL,
    not_content VARCHAR2(150) NOT NULL,
    not_dt TIMESTAMP NOT NULL,
    not_read_dt TIMESTAMP,
    post_no NUMBER
        CONSTRAINT region_board_keyword_not_post_no_fk REFERENCES region_board(post_no) ON DELETE SET NULL,
    keyword VARCHAR2(30) NOT NULL,
    member_id NUMBER NOT NULL,
    
    CONSTRAINT region_board_keyword_not_keyword_member_id_fk 
    FOREIGN KEY(keyword, member_id) REFERENCES member_keyword(keyword, member_id)
); 

DROP TABLE sale_board_keyword_not;

CREATE TABLE sale_board_keyword_not (
    not_no NUMBER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT sale_board_keyword_not_not_no_pk PRIMARY KEY NOT NULL,
    not_content VARCHAR2(150) NOT NULL,
    not_dt TIMESTAMP NOT NULL,
    not_read_dt TIMESTAMP,
    post_no NUMBER
        CONSTRAINT sale_board_keyword_not_post_no_fk REFERENCES sale_board(post_no) ON DELETE SET NULL,
    keyword VARCHAR2(30) NOT NULL,
    member_id NUMBER NOT NULL,
    
    CONSTRAINT sale_board_keyword_not_keyword_member_id_fk 
    FOREIGN KEY(keyword, member_id) REFERENCES member_keyword(keyword, member_id)
);

DROP TABLE region_board_act_not;

CREATE TABLE region_board_act_not (
    not_no NUMBER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT region_board_act_not_not_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT region_board_act_not_member_id_fk REFERENCES member(member_id) ON DELETE CASCADE NOT NULL,
    post_no NUMBER
        CONSTRAINT region_board_act_not_post_no_fk REFERENCES region_board(post_no) ON DELETE SET NULL,
    not_target_member_id NUMBER NOT NULL,
    not_content VARCHAR2(150) NOT NULL,
    not_type VARCHAR2(15)
        CONSTRAINT region_board_act_not_not_type_ck 
        CHECK (not_type in ('comment', 'comment_comment', 'deal_cpl', 'mate_join', 'mate_cpl')) NOT NULL,
    not_dt TIMESTAMP NOT NULL,
    not_read_dt TIMESTAMP
);

DROP TABLE sale_board_act_not;

CREATE TABLE sale_board_act_not (
    not_no NUMBER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT sale_board_act_not_not_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT sale_board_act_not_member_id_fk REFERENCES member(member_id) ON DELETE CASCADE NOT NULL,
    post_no NUMBER
        CONSTRAINT sale_board_act_not_post_no_fk REFERENCES sale_board(post_no) ON DELETE SET NULL,
    not_target_member_id NUMBER NOT NULL,
    not_content VARCHAR2(150) NOT NULL,
    not_type VARCHAR2(15)
        CONSTRAINT sale_board_act_not_not_type_ck 
        CHECK (not_type in ('comment', 'comment_comment', 'deal_cpl', 'mate_join', 'mate_cpl')) NOT NULL,
    not_dt TIMESTAMP NOT NULL,
    not_read_dt TIMESTAMP
);

DROP TABLE region_board_bookmark;

CREATE TABLE region_board_bookmark (
    bookmark_no NUMBER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT region_board_bookmark_bookmark_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT region_board_bookmark_member_id_fk REFERENCES member(member_id) ON DELETE CASCADE NOT NULL,
    post_no NUMBER
        CONSTRAINT region_board_bookmark_post_no_fk REFERENCES region_board(post_no) ON DELETE SET NULL
);

DROP TABLE sale_board_bookmark;

CREATE TABLE sale_board_bookmark (
    bookmark_no NUMBER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT sale_board_bookmark_bookmark_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT sale_board_bookmark_member_id_fk REFERENCES member(member_id) ON DELETE CASCADE NOT NULL ,
    post_no NUMBER
        CONSTRAINT sale_board_bookmark_post_no_fk REFERENCES sale_board(post_no) ON DELETE SET NULL
);

CREATE TABLE COMPRI.member
(
member_id NUMBER GENERATED BY DEFAULT AS IDENTITY
CONSTRAINT member_member_id_pk PRIMARY KEY, 

member_level_num NUMBER NOT NULL
CONSTRAINT members_member_level_num_fk REFERENCES member_act_grade(member_level_num),

town_id NUMBER NOT NULL
CONSTRAINT member_town_id_fk REFERENCES town(town_id),

login_id VARCHAR2(20) NOT NULL,

alias VARCHAR2(10) NOT NULL,

money NUMBER NOT NULL,

email VARCHAR2(30) NULL,

mobile_num NUMBER NULL,

sns VARCHAR2(10) NULL,

pwd VARCHAR2(20) NOT NULL,

join_date TIMESTAMP NOT NULL,

point NUMBER NOT NULL,

authority_code VARCHAR2(10) NOT NULL,
CONSTRAINT member_authority_code_ck CHECK(authority_code in ('read', 'read+write')),

admin_account VARCHAR2(10) NOT NULL,
CONSTRAINT member_admin_account_ck CHECK (admin_account in ('user', 'admin'))
);

CREATE TABLE COMPRI.non_member
(
non_member_id NUMBER GENERATED BY DEFAULT AS IDENTITY
CONSTRAINT non_member_non_member_id_pk PRIMARY KEY, 

town_id NUMBER NOT NULL
CONSTRAINT non_member_town_id_fk REFERENCES town(town_id),

non_member_ip VARCHAR2(30) NOT NULL,

authority_code VARCHAR2(10) NOT NULL,
CONSTRAINT non_member_authority_code_ck CHECK(authority_code in ('read', 'read+write'))
);

CREATE TABLE COMPRI.retail
(
retail_id NUMBER GENERATED BY DEFAULT AS IDENTITY
	CONSTRAINT retail_retail_id_pk PRIMARY KEY,

retail_name VARCHAR2(20)  NOT NULL,

retail_addr VARCHAR2(50)  NOT NULL
);

CREATE TABLE COMPRI.cart
(
cart_id NUMBER  GENERATED BY DEFAULT AS IDENTITY
	CONSTRAINT cart_cart_id_pk PRIMARY KEY,

cart_creation_date TIMESTAMP  NOT NULL,

API_date TIMESTAMP NOT NULL
);

CREATE TABLE COMPRI.member_retail_cart
(
member_retail_cart_num NUMBER GENERATED BY DEFAULT AS IDENTITY
CONSTRAINT member_retail_cart_member_retail_cart_num_pk PRIMARY KEY, 

member_id NUMBER NOT NULL
CONSTRAINT member_retail_cart_member_id_fk REFERENCES member(member_id) ON DELETE CASCADE,

retail_id NUMBER NOT NULL
CONSTRAINT member_retail_cart_retail_id_fk REFERENCES retail(retail_id),

cart_id NUMBER NOT NULL
CONSTRAINT member_retail_cart_cart_id_fk REFERENCES cart(cart_id)
);

CREATE TABLE withdrawal (
    withdrawal_num NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT withdrawal_withdrawal_num_pk PRIMARY KEY,
    withdrawal_reason VARCHAR2(20) NOT NULL,
    etc_reason VARCHAR2(600)
);

CREATE TABLE country (
    country_id NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT country_country_id_pk PRIMARY KEY,
    country_name VARCHAR2(20) NOT NULL
);

CREATE TABLE city (
    city_id NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT city_city_id_pk PRIMARY KEY,
    city_name VARCHAR2(20) NOT NULL,
    country_id NUMBER NOT NULL
);

CREATE TABLE town (
    town_id NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT town_town_id_pk PRIMARY KEY,
    town_name VARCHAR2(20) NOT NULL,
    city_id NUMBER NOT NULL
);

CREATE TABLE favorite (
    member_id NUMBER,
    retail_id NUMBER
);

CREATE TABLE sale (
    api_date DATE,
    retail_id NUMBER,
    goods_id NUMBER, 
    price NUMBER NOT NULL,
);

CREATE TABLE wish_list (
    member_id NUMBER,
    goods_id NUMBER,
);

CREATE TABLE chat_room_enter (
    chat_room_id NUMBER,
    member_id_1 NUMBER NOT NULL,
    member_id_2 NUMBER,
    member_id_3 NUMBER,
    member_id_4 NUMBER,
);

ALTER TABLE city
ADD CONSTRAINT city_country_id_fk FOREIGN KEY (country_id)  
REFERENCES country (country_id) ON DELETE CASCADE;

ALTER TABLE town
ADD CONSTRAINT town_city_id_fk FOREIGN KEY (city_id)
REFERENCES city (city_id) ON DELETE CASCADE;

ALTER TABLE favorite
ADD CONSTRAINT favorite_member_id_retail_id_pk PRIMARY KEY (
	member_id,
	retail_id
);

ALTER TABLE favorite
ADD CONSTRAINT favorite_member_id_fk FOREIGN KEY (member_id)
REFERENCES member (member_id) ON DELETE CASCADE;

ALTER TABLE favorite
ADD CONSTRAINT favorite_retail_id_fk FOREIGN KEY (retail_id)
REFERENCES retail (retail_id) ON DELETE CASCADE;


ALTER TABLE sale
ADD CONSTRAINT sale_api_date_retail_id_goods_id_pk PRIMARY KEY (
	api_date,
	retail_id,
	goods_id
);

ALTER TABLE sale
ADD CONSTRAINT sale_retail_id_fk FOREIGN KEY (retail_id)
REFERENCES retail (retail_id) ON DELETE CASCADE;

ALTER TABLE sale
ADD CONSTRAINT sale_goods_id_fk FOREIGN KEY (goods_id)
REFERENCES goods (goods_id) ON DELETE CASCADE;


ALTER TABLE wish_list
ADD CONSTRAINT wish_list_member_id_goods_id_pk PRIMARY KEY (
	member_id,
	goods_id
);

ALTER TABLE wish_list
ADD CONSTRAINT wish_list_member_id_fk FOREIGN KEY (member_id)
REFERENCES member (member_id) ON DELETE CASCADE;

ALTER TABLE wish_list
ADD CONSTRAINT wish_list_goods_id_fk FOREIGN KEY (goods_id)
REFERENCES goods (goods_id) ON DELETE CASCADE;


ALTER TABLE chat_room_enter
ADD CONSTRAINT chat_room_enter_chat_room_id_pk PRIMARY KEY (
	chat_room_id
);

ALTER TABLE chat_room_enter
ADD CONSTRAINT chat_room_enter_chat_room_id_fk FOREIGN KEY (chat_room_id)
REFERENCES chatroom (chat_room_id) ON DELETE CASCADE;

ALTER TABLE chat_room_enter
ADD CONSTRAINT chat_room_enter_members_id_1_fk FOREIGN KEY (member_id_1)
REFERENCES member (member_id) ON DELETE CASCADE;

ALTER TABLE chat_room_enter
ADD CONSTRAINT chat_room_enter_members_id_2_fk FOREIGN KEY (member_id_2)
REFERENCES member (member_id) ON DELETE CASCADE;

ALTER TABLE chat_room_enter
ADD CONSTRAINT chat_room_enter_members_id_3_fk FOREIGN KEY (member_id_3)
REFERENCES member (member_id) ON DELETE CASCADE;

ALTER TABLE chat_room_enter
ADD CONSTRAINT chat_room_enter_members_id_4_fk FOREIGN KEY (member_id_4)
REFERENCES member (member_id) ON DELETE CASCADE;
