<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.util.List" %> 

<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장메이트 수정, ${param.currPage}</title>
	
	<script src="/resources/js/board/mate/list.js" defer></script>
	<script src="/resources/js/board/mate/script.js" defer></script>
	<link rel="stylesheet" href="/resources/css/board/mate/style.css">

    <!-- <script src="https://kit.fontawesome.com/78271596c1.js" crossorigin="anonymous"></script> -->

    <script src="https://kit.fontawesome.com/a623128410.js" crossorigin="anonymous"></script>

    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" /> -->

    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Source+Sans+Pro:ital,wght@1,700&display=swap"
        rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.3/sweetalert2.min.css" integrity="sha512-NvuRGlPf6cHpxQqBGnPe7fPoACpyrjhlSNeXVUY7BZAj1nNhuNpRBq3osC4yr2vswUEuHq2HtCsY2vfLNCndYA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.3/sweetalert2.min.js" integrity="sha512-eN8dd/MGUx/RgM4HS5vCfebsBxvQB2yI0OS5rfmqfTo8NIseU+FenpNoa64REdgFftTY4tm0w8VMj5oJ8t+ncQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/js/select2.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

</head>
<body>
    	<!-- jsp:include page="../../header_footer/main_header.jsp" flush="true" /-->
    <% Object auth = session.getAttribute("__AUTH__"); %>
      
      <% if(auth != null) { %>
         <jsp:include page="../../header_footer/main_header.jsp" flush="true" />
      <% } else { %>
         <jsp:include page="../../header_footer/home_header.jsp" flush="true" />
      <% } %>
        <main id="board_main">

                <div class="board_change">
                    <a href="RegionBoard.html"><button id="region">지역</button></a>
                    <a href="UsedBoard.html"><button id="used">중고거래</button></a>
                    <a href="/board/mate/matelist"><button id="mate">장메이트</button></a>
                    <a href="CrawlingBoard.html"><button id="crawling">크롤링</button></a>
                    <a href="SaleBoard.html"><button id="sale">세일정보</button></a>
                </div>
            <div id="mate_board_read">

               <div class="mate_board_name">장메이트 게시판</div>
               
               <form action = "/board/mate/matemodify" method="post">
	               	<input type="hidden" name="currPage" value="${param.currPage}">
	              	<input type="hidden" name="amount" value="${param.amount}">
               	
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
	                    
	                    <div class="mate_board_contents_join">
	                        <button type="button" class="mate_board_join_button">참여하기</button>
	                    </div>
	                </div>
	                </div><!--mate_board_contents-->
	            
					
	
	                <div id="mate_board_info_below">
	                    <button type="button" class="mate_board_report">신고</button>
	                    
	                    <div class="mate_board_attach"><button id="download_button"><div class="fas fa-paperclip"></div>첨부파일</button>
	                        <div id="mate_board_attach_download">
	                            <ul>
	                                <li><div class="fas fa-paperclip"></div> 파일 다운로드1</li>
	                                <li><div class="fas fa-paperclip"></div> 파일 다운로드2</li>
	                                <li><div class="fas fa-paperclip"></div> 파일 다운로드3</li>
	                            </ul>
	                        </div>
	                    </div> <!--qna_board_attach-->
	
	                    <div id="mate_board_modify_and_delete">
	                        <button type="submit" class="mate_board_modify" >수정</button>
	                        <button type="button" class="mate_board_delete" >삭제</button>
	                        <button type="button" class="mate_board_list" >목록</button>
	                    </div>
                    
            	</div> <!--mate_board_info_below-->
			</form>
						<!-- 답글 넣기 -->
      	  </main>

        <jsp:include page="../../header_footer/footer.jsp" flush="true" />
</body>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0be8f3b8bf2f892c159cfeb384998199"></script>	
	
<script>

    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(34.8861, 127.5091),
        level: 3
    };

    var map = new kakao.maps.Map(container, options);
    
 // 마커가 표시될 위치입니다 
    var markerPosition  = new kakao.maps.LatLng(34.8861, 127.5091); 

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);   
</script>

</html>