<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="/resources/css/header_footer/main_header.css">
    	
    <div class="wrapper_contatiner">
      <div class="wrapper">
       
        <header>
            <div class="container">
                <div class="site_name">
                         <div class="WeCart">
                            <span><a href="/main">우리동네<br>장바구니</a></span>
                        </div> <!--WeCart-->
                </div>  <!--site_name-->

                <ul class="headerbar_menu">
                    <li><a href="/priceCompare/list">가격비교</a></li>
                    <li><a href="/board/mate/matelist">커뮤니티</a></li>
                    <li><a href="/board/qna/list">Q&A</a></li>
                </ul><!--headerbar_menu-->

                <ul class="header_login">
                    <li id="dong-info" onclick="sample6_execDaumPostcode()"><i class="fa-solid fa-location-dot"><%= session.getAttribute("__TOWN_NAME__") %></i></a></li>
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
       
			<script>
			/*
			  // Add an event listener to the #dong-info element
			  document.querySelector("#dong-info").addEventListener("click", function(event) {
			    // Prevent the default link behavior
			    event.preventDefault();
			    
			    // Call the sample6_execDaumPostcode function
			    sample6_execDaumPostcode();
			  });
		*/
			</script>
				
			<!-- 카카오API -->
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
		    function sample6_execDaumPostcode() {
		    	new daum.Postcode({
		            oncomplete: function (data) {
		            	
		                // Create a JSON object with the bname value
		                var dongInfo = {
		                    'bname': data.bname
		                };
		                
		                // Convert the JSON object to a string
		                var jsondongInfo = JSON.stringify(dongInfo);
		                console.log('jsondongInfo : ', jsondongInfo);
		
		                // Update the input field value with the bname value
		                document.querySelector("#dong-info").value = data.bname;
		                
		                // Get the address link element
		                const addressLink = document.querySelector("#dong-info");
		                // Update the link text with the new address value
		                addressLink.textContent = data.bname + " ";
		                // Create a new location icon element
		                const locationIcon = document.createElement("i");
		                locationIcon.classList.add("fa-solid", "fa-location-dot");
		                // Append the location icon element to the link
		                addressLink.appendChild(locationIcon);
		                
		                // Send an Ajax request to store the value of data.bname
		                $.ajax({
		                  url: '/main',
		                  type: 'POST',
		                  data : jsondongInfo,
		                  contentType: "application/json; charset=utf-8",
		                  dataType: 'json',// 추가 
		                  success: function(data) {
		                    console.log('Successfully stored bname: ' + data);
		                  },
		                  error: function() {
		                    console.error('Failed to store bname.');
		                  }
		                });//ajax
		            } 
		        }).open();
		    } //sample6_execDaumPostcode()
		    </script>
        </header>