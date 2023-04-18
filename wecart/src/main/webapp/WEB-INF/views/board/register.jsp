<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>WeCart</title>
        <script type="text/javascript" src="/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8" defer></script>
        <script src="https://kit.fontawesome.com/a623128410.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Jua&family=Source+Sans+Pro:ital,wght@1,700&display=swap"
        rel="stylesheet">
        
        <link rel="stylesheet" href="/resources/css/header_footer/main_header.css">
        <link rel="stylesheet" href="/resources/css/header_footer/home_header.css">
        <link rel="stylesheet" href="/resources/css/header_footer/footer.css">
        <link rel="stylesheet" href="/resources/css/board/qna/style.css">
        <script src="/resources/js/board/qna/script.js" defer ></script>
        <script src="/resources/js/board/qna/smarteditor.js" defer ></script>
        
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
        
        <main id="board_main">
            <form action="" method="POST">
                <div id = "board_write">
                    <div id="board_write_top">
                        <div>글쓰기</div>
                        <button type="submit"><span class="fas fa-pen-to-square" />등록</button>
                    </div>
                    <div><hr></div>
                    <select name="">
                        <option value="">게시판을 선택해 주세요</option>
                        <option value="">지역게시판</option>
                        <option value="">중고거래</option>
                        <option value="">장메이트</option>
                        <option value="">크롤링</option>
                        <option value="">세일정보</option>
                    </select>
                    <input type="text" placeholder="제목을 입력해 주세요"/>
                    <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>

                    <div id="board_secret">
                        <input type="checkbox">&nbsp;비밀글을 작성합니다.
                    </div>


                </div>
            </form>
        </main>


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