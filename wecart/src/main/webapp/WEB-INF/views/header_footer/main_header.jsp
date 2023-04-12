<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="../../resources/css/header_footer/main_header.css">
    	
    <div class="wrapper_contatiner">
      <div class="wrapper">
       
        <header>
            <div class="container">
                <div class="site_name">
                         <div class="WeCart">
                            <span><a href="/">우리동네<br>장바구니</a></span>
                        </div> <!--WeCart-->
                </div>  <!--site_name-->

                <ul class="headerbar_menu">
                    <li><a href="/priceCompare/list">가격비교</a></li>
                    <li><a href="/">커뮤니티</a></li>
                    <li><a href="">Q&A</a></li>
                </ul><!--headerbar_menu-->

                <ul class="header_login">
                    <li><a href="/">개포동 <i class="fa-solid fa-location-dot"></i></a></li>
                    <li><a href="/"><i class="fa-regular fa-comment-dots"></i></a></li>
                    <li><a href="/"><i class="fa-regular fa-bell"></i></a></li>
                    <li><a href="/"><i class="fa-solid fa-piggy-bank"></i></a></li>
                    <li>
                        <a href="/mypage/edit/check_password">
                         <%= session.getAttribute("id") %>
                        </a>
                    </li>
                    <li><a href="/user/logout">로그아웃</a></li>
                </ul>   <!--header_login-->

            </div> <!--container-->
        </header>