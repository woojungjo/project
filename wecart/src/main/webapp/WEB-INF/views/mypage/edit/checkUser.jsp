<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

        <link rel="stylesheet" href="/resources/css/mypageEdit/checkUser.css">

    </head>

    <body>
        <jsp:include page="/WEB-INF/views/header_footer/main_header.jsp" flush="true" />

        <div class="widthfix">
            <div id="container">
                <div id="section">
                    <div id="mypage_nav">
                        <ul class="mypage_nav_ul">
                            <li class="mypage_nav_li"><a href="#" class="nav_text">마이페이지</a></li>
                            <li class="mypage_nav_li"><a href="/mypage/edit/check_password" class="nav_text">개인정보 수정</a></li>
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
                            <p><span class="small_title">비밀번호 재확인</span> <span class="small_content">회원님의 소중한 정보보호를 위해
                                    비밀번호를 재확인하고 있습니다</span></p>
                            <hr>

                            <form action="/mypage/edit/checkUser" method="post">
                                <div class="table_wrap">
                                    <div class="article">
                                        <h3 class="input_title"><label for="login_id">아이디</label></h3>
                                        <input type="text" id="login_id" name="login_id" class="input" maxlength="20">
                                    </div>
    
                                    <div class="article">
                                        <h3 class="input_title"><label for="pwd">비밀번호</label></h3>
                                        <input type="password" id="pwd" name="pwd" class="input" maxlength="16">
                                    </div>
                                </div>
    
                                <div id="next">
                                    <button type="submit" id="next_button" class="button">
                                        <span>다음</span>
                                    </button>
                                </div>
                            </form>                           
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