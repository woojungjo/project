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

