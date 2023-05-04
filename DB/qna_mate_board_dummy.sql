-- ============================== qna
ALTER TABLE qna_board MODIFY(post_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO qna_board (member_id, title, content, views, secret_yn) 
SELECT
	(SELECT member_id FROM member WHERE member_id = 198),
	'TITLE_' || LEVEL,
	'CONTENT_' || LEVEL,
	LEVEL,
    LEVEL

FROM dual
CONNECT BY level <= 1;

INSERT INTO qna_board (member_id, title, content, views, secret_yn)
SELECT
	999,
	'한글 테스트',
	'pls',
	999,
    0
FROM dual
;



DELETE from QNA_BOARD_COMMENT;

ALTER TABLE qna_board_comment MODIFY(comment_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO qna_board_comment (post_no, member_id, secret_yn, content, like_cnt, high_comment_no, comment_lv) 
SELECT
    (SELECT post_no FROM qna_board WHERE post_no = 1),
    (SELECT member_id FROM member WHERE member_id = 198),
    MOD(LEVEL, 2),
	'CONTENT_' || LEVEL,
	LEVEL,
	LEVEL,
    MOD(LEVEL, 10)

FROM dual
CONNECT BY level <= 100000;
-- 게시글당 하나씩 댓글작성
INSERT INTO qna_board_comment (post_no, member_id, secret_yn, content, like_cnt, comment_root) 
SELECT
    level,
    (SELECT member_id FROM member WHERE member_id = 198),
    MOD(LEVEL, 2),
	'CONTENT_' || LEVEL,
	MOD(LEVEL, 50),
	ISEQ$$_110610.currval

FROM dual
CONNECT BY level <= 100000;

-- 세일게시판 댓글 더미
ALTER TABLE sale_board_comment MODIFY(comment_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO sale_board_comment (post_no, member_id, content, delete_yn, comment_root) 
SELECT
    level,
    (SELECT member_id FROM member WHERE member_id = 198),
	'CONTENT_' || LEVEL,
	0,
	ISEQ$$_112091.currval

FROM dual
CONNECT BY level <= 100000;
-- /세일게시판 댓글 더미

INSERT INTO qna_board_file (file_id, post_no, file_name, file_path, file_type, file_size) 
SELECT
	'FILE_ID_' || LEVEL,
    (SELECT post_no FROM qna_board WHERE post_no = 1),
	'FILE_NAME_' || LEVEL,
	'FILE_PATH_' || LEVEL,
	'TYPE' || MOD(LEVEL, 10),
    LEVEL
FROM dual
CONNECT BY level <= 100000;

ALTER TABLE qna_board_act_not MODIFY(not_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO qna_board_act_not (member_id, post_no, not_target_member_id, not_content, not_type, not_read_dt)
SELECT
    (SELECT member_id FROM member WHERE member_id = 198),
    (SELECT post_no FROM qna_board WHERE post_no = 1),
    (SELECT member_id FROM member WHERE member_id = 200),
	'NOT_CONTENT_' || LEVEL,
	'NOT_TYPE_' || LEVEL,
    CURRENT_DATE

FROM dual
CONNECT BY level <= 100000;

ALTER TABLE qna_board_keyword_not MODIFY(not_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO qna_board_keyword_not (not_content, not_read_dt, post_no, keyword, member_id)

SELECT
	'NOT_CONTENT_' || LEVEL,
    CURRENT_DATE,
    (SELECT post_no FROM qna_board WHERE post_no = 1),
	'KEYWORD' || LEVEL,
    (SELECT member_id FROM member_keyword WHERE rownum = 1)

FROM dual
CONNECT BY level <= 100000;

INSERT INTO qna_board_bookmark (member_id, post_no)

SELECT
    (SELECT member_id FROM member_keyword WHERE rownum = 1),
    (SELECT post_no FROM qna_board WHERE rownum = 1)

FROM dual
CONNECT BY level <= 100000;


-- ============================== mate

ALTER TABLE mate_board MODIFY(post_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO mate_board (member_id, title, content, views, report_cnt, meeting_status, meeting_time, meeting_area, participant_id_1, participant_id_2, participant_id_3) 
SELECT
	(SELECT member_id FROM member WHERE rownum = 1),
	'TITLE_' || LEVEL,
	'CONTENT_' || LEVEL,
	LEVEL,
	LEVEL,
    MOD(LEVEL, 2),
	CURRENT_DATE,
	'MEETING_AREA_' || LEVEL,
	(SELECT member_id FROM member WHERE member_id = 199),
	(SELECT member_id FROM member WHERE member_id = 200),
	(SELECT member_id FROM member WHERE member_id = 201)

FROM dual
CONNECT BY level <= 100000;

ALTER TABLE mate_board_comment MODIFY(comment_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO mate_board_comment (post_no, member_id, secret_yn, content, like_cnt, high_comment_no, comment_lv) 
SELECT
    (SELECT post_no FROM mate_board WHERE post_no = 1),
    (SELECT member_id FROM member WHERE member_id = 198),
    MOD(LEVEL, 2),
	'CONTENT_' || LEVEL,
	LEVEL,
	LEVEL,
    MOD(LEVEL, 10)

FROM dual
CONNECT BY level <= 100000;

INSERT INTO mate_board_file (file_id, post_no, file_name, file_path, file_type, file_size) 
SELECT
	'FILE_ID_' || LEVEL,
    (SELECT post_no FROM mate_board WHERE post_no = 1),
	'FILE_NAME_' || LEVEL,
	'FILE_PATH_' || LEVEL,
	'TYPE' || MOD(LEVEL, 10),
    LEVEL

FROM dual
CONNECT BY level <= 100000;

ALTER TABLE mate_board_act_not MODIFY(not_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO mate_board_act_not (member_id, post_no, not_target_member_id, not_content, not_type, not_read_dt)
SELECT
    (SELECT member_id FROM member WHERE member_id = 198),
    (SELECT post_no FROM mate_board WHERE post_no = 1),
    (SELECT member_id FROM member WHERE member_id = 200),
	'NOT_CONTENT_' || LEVEL,
	'NOT_TYPE_' || LEVEL,
    CURRENT_DATE

FROM dual
CONNECT BY level <= 100000;

ALTER TABLE mate_board_keyword_not MODIFY(not_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO mate_board_keyword_not (not_content, not_read_dt, post_no, keyword, member_id)

SELECT
	'NOT_CONTENT_' || LEVEL,
    CURRENT_DATE,
    (SELECT post_no FROM mate_board WHERE post_no = 1),
	'KEYWORD' || LEVEL,
    (SELECT member_id FROM member_keyword WHERE rownum = 1)

FROM dual
CONNECT BY level <= 100000;

INSERT INTO mate_board_bookmark (member_id, post_no)

SELECT
    (SELECT member_id FROM member_keyword WHERE rownum = 1),
    (SELECT post_no FROM mate_board WHERE rownum = 1)

FROM dual
CONNECT BY level <= 100000;

INSERT INTO mate_board_tags (tag_name, post_no)

SELECT
	'tag_name_' || LEVEL,
    (SELECT post_no FROM mate_board WHERE rownum = 1)

FROM dual
CONNECT BY level <= 100000;


-- ============================== crawling

ALTER TABLE crawling_board MODIFY(post_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO crawling_board (member_id, title, content, views, like_cnt, hate_cnt)
SELECT
	(SELECT member_id FROM member WHERE rownum = 1),
	'TITLE_' || LEVEL,
	'CONTENT_' || LEVEL,
	LEVEL,
	LEVEL,
	LEVEL

FROM dual
CONNECT BY level <= 100000;

INSERT INTO crawling_board_bookmark (member_id, post_no)

SELECT
    (SELECT member_id FROM member_keyword WHERE rownum = 1),
    (SELECT post_no FROM crawling_board WHERE rownum = 1)

FROM dual
CONNECT BY level <= 100000;

ALTER TABLE crawling_board_act_not MODIFY(not_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO crawling_board_act_not (member_id, post_no, not_target_member_id, not_content, not_type, not_read_dt)
SELECT
    (SELECT member_id FROM member WHERE member_id = 198),
    (SELECT post_no FROM mate_board WHERE post_no = 1),
    (SELECT member_id FROM member WHERE member_id = 200),
	'NOT_CONTENT_' || LEVEL,
	CASE MOD(LEVEL, 5)
        WHEN 0 THEN 'comment'
        WHEN 1 THEN 'comment_comment'
        WHEN 2 THEN 'deal_cpl'
        WHEN 3 THEN 'mate_join'
        WHEN 4 THEN 'mate_cpl'
    END,
    CURRENT_DATE

FROM dual
CONNECT BY level <= 100000;


ALTER TABLE crawling_board_keyword_not MODIFY(not_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO crawling_board_keyword_not (not_content, not_read_dt, post_no, keyword, member_id)

SELECT
	'NOT_CONTENT_' || LEVEL,
    CURRENT_DATE,
    (SELECT post_no FROM crawling_board WHERE post_no = 1),
	'KEYWORD' || LEVEL,
    (SELECT member_id FROM member_keyword WHERE rownum = 1)

FROM dual
CONNECT BY level <= 100000;

ALTER TABLE crawling_board_comment MODIFY(comment_no GENERATED AS IDENTITY (START WITH 1));

INSERT INTO crawling_board_comment (post_no, member_id, content, like_cnt, high_comment_no, comment_lv) 
SELECT
    (SELECT post_no FROM crawling_board WHERE post_no = 1),
    (SELECT member_id FROM member WHERE member_id = 198),
	'CONTENT_' || LEVEL,
	LEVEL,
	LEVEL,
    MOD(LEVEL, 10)

FROM dual
CONNECT BY level <= 100000;

INSERT INTO crawling_board_file (file_id, post_no, file_name, file_path, file_size) 
SELECT
	'FILE_ID_' || LEVEL,
    (SELECT post_no FROM crawling_board WHERE post_no = 1),
	'FILE_NAME_' || LEVEL,
	'FILE_PATH_' || LEVEL,
    LEVEL

FROM dual
CONNECT BY level <= 100000;






select * from CRAWLING_BOARD;

truncate table mate_board_file;