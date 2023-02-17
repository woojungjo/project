-- qna board, mate board

ALTER TABLE qna_board ADD CONSTRAINT qna_board_member_id_fk FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE CASCADE;

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
-- on delete?
ALTER TABLE mate_board_bookmark ADD CONSTRAINT mate_board_bookmark_post_no_fk FOREIGN KEY (post_no)REFERENCES mate_board (post_no) ON DELETE SET NULL;

ALTER TABLE mate_board_bookmark ADD CONSTRAINT mate_board_bookmark_member_id_fk FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE mate_board_tags ADD CONSTRAINT mate_board_tags_post_no_fk FOREIGN KEY (post_no)REFERENCES mate_board (post_no) ON DELETE CASCADE;

ALTER TABLE member ADD CONSTRAINT member_member_level_num_fk FOREIGN KEY (member_level_num) REFERENCES member_act_grade(member_level_num) ON DELETE CASCADE;

ALTER TABLE member ADD CONSTRAINT member_town_id_fk FOREIGN KEY (town_id) REFERENCES town(town_id) ON DELETE CASCADE;

ALTER TABLE non_member ADD CONSTRAINT non_member_town_id_fk FOREIGN KEY (town_id) REFERENCES town(town_id) ON DELETE CASCADE;

ALTER TABLE member_retail_cart ADD CONSTRAINT member_retail_cart_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE member_retail_cart ADD CONSTRAINT member_retail_cart_retail_id_fk FOREIGN KEY (retail_id) REFERENCES retail(retail_id) ON DELETE CASCADE;

ALTER TABLE  member_retail_cart ADD CONSTRAINT member_retail_cart_cart_id_fk FOREIGN KEY (cart_id ) REFERENCES cart(cart_id) ON DELETE CASCADE;
