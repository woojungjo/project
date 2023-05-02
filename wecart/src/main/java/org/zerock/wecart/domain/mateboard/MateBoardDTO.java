package org.zerock.wecart.domain.mateboard;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MateBoardDTO { 
	//전송파라미터 저장, 전송파라미터를 받아서 웹 3계층의 뒤로 필요한 곳에 어디든 전달만 잘해주면 됨 .
	//필요한 전송 파라미터를 받는거지 , 필드를 모두 채워야하는게 아니다. 

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
    
//    @DateTimeFormat(pattern = "yyyy/MM/dd h:mm a")
//    private Timestamp meeting_time_temp;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime meeting_time;    
}//MateBoardDTO
