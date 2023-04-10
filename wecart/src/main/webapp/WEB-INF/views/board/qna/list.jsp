<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
            
            <link rel="stylesheet" href="/resources/css/JSP_Resources/main.css">
            <link rel="stylesheet" href="/resources/css/JSP_Resources/afterlogin_header.css">
            <link rel="stylesheet" href="/resources/css/JSP_Resources/footer.css">
            <link rel="stylesheet" href="/resources/css/style.css">
            <script src="/resources/js/board.js" defer ></script>
            
</head>
<body>
    
    <div class="wrapper_contatiner">
        <div class="wrapper">
            
        <header>
            <div class="container">
                <div class="site_name">
                         <div class="WeCart">
                            <span>우리동네<br>장바구니</span>
                        </div> <!--WeCart-->
                </div>  <!--site_name-->

                <ul class="headerbar_menu">
                    <li>가격비교</li>
                    <li>커뮤니티</li>
                    <li>Q&A</li>
                </ul><!--headerbar_menu-->

                <ul class="header_login">
                    <li>개포동 <i class="fa-solid fa-location-dot"></i></li>
                    <li><i class="fa-regular fa-comment-dots"></i></li>
                    <li><i class="fa-regular fa-bell"></i></li>
                    <li><i class="fa-solid fa-piggy-bank"></i></li>
                    <li>Juuu</li>
                </ul>   <!--header_login-->

            </div> <!--container-->
        
        </header>
	
	
        <main>
            <!--*********************************************메인 내용은 여기부터*********************************************-->
            
            <article id="board">
                <div class="qna_board_name">문의게시판</div>
                <ul>
                    <c:forEach items="${list}" var="qnaBoardVO">
                        <li class="board_list">
                            <div class="board_grid">
                                <div class="board_head">
                                    <div>${qnaBoardVO.member_id}</span></div>
                                    <div>&nbsp;&nbsp;${qnaBoardVO.write_dt}</div>
                                </div>
                                <c:choose>
                                    <c:when test="${qnaBoardVO.secret_yn  == 0}">
                                        <div class="board_title"><a href="QnaBoardRead.html">${qnaBoardVO.title}</a></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="board_title"><a href="QnaBoardRead.html"><span class="fas fa-lock" />비밀글 입니다.</a></div>    
                                    </c:otherwise>
                                </c:choose>
                                <!-- <div class="board_title"><a href="QnaBoardRead.html">${qnaBoardVO.title}</a></div> -->
                                <div class="board_tail">
                                    <div><span class="fas fa-eye"></span>${qnaBoardVO.views}</div>
                                    <div><span class="fas fa-comment-dots"></span>${qnaBoardVO.comment_count}</div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                    
                </ul>


                <form action="" method="POST">

                    <div id="board_search">
                        <select name="정렬" id="board_sort">
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
                            <select name="검색" id="search_select">
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

            </article>


            <!--*********************************************메인 내용은 여기까지*********************************************-->
        </main>
        


    </div> <!-- wrapper: header+main-->
           <footer>
               <div class="footerText">
                   <p>
                       WeCart
                       <span>
                           <a href="">사업자 정보</a>
                           <a href="">이용약관</a>
                           <a href="">개인정보처리방침</a>
                       </span>
                   </p>
                   
                   <p>
                       Woojungjo
                       <a href="https://github.com/zuxico123">감성현</a>
                       <a href="https://github.com/KimYongSae">김용세</a>
                       <a href="https://github.com/JeongHwan95">김정환</a>
                       <a href="https://github.com/comdesk">김지연</a>
                       <a href="https://github.com/Juyeonjoo">조연주</a>
                       <span class="copyright">&copy; 2023 WeCart, Inc. All Rights Reserved</span>
                    </p>
               </div>
           </footer>
       </div> <!--wrapper_contatiner-->
        
</body>


</html>