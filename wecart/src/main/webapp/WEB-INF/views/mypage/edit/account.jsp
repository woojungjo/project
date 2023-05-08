<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        <link rel="stylesheet" href="/resources/css/mypageEdit/account.css">

    </head>

    <body>
    	<c:choose>
    		<c:when test="${empty sessionScope['__AUTH__']}">
    			<c:redirect url="/" />
	        </c:when>
	    </c:choose>
	    
        <jsp:include page="/WEB-INF/views/header_footer/main_header.jsp" flush="true" />

        <div class="widthfix">
            <div id="container">
                <div id="section">
                    <div id="mypage_nav">
                        <ul class="mypage_nav_ul">
                            <li class="mypage_nav_li"><a href="#" class="nav_text">마이페이지</a></li>
                            <li class="mypage_nav_li"><a href="/mypage/edit/checkUser" class="nav_text">개인정보 수정</a></li>
                     		<li class="mypage_nav_li"><a href="/mypage/cart/list" class="nav_text">장바구니 목록</a></li>
                     		<li class="mypage_nav_li"><a href="/mypage/cart/wishedPrds" class="nav_text">찜한 상품</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">즐겨찾는 마트</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">내 활동 내역</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">키워드알림</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">활동알림</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">채팅 내역</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">북마크 내역</a></li>
                        </ul>
                    </div>

                    <div id="mypage_article">
                        <div class="mypage_article_title">
                            <h3>개인정보 수정</h3> <!--제목 변경-->
                        </div>
                        <div class="mypage_article_content"> <!-- 탭 내용 -->

                            <div class="table_wrap">

                                <form action="/mypage/edit/changeUser" method="post">

                                    <div class="article">
                                        <h3 class="input_title"><label for="alias">닉네임</label></h3>
                                        <input type="text" id="alias" name="alias" class="input" maxlength="10">

                                        <a href="#" id="alias_check" class="button" role="button">
                                            <span>중복확인</span>
                                        </a>
                                    </div>

                                    <div class="article">
                                        <h3 class="input_title">비밀번호</h3>
                                        <a href="/mypage/edit/changePw" id="change_button" class="button" role="button">
                                            <span>변경하기</span>
                                        </a>
                                    </div>

                                    <div class="article">
                                        <h3 class="input_title"><label for="email">이메일</label></h3>
                                        <input type="email" id="email" name="email" class="input" maxlength="100">
                                    </div>

                                    <div class="article">
                                        <h3 class="input_title"><label for="mobile_num">휴대전화</label></h3>
                                        <input type="number" id="mobile_num" name="mobile_num" class="input" maxl="16">

                                        <a href="#" id="auth_button" class="button" role="button">
                                            <span>인증</span>
                                        </a>
                                    </div>

                                    <div id="withdrawal">
                                        <a href="/mypage/edit/withdrawal" id="withdrawal_button">탈퇴하기</a>
                                    </div>

                                    <div id="edit">
                                        <button type="submit" id="edit_button">수정하기</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <a href="#TOP" id="top_bt" class="a_black_text">
            <i class="fa-solid fa-arrow-up fa-lg"></i>
        </a>
        </div>

        <jsp:include page="/WEB-INF/views/header_footer/footer.jsp" flush="true" />

    </body>
    
    </html>