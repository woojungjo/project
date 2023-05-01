<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.Duration" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

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
        
        <link rel="stylesheet" href="/resources/css/header_footer/main_header.css">
        <link rel="stylesheet" href="/resources/css/header_footer/home_header.css">
        <link rel="stylesheet" href="/resources/css/header_footer/footer.css">
        <link rel="stylesheet" href="/resources/css/board/qna/style.css">
        <script src="/resources/js/board/qna/board.js" defer ></script>
        
    </head>
    <body>
        
        <% Object auth = session.getAttribute("__AUTH__"); %>
		
		<% if(auth != null) { %>
			<jsp:include page="../../header_footer/main_header.jsp" flush="true" />
		<% } else { %>
			<jsp:include page="../../header_footer/home_header.jsp" flush="true" />
		<% } %>

        
        <main>
            <!--*********************************************메인 내용은 여기부터*********************************************-->
            
            <article id="board">
                <div class="qna_board_name">문의게시판</div>
                <ul>
                    <fmt:formatDate value="${currentTime}" pattern="yyyyMMddHHmmss" var="currDate" />
                    <c:forEach items="${list}" var="qnaBoardVO">
                        <li class="board_list">
                            <div class="board_grid">
                                <div class="board_head">
                                    <div>${qnaBoardVO.member_id}</span></div>
                                    <fmt:formatDate value="${qnaBoardVO.write_dt}" pattern="yyyyMMddHHmmss" var="write_dt" />
                                    <fmt:formatDate value="${qnaBoardVO.write_dt}" pattern="yyyy-MM-dd" var="formatDate" />
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
                                <c:choose>
                                    <c:when test="${qnaBoardVO.secret_yn  == 0}">
                                        <div class="board_title"><a href="/board/qna/read/${qnaBoardVO.post_no}">${qnaBoardVO.title}</a></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="board_title"><span class="fas fa-lock" />비밀글 입니다.</div>    
                                    </c:otherwise>
                                </c:choose>
                                <div class="board_tail">
                                    <div><span class="fas fa-eye"></span>${qnaBoardVO.views}</div>
                                    <div><span class="fas fa-comment-dots"></span>${qnaBoardVO.comment_count}</div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                    
                </ul>
            </article>
            <div id="sticky">
                <form action="/board/qna/list" method="GET">

                    <div id="board_search">
                        <select name="sort" id="board_sort">
                            <c:choose>
                                <c:when test="${param.sort == 'views'}">
                                    <option value="views">조회순</option>
                                    <option value="post_no">최신순</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="post_no">최신순</option>
                                    <option value="views">조회순</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                        <div>
                            <select name="type" id="search_select">
                                <option value="title-content">제목 +  내용</option>
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                                <option value="member_id">작성자</option>
                            </select>
                            <input type="text" name="keyword">
                            <button type="submit" >검색</button>
                        </div>

                        <c:if test="${not empty sessionScope.__AUTH__}">
                            <a href="/board/register
                            "><button type="button"><span class="fas fa-pen-to-square" />글쓰기</button></a>
                        </c:if>
                        <c:if test="${empty sessionScope.__AUTH__}">
                            <div></div>
                        </c:if>

                    </div>
                </form>

                <div id="move_page">
                    <c:choose>
                        <c:when test="${pageMaker.prev}">
                            <a data-temp="${pageMaker.cri.setCurrPage(pageMaker.startPage-1)}"
                            href="/board/qna/list${pageMaker.cri.pagingUri}">
                            <span class="fas fa-arrow-left-long"/>&nbsp;이전
                            </a>
                        </c:when>
                        <c:otherwise>
                            <div><span class="fas fa-arrow-left-long"/>&nbsp;이전</div>
                        </c:otherwise>
                    </c:choose>
                    <c:set var="currPage" value="${not empty param.currPage ? param.currPage : 1}"/>
                    <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            <div class="${currPage eq pageNum ? 'currPage' : ''}">
                                <a data-temp="${pageMaker.cri.setCurrPage(pageNum)}"
                                href="/board/qna/list${pageMaker.cri.pagingUri}">${pageNum}</a>
                            </div>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${pageMaker.next}">
                            <a data-temp="${pageMaker.cri.setCurrPage(pageMaker.endPage + 1)}"
                            href="/board/qna/list${pageMaker.cri.pagingUri}">
                            다음&nbsp;<span class="fas fa-arrow-right-long"/>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <div>다음&nbsp;<span class="fas fa-arrow-right-long"/></div>
                        </c:otherwise>
                    </c:choose>
                </div>

           
        </div>            

            <!--*********************************************메인 내용은 여기까지*********************************************-->
        </main>
        


       <jsp:include page="../../header_footer/footer.jsp" flush="true" />
</body>


</html>