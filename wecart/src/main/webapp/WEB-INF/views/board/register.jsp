<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>WeCart</title>
       
        <script src="https://kit.fontawesome.com/a623128410.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Jua&family=Source+Sans+Pro:ital,wght@1,700&display=swap"
        rel="stylesheet">
        	
        <script src="/resources/js/board/mate/list.js" defer></script>
		<script src="/resources/js/board/mate/script.js" defer></script>
		<link rel="stylesheet" href="/resources/css/board/mate/style.css">
       
        <link rel="stylesheet" href="/resources/css/board/qna/style.css">
        <script src="/resources/js/board/qna/script.js" defer ></script>
        <script src="/resources/js/board/qna/smarteditor.js" defer ></script>
        
        <!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
		 <script type="text/javascript" src="/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8" defer></script>
		<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>


</head>
<body>
	<jsp:include page="../header_footer/main_header.jsp" flush="true" />
	
    <main>
        <!--*********************************************메인 내용은 여기부터*********************************************-->
        
        <main id="board_main">
            <form id ="frm" action="/board/register" method="post">
            
	            <input type="hidden" name="currPage" value="${param.currPage}">
				<input type="hidden" name="amount" value="${param.amount}">
				
	                <div id = "board_write">
	                    <div id="board_write_top">
	                        <div>글쓰기</div>
	                         <button type="submit" id="submitBtn"><span class="fas fa-pen-to-square" />등록</button>
	                       	 <button type="button" id="listBtn"><span class="fas fa-pen-to-square" />목록</button>
	                    </div>
	                    <div><hr></div>
	                    <select name="">
	                        <option value="">게시판을 선택해 주세요</option>
	                        <option value="">지역게시판</option>
	                        <option value="">중고거래</option>
	                        <option value="">장메이트</option>
	                        <option value="">크롤링</option>
	                        <option value="">세일정보</option>
	                    </select>
	                
	              <div id="mate_board_info">
                    <div class="mate_board_recruiting">
                        <select class="mate_board_recruiting_option">
                            <option value="recruiting" >모집중</option >
                            <option value="completed"  >참여완료</option>
                        </select>
                    </div>
                    
                    <div id="mate_board_writer_and_bookMark">
                        <div class="mate_board_writer">
                            <button type="button" value=""><i class="fa-solid fa-piggy-bank"></i>￦3500 </button>
                            작성자: ${__MateBoard__.member_id}
                        </div>
                        <div class="mate_board_bookMark"><i class="fa-regular fa-bookmark"></i></div>
                    </div>

                    <div id="mate_board_writedt_mate_board_views"></div>
                    
                    <!-- <fmt:formatDate pattern ="yyyy/MM/dd HH:mm:ss" value="${boardVO.insert_ts}"/> -->

                    <div id="mate_board_writedt_and_views">
                        <div class="mate_board_writedt">
                        	<fmt:formatDate value="${__MateBoard__.write_dt}" pattern="yyyyMMddHHmmss" var="write_dt" />
                                    <fmt:formatDate value="${__MateBoard__.write_dt}" pattern="yyyy-MM-dd" var="formatDate" />
                                    <c:set var="currentLocalDateTime" value="${LocalDateTime.parse(currDate, DateTimeFormatter.ofPattern('yyyyMMddHHmmss'))}"/>
                                    <c:set var="writeLocalDateTime" value="${LocalDateTime.parse(write_dt, DateTimeFormatter.ofPattern('yyyyMMddHHmmss'))}"/>
                                    <c:set var="diffMinutes" value="${Duration.between(writeLocalDateTime, currentLocalDateTime).toMinutes()}"/>
                                    
                                    <c:choose>
                                        <c:when test="${diffMinutes < 1}">
                                            <div>&nbsp;&nbsp;방금 전</div>
                                        </c:when>
                                        <c:when test="${diffMinutes < 60}">
                                            <div>&nbsp;&nbsp;${diffMinutes}분 전</div>
                                        </c:when>
                                        <c:when test="${diffMinutes < 1440}">
                                            <fmt:formatNumber value="${diffMinutes div 60}" pattern="##" var="minutestoTime"/>
                                            <div>&nbsp;&nbsp;${minutestoTime}시간 전</div>
                                        </c:when>
                                        <c:otherwise>
                                            <div>&nbsp;&nbsp;${formatDate}</div>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                    </div>
                        <div class="mate_board_views"><div class="fas fa-eye"></div>${__MateBoard__.views}</div>
                    </div>    
                    <div class="mate_board_title"><!--div class="fas fa-lock"--></div>${__MateBoard__.title}</div>
                </div> <!--mate_board_info-->

                <div id="mate_board_contents">
                    
                    <div class="mate_board_contents_wrapper">
                    <div class="mate_board_maps"><i class="fa-solid fa-location-dot"></i>${__MateBoard__.meeting_area}</div>
                    <div id="mate_board_contents_dt_and_members">
                        <div class="mate_board_contents_dt"><i class="fa-regular fa-clock"></i>&nbsp;${__MateBoard__.meeting_time}</div>
                        
                        <div id="member">
                            <div class="mate_board_contents_members"><i class="fa-solid fa-people-group"></i></div>
                            <div class="currentMemberNum"></div>
                            <div>/</div>
                            <div class="finalMemberNum">4</div>

                            <ul id="sub">
                                <div class="sub_writers">
                                    <li><i class="fa-solid fa-piggy-bank"></i>3500</li>
                                    <li  class="sub_writer" >작성자 <span class="sub_alias">(닉네임)</span></li>
                                </div>   
                                <hr>
                                <div class="sub1">
                                    <li><i class="fa-solid fa-piggy-bank"></i>4000</li>
                                    <li  class="sub_participants1" >참여자1 <span class="sub_waiting">(대기)</span></li>
                                </div>
                                <div class="sub2">
                                    <li><i class="fa-solid fa-piggy-bank"></i>4500</li>
                                    <li  class="sub_participants2" >참여자2 <span class="sub_joint">(참여)</span></li>
                                </div>
                                <div class="sub3">
                                    <li><i class="fa-solid fa-piggy-bank"></i>4500</li>
                                    <li  class="sub_participants3" >참여자3 <span class="sub_joint">(참여)</span></li>
                                </div>
                                
                                 <!-- 
                                <div class="sub4">
                               		 <li><i class="fa-solid fa-piggy-bank"></i>4500</li>
                                <li  class="sub_participants4" >참여자4 <span class="sub_waiting">(대기)</span></li>
                           		</div>
                           		 -->
                            </ul><!--sub-->
                        </div><!--member-->
                    </div>
                    <hr>

                    <p>
                   	${__MateBoard__.content}
                    </p>  

                    <div id="map" style="width:500px;height:400px; margin: 0 auto; "></div>
                    

                </div>
                </div><!--mate_board_contents-->
                
	                    <input type="text" id="title" placeholder="제목을 입력해 주세요" style="width:1130px"/>
	                    <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
	
	                    <div id="board_secret">
	                        <input type="checkbox">&nbsp;비밀글을 작성합니다.
	                    </div>
       			     
                </div>
                
            </form>
        </main>

 		<jsp:include page="../header_footer/footer.jsp" flush="true" />
        <!--*********************************************메인 내용은 여기까지*********************************************-->
    </main>
    
    <script>
 	   var listBtn = document.querySelector('#listBtn');
 	   
 	   listBtn.addEventListener('click', function(){
		 var url = '/board/mate/matelist?currPage='+encodeURIComponent('${param.currPage}');
	 	 location.href = url
		});
    </script>
</body>


</html>