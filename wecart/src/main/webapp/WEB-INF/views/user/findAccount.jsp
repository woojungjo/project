<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel="stylesheet" href="/resources/css/user/findAccount.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    </head>

    <body>
        <header>
            <div id="logo">
                <a href="/">우리동네 장바구니</a>
            </div>
        </header>

        <main>

            <div id="container">

                <div id="content">

                    <nav>
                        <ul>
                            <li class="tablinks active" onclick="search_check(1)">아이디 찾기</li>
                            <li class="tablinks" onclick="search_check(2)">비밀번호 찾기</li>
                        </ul>
                    </nav>

                    <!-- 아이디 찾기 -->
                    <div id="searchI" class="tabcontent" style="display: block;">

                        <div class="table_wrap">

                            <div class="article">
                                <h3 class="input_title"><label for="alias">닉네임</label></h3>
                                <input type="text" id="alias" name="alias" class="input" maxlength="20">
                            </div>

                            <div class="article">
                                <h3 class="input_title"><label for="email">이메일</label></h3>
                                <input type="text" id="email" name="email" class="input" maxlength="100">
                            </div>
                        </div>

                        <div class="next" id="id_next">
                            <button class="next_button" type="button" onclick="idSearch_click()">다음</button>
                        </div>
                    </div>

                    <!-- 비밀번호 찾기 -->
                    <div id="searchP" class="tabcontent">

                        <div class="table_wrap">

                            <div class="article">
                                <h3 class="input_title"><label for="login_id">아이디</label></h3>
                                <input type="text" id="login_id" name="login_id" class="input" maxlength="20">
                            </div>

                            <div class="article">
                                <h3 class="input_title"><label for="alias2">닉네임</label></h3>
                                <input type="text" id="alias2" name="alias2" class="input" maxlength="20">
                            </div>

                            <div class="article">
                                <h3 class="input_title"><label for="email2">이메일</label></h3>
                                <input type="text" id="email2" name="email2" class="input" maxlength="100">
                            </div>
                        </div>

                        <div class="next" id="pw_next">
                            <button class="next_button" type="button" onclick="pwSearch_click()">다음</button>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer>

            <ul id="footer_1">
                <li><a href="">사업자 정보</a></li>
                <li><a href="">이용약관</a></li>
                <li><a href="">개인정보처리방침</a></li>
            </ul>

            <ul id="footer_2">
                <li><a href="https://github.com/woojungjo">Woojungjo</a></li>
                <li><a href="https://github.com/zuxico123">감성현</a></li>
                <li><a href="https://github.com/KimYongSae">김용세</a></li>
                <li><a href="https://github.com/JeongHwan95">김정환</a></li>
                <li><a href="https://github.com/comdesk">김지연</a></li>
                <li><a href="https://github.com/Juyeonjoo">조연주</a></li>
            </ul>

            <br>

            &copy; 2023 WeCart, Inc. All Rights Reserved
        </footer>

        <div id="idsearch_modal" class="idsearch_modal" style="display: none;">
            <div class="modal_contents">
                <h4><b>손님 아이디는?</b><span class="close">&times;</span></h4>
                <br>
                <h2 id="id_value"></h2>
                <br>
                <button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
                    <i class="fa fa-envelope"></i>비밀번호 찾기</button>
            </div>
        </div>

        <div id="pwsearch_modal" class="pwsearch_modal" style="display: none;">
            <div class="modal_contents">
                <h4><b>회원님의 계정으로 임시비밀번호를 보내드렸습니다.</b><span class="close">&times;</span></h4>
            </div>
        </div>
    </body>

    <!-- 스크립트 -->
    <script>
        function search_check(num) {
            if (num == '1') {
                document.getElementById("searchI").style.display = "block";
                document.getElementById("searchP").style.display = "none";
            } else {
                document.getElementById("searchI").style.display = "none";
                document.getElementById("searchP").style.display = "block";
            }

            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }

            event.currentTarget.className += " active";
        }

        $(document).ready(function () {
            // ID 찾기 모달
            // 1. 보여주기
            $('#id_next').click(function () {
                $('#idsearch_modal').show();
            });
            // 2. 닫기
            $('.close').on('click', function () {
                $('#idsearch_modal').hide();
            });
            // 3. 윈도우 클릭 시 닫기
            $(window).on('click', function () {
                if (event.target == $('#idsearch_modal').get(0)) {
                    $('#idsearch_modal').hide();
                }
            });

            // 비밀번호 찾기 모달
            // 1. 보여주기
            $('#pw_next').click(function () {
                $('#pwsearch_modal').show();
            });
            // 2. 닫기
            $('.close').on('click', function () {
                $('#pwsearch_modal').hide();
            });
            // 3. 윈도우 클릭 시 닫기
            $(window).on('click', function () {
                if (event.target == $('#pwsearch_modal').get(0)) {
                    $('#pwsearch_modal').hide();
                }
            });
        });

        // 아이디 값 받고 출력하는 ajax
        var idSearch_click = function () {
            var data = {
                alias: $('#alias').val(),
                email: $('#email').val()
            };

            $.ajax({
                type: "POST",
                url: "/user/searchId",
                data: data,
                success: function (data) {                    
                    if (data == 0 || !data) {
                        $('#id_value').text("회원 정보를 확인해주세요!");
                    } else {
                        $('#id_value').text(data);
                    }
                }
            });
        }

        // 비밀번호 ajax
        var pwSearch_click = function () {
            var data = {
                login_id: $('#login_id').val(),
                alias: $('#alias2').val(),
                email: $('#email2').val()
            };

            $.ajax({
                type: "POST",
                url: "/user/searchPw",
                data: data,
                success: function (data) {
                    
                }
            });
        }

    </script>

    </html>