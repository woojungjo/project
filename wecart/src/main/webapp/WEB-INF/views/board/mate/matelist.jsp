<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page import="java.util.List" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장메이트 게시판 목록</title>
    

    <!--  script src="/resources/js/board/qna/board.js" defer ></script-->
	<!--script src="/resources/js/board/mate/script.js" defer></script-->
	
	<!-- script src="/resources/js/board/mate/list.js" defer></script-->
	<link rel="stylesheet" href="/resources/css/board/qna/style.css">
	<link rel="stylesheet" href="/resources/css/board/mate/style.css">
	

    <script src="https://kit.fontawesome.com/a623128410.js" crossorigin="anonymous"></script>

     <!--link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" /--> 

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
	<jsp:include page="../../header_footer/main_header.jsp" flush="true" />
 	
 	 <main>
        <!--*********************************************메인 내용은 여기부터*********************************************-->
        
        <article id="board">
            <div class="qna_board_name">장메이트 게시판</div>
            <ul>
	            <c:forEach items="${__MATE_LIST__}" var="MateBoardVO">
	                <li class="board_list">
	                    <div class="board_grid">
	                        <div class="board_head">
	                           <div class="mate_board_writer">
	                            <button type="button" value=""><i class="fa-solid fa-piggy-bank"></i>￦3500 </button>
	                            ${MateBoardVO.member_id}</div>
	                            
	                           		<fmt:formatDate value="${MateBoardVO.write_dt}" pattern="yyyyMMddHHmmss" var="write_dt" />
                                    <fmt:formatDate value="${MateBoardVO.write_dt}" pattern="yyyy-MM-dd" var="formatDate" />
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
                                
	                            <button type=button value="recruiting" >모집중 </button>
	
	                        </div>
	                        <div id="mate_board_container1">
	                        <div class="board_title"><a href="/board/mate/mateget/${MateBoardVO.post_no}">${MateBoardVO.title}</a></div> 
	                        <div class="fas fa-paperclip"></div>
	                        
	                        </div>
	                        
	                        <div id="mate_board_container2">
	                        
	                        <div class="mate_board_maps"><i class="fa-solid fa-location-dot"></i>${MateBoardVO.meeting_area}</div>
	                    	<div id="mate_board_contents_dt_and_members">
	                        <div class="mate_board_contents_dt"><i class="fa-regular fa-clock"></i>&nbsp;${MateBoardVO.meeting_time}</div>
	                        <div class="mate_board_contents_members"><i class="fa-solid fa-people-group"></i></div>
	                        <div class="currentMemberNum">2</div>
	                        <div>/</div>
	                        <div class="finalMemberNum">4</div>
	                        <p></p>
	                        </div>
	                        
	                        
	                        <div class="board_tail">
	                            <div><span class="fas fa-eye"></span>${MateBoardVO.views}</div>
	                            <div><span class="fas fa-comment-dots"></span>댓글</div>
	                        </div>
	                    </div>
	                </li>
                 </c:forEach>
            </ul>


            <form action="" method="POST">

                <div id="board_search">
                    <button type="button"><span class="fas fa-arrow-down-wide-short" />최신순</button>
                    <div>
                        <select name="검색">
                            <option value="">제목 +  내용</option>
                            <option value="">제목</option>
                            <option value="">내용</option>
                            <option value="">작성자</option>
                        </select>
                        <input type="text">
                        <button type="submit">검색</button>
                    </div>
                    <a href="BoardWrite.html"><button type="button"><span class="fas fa-pen-to-square" />글쓰기</button></a>
                </div>
                
            </form>

   			 <div id="move_page">
   			 	<form id="">
                    <c:choose>
                        <c:when test="${__PAGE_MAKER__.prev}">
                            <a data-temp="${__PAGE_MAKER__.cri.setCurrPage(__PAGE_MAKER__.startPage-1)}"
                            href="/board/mate/matelist${__PAGE_MAKER__.cri.pagingUri}">
                            <span class="fas fa-arrow-left-long"/>&nbsp;이전
                            </a>
                        </c:when>
                        <c:otherwise>
                            <div><span class="fas fa-arrow-left-long"/>&nbsp;이전</div>
                        </c:otherwise>
                    </c:choose>

                    <c:set var="currPage" value="${not empty param.currPage ? param.currPage : 1}"/>
                    <c:forEach var="pageNum" begin="${__PAGE_MAKER__.startPage}" end="${__PAGE_MAKER__.endPage}">
                            <div class="${currPage eq pageNum ? 'currPage' : ''}">
                                <a data-temp="${__PAGE_MAKER__.cri.setCurrPage(pageNum)}"
                                href="/board/mate/matelist${__PAGE_MAKER__.cri.pagingUri}">${pageNum}</a>
                            </div>
                    </c:forEach>
                    

                    <c:choose>
                        <c:when test="${__PAGE_MAKER__.next}">
                            <a data-temp="${__PAGE_MAKER__.cri.setCurrPage(__PAGE_MAKER__.endPage + 1)}"
                            href="/board/mate/matelist${__PAGE_MAKER__.cri.pagingUri}">
                            다음&nbsp;<span class="fas fa-arrow-right-long"/>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <div>다음&nbsp;<span class="fas fa-arrow-right-long"/></div>
                        </c:otherwise>
                    </c:choose>
                    
                    <!-- Pagination에서 Prev or Next 버튼 클릭했을 때, 자바스크립트로
                   		우리가 직접 form 태그를 조작해서 전송하기 위해 필요한 기준 전송파라미터
                   		Criteria를 위한 전송파라미터들  
                     -->
                     <input type="hidden" name="currPage">
                     <input type="hidden" name="amount">
                     <input type="hidden" name="pagesPerPage">
                     <input type="hidden" name="type">
                     <input type="hidden" name="keyword">
                 </form>
                </div>
                
          	  </div>

        </article>



        <!--*********************************************메인 내용은 여기까지*********************************************-->
    </main>
	    <jsp:include page="../../header_footer/footer.jsp" flush="true" />
		
</body>


</html>

