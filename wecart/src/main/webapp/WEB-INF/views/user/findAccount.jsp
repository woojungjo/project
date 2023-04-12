<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/resources/css/user/findAccount.css">
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
                    <a href="#" id="tab" class="tablinks active" onclick="openTab(event, 'tab1')">아이디 찾기</a>
                    <a href="#" id="tab" class="tablinks" onclick="openTab(event, 'tab2')">비밀번호 찾기</a>
                </nav>

                <div id="tab1" class="tabcontent show">

                    <div class="table_wrap">

                        <div class="article">
                            <h3 class="input_title"><label for="id">닉네임</label></h3>
                            <input type="text" id="id" class="input" maxlength="20">
                        </div>

                        <div class="article">
                            <h3 class="input_title"><label for="email">이메일</label></h3>
                            <input type="text" id="email" class="input" maxlength="100">
                        </div>
                    </div>
                </div>

                <div id="tab2" class="tabcontent">

                    <div class="table_wrap">

                        <div class="article">
                            <h3 class="input_title"><label for="id">아이디</label></h3>
                            <input type="text" id="id" class="input" maxlength="20">
                        </div>

                        <div class="article">
                            <h3 class="input_title"><label for="id">닉네임</label></h3>
                            <input type="text" id="id" class="input" maxlength="20">
                        </div>

                        <div class="article">
                            <h3 class="input_title"><label for="email">이메일</label></h3>
                            <input type="text" id="email" class="input" maxlength="100">
                        </div>
                    </div>
                </div>

                <div id="next">                                
                    <a href="#" id="next_button">다음</a>
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
    
</body>

	<script>
        function openTab(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.className += " active";
        }
    </script>

</html>