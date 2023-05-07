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

    <link rel="shortcut icon" href="../resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../resources/ico/favicon.ico" type="image/x-icon">
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
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201021<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">견과류</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201009<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">국수</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201005<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">냉동만두</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201015<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">당면</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201008<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">두부</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201011<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">라면</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=7<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">밀가루</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201012<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">부침가루</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201007<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">빵</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201019<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">스프</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201013<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">식빵</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201010<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">시리얼</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201002<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">즉석국</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201004<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">즉석덮밥</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201014<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">즉석밥</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201020<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">즉석죽</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201024<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">컵라면</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201025<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">컵밥</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30201026<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">탕</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component2" name="component" value="component2">
                                <div class="cate_title">
                                    <label for="component2">정육·난류</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30101001<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">계란</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30101003<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">닭고기</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30101004<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">돼지고기</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30101002<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">쇠고기</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component3" name="component" value="component3">
                                <div class="cate_title">
                                    <label for="component3">수산가공품</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30202005<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">맛김</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30202003<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">맛살</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30202002<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">어묵</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30202004<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">참치캔</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component4" name="component" value="component4">
                                <div class="cate_title">
                                    <label for="component4">낙농·축산가공품</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30203002<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">마가린</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30203008<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">발효유</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30203006<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">분유</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30203003<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">소시지</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30203005<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">우유</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30203007<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">치즈</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30203004<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">햄</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component5" name="component" value="component5">
                                <div class="cate_title">
                                    <label for="component5">조미류·장류·식용유</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204011<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">간장</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204009<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">고추장</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204010<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">된장</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204015<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">잼</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204012<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">마요네즈</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204002<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">꿀</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204007<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">설탕</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204006<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">소금</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204005<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">식용유</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204001<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">식초</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204016<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">쌈장</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204004<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">참기름</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204014<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">카레</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204013<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">케첩</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204008<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">혼합조미료</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30204019<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">드레싱</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component6" name="component" value="component6">
                                <div class="cate_title">
                                    <label for="component6">채소</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102009<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">감자</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102010<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">고구마</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102017<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">깻잎</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102006<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">단무지</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102008<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">당근</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102015<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">대파</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102016<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">마늘</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102003<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">무</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102001<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">배추</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102011<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">버섯</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102018<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">상추</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102007<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">시금치</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102020<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">양배추</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102002<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">양파</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102012<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">오이</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102021<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">쪽파</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102005<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">콩나물</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102004<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">포기김치</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102013<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">풋고추</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102014<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">호박</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30102022<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">가지</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component7" name="component" value="component7">
                                <div class="cate_title">
                                    <label for="component7">과자·빙과류</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205003<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">감자칩</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205007<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">껌</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205010<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">모나카류아이스크림</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205009<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">빙과류</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205004<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">새우깡</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205008<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">아이스크림</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205011<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">에너지바</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205012<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">초코바</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205005<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">초코파이</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205006<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">초콜릿</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205001<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">사탕</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30205002<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">비스킷</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component8" name="component" value="component8">
                                <div class="cate_title">
                                    <label for="component8">차·음료·주류</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206008<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">주스</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206004<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">차</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206011<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">두유</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206016<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">막걸리</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206012<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">맥주</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206001<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">비타민음료</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206006<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">사이다</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206007<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">생수</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206013<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">소주</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206021<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">에너지음료</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206019<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">이온음료</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206002<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">캔커피</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206003<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">커피믹스</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206005<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">콜라</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30206023<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">포도주</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component9" name="component" value="component9">
                                <div class="cate_title">
                                    <label for="component9">이미용품</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301004<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">화장지</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301002<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">바디워시</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301001<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">로션</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301013<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">생리대</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301006<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">비누</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301021<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">손세정제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301020<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">염색약</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301017<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">면도날</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301010<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">샴푸</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301012<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">종이기저귀</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301007<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">치약</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301024<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">칫솔</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30304009<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">구강청결제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30301026<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">마스크</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30304028<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">코로나 자가검사 키트</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component10" name="component" value="component10">
                                <div class="cate_title">
                                    <label for="component10">세탁·주방·가사용품</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302008<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">고무장갑</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302009<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">랩</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302015<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">부탄가스</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302013<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">살균소독제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302016<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">살충제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302005<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">섬유유연제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302003<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">섬유탈취제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302011<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">세정제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302017<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">세탁세제(가루형)</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302018<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">세탁세제(액체형)</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302012<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">습기제거제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302002<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">위생백</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302006<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">주방세제</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30302007<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">키친타월</a></li>
                                </ul>
                            </li>
                            <li class="cate_nav_item">
                                <input type="radio" id="component11" name="component" value="component11">
                                <div class="cate_title">
                                    <label for="component11">생선류</label>
                                    <button type="button" class="cate_nav_bt"><i class="fa-solid fa-chevron-down"></i></button>
                                </div>

                                <ul class="cate_nav_ul nonedeco_li">
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30103001<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">갈치</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30103003<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">고등어</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30103004<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">오징어</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30103002<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">조기</a></li>
                                    <li class="details_cate" style="visibility: hidden;"><a href="${request.requestURI}?category=30103005<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>">삼치</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="article">
                        <div class="goods_sort">
                            <ul class="nav goods_sort_ul">
                                <li class="nav_item goods_sort_li">
                                    <a href="${request.requestURI}?sort=popular<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if><c:if test="${not empty __GOODSPAGEMAKER__.cri.category}">&amp;category=${__GOODSPAGEMAKER__.cri.category}</c:if>" class="goods_sort_a">인기순</a>
                                </li>
                                <li class="nav_item goods_sort_li">
                                    <a href="${request.requestURI}?sort=low<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if><c:if test="${not empty __GOODSPAGEMAKER__.cri.category}">&amp;category=${__GOODSPAGEMAKER__.cri.category}</c:if>" class="goods_sort_a">낮은 가격순</a>
                                </li>
                                <li class="nav_item goods_sort_li">
                                    <a href="${request.requestURI}?sort=high<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if><c:if test="${not empty __GOODSPAGEMAKER__.cri.category}">&amp;category=${__GOODSPAGEMAKER__.cri.category}</c:if>" class="goods_sort_a">높은 가격순</a>
                                </li>
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
                                            <span class="lowest_price">평균</span>
                                            <span class="price_won">
                                                <span class="goods_price won"><fmt:formatNumber value="${list.avg_price}" pattern="#,##0" /></span>
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
        <a href="${request.requestURI}?category=1<c:if test="${not empty __GOODSPAGEMAKER__.cri.keyword}">&amp;keyword=${__GOODSPAGEMAKER__.cri.keyword}</c:if>TOP" id="top_bt">
            <i class="fa-solid fa-arrow-up fa-lg"></i>
        </a>

        <jsp:include page="../header_footer/footer.jsp" flush="true" />
    </div>
</body>
</html>
