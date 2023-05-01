<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 화면</title>

    <link rel="stylesheet" href="/resources/css/user/login.css">
</head>

<body>
    <header>
        <div id="logo">
            우리동네 장바구니
        </div>       
    </header>

    <div id="container">

        <form action="/user/loginPost" method="post">
            <div id="panel_out">
                <div id="panel_in">

                    <div id="id_box">
                        <input type="text" id="id" name="login_id" placeholder="아이디">
                    </div>
    
                    <div id="pw_box">
                        <input type="password" id="pw" name="pwd" placeholder="비밀번호">
                    </div>
    
                    <div id="login_button">
                        <button id="button" type="submit">로그인 하기</button>
                    </div>
    
                </div>           
            </div>
        </form>

        <div id="login_bottom">
            <div id="sns_login">
                SNS 계정으로 로그인 하기
                <div id="sns_logo">
                    <a href="#"><div id="logo_1"></div></a>
                    <a href="#"><div id="logo_2"></div></a>
                    <a href="#"><div id="logo_3"></div></a>
                </div>
            </div>        

            <ul id="find">
                <li><a href="/user/findAccount">아이디 찾기</a></li>
                <li><a href="/user/findAccount">비밀번호 찾기</a></li>
                <li><a href="/user/signUpTerms">회원가입</a></li>
            </ul>

        </div>

    </div>

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

</html>