ALTER TABLE favorite
ADD CONSTRAINT favorite_member_id_retail_id_pk PRIMARY KEY (
    member_id,
    retail_id
);

ALTER TABLE sale
ADD CONSTRAINT sale_api_date_retail_id_goods_id_pk PRIMARY KEY (
    api_date,
    retail_id,
    goods_id
);

ALTER TABLE wish_list
ADD CONSTRAINT wish_list_member_id_goods_id_pk PRIMARY KEY (
    member_id,
    goods_id
);

ALTER TABLE chat_room_enter
ADD CONSTRAINT chat_room_enter_chat_room_id_pk PRIMARY KEY (
    chat_room_id
);


ALTER TABLE region_board ADD
CONSTRAINT region_board_post_no_pk PRIMARY KEY(post_no);

ALTER TABLE sale_board ADD
CONSTRAINT sale_board_post_no_pk PRIMARY KEY(post_no);


ALTER TABLE sale_board_file ADD
CONSTRAINT sale_board_file_file_id_post_no_pk PRIMARY KEY(file_id, post_no);

ALTER TABLE member_keyword ADD
CONSTRAINT member_keyword_keyword_member_id_pk PRIMARY KEY(keyword, member_id);

ALTER TABLE region_board_keyword_not ADD
CONSTRAINT region_board_keyword_not_not_no_pk PRIMARY KEY(not_no);

ALTER TABLE sale_board_keyword_not ADD
CONSTRAINT sale_board_keyword_not_not_no_pk PRIMARY KEY(not_no);

ALTER TABLE region_board_act_not ADD
CONSTRAINT region_board_act_not_not_no_pk PRIMARY KEY(not_no);

ALTER TABLE sale_board_act_not ADD
CONSTRAINT sale_board_act_not_not_no_pk PRIMARY KEY(not_no);

ALTER TABLE region_board_bookmark ADD
CONSTRAINT region_board_bookmark_bookmark_no_pk PRIMARY KEY(bookmark_no);

ALTER TABLE sale_board_bookmark ADD
CONSTRAINT sale_board_bookmark_bookmark_no_pk PRIMARY KEY(bookmark_no);




