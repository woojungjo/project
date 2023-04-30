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

        <link rel="stylesheet" href="/resources/css/mypageEdit/changePw.css">

    </head>

    <body>
        <jsp:include page="/WEB-INF/views/header_footer/main_header.jsp" flush="true" />

        <div class="widthfix">
            <div id="container">
                <div id="section">
                    <div id="mypage_nav">
                        <ul class="mypage_nav_ul">
                            <li class="mypage_nav_li"><a href="#" class="nav_text">마이페이지</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">개인정보 수정</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">장바구니 목록</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">찜한 상품</a></li>
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

                                <div class="article">
                                    <h3 class="input_title"><label for="pwd">기존 비밀번호</label></h3>
                                    <input type="password" id="pwd" placeholder="현재 비밀번호를 입력하세요" class="input"
                                        maxlength="16">
                                </div>

                                <div class="article">
                                    <h3 class="input_title"><label for="change_pwd">변경 비밀번호</label></h3>
                                    <input type="password" id="change_pwd" placeholder="새 비밀번호를 입력하세요" class="input"
                                        maxlength="16">
                                </div>

                                <div class="article">
                                    <h3 class="input_title"><label for="check_change_pwd">변경 비밀번호 확인</label></h3>
                                    <input type="password" id="check_change_pwd" class="input" maxlength="16">
                                </div>
                            </div>

                            <div id="button">
                                <a href="/mypage/edit/account" id="cancel_button">변경 취소</a>
                                <a href="#" id="save_button">확인</a>
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