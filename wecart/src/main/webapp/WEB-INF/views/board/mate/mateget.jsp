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
<title>장메이트 게시판 ${param.currPage}</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0be8f3b8bf2f892c159cfeb384998199&libraries=services"></script>
<script src="/resources/js/board/mate/map.js" defer></script>
<link rel="stylesheet" href="/resources/css/board/mate/map.css">

<link rel="stylesheet" href="/resources/css/header_footer/main_header.css">
<link rel="stylesheet" href="/resources/css/header_footer/home_header.css">
<link rel="stylesheet" href="/resources/css/header_footer/footer.css">
<script src="/resources/js/board/mate/mateget.js" defer></script>
<link rel="stylesheet" href="/resources/css/board/mate/style.css">

<script src="https://kit.fontawesome.com/a623128410.js" crossorigin="anonymous"></script>

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
<% Object auth = session.getAttribute("__AUTH__"); %>
    <% if(auth != null) { %>
        <jsp:include page="../../header_footer/main_header.jsp" flush="true" />
    <% } else { %>
        <jsp:include page="../../header_footer/home_header.jsp" flush="true" />
    <% } %>
    

<main id="board_main">
    <!--*********************************************메인 내용은 여기부터*********************************************-->     
<form action="/board/mate/matemodify" method="post" id="matemodifyDelete">
    <input type="hidden" name="currPage" value="${param.currPage}">
    <input type="hidden" name="amount" value="${param.amount}">	
        
    <div id="mate_board_read">

        <div class="mate_board_name">장메이트 게시판</div>
        <div id="mate_board_info">

            <div class="mate_board_recruiting">
                <!-- select class="mate_board_recruiting_option">
                    <option value="recruiting" >모집중</option >
                    <option value="completed"  >참여완료</option>
                </select-->
                
				<button class="mate_board_recruiting_option" type="button">
				    <c:choose>
				        <c:when test="${__MateBoard__.meeting_status == '1'}">
				            모집중
				        </c:when>
				        <c:otherwise>
				            참여완료
				        </c:otherwise>
				    </c:choose>
				</button>
								                
                <script>
                console.log('meeting_status: ${__MateBoard__.meeting_status}'); //1
                console.log('check2: ${__MateBoard__.meeting_status== "1"}'); 
                console.log('check5: ${__MateBoard__.meeting_status == 1}');

                console.log('meeting_status: ${__MateBoard__.meeting_status}'); //1
                console.log('check2: ${__MateBoard__.meeting_status == 1}'); 
                console.log('check5: ${__MateBoard__.meeting_status === 1}');
                
                console.log('meeting_status: ${__MateBoard__.meeting_status}'); 
                console.log('check: ${__MateBoard__.meeting_status == '1'}');



                </script>
            </div>
            
            <div id="mate_board_writer_and_bookMark">
                <div class="mate_board_writer">
                    <button type="button" value=""><i class="fa-solid fa-piggy-bank"></i>￦3500 </button>
                    작성자: ${__MateBoard__.member_id} 
                </div><!--mate_board_writer-->
                <div class="mate_board_bookMark"><i class="fa-regular fa-bookmark"></i></div>
            </div>
            
            <div id="mate_board_writedt_mate_board_views">
                <fmt:formatDate value="${__MateBoard__.write_dt}" pattern="yyyy-MM-dd HH:mm" var="formatDate" />
                <div class="qna_board_writedt">작성일시: ${formatDate}</div>
                <div class="mate_board_views"><div class="fas fa-eye"></div>${__MateBoard__.views}</div>
            </div>
                <div id="mate_board_writedt_and_views">
            
                <!--div class="mate_board_writedt">
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
                        </div-->

            <div class="mate_board_title"><!--div class="fas fa-lock"--></div>${__MateBoard__.title}</div>
        </div> <!--mate_board_info-->

        <div id="mate_board_contents">
            
            <div class="mate_board_contents_wrapper">
            <div class="mate_board_maps"><i class="fa-solid fa-location-dot"></i>${__MateBoard__.meeting_area}</div>
            <div id="mate_board_contents_dt_and_members">
            <fmt:formatDate value="${__MateBoard__.meeting_time}" pattern="yyyy-MM-dd HH:mm" var="formatMeetingTime" />
            <div class="mate_board_contents_dt">미팅 일시: ${formatMeetingTime}</div>
                
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

            <div id="map" style="width:500px; height:400px; margin: 0 auto; "></div>
            
            <div class="mate_board_contents_join">
                <button type="button" class="mate_board_join_button">참여하기</button>
            </div>
        </div>
        </div><!--mate_board_contents-->

        <div id="mate_board_info_below">
            <button type="button" class="mate_board_report">신고</button>
            
            <div class="mate_board_attach">
                <button id="download_button">
                    <div class="fas fa-paperclip"></div>
                    첨부파일
                </button>
                <div id="mate_board_attach_download">
                    <ul>
                        <li><div class="fas fa-paperclip"></div> 파일 다운로드1</li>
                        <li><div class="fas fa-paperclip"></div> 파일 다운로드2</li>
                        <li><div class="fas fa-paperclip"></div> 파일 다운로드3</li>
                    </ul>
                </div>
            </div> <!--qna_board_attach-->

            <div id="mate_board_modify_and_delete">
                <c:if test="${__AUTH__.member_id == __MateBoard__.member_id}">
                    <input type="hidden" name="post_no" value="${__MateBoard__.post_no}">
                    <button type="button" class="mate_board_modify" data-post-no="${post_no}">수정</button>
                    <button type="button" class="mate_board_delete" >삭제</button>
                </c:if>
            </div>
    
