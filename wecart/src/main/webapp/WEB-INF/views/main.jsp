<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
	
</head>
<body>
	<jsp:include page="header_footer/main_header.jsp" flush="true" />
	
	
        <main>
            <!--*********************************************메인 내용은 여기부터*********************************************-->
            <div class="main_container">
                <div class="content">
                    당신의 장바구니가 더 가벼워집니다.<br>가장 합리적으로 소비하는 방법
                </div>
        
                <div class="adr_start">
                    <!--  input class="adr" type="text" name="adr" placeholder="당신의 동네를 입력해주세요."-->
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
            	
                // Create a JSON object with the bname value
                var dongInfo = {
                    'bname': data.bname
                };
                
                // Convert the JSON object to a string
                var jsondongInfo = JSON.stringify(dongInfo);
                console.log('jsondongInfo : ', jsondongInfo);

                // Update the input field value with the bname value
                document.querySelector(".adr").value = data.bname;

                // Get the address link element
                const addressLink = document.querySelector("#dong-info a");
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
    
                  /*
                  data: JSON.stringify({
                      'bname': data.bname
                    }),

                  data : jsondongInfo,
                  
                  data: {
                      'bname': data.bname
                    },
                    */
</script>

</html>