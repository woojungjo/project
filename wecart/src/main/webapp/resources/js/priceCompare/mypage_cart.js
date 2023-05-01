window.onload = function () {
    let cart_id = $('input[name=cart_id]').val();

    //합계 구하기
    let count = (function () {
        function totalPrice() {
            console.log("totalPrice invoked...");

            const totals = document.querySelectorAll(".total_price");
            totals.forEach((total) => {
                var tPrice = 0;
                var index = Array.from(totals).indexOf(total);

                const priceTRs = document.querySelectorAll(".goods_price_tr");
                console.log("index:", index);

                priceTRs.forEach((tr) => {
                    const priceSpans = tr.querySelectorAll(".goods_price");
                    const amount = tr.querySelector(".amount_div").textContent;
                    console.log("amount:", amount);

                    priceSpans.forEach((span) => {
                        const intialPrice = parseInt(span.dataset.price);
            
                        const calPrice = intialPrice * amount;
                        console.log("calPrice: ", calPrice);

                        span.textContent = calPrice.toLocaleString();
                    });

                    tPrice += parseInt(priceSpans[index].textContent.replace(",", ""));
                });
                
                total.textContent = tPrice.toLocaleString();
            });
        } //totalPrice

        function minusImage() {
            console.log("minusImage() invoked...");

            const amountDiv = document.querySelectorAll(".amount_div");
            amountDiv.forEach((div) => {
                let minusBt = div.parentNode.querySelector('.count_minus_bt');
                console.log("minusBt:", minusBt);
                
                if(parseInt(div.textContent) == 1) {
                    minusBt.style.backgroundImage = "url(../../../resources/imgs/priceCompare/minus-xs-svgrepo-gray.svg)";
                } else {
                    minusBt.style.backgroundImage = "url(../../../resources/imgs/priceCompare/minus-xs-svgrepo-black.svg)";
                } //if-else
            });
        } //minusImage

        function removeCart(cart_id, callback, error) {
            console.log('removeCart invoked...');

            $.ajax({
                type : 'delete',
                url : '/mypageCart/remove/cart/' + cart_id,
                success : function(removeResult) {
                    if (callback) {
                        callback(removeResult);
                    }
                },
                error : function(xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        } //removeCart

        return {
            totalPrice : totalPrice,
            minusImage : minusImage,
            removeCart : removeCart
        }
    })();

    count.totalPrice();
    count.minusImage();




    //플러스버튼 -> 수량 1 증가
    var plusBts = document.querySelectorAll(".count_plus_bt");
    var counts = Array.from(plusBts).map(() => 1);  

    var plus = function (e) {
        var index = Array.from(plusBts).indexOf(e.currentTarget);

        counts[index]++;

        const priceTRs = document.querySelectorAll(".goods_price_tr");
        const priceSpans = priceTRs[index].querySelectorAll(".goods_price");

        priceSpans.forEach((span) => {
            const intialPrice = parseInt(span.dataset.price);
            
            const calPrice = intialPrice * counts[index];
            console.log("calPrice: ", calPrice);

            span.textContent = calPrice.toLocaleString();
        });

        const amountDiv = document.querySelectorAll(".amount_div");
        amountDiv[index].textContent = `${counts[index]}`;

        if (counts[index] >= 2) {
            const minusBt = document.querySelectorAll(".count_minus_bt")[index];
            minusBt.style.backgroundImage = "url(../../../resources/imgs/priceCompare/minus-xs-svgrepo-black.svg)";
        }

        count.totalPrice();
    };  //plus

    plusBts.forEach((bt) => {
        bt.addEventListener('click', plus);
    });

    //마이너스버튼 -> 수량 1 감소
    var minusBts = document.querySelectorAll(".count_minus_bt");

    var minus = function (e) {
        console.log(e.target);
        var index = Array.from(minusBts).indexOf(e.currentTarget);

        if(counts[index] > 1) counts[index]--;

        const priceTRs = document.querySelectorAll(".goods_price_tr");
        const priceSpans = priceTRs[index].querySelectorAll(".goods_price");

        priceSpans.forEach((span) => {
            const intialPrice = parseInt(span.dataset.price);
            
            const calPrice = intialPrice * counts[index];
            console.log("calPrice: ", calPrice);

            span.textContent = calPrice.toLocaleString();
        });

        const amountDiv = document.querySelectorAll(".amount_div");
        amountDiv[index].textContent = `${counts[index]}`;

        if (counts[index] == 1) {
            e.currentTarget.style.backgroundImage = "url(/resources/imgs/priceCompare/minus-xs-svgrepo-gray.svg)";
        }

        count.totalPrice();
    }; //minus

    minusBts.forEach((bt) => {
        bt.addEventListener('click', minus);
    });

    //상품 개별 삭제(자바스크립트 상 삭제)
    var deleteBts = document.querySelectorAll(".delete_bt");
    var deleteOne = function (e) {      
        if(confirm('삭제하시겠습니까?')) {
            var tr = e.target.closest(".goods_price_tr");
            tr.remove();
        } //if 

        const totals = document.querySelectorAll(".total_price");
        totals.forEach((total) => {
            var tPrice = 0;
            var index = Array.from(totals).indexOf(total);

            const priceTRs = document.querySelectorAll(".goods_price_tr");
            console.log("index:", index);

            priceTRs.forEach((tr) => {
                const priceSpans = tr.querySelectorAll(".goods_price");
                tPrice += parseInt(priceSpans[index].textContent.replace(",", ""));
            });
            
            total.textContent = tPrice.toLocaleString();
        });
    };

    deleteBts.forEach((bt) => {
        bt.addEventListener('click', deleteOne)
    });

	//장바구니 삭제 버튼 (DB 삭제)
	const cartRemoveBt = document.querySelector("#cart_remove_bt");
    cartRemoveBt.addEventListener('click', function () {
        if(confirm("장바구니를 삭제하시겠습니까?")) {
            count.removeCart(cart_id, function (removeResult) {
                alert(removeResult);

                window.location = "/mypage/cart/list";
            })
        } //if              
    });

    //장바구니 목록 버튼
    const cartListBt = document.querySelector("#cart_list_bt");
    cartListBt.addEventListener("click", function () {
       location = "/mypage/cart/list"; 
    });
};  //.onload







