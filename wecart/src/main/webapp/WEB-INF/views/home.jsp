<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>WeCart</title>

    <script src="https://kit.fontawesome.com/a623128410.js" crossorigin="anonymous"></script>

    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Source+Sans+Pro:ital,wght@1,700&display=swap"
        rel="stylesheet">
        
      <link rel="stylesheet" href="../../resources/css/main/main.css">
    

</head>
<body>
    <c:choose>
        <c:when test="${not empty sessionScope['__AUTH__']}">
            <c:redirect url="/main" />
        </c:when>
    </c:choose>

	<jsp:include page="header_footer/home_header.jsp" flush="true" />
	
        <main>
            <!--*********************************************메인 내용은 여기부터*********************************************-->
            <div class="main_container">
                <div class="content">
                    당신의 장바구니가 더 가벼워집니다.<br>가장 합리적으로 소비하는 방법
                </div>
        
                <div class="adr_start">
                    <input class="adr" type="text" name="adr" placeholder="당신의 동네를 찾아주세요.">
                    <!-- <button class="start" type="button" onclick="addrPopUp()">start</button> -->
                    <input class="start" type="button" onclick="sample6_execDaumPostcode()" value="start">
                </div>
            </div>
            <!--*********************************************메인 내용은 여기까지*********************************************-->
        </main>
        
        <jsp:include page="header_footer/footer.jsp" flush="true" />
        
</body>
<!-- 카카오API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				document.querySelector(".adr").value = data.sigungu;
                
	            // Get the address link element
	            const addressLink = document.querySelector("#dong-info a");
	            // Update the link text with the new address value
	            addressLink.textContent = data.sigungu + " ";
	            // Create a new location icon element
	            const locationIcon = document.createElement("i");
	            locationIcon.classList.add("fa-solid", "fa-location-dot");
	            // Append the location icon element to the link
	            addressLink.appendChild(locationIcon);
            }
        }).open();
    }
</script>

</html>