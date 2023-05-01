package org.zerock.wecart.domain.board;

import lombok.Data;

@Data
public class BoardDTO {
	
	private int sortOfBoard;
	
    private Integer post_no;
    private String title;
    private String content;
    private Integer views;
    private Integer member_id;
    private Character meeting_status;
    private String meeting_area;
    private String meeting_time;
    
    private Integer report_cnt;
    
    private Integer participant_id_1;
    private Integer participant_id_2;
    private Integer participant_id_3;
    
	private Integer secret_yn;
	
}//BoardDTO

