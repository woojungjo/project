<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../../resources/css/header_footer/home_header.css">

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
                  <li><a href="/board/mate/matelist">커뮤니티</a></li>
                  <li><a href="/board/qna/list">Q&A</a></li>
              </ul><!--headerbar_menu-->

              <ul class="header_login">
                  <li id="dong-info"><a href="/"><i class="fa-solid fa-location-dot"></i></a></li>
                  <li><a href="/user/login">로그인</a></li>
              </ul><!--header_login-->

          </div> <!--container-->
          
	     	 <script>
			  // Add an event listener to the #dong-info element
			  document.querySelector("#dong-info").addEventListener("click", function(event) {
			    // Prevent the default link behavior
			    event.preventDefault();
			    
			    // Call the sample6_execDaumPostcode function
			    sample6_execDaumPostcode();
			  });
			</script>
      </header>


  