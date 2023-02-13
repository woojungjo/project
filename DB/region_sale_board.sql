DROP TABLE member;

CREATE TABLE member (
    user_id NUMBER CONSTRAINT member_user_id_pk PRIMARY KEY
);

DROP table region_board;

CREATE TABLE region_board (
    post_no NUMBER
        CONSTRAINT region_board_post_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT region_board_member_id_fk REFERENCES members(member_id) ON DELETE SET NULL,
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
    post_no NUMBER
        CONSTRAINT sale_board_post_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT sale_board_member_id_fk REFERENCES members(member_id) ON DELETE SET NULL,
    title VARCHAR2(300) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    views NUMBER DEFAULT 0 NOT NULL,
    write_dt TIMESTAMP DEFAULT current_timestamp NOT NULL,
    like_cnt NUMBER DEFAULT 0 NOT NULL,
    hate_cnt NUMBER DEFAULT 0 NOT NULL,
    report_cnt NUMBER DEFAULT 0 NOT NULL,
    writing_area NUMBER NOT NULL
);

DROP TABLE region_board_comment;

CREATE TABLE region_board_comment (
    comment_no NUMBER,
    post_no NUMBER
        CONSTRAINT region_board_comment_post_no_fk REFERENCES region_board(post_no) ON DELETE CASCADE,
    member_id NUMBER
        CONSTRAINT region_board_comment_member_id_fk REFERENCES members(member_id) ON DELETE SET NULL,
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
    comment_no NUMBER,
    post_no NUMBER
        CONSTRAINT sale_board_comment_post_no_fk REFERENCES sale_board(post_no) ON DELETE CASCADE,
    member_id NUMBER
        CONSTRAINT sale_board_comment_member_id_fk REFERENCES members(member_id) ON DELETE SET NULL,
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
        CONSTRAINT sale_board_file_post_no_fk REFERENCES sale_board(post_no) ON DELETE SET NULL,
    file_name VARCHAR2(200) NOT NULL,
    file_path VARCHAR2(1000) NOT NULL,
    file_size NUMBER NOT NULL,
    create_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    
    CONSTRAINT sale_board_file_file_id_post_no_pk PRIMARY KEY(file_id, post_no)
);

DROP TABLE members_keyword;

CREATE TABLE members_keyword (
    keyword VARCHAR2(30) NOT NULL,
    member_id NUMBER
        CONSTRAINT members_keyword_member_id_fk REFERENCES members(member_id) ON DELETE CASCADE,
       
    CONSTRAINT members_keyword_keyword_member_id_pk PRIMARY KEY(keyword, member_id)
);

DROP TABLE region_board_keyword_not;

CREATE TABLE region_board_keyword_not (
    not_no NUMBER CONSTRAINT region_board_keyword_not_not_no_pk PRIMARY KEY NOT NULL,
    not_content VARCHAR2(150) NOT NULL,
    not_dt TIMESTAMP NOT NULL,
    not_read_dt TIMESTAMP,
    post_no NUMBER
        CONSTRAINT region_board_keyword_not_post_no_fk REFERENCES region_board(post_no) ON DELETE SET NULL,
    keyword VARCHAR2(30) NOT NULL,
    member_id NUMBER NOT NULL,
    
    CONSTRAINT region_board_keyword_not_keyword_member_id_fk 
    FOREIGN KEY(keyword, member_id) REFERENCES members_keyword(keyword, member_id)
); 

DROP TABLE sale_board_keyword_not;

CREATE TABLE sale_board_keyword_not (
    not_no NUMBER CONSTRAINT sale_board_keyword_not_not_no_pk PRIMARY KEY NOT NULL,
    not_content VARCHAR2(150) NOT NULL,
    not_dt TIMESTAMP NOT NULL,
    not_read_dt TIMESTAMP,
    post_no NUMBER
        CONSTRAINT sale_board_keyword_not_post_no_fk REFERENCES sale_board(post_no) ON DELETE SET NULL,
    keyword VARCHAR2(30) NOT NULL,
    member_id NUMBER NOT NULL,
    
    CONSTRAINT sale_board_keyword_not_keyword_member_id_fk 
    FOREIGN KEY(keyword, member_id) REFERENCES members_keyword(keyword, member_id)
);

DROP TABLE region_board_act_not;

CREATE TABLE region_board_act_not (
    not_no NUMBER CONSTRAINT region_board_act_not_not_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT region_board_act_not_member_id_fk REFERENCES members(member_id) NOT NULL,
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
    not_no NUMBER CONSTRAINT sale_board_act_not_not_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT sale_board_act_not_member_id_fk REFERENCES members(member_id) NOT NULL,
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
    bookmark_no NUMBER
        CONSTRAINT region_board_bookmark_bookmark_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT region_board_bookmark_member_id_fk REFERENCES members(member_id) ON DELETE CASCADE NOT NULL,
    post_no NUMBER
        CONSTRAINT region_board_bookmark_post_no_fk REFERENCES region_board(post_no) ON DELETE SET NULL
);

DROP TABLE sale_board_bookmark;

CREATE TABLE sale_board_bookmark (
    bookmark_no NUMBER
        CONSTRAINT sale_board_bookmark_bookmark_no_pk PRIMARY KEY,
    member_id NUMBER
        CONSTRAINT sale_board_bookmark_member_id_fk REFERENCES members(member_id) ON DELETE CASCADE NOT NULL ,
    post_no NUMBER
        CONSTRAINT sale_board_bookmark_post_no_fk REFERENCES sale_board(post_no) ON DELETE SET NULL
);

DESC region_board;
DESC sale_board;
DESC region_board_comment; 
DESC sale_board_comment; 
DESC region_board_file;
DESC sale_board_file;
DESC user_keyword;  
DESC region_board_keyword_not;   
DESC sale_board_keyword_not; 
DESC region_board_act_not;
DESC sale_board_act_not;
DESC region_board_bookmark;
DESC sale_board_bookmark;


DROP TABLE region_board CASCADE CONSTRAINTS;
DROP TABLE sale_board CASCADE CONSTRAINTS;
DROP TABLE region_board_comment CASCADE CONSTRAINTS;
DROP TABLE sale_board_comment CASCADE CONSTRAINTS;
DROP TABLE region_board_file CASCADE CONSTRAINTS;
DROP TABLE sale_board_file CASCADE CONSTRAINTS;
DROP TABLE user_keyword CASCADE CONSTRAINTS;
DROP TABLE region_board_keyword_not CASCADE CONSTRAINTS;
DROP TABLE sale_board_keyword_not CASCADE CONSTRAINTS;
DROP TABLE region_board_act_not CASCADE CONSTRAINTS;
DROP TABLE sale_board_act_not CASCADE CONSTRAINTS;
DROP TABLE region_board_bookmark CASCADE CONSTRAINTS;
DROP TABLE sale_board_bookmark CASCADE CONSTRAINTS;

