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

        <link rel="stylesheet" href="/resources/css/mypageEdit/withdrawal_account.css">

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

                                <div id="reason_1">

                                    <h3 class="box_title">탈퇴사유&nbsp;&nbsp;<span>중복선택 가능</span></h3>
                                    <form action="#">
                                        <input type="checkbox" id="ck_1" value="서비스 불만">
                                        <label for="ck_1">
                                            서비스 불만
                                        </label>

                                        <input type="checkbox" id="ck_2" value="더이상 사용안함">
                                        <label for="ck_2">
                                            더이상 사용안함
                                        </label>

                                        <input type="checkbox" id="ck_3" value="정보부족">
                                        <label for="ck_3">
                                            정보부족
                                        </label>

                                        <input type="checkbox" id="ck_4" value="이용 불편">
                                        <label for="ck_4">
                                            이용 불편
                                        </label>
                                    </form>
                                </div>

                                <div id="reason_2">

                                    <h3 class="box_title">기타사유</h3>
                                    <textarea name="" id="" cols="80" rows="10"></textarea>
                                </div>


                                <div id="reason_3">

                                    <h3 class="box_title">탈퇴시 유의사항</h3>
                                    <div class="box_content">
                                        <p class="box__text">
                                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Temporibus
                                            blanditiis quo qui nam ex ipsa soluta,
                                            ullam quae repudiandae expedita cum quia. Provident amet nihil saepe
                                            praesentium ipsa alias natus!
                                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ea in, ut fugiat
                                            quam recusandae modi inventore,
                                            qui eaque deserunt officia numquam dolor? Necessitatibus consequuntur
                                            quaerat, quos delectus et accusamus saepe?
                                        </p>
                                    </div>
                                </div>

                                <div id="reason_4">
                                    <input type="checkbox" id="ck_5">
                                    <label for="ck_5" id="check_text">
                                        위 내용을 모두 확인 했습니다. <span>(필수)</span>
                                    </label>
                                </div>
                            </div>

                            <div id="button">
                                <a href="/mypage/edit/account" id="cancel_button">취소</a>
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