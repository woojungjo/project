SQL
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
