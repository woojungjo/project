package org.zerock.wecart.domain.mateboard;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class MateBoardVO { //테이블 스키마대로 채워야 하는 것. 
	
    private int post_no;
    private int member_id;
    private String title;
    private String content;
    private int views;
    private Timestamp write_dt;
    private int report_cnt;
    private char meeting_status;
    private Timestamp meeting_time;
    private String meeting_area;
    private int participant_id_1;
    private int participant_id_2;
    private int participant_id_3;
	
}//MateBoardVO
