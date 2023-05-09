<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WeCart</title>

    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/priceCompare/mypage_frame.css">
    <link rel="stylesheet" href="/resources/css/priceCompare/mypage_cart.css">
    <link rel="stylesheet" href="/resources/css/priceCompare/mypage_cart_cur.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/3a5b85a601.js" crossorigin="anonymous"></script>
    <script src="/resources/js/priceCompare/mypage_cart.js"></script>
</head>
<body>
    <div id="wrap">
      <% Object auth = session.getAttribute("__AUTH__"); %>
      
      <% if(auth != null) { %>
         <jsp:include page="../../header_footer/main_header.jsp" flush="true" />
      <% } else { %>
         <jsp:include page="../../header_footer/home_header.jsp" flush="true" />
      <% } %>

        <div class="widthfix">
            <div id="container">
                <div id="section">
                    <div id="mypage_nav">
                        <ul class="mypage_nav_ul">
                            <li class="mypage_nav_li"><a href="#" class="nav_text"><span>마이페이지</span></a></li>
                            <li class="mypage_nav_li"><a href="/mypage/edit/check_password" class="nav_text"><span>개인정보 수정</span></a></li>
                            <li class="mypage_nav_li mypage_nav_li_selected"><a href="/mypage/cart/list" class="nav_text"><span>장바구니 목록</span></a></li>
                            <li class="mypage_nav_li"><a href="/mypage/cart/wishedPrds" class="nav_text"><span>찜한 상품</span></a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text"><span>즐겨찾는 마트</span></a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text"><span>내 활동 내역</span></a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text"><span>키워드알림</span></a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text"><span>활동알림</span></a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text"><span>채팅 내역</span></a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text"><span>북마크 내역</span></a></li>
                        </ul>
                    </div>

                    <div id="mypage_article">
                        <div class="mypage_article_title">
                            <h3>장바구니 목록</h3>
                            <span>* (X) 표시는 마트에 존재하지 않는 상품으로 현재 상품의 평균가로 대체하였습니다.</span>
                        </div>

                        <div class="mypage_article_content">
                            <div class="mycart_table_div">
                                <table id="mycart_tbl">
                                    <thead>
                                        <tr>
                                            <th scope="col" colspan="2">
                                                <div class="cart_tbl_date">
                                                    <span>장바구니</span>
                                                    <input type="date" data-placeholder="날짜 선택" required
                                                    aria-required="true" name="cartDate" id="cartDate" value="${__CREATIONDATE__}"> <!-- value 장바구니 담은 날로 지정-->
                                                </div>
                                            </th>
                                            <c:forEach var="priceList0" items="${__PRICELIST__[0]}">
                                                <th scope="col"><span>${priceList0.retail_name}</span></th>
                                            </c:forEach>
                                        </tr>
                                    </thead>
                                    <tbody>     <!--동적-->
                                        <c:forEach var="goodsList" items="${__GOODSLIST__}">                                            
                                            <tr class="goods_price_tr" data-goods_id="${goodsList.goods_id}">
                                                <td colspan="2" class="td_cart_goods_list">
                                                    <div class="cart_goods_list">
                                                                                                                    
                                                        <div>
                                                            <a href="/priceCompare/showPrd/${goodsList.goods_id}"><img src="${goodsList.goods_pic}" class="cart_goods_image"></a>
                                                        </div>
                                                                                                                
                                                        <div class="cart_title_count">
                                                            <a href="/priceCompare/showPrd/${goodsList.goods_id}" class="a_black_text"><span>${goodsList.goods_name}</span></a>
                                                            <div class="count_bt_delete">
                                                                <div class="count_bt">
                                                                    <button type="button" aria-label="수량내리기" class="count_minus_plus_bt count_minus_bt"></button>
                                                                    <div class="amount_div">${goodsList.amount}</div>
                                                                    <button type="button" aria-label="수량올리기" class="count_minus_plus_bt count_plus_bt"></button>
                                                                </div>
                                                            </div>                                                            
                                                        </div>                                                    
                                                    </div>
                                                </td>
                                                
                                                <c:forEach var="priceLists" items="${__PRICELIST__}">
                                                    <c:forEach var="list" items="${priceLists}">
                                                        <c:if test="${goodsList.goods_id eq list.goods_id}">
                                                        <td>
                                                            <span class="goods_price" data-price="${not empty list.price ? list.price : list.avg_price}">
                                                                <fmt:formatNumber value="${not empty list.price ? list.price : list.avg_price}" pattern="#,##0" />
                                                                
                                                            </span>
                                                            <span>원</span>
                                                            <c:if test="${empty list.price}">
                                                                <div class="nullPrice">(X)</div>    	
                                                            </c:if>
                                                            <div class="price_compare"></div>
                                                        </td>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>    
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr class="total_tr">
                                            <td colspan="2">
                                                <span>합계</span>
                                            </td>
                                            <c:forEach var="priceList0" items="${__PRICELIST__[0]}">
                                                <td>
                                                    <span class="total_price"></span>
                                                    <span class="total_won">원</span>  
                                                </td>
                                            </c:forEach>
                                        </tr>
                                    </tfoot>
                                </table>
                                <input type="hidden" name="member_id" value="${__AUTH__.member_id}">
                                <input type="hidden" name="cart_id" value="${__CARTID__}">                                                            
                            </div>
                            
                            <div id="mycart_tbl_button">
                                <button type="button" id="cart_remove_bt" class="mycart_tbl_bt">장바구니 삭제</button>

                                <div>
                                    <button type="button" id="current_price_bt" class="mycart_tbl_bt">현재 가격 비교</button>

                                    <button type="button" id="cart_list_bt" class="mycart_tbl_bt">장바구니 목록</button>
                                </div>                                        
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../../header_footer/footer.jsp" flush="true" />

        <a href="#TOP" id="top_bt" class="a_black_text">
            <i class="fa-solid fa-arrow-up fa-lg"></i>
        </a>
    </div>
</body>
</html>
