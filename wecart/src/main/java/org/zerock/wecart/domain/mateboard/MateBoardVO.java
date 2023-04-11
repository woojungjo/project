package org.zerock.wecart.domain.mateboard;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class MateBoardVO { //테이블 스키마대로 채워야 하는 것. 
	
    private int postNo;
    private int memberId;
    private String title;
    private String content;
    private int views;
    private Timestamp writeDt;
    private int reportCnt;
    private char meetingStatus;
    private Timestamp meetingTime;
    private String meetingArea;
    private int participantId1;
    private int participantId2;
    private int participantId3;
	
}//MateBoardVO