</div>
            
        <!-- MateBoard -->
            <div class="map_wrap">
                <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
            
                <div id="menu_wrap" class="bg_white">
                    <div class="option">
                        <div>
                                키워드 <input type="text" value="" id="keyword">
                                <button type="submit" onclick="searchPlaces(); return false; ">검색</button> 
                        </div>
                    </div>
                    <hr>
                    <ul id="placesList"></ul>
                    <div id="pagination"></div>
                </div>
        </div>
    </div> <!--mate_board_info_below-->

    </form> <!-- 답글 넣기 -->   				
        
        
    </main>

<jsp:include page="../../header_footer/footer.jsp" flush="true" />

</body>
<script>
  var postNo = ${__MateBoard__.post_no};
</script>
<!--  script>
var mateListBtn = document.querySelector('.mate_board_list');
var mateModifyBtn = document.querySelector('.mate_board_modify');

mateListBtn.addEventListener('click', function(){
/*location.href='/board/mate/matelist?currPage=${param.currPage}&amount=${param.amount}';*/
var url = '/board/mate/matelist?currPage=' + encodeURIComponent('${param.currPage}') + '&amount=' + encodeURIComponent('${param.amount}');
location.href = url;
});

mateModifyBtn.addEventListener('click', function(){
location.href='/board/mate/matemodify?currPage=${param.currPage}&amount=${param.amount}&post_no=${post_no}';
});//.addEventListener
</script-->

<script>
/*
var listBtn = document.querySelector('.mate_board_list');

listBtn.addEventListener('click', function(){
location.href='/board/mate/matelist';
});

var removeBtn = document.querySelector('.mate_board_delete');
removeBtn.addEventListener('click', function(){
var form = document.querySelector('form');
var input = document.createElement('input');
input.setAttribute('type', 'hidden');
input.setAttribute('name', 'post_no');
input.setAttribute('value', '${__MateBoard__.post_no}');
form.appendChild(input);
form.setAttribute('method', 'POST');
form.setAttribute('action', '/board/mate/materemove');
form.submit();
});//addEventListener
*/
</script>

</html>