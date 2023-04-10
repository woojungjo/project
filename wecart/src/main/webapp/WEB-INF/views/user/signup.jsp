<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

    <link rel="stylesheet" href="/resources/css/user/signup.css">
</head>

<body>
    <header>
        <div id="logo">
            우리동네장바구니
        </div>
    </header>

    <main>
        <div id="container">

            <div id="content">

                <div id="part_1">

                    <div class="article">
                        <h3 class="input_title"><label for="id">아이디</label></h3>
                        <input type="text" id="id" class="input" placeholder="5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능" maxlength="20">
                    </div>

                    <div class="article">
                        <h3 class="input_title"><label for="password">비밀번호</label></h3>
                        <input type="password" id="password" placeholder="최소 8~16자 영문 대 소문자, 숫자, 특수문자 사용 가능" class="input" maxlength="16">
                    </div>

                    <div class="article">
                        <h3 class="input_title"><label for="password">비밀번호 확인</label></h3>
                        <input type="password" id="password" class="input" maxlength="16">
                    </div>

                    <div class="article">
                        <h3 class="input_title"><label for="nickname">닉네임</label></h3>
                        <input type="text" id="nickname" class="input" placeholder="한글, 영어, 숫자 최소 3~10자로 입력" maxlength="10">
                        
                        <a href="#" id="nick_button" class="button" role="button">
                            <span>중복 확인</span>
                        </a>
                    </div>                    

                </div>

                <div id="part_2">

                    <div class="article">
                        <h3 class="input_title"><label for="email">이메일(선택사항)</label></h3>
                        <input type="text" id="email" class="input" placeholder="@부분 까지 전체 이메일 입력" maxlength="100">
                    </div>

                    <div class="article">
                        <h3 class="input_title"><label for="phoneNo">휴대전화(선택사항)</label></h3>
                        <input type="text" id="phoneNo" placeholder="-없이 숫자만" class="input" maxlength="16">

                        <a href="#" id="auth_button" class="button" role="button">
                            <span>인증번호 받기</span>
                        </a>
                    </div>

                    <div class="article" id="auth">
                        <input type="text" id="authck" class="input" placeholder="인증번호를 입력하세요" maxlength="20">
                    </div>

                </div>

                <div id="part_3">
                    <button id="signup_button" class="button" class="button">
                        <span>가입하기</span>
                    </button>
                </div>

            </div>

        </div>

    </main>

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