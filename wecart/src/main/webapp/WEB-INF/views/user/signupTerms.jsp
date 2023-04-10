<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 약관</title>

    <link rel="stylesheet" href="/resources/css/user/signupTerms.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
</head>
<body>
    <header>
        <div id="logo">
            우동장
        </div>
    </header>

    <div class="container">

        <form id="signup_form" method="get" action="/user/signup">

            <div id="wrap">

                <div id="checkbox">
                    <input type="checkbox" id="ck_all">
                    <label for="ck_all">전체 동의</label>
                </div>


                <ul class="terms_ul">

                    <li class="terms_li">

                        <div id="checkbox">
                            <input type="checkbox" id="ck_1">
                            <label for="ck_1">
                                우동장 이용약관 동의<span class="ck_color_1">(필수)</span>
                            </label>
                        </div>

                        <div class="terms_box">

                            <div class="box_content">
                                <h3 class="box__title">1. 우동장 이용약관 목차</h3>
                                <p class="box__text">
                                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos quisquam
                                    ut fuga illum, ab voluptas aspernatur harum dolorum sunt accusamus
                                    reiciendis nostrum nisi, voluptate dolor distinctio! Asperiores, quidem?
                                    Sunt, unde.
                                </p>
                            </div>
                        </div>
                    </li>

                    <li class="terms_li">

                        <div id="checkbox">
                            <input type="checkbox" id="ck_2">
                            <label for="ck_2">
                                약관 1 동의<span class="ck_color_1">(필수)</span>
                            </label>
                        </div>

                        <div class="terms_box">

                            <div class="box_content">
                                <h3 class="box__title">1. 약관 1 목차</h3>
                                <p class="box__text">
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Adipisci
                                    pariatur laborum dolore numquam fuga quibusdam, aspernatur et explicabo
                                    aliquam assumenda doloremque. Laboriosam nesciunt consectetur repellat
                                    et quos voluptatem! Corporis, aut!
                                </p>
                            </div>
                        </div>
                    </li>

                    <li class="terms_li">

                        <div id="checkbox">
                            <input type="checkbox" id="ck_3">
                            <label for="ck_3">
                                선택 약관 동의<span class="ck_color_2">(선택)</span>
                            </label>
                        </div>

                        <div class="terms_box" id="divLocation">

                            <div class="box_content">
                                <h3 class="box__title">선택 약관 목차</h3>
                                <p class="box__text">
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis, sit
                                    expedita esse nisi beatae sint est odit sapiente nesciunt quis. Magni
                                    minus corporis fuga rerum iusto eos sit dolores ea.
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>

            </div>

            <div class="terms_btn">
                <span><a href="#" id="cancel" class="btn_config" role="button">취소</a></span>
                <span><button id="agree" class="btn_config" role="button" type="submit">확인</button></span>
            </div>

        </form>
    </div>

    <script>
        $('#ck_all').click(function () {
            var checked = $('#ck_all').is(':checked');

            if (checked)
                $('input:checkbox').prop('checked', true);
            else
                $('input:checkbox').prop('checked', false);
        });
    </script>

    <footer>
        <ul id="footer_1">
            <li><a href="#">이용약관</a></li>
            <li><a href="#">개인정보처리방침</a></li>
            <li>회사소개</li>
            <li>회사 주소 : Lorem, ipsum dolor.</li>
            <li>회사 대표전화 : 012-3456-7890</li>
            <li>팩스번호 : 012-3456-7890</li>
            <li>사업자 번호 : 1234</li>
        </ul>

        <ul id="footer_2">
            <li><a href="#"></a>감성현</li>
            <li><a href="#"></a>조연주</li>
            <li><a href="#"></a>김민규</li>
            <li><a href="#"></a>김용세</li>
            <li><a href="#"></a>김정환</li>
            <li><a href="#"></a>김지연</li>
        </ul>

        <br>

        © 2023 Wecart, Inc. ALL Rights Reserved

    </footer>
</body>
</html>