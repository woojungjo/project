package org.zerock.wecart.domain.mateboard;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Value;

@Value

public class MateBoardVO { //테이블 스키마대로 채워야 하는 것. 
	
    private Integer post_no;
    private Integer member_id;
    private String title;
    private String content;
    private Integer views;
    private Timestamp write_dt;
    private Integer report_cnt;
    private Character meeting_status;
    private String meeting_area;
    private Integer participant_id_1;
    private Integer participant_id_2;
    private Integer participant_id_3;
    @DateTimeFormat(pattern = "yyyy/MM/dd h:mm a")
    private Timestamp meeting_time;
}//MateBoardVO
