package org.zerock.wecart.domain.mateboard;

import lombok.Data;

@Data
public class MateBoardDTO { //전송파라미터 저장, 전송파라미터를 받아서 웹 3계층의 뒤로 필요한 곳에 어디든 전달만 잘해주면 됨 .
	//필요한 전송 파라미터를 받는거지 , 필드를 모두 채워야하는게 아니다. 

    private int postNo;
    private String title;
    private String content;
    private int views;
    
    private int memberId;
    private char meetingStatus;
    private String meetingArea;
    
    private int participantId1;
    private int participantId2;
    private int participantId3;
}//MateBoardDTO
