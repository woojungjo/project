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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" defer></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/3.2.1/jquery.serializejson.min.js" defer></script>

            <link rel="stylesheet" href="/resources/css/header_footer/main_header.css">
            <link rel="stylesheet" href="/resources/css/header_footer/home_header.css">
            <link rel="stylesheet" href="/resources/css/header_footer/footer.css">
            <!-- <link rel="stylesheet" href="/resources/css/board/sale/style.css"> -->
            <link rel="stylesheet" href="/resources/css/board/sale/style.css">
            <script src="/resources/js/board/sale/script.js" defer ></script>
            <script src="/resources/js/board/sale/board.js" defer ></script>

            
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
            <div class="board_change">
                <a href="/board/mate/matelist"><button id="mate">장메이트</button></a>
                <a href="/board/sale/list"><button id="sale">세일정보</button></a>
            </div>
            
            <main id="board_main">
                <div id="sale_board_read">
                    <div class="sale_board_name"></div>
                    <div class="sale_board_writer">${readVO.member_id}</div>
                    <fmt:formatDate value="${readVO.write_dt}" pattern="yyyy-MM-dd HH:mm:ss" var="formatDate" />
                    <div class="sale_board_writedt">${formatDate}</div>
                    <div class="sale_board_views"><span class="fas fa-eye"></span>${readVO.views}</div>
                    <div class="sale_board_title">
                        ${readVO.title}
                    </div>
                    <div class="sale_board_contents">${readVO.content}</div>
                    <div class="sale_board_attach"><button id="download_button"><span class="fas fa-paperclip"></span>첨부파일</button>
                        <div id="sale_board_attach_download">
                            <ul>
                                <li><span class="fas fa-paperclip"></span> 파일 다운로드1</li>
                                <li><span class="fas fa-paperclip"></span> 파일 다운로드2</li>
                                <li><span class="fas fa-paperclip"></span> 파일 다운로드3</li>
                            </ul>
                        </div>
                    </div>
                    <div class="sale_board_update_delete">
                        <c:if test="${__AUTH__.member_id == readVO.member_id}">
                            <form id="updateOrDelete">
                                <input type="hidden" name="post_no" value="${readVO.post_no}"> 
                                <button id="update" type="button">수정</button>
                                <button id="delete" type="button">삭제</button>
                            </form>
                        </c:if>
                    </div>
                    <div class="sale_board_like_hate">
                        <form>
                            <input type="hidden" name="post_no" value="${readVO.post_no}">
                            <input type="hidden" name="member_id" value="${__AUTH__.member_id}"> 
                            <button class="sale_board_like" type="button"><div class="fas fa-heart"/>&nbsp;좋아요&nbsp;${readVO.like_count}</button>
                            <button class="sale_board_hate" type="button"><div class="fas fa-heart-crack"/>&nbsp;싫어요&nbsp;${readVO.hate_count}</button>
                        </form>
                    </div>
                </div>
                
    
                <hr>
                <div class="board_commant">
    
                    <div id="board_commant_head">
                        <div>${readVO.comment_count}개의 댓글</div>
                        <div>
                            <div><span class="fas fa-arrow-left-long"/>&nbsp;이전&nbsp;</div>
                            <div>다음&nbsp;<span class="fas fa-arrow-right-long"/></div>
                        </div>
                    </div>
                    
                    <c:if test="${not empty sessionScope.__AUTH__}">

                        <form id="comment-form" class="board_commant_write" action="/board/sale/read/commentwrite" method="post">
                            <input type="hidden" name="post_no" value="${readVO.post_no}">
                            <c:choose>
                                <c:when test="${not empty sessionScope.__AUTH__}">
                                    <input type="hidden" name="member_id" value="${__AUTH__.member_id}"> 
                                </c:when>
                                <c:otherwise>
                                    <input type="hidden" name="member_id" value="334"> 
                                </c:otherwise>
                            </c:choose>
                            <!-- 멤버아이디는 세션에 올라간 로그인된 사용자아이디 사용, 밑에 댓글작성자(로그인된유저)도 같은데이터사용 -->
                            <input type="hidden" name="secret_yn" value="0">
                            <input type="hidden" name="delete_yn" value="0">
                            <input type="hidden" name="comment_root">
                            <input type="hidden" name="comment_step" value="0">
                            <input type="hidden" name="comment_indent" value="0">
                            <div>
                                <c:choose>
                                    <c:when test="${not empty sessionScope.__AUTH__}">
                                        ${__AUTH__.member_id}
                                    </c:when>
                                    <c:otherwise>
                                        tmp
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <input type="text" name="content" placeholder="댓글을 남겨보세요.">
                            <div class="board_commant_write_footer" >
                                <div class="fas fa-unlock"></div>
                                <button class="board_commant_submit">등록</button>
                            </div>
                        </form>
                    </c:if>
                    <hr>
                    <fmt:formatDate value="${currentTime}" pattern="yyyyMMddHHmmss" var="currDate" />
                    <c:forEach items="${commentVO}" var="commentList">
                        <c:choose>
                            <c:when test="${commentList.delete_yn == 0}">
                            <div class="board_commant_read" style="padding-left: ${commentList.comment_indent * 20}px;">

                                <div class="board_commant_read_header">
                                    <div class="board_commant_read_header_namegroup">
                                        <div class="fas fa-piggy-bank"></div>
                                        <div>
                                            <div>&nbsp;&nbsp;${commentList.member_id}</div>
                                            

                                            <fmt:formatDate value="${commentList.write_dt}" pattern="yyyyMMddHHmmss" var="write_dt" />
                                            <fmt:formatDate value="${commentList.write_dt}" pattern="yyyy-MM-dd" var="formatDate" />
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
                                    </div>
                                    <c:if test="${__AUTH__.member_id == commentList.member_id}">
                                    <div class="fas fa-bars">
                                        <div class="board_commant_ud">
                                            <ul>
                                                <input type="hidden" name="comment_no" value="${commentList.comment_no}">
                                                <li class="board_comment_update">수정</li>
                                                <li class="board_comment_delete">삭제</li>
                                            </ul>
                                        </div>
                                    </div>
                                </c:if>
                                </div>
                                <div class="board_commant_read_main">
                                    <c:choose>
                                        <c:when test="${commentList.secret_yn == 0}">
                                            ${commentList.content}
                                        </c:when>
                                        <c:otherwise>
                                            <span class="fas fa-lock" /> 비밀댓글 입니다.
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="board_commant_read_footer">
                                    <c:if test="${not empty sessionScope.__AUTH__}">
                                        <button class="board_commant_commant">답글쓰기</button>
                                    </c:if>
                                    <c:if test="${empty sessionScope.__AUTH__}">
                                        <div></div>
                                    </c:if>
                                    <div>
                                        <input type="hidden" name="member_id" value="${commentList.member_id}">
                                        <form>
                                            <input type="hidden" name="post_no" value="${readVO.post_no}">
                                            <input type="hidden" name="comment_no" value="${commentList.comment_no}">
                                            <input type="hidden" name="member_id" value="${__AUTH__.member_id}"> 
                                            <span class="fas fa-heart"/>&nbsp;${commentList.like_count}
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="board_commant_comment_update hidden">
                                <form class="board_commant_write" action="/board/sale/read/commentupdate" method="post">
                                    <input type="hidden" name="comment_no" value="${commentList.comment_no}">
                                    <input type="hidden" name="post_no" value="${commentList.post_no}">
                                    <input type="hidden" name="member_id" value="${__AUTH__.member_id}"> 
                                    <input type="hidden" name="secret_yn" value="${commentList.secret_yn}">
                                    <input type="hidden" name="delete_yn" value="${commentList.delete_yn}">
                                    <input type="hidden" name="comment_root" value="${commentList.comment_root}">
                                    <input type="hidden" name="comment_step" value="${commentList.comment_step + 1}">
                                    <input type="hidden" name="comment_indent" value="${commentList.comment_indent + 1}">
                                    <div>${__AUTH__.member_id}</div>
                                    <input type="text" name="content" placeholder="댓글을 남겨보세요." value="${commentList.content}">
                                    <div class="board_commant_write_footer" >
                                        <c:choose>
                                            <c:when test="${commentList.secret_yn == 0}">
                                                <div class="fas fa-unlock"></div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="fas fa-lock"></div>
                                            </c:otherwise>
                                        </c:choose>
                                        <button class="board_commant_update">등록</button>
                                    </div>
                                </form>
                            </div>
                            <hr>
                            
                            <div class="board_commant_commant_write hidden">
                                <form class="board_commant_write" action="/board/sale/read/commentwrite" method="post">
                                    <input type="hidden" name="post_no" value="${readVO.post_no}">
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.__AUTH__}">
                                            <input type="hidden" name="member_id" value="${__AUTH__.member_id}"> 
                                        </c:when>
                                        <c:otherwise>
                                            <input type="hidden" name="member_id" value="334"> 
                                        </c:otherwise>
                                    </c:choose>
                                    <input type="hidden" name="secret_yn" value="0">
                                    <input type="hidden" name="delete_yn" value="0">
                                    <input type="hidden" name="comment_root" value="${commentList.comment_root}">
                                    <input type="hidden" name="comment_step" value="${commentList.comment_step + 1}">
                                    <input type="hidden" name="comment_indent" value="${commentList.comment_indent + 1}">
                                    <div>
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.__AUTH__}">
                                                ${__AUTH__.member_id}
                                            </c:when>
                                            <c:otherwise>
                                                tmp
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <input type="text" name="content" placeholder="댓글을 남겨보세요.">
                                    <div class="board_commant_write_footer" >
                                        <div class="fas fa-unlock"></div>
                                        <button class="board_commant_submit" onclick="commant_submit">등록</button>
                                    </div>
                                </form>
                            </div>

                        </c:when>
                        <c:otherwise>
                            <div class="board_comment_deleted">
                                삭제된 댓글입니다.
                            </div>
                            <hr>
                        </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </main>


            <!--*********************************************메인 내용은 여기까지*********************************************-->
        </main>
       <jsp:include page="../../header_footer/footer.jsp" flush="true" />
        
</body>


</html>