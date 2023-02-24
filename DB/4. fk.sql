

ALTER TABLE city
ADD CONSTRAINT city_country_id_fk FOREIGN KEY (country_id)  
REFERENCES country (country_id) ON DELETE CASCADE;

ALTER TABLE town
ADD CONSTRAINT town_city_id_fk FOREIGN KEY (city_id)
REFERENCES city (city_id) ON DELETE CASCADE;



ALTER TABLE favorite
ADD CONSTRAINT favorite_member_id_fk FOREIGN KEY (member_id)
REFERENCES member (member_id) ON DELETE CASCADE;

ALTER TABLE favorite
ADD CONSTRAINT favorite_retail_id_fk FOREIGN KEY (retail_id)
REFERENCES retail (retail_id) ON DELETE CASCADE;




ALTER TABLE sale
ADD CONSTRAINT sale_retail_id_fk FOREIGN KEY (retail_id)
REFERENCES retail (retail_id) ON DELETE CASCADE;

ALTER TABLE sale
ADD CONSTRAINT sale_goods_id_fk FOREIGN KEY (goods_id)
REFERENCES goods (goods_id) ON DELETE CASCADE;




ALTER TABLE wish_list
ADD CONSTRAINT wish_list_member_id_fk FOREIGN KEY (member_id)
REFERENCES member (member_id) ON DELETE CASCADE;

ALTER TABLE wish_list
ADD CONSTRAINT wish_list_goods_id_fk FOREIGN KEY (goods_id)
REFERENCES goods (goods_id) ON DELETE CASCADE;




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
REFERENCES member (member_id) ON DELETE CASCADE;ALTER TABLE qna_board ADD CONSTRAINT qna_board_member_id_fk FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE CASCADE;

ALTER TABLE qna_board_comment ADD CONSTRAINT qna_board_comment_post_no_fk FOREIGN KEY (post_no)REFERENCES qna_board (post_no) ON DELETE CASCADE;

ALTER TABLE qna_board_comment ADD CONSTRAINT qna_board_comment_member_id_fk FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE qna_board_file ADD CONSTRAINT qna_board_file_post_no_fk FOREIGN KEY (post_no)REFERENCES qna_board (post_no) ON DELETE CASCADE;

ALTER TABLE qna_board_act_not ADD CONSTRAINT qna_board_act_no_post_no_fk FOREIGN KEY (post_no)REFERENCES qna_board (post_no) ON DELETE SET NULL;

ALTER TABLE qna_board_act_not ADD CONSTRAINT qna_board_act_not_member_id_fk FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE qna_board_keyword_not ADD CONSTRAINT qna_board_keyword_not_post_no_fk FOREIGN KEY (post_no)REFERENCES qna_board (post_no) ON DELETE SET NULL;

ALTER TABLE qna_board_keyword_not ADD CONSTRAINT qna_board_keyword_not_keyword_member_id_fk FOREIGN KEY(keyword, member_id) REFERENCES member_keyword(keyword, member_id) ;

ALTER TABLE qna_board_bookmark ADD CONSTRAINT qna_board_bookmark_post_no_fk FOREIGN KEY (post_no)REFERENCES qna_board (post_no) ON DELETE CASCADE;

ALTER TABLE qna_board_bookmark ADD CONSTRAINT qna_board_bookmark_member_id_fk FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE;


ALTER TABLE mate_board ADD CONSTRAINT mate_board_member_id_fk FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE mate_board_comment ADD CONSTRAINT mate_board_comment_post_no_fk FOREIGN KEY (post_no)REFERENCES mate_board (post_no) ON DELETE CASCADE;

ALTER TABLE mate_board_comment ADD CONSTRAINT mate_board_comment_member_id_fk FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE mate_board_file ADD CONSTRAINT mate_board_file_post_no_fk FOREIGN KEY (post_no)REFERENCES mate_board (post_no) ON DELETE CASCADE;

ALTER TABLE mate_board_act_not ADD CONSTRAINT mate_board_act_not_post_no_fk FOREIGN KEY (post_no)REFERENCES mate_board (post_no) ON DELETE SET NULL;

ALTER TABLE mate_board_act_not ADD CONSTRAINT mate_board_act_not_member_id_fk FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE mate_board_keyword_not ADD CONSTRAINT mate_board_keyword_not_post_no_fk FOREIGN KEY (post_no)REFERENCES mate_board (post_no) ON DELETE SET NULL;

ALTER TABLE mate_board_keyword_not ADD CONSTRAINT mate_board_keyword_not_keyword_member_id_fk FOREIGN KEY(keyword, member_id) REFERENCES member_keyword(keyword, member_id);

ALTER TABLE mate_board_bookmark ADD CONSTRAINT mate_board_bookmark_post_no_fk FOREIGN KEY (post_no)REFERENCES mate_board (post_no) ON DELETE SET NULL;

ALTER TABLE mate_board_bookmark ADD CONSTRAINT mate_board_bookmark_member_id_fk FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE mate_board_tags ADD CONSTRAINT mate_board_tags_post_no_fk FOREIGN KEY (post_no)REFERENCES mate_board (post_no) ON DELETE CASCADE;

ALTER TABLE member ADD CONSTRAINT member_member_level_num_fk FOREIGN KEY (member_level_num) REFERENCES member_act_grade(member_level_num) ON DELETE CASCADE;

ALTER TABLE member ADD CONSTRAINT member_town_id_fk FOREIGN KEY (town_id) REFERENCES town(town_id) ON DELETE CASCADE;

ALTER TABLE non_member ADD CONSTRAINT non_member_town_id_fk FOREIGN KEY (town_id) REFERENCES town(town_id) ON DELETE CASCADE;

ALTER TABLE member_retail_cart ADD CONSTRAINT member_retail_cart_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE member_retail_cart ADD CONSTRAINT member_retail_cart_retail_id_fk FOREIGN KEY (retail_id) REFERENCES retail(retail_id) ON DELETE CASCADE;

ALTER TABLE  member_retail_cart ADD CONSTRAINT member_retail_cart_cart_id_fk FOREIGN KEY (cart_id ) REFERENCES cart(cart_id) ON DELETE CASCADE;
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
ADD CONSTRAINT non_member_retail_cart_non_member_id_fk FOREIGN KEY(non_member_id)
REFERENCES non_member(non_member_id) ON DELETE CASCADE;

ALTER TABLE non_member_retail_cart
ADD CONSTRAINT non_member_retail_cart_cart_id_fk FOREIGN KEY(cart_id)
REFERENCES cart(cart_id) ON DELETE CASCADE;

ALTER TABLE non_member_retail_cart
ADD CONSTRAINT retail_id_fk FOREIGN KEY(retail_id)
REFERENCES retail(retail_id) ON DELETE CASCADE;


ALTER TABLE non_member_goods_cart
ADD CONSTRAINT non_member_goods_cart_non_member_id_fk FOREIGN KEY(non_member_id)
REFERENCES non_member(non_member_id) ON DELETE CASCADE;

ALTER TABLE non_member_goods_cart
ADD CONSTRAINT non_member_goods_cart_goods_id_fk FOREIGN KEY(goods_id)
REFERENCES goods(goods_id) ON DELETE CASCADE;

ALTER TABLE non_member_goods_cart
ADD CONSTRAINT non_member_goods_cart_cart_id_fk FOREIGN KEY(cart_id)
REFERENCES cart(cart_id) ON DELETE CASCADE;



ALTER TABLE region_board ADD
CONSTRAINT region_board_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;



ALTER TABLE sale_board ADD
CONSTRAINT sale_board_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE region_board_comment ADD
CONSTRAINT region_board_comment_post_no_fk FOREIGN KEY(post_no) REFERENCES region_board(post_no) ON DELETE CASCADE;

ALTER TABLE region_board_comment ADD
CONSTRAINT region_board_comment_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;


ALTER TABLE sale_board_comment ADD
CONSTRAINT sale_board_comment_post_no_fk FOREIGN KEY(post_no) REFERENCES sale_board(post_no) ON DELETE CASCADE;

ALTER TABLE sale_board_comment ADD
CONSTRAINT sale_board_comment_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;


ALTER TABLE region_board_file ADD
CONSTRAINT region_board_file_post_no_fk FOREIGN KEY(post_no) REFERENCES region_board(post_no) ON DELETE CASCADE;

    
ALTER TABLE sale_board_file ADD
CONSTRAINT sale_board_file_post_no_fk FOREIGN KEY(post_no) REFERENCES sale_board(post_no) ON DELETE CASCADE;


ALTER TABLE member_keyword ADD
CONSTRAINT member_keyword_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;


ALTER TABLE region_board_keyword_not ADD
CONSTRAINT region_board_keyword_not_post_no_fk FOREIGN KEY(post_no) REFERENCES region_board(post_no) ON DELETE SET NULL;

ALTER TABLE region_board_keyword_not ADD
CONSTRAINT region_board_keyword_not_keyword_member_id_fk 
FOREIGN KEY(keyword, member_id) REFERENCES member_keyword(keyword, member_id);


ALTER TABLE sale_board_keyword_not ADD
CONSTRAINT sale_board_keyword_not_post_no_fk FOREIGN KEY(post_no) REFERENCES sale_board(post_no) ON DELETE SET NULL;

ALTER TABLE sale_board_keyword_not ADD
CONSTRAINT sale_board_keyword_not_keyword_member_id_fk 
FOREIGN KEY(keyword, member_id) REFERENCES member_keyword(keyword, member_id);


ALTER TABLE region_board_act_not ADD
CONSTRAINT region_board_act_not_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE region_board_act_not ADD
CONSTRAINT region_board_act_not_post_no_fk FOREIGN KEY(post_no) REFERENCES region_board(post_no) ON DELETE SET NULL;


ALTER TABLE sale_board_act_not ADD
CONSTRAINT sale_board_act_not_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE sale_board_act_not ADD
CONSTRAINT sale_board_act_not_post_no_fk FOREIGN KEY(post_no) REFERENCES sale_board(post_no) ON DELETE SET NULL;

ALTER TABLE region_board_bookmark ADD
CONSTRAINT region_board_bookmark_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;


ALTER TABLE sale_board_bookmark ADD
CONSTRAINT sale_board_bookmark_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE sale_board_bookmark ADD
CONSTRAINT sale_board_bookmark_post_no_fk FOREIGN KEY(post_no) REFERENCES sale_board(post_no) ON DELETE SET NULL;


