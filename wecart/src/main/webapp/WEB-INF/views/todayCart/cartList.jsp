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
    <link rel="stylesheet" href="../resources/css/priceCompare/cart_frame.css">
    <link rel="stylesheet" href="../resources/css/priceCompare/mypage_cart.css">
    <link rel="stylesheet" href="../resources/css/priceCompare/today_cart.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/3a5b85a601.js" crossorigin="anonymous"></script>
    <script src="../resources/js/priceCompare/today_cart.js" defer></script>
</head>
<body>
    <div id="wrap">
      <% Object auth = session.getAttribute("__AUTH__"); %>
      
      <% if(auth != null) { %>
         <jsp:include page="../header_footer/main_header.jsp" flush="true" />
      <% } else { %>
         <jsp:include page="../header_footer/home_header.jsp" flush="true" />
      <% } %>

        <div class="widthfix">    
            <div id="search">
                <div class="cate">
                    <i class="fa-solid fa-bars fa-2x"></i>
                    <span>카테고리</span>    
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
                    <div class="article">
                        <div class="mypage_article_content">
                            <div>
                                <h2>오늘의 장바구니</h2>
                            </div>
                            <div class="mycart_table_div">
                                <form action="/todayCart/register" method="post">
                                    <table id="mycart_tbl">
                                        <thead>
                                            <tr>
                                                <th scope="col" colspan="2">
                                                    <div class="goods_select">
                                                        <label class="checkBox">
                                                            <input type="checkbox" name="todayCartList" id="allSelect" value="allSelect" checked>   
                                                            <span class="allSelectText">전체선택</span>
                                                            <button type="button" id="allDeletebt">선택삭제</button>
                                                        </label>
                                                        <span>상품 정보</span>
                                                    </div>
                                                </th>
                                                <c:forEach var="priceList0" items="${__PRICELIST__[0]}">
                                                	<th scope="col"><span>${priceList0.retail_name}</span></th>
                                                </c:forEach>
                                            </tr>
                                        </thead>
                                        <tbody>     <!--동적-->
                                            <c:forEach var="goodsList" items="${__GOODSLIST__}">                                            
                                                <tr class="goods_price_tr">
                                                    <td colspan="2" class="td_cart_goods_list">
                                                        <div class="cart_goods_list">
                                                            <div class="checkBox_img">
                                                                <label>
                                                                    <input type="checkbox" name="todayCartList" class="cart_select" value="">
                                                                </label>                                                            
                                                                <div>
                                                                    <a href="#"><img src="https://picsum.photos/id/684/100/100" class="cart_goods_image"></a>
                                                                </div>
                                                            </div>                                                        
                                                            <div class="cart_title_count">
                                                                <a href="#" class="a_black_text"><span>${goodsList.goods_name}</span></a>
                                                                <div class="count_bt_delete">
                                                                    <div class="count_bt">
                                                                        <button type="button" aria-label="수량내리기" class="count_minus_plus_bt count_minus_bt"></button>
                                                                        <div class="amount_div">1</div>
                                                                        <button type="button" aria-label="수량올리기" class="count_minus_plus_bt count_plus_bt"></button>
                                                                    </div>
                                                                    <div class="delete_bt_div">
                                                                        <button type="button" aria-label="장바구니삭제" class="delete_bt"></button>
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
                                                            </td>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>                                       
	                                                
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="2">
                                                    <span>합계</span>
                                                </td>
                                                <td>
                                                    <span class="total_price"></span>
                                                    <span>원</span>  
                                                </td>
                                                <td>
                                                    <span class="total_price"></span>
                                                    <span>원</span>  
                                                </td>
                                                <td>
                                                    <span class="total_price"></span>
                                                    <span>원</span>  
                                                </td>
                                                <td>
                                                    <span class="total_price"></span>
                                                    <span>원</span>  
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>

                                    <div class="mycart_tbl_button_flex">
                                        <input type="submit" value="장바구니 저장" class="mycart_tbl_bt todayCartSave">
                                    </div>
                                </form>                        
                            </div>                            
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
