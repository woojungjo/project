package org.zerock.wecart.domain.board;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

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
    private Integer report_cnt;
    
    private Integer participant_id_1;
    private Integer participant_id_2;
    private Integer participant_id_3;
    
    //@DateTimeFormat(pattern = "yyyy/MM/dd h:mm a")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime meeting_time;
    
	private Integer secret_yn;
	
	public LocalDateTime getMeeting_time_temp() {
	    return meeting_time;
	}

	public void setMeeting_time_temp(LocalDateTime meeting_time) {
	    this.meeting_time = meeting_time;
	}
	
}//BoardDTO

