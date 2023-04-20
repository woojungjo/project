<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WeCart</title>

    <link rel="shortcut icon" href="../ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../ico/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../resources/css/priceCompare/cart.css">
    <link rel="stylesheet" href="../resources/css/priceCompare/cart_frame.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/3a5b85a601.js" crossorigin="anonymous"></script>
    <script src="../resources/js/priceCompare/cart.js" defer></script>
</head>
<body>
    <div id="wrap">
    
	    <% Object auth = session.getAttribute("__AUTH__"); %>
	     
	    <% if(auth != null) { %>
	         <jsp:include page="../header_footer/main_header.jsp" flush="true" />
	    <% } else { %>
	         <jsp:include page="../header_footer/home_header.jsp" flush="true" />
	    <% } %>

        <div class="widthfix search_fix">    
            <div id="search">
                <div id="category">
                    <div class="cate" style="height: 50px; align-items: center;">
                        <i class="fa-solid fa-bars fa-2x"></i>
                        <span>카테고리</span>    
                        <div class="cate_hover_div" style="display: none;">
                            <ul class="cate_hover_ul nonedeco_li">
                                <li class="cate_hover_li">
                                    <div class="cate_hover_li_text">
                                        곡물가공품
                                    </div>
                                </li>
                                <li class="cate_hover_li">
                                    <div class="cate_hover_li_text">
                                        정육·난류
                                    </div>                                
                                </li>
                                <li class="cate_hover_li">
                                    <div class="cate_hover_li_text">
                                        수산가공품
                                    </div>                                
                                </li>
                                <li class="cate_hover_li">
                                    <div class="cate_hover_li_text">
                                        낙농·축산가공품
                                    </div>                                 
                                </li>
                                <li class="cate_hover_li">
                                    <div class="cate_hover_li_text">
                                        조미료·장류·식용유
                                    </div>                                 
                                </li>
                                <li class="cate_hover_li">
                                    <div class="cate_hover_li_text">
                                        채소
                                    </div>                                 
                                </li>
                                <li class="cate_hover_li">
                                    <div class="cate_hover_li_text">
                                        과자·빙과류
                                    </div>                                 
                                </li>
                                <li class="cate_hover_li">
                                    <div class="cate_hover_li_text">
                                        차·음료·주류
                                    </div>                                 
                                </li>
                                <li class="cate_hover_li">
                                    <div class="cate_hover_li_text">
                                        이미용품
                                    </div>                                 
                                </li>
                                <li class="cate_hover_li">
                                    <div class="cate_hover_li_text">
                                        세탁·주방·가사용품
                                    </div>                                 
                                </li>
                                <li class="cate_hover_li">
                                    <div class="cate_hover_li_text">
                                        생선류
                                    </div>                                 
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="search_bar">
                    <form action="/priceCompare/search" method="get">
                        <div class="search_form">
                            <input type="text" name="keyword" placeholder="검색어를 입력해주세요" class="search_input">
                            <button type="submit"class="submit_bt"><i class="fa-solid fa-magnifying-glass fa-lg"></i></button>
                        </div>                    
                    </form>                          
                </div> 
                <div>
                    <button type="button" class="mypick_bt mypick_goods"><i class="fa-regular fa-heart fa-2x"></i></button>
                    <button type="button" class="mypick_bt mypick_cart"><i class="fa-solid fa-cart-shopping fa-2x"></i></button>
                </div>             
            </div>
        </div>

        <div class="widthfix">  
            <div id="container">
                <div id="section">
                    <div class="cate_nav">
                        <ul class="cate_ul">
                            <li class="cate_nav_item">
                                <input type="radio" id="component1" name="component" value="component1">
                                <div class="cate_title">
                                    <label for="component1">곡물가공품</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>
                                
                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(1)}"
                                                                                            href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">견과류</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(2)}"
                                                                                            href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">국수</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(3)}"
                                                                                            href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">냉동만두</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(4)}"
                                                                                            href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">당면</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(5)}"
                                                                                            href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">두부</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(6)}"
                                                                                            href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">라면</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(7)}"
                                                                                            href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">밀가루</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(8)}"
                                                                                            href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">부침가루</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(9)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">빵</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(10)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">스프</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(11)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">식빵</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(12)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">시리얼</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(13)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">즉석국</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(14)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">즉석덮밥</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(15)}"
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">즉석밥</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(16)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">즉석죽</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(17)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">컵라면</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(18)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">컵밥</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(19)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">탕</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component2" name="component" value="component2">
                                <div class="cate_title">
                                    <label for="component2">정육·난류</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(20)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">계란</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(21)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">닭고기</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(22)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">돼지고기</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(23)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">쇠고기</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component3" name="component" value="component3">
                                <div class="cate_title">
                                    <label for="component3">수산가공품</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(24)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">맛김</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(25)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">맛살</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(26)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">어묵</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(27)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">참치캔</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component4" name="component" value="component4">
                                <div class="cate_title">
                                    <label for="component4">낙농·축산가공품</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(28)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">마가린</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(29)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">발효유</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(30)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">분유</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(31)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">소시지</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(32)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">우유</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(33)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">치즈</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(34)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">햄</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component5" name="component" value="component5">
                                <div class="cate_title">
                                    <label for="component5">조미류·장류·식용유</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(35)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">간장</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(36)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">고추장</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(37)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">된장</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(38)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">잼</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(39)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">마요네즈</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(40)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">꿀</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(41)}" 
                                   															href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">설탕</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(42)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">소금</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(43)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">식용유</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(44)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">식초</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(45)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">쌈장</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(46)}" 
                                   															href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">참기름</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(47)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">카레</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(48)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">케첩</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(49)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">혼합조미료</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(50)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">드레싱</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component6" name="component" value="component6">
                                <div class="cate_title">
                                    <label for="component6">채소</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(51)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">감자</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(52)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">고구마</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(53)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">깻잎</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(54)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">단무지</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(55)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">당근</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(56)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">대파</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(57)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">마늘</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(58)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">무</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(59)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">배추</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(60)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">버섯</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(61)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">상추</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(62)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">시금치</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(63)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">양배추</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(64)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">양파</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(65)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">오이</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(66)}" 
                                   															href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">쪽파</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(67)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">콩나물</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(68)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">포기김치</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(69)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">풋고추</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(70)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">호박</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component7" name="component" value="component7">
                                <div class="cate_title">
                                    <label for="component7">과자·빙과류</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(71)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">감자칩</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(72)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">껌</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(73)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">모나카류아이스크림</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(74)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">빙과류</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(75)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">새우깡</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(76)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">아이스크림</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(77)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">에너지바</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(78)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">초코바</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(79)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">초코파이</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(80)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">초콜릿</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(81)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">사탕</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(82)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">비스킷</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component8" name="component" value="component8">
                                <div class="cate_title">
                                    <label for="component8">차·음료·주류</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(83)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">주스</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(84)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">차</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(85)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">두유</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(86)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">막걸리</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(87)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">맥주</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(88)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">비타민음료</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(89)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">사이다</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(90)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">생수</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(91)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">소주</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(92)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">에너지음료</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(93)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">이온음료</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(94)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">캔커피</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(95)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">커피믹스</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(96)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">콜라</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(97)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">포도주</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component9" name="component" value="component9">
                                <div class="cate_title">
                                    <label for="component9">이미용품</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(98)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">화장지</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(99)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">바디워시</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(100)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">로션</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(101)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">생리대</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(102)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">비누</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(103)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">손세정제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(104)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">염색약</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(105)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">면도날</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(106)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">샴푸</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(107)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">종이기저귀</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(108)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">치약</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(109)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">칫솔</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(110)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">구강청결제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(111)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">마스크</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(112)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">코로나 자가검사 키트</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component10" name="component" value="component10">
                                <div class="cate_title">
                                    <label for="component10">세탁·주방·가사용품</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(113)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">고무장갑</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(114)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">랩</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(115)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">부탄가스</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(116)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">살균소독제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(117)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">살충제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(118)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">섬유유연제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(119)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">섬유탈취제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(120)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">세정제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(121)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">세탁세제(가루형)</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(122)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">세탁세제(액체형)</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(123)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">습기제거제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(124)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">위생백</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(125)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">주방세제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(126)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">키친타월</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component11" name="component" value="component11">
                                <div class="cate_title">
                                    <label for="component11">생선류</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(127)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">갈치</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(128)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">고등어</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(129)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">오징어</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a data-temp="${__GOODSPAGEMAKER__.cri.setCategory(130)}" 
                                    														href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}">조기</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="article">
                        <div class="goods_sort">
                            <ul class="nav goods_sort_ul">
                                <li class="nav_item goods_sort_li"><a data-temp="${__GOODSPAGEMAKER__.cri.setSort("popular")}"
                                									  href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}" class="goods_sort_a">인기순</a></li>
                                <li class="nav_item goods_sort_li"><a data-temp="${__GOODSPAGEMAKER__.cri.setSort("low")}"
                                									  href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}" class="goods_sort_a">낮은 가격순</a></li>
                                <li class="nav_item goods_sort_li"><a data-temp="${__GOODSPAGEMAKER__.cri.setSort("high")}"
                                									  href="${request.requestURI}${__GOODSPAGEMAKER__.cri.searchPagingUri}" class="goods_sort_a">높은 가격순</a></li>
                            </ul>
                        </div>
                                             
                        <div class="goods_img_tbl">
                            <c:forEach var="list" items="${__GOODSLIST__}">   
                                <a href="/priceCompare/showPrd/${list.goods_id}" class="goods_img_a">
                                    <div class="goods_img">
                                        <div class="goods_img_content">
                                            <img src="${list.goods_pic}" alt="${list.goods_name}">
                                        </div>
                                        
                                    </div>
                                    <div class="goods_img_title">
                                        <span class="goods_name">${list.goods_name}</span>
                                        
                                        <div class="goods_img_price">
                                            <span class="lowest_price">최저</span>
                                            <span class="price_won">
                                                <span class="goods_price won"><fmt:formatNumber value="${list.low_price}" pattern="#,##0" /></span>
                                                <span class="won">원</span>
                                            </span>
                                            
                                        </div>
                                    </div>
                                </a>   
                            </c:forEach>                   
                        </div>                        

                        <div class="page_index">
                            <c:set var="currPage" value="${not empty param.currPage ? param.currPage : 1}"/>
                            <!-- 1. first -->
                            <a  data-temp="${__GOODSPAGEMAKER__.cri.setCurrPage(1)}"
                                href="${request.requestURI}${__GOODSPAGEMAKER__.cri.pagingUri}" 
                                class="page_index_item"><i class="fa-solid fa-angles-left"></i></a>

                            <!-- 2. prev -->
                            <a  data-temp="${__GOODSPAGEMAKER__.cri.setCurrPage(currPage eq 1 ? 1 : currPage - 1)}"
                                href="${request.requestURI}${__GOODSPAGEMAKER__.cri.pagingUri}" class="page_index_item"><i class="fa-solid fa-angle-left"></i></a>

                            <!-- 3. 페이지번호 목록 -->
                            <c:forEach var="pageNum" begin="${__GOODSPAGEMAKER__.startPage}" end="${__GOODSPAGEMAKER__.endPage}">
                                <a data-temp="${__GOODSPAGEMAKER__.cri.setCurrPage(pageNum)}"
                                   href="${request.requestURI}${__GOODSPAGEMAKER__.cri.pagingUri}" 
                                   class="page_index_item ${currPage eq pageNum ? 'currPage' : ''}">
                                   ${pageNum}
                                </a>
                            </c:forEach>

                            <!-- 4. next -->
                            <a  data-temp="${__GOODSPAGEMAKER__.cri.setCurrPage(currPage eq __GOODSPAGEMAKER__.realEndPage ? __GOODSPAGEMAKER__.realEndPage : currPage + 1)}"
                                href="${request.requestURI}${__GOODSPAGEMAKER__.cri.pagingUri}" class="page_index_item"><i class="fa-solid fa-angle-right"></i></a>

                            <!-- 5. last  -->
                            <a  data-temp="${__GOODSPAGEMAKER__.cri.setCurrPage(__GOODSPAGEMAKER__.realEndPage)}"
                                href="${request.requestURI}${__GOODSPAGEMAKER__.cri.pagingUri}" 
                                class="page_index_item"><i class="fa-solid fa-angles-right"></i></a>    
                        </div>
                    </div>                   
                </div>
            </div>
        </div>
        <a href="#TOP" id="top_bt">
            <i class="fa-solid fa-arrow-up fa-lg"></i>
        </a>

        <jsp:include page="../header_footer/footer.jsp" flush="true" />
    </div>
</body>
</html>
