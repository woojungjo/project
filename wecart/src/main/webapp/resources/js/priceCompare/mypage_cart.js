window.onload = function () {
    let cart_id = $('input[name=cart_id]').val();
    let member_id = $('input[name=member_id]').val();
    let apiDate;
    let api_date = new Date($('#cartDate').val());

    //api_date 변경
    $('#cartDate').change(function () {
        apiDate = $('#cartDate').val();
        api_date = new Date(apiDate);
        console.log('api_date:', api_date);
    });

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

        function currentCompare(cart_id, member_id, api_date, callback, error) {
            console.log("currentCompare invoked...");
            console.log("api_date:", api_date);

            $.ajax({
                type : 'get',
                url : '/mypageCart/getCurrent/member/' + member_id + '/cart/' + cart_id + '/date/' + api_date,
                success : function (currentPrices) {
                    if(callback) {
                        console.log(currentPrices);
                        callback(currentPrices);
                    }
                },
                error : function (xhr, status, er) {
                    if(error) {
                        error(er);
                    }
                }
            });
        } //currentCompare

        return {
            totalPrice : totalPrice,
            minusImage : minusImage,
            removeCart : removeCart,
            currentCompare : currentCompare
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

    // //상품 개별 삭제(자바스크립트 상 삭제)
    // var deleteBts = document.querySelectorAll(".delete_bt");
    // var deleteOne = function (e) {      
    //     if(confirm('삭제하시겠습니까?')) {
    //         var tr = e.target.closest(".goods_price_tr");
    //         tr.remove();
    //     } //if 

    //     const totals = document.querySelectorAll(".total_price");
    //     totals.forEach((total) => {
    //         var tPrice = 0;
    //         var index = Array.from(totals).indexOf(total);

    //         const priceTRs = document.querySelectorAll(".goods_price_tr");
    //         console.log("index:", index);

    //         priceTRs.forEach((tr) => {
    //             const priceSpans = tr.querySelectorAll(".goods_price");
    //             tPrice += parseInt(priceSpans[index].textContent.replace(",", ""));
    //         });
            
    //         total.textContent = tPrice.toLocaleString();
    //     });
    // };

    // deleteBts.forEach((bt) => {
    //     bt.addEventListener('click', deleteOne)
    // });

	//장바구니 삭제 버튼 (DB 삭제)
	const cartRemoveBt = document.querySelector("#cart_remove_bt");
    cartRemoveBt.addEventListener('click', function () {
        if(confirm("장바구니를 삭제하시겠습니까?")) {
            count.removeCart(cart_id, function (removeResult) {
                alert(removeResult);

                window.location = "/mypage/cart/list";
            });
        } //if              
    });

    //장바구니 목록 버튼
    const cartListBt = document.querySelector("#cart_list_bt");
    cartListBt.addEventListener("click", function () {
       location = "/mypage/cart/list"; 
    });

    let compare = (function () {
        function currentList(currentPrices) {
            console.log("currentList invoked....");

            let priceTRs = document.querySelectorAll(".goods_price_tr");

            for (let i = 0; i < currentPrices.length; i++) {
                for (let j = 0; j < currentPrices[i].length; j++) {
                    let str = "";
                    let curDiv = priceTRs[i].querySelectorAll(".price_compare");
                    let amount = priceTRs[i].querySelector(".amount_div").textContent;
                    console.log("curDiv:", curDiv[j], "i:", i, "j:", j);
                    console.log("amount:", amount);

                    str += "<div class='curPrice'>";
                    str += "  <div class='curPrice_text'>현재가격</div>";
                    str += "  <div><span class='curPrice_number'>"+(currentPrices[i][j].price != null ? (currentPrices[i][j].price * amount).toLocaleString() : (currentPrices[i][j].avg_price * amount).toLocaleString())+"</span>";
                    str += "       <span>원</span></div>";
                    curDiv[j].innerHTML = str;
                    console.log("str:", str);
                } //inner for
            } //outer for
        } //currentList

        function comparePrice() {
            console.log('comparePrice invoked...');

            let priceTRs = document.querySelectorAll(".goods_price_tr");

            priceTRs.forEach((tr) => {
                let curPriceSpans = tr.querySelectorAll('.curPrice_number');
                let goodsPrices = tr.querySelectorAll('.goods_price');
                let curDivs = tr.querySelectorAll('.price_compare');

                for(let i = 0; i < curPriceSpans.length; i++) {
                    let str = "";
                    console.log("goodsPrices:", goodsPrices[i].textContent);
                    console.log("curPriceSpans:", curPriceSpans[i].textContent);
                    console.log("minus:", parseInt(curPriceSpans[i].textContent.replace(",", "")) - parseInt(goodsPrices[i].textContent.replace(",", "")));

                    if(parseInt(curPriceSpans[i].textContent.replace(",", "")) - parseInt(goodsPrices[i].textContent.replace(",", "")) >= 0) {
                        str += "    <div class='compare_pluszero'>+";
                    } else {
                        str += "    <div class='compare_minus'>";
                    } //if-else                    
                    str += parseInt(curPriceSpans[i].textContent.replace(",", "")) - parseInt(goodsPrices[i].textContent.replace(",", ""));
                    str += "    </div>";
                    
                    curDivs[i].innerHTML = str + curDivs[i].innerHTML;
                } //for

            });
        } //comparePrice

        function comparePriceTotal() {
            console.log("comparePriceTotal invoked...");

            const totals = document.querySelectorAll(".total_price");
            const priceTRs = document.querySelectorAll(".goods_price_tr");
            let curPriceArr = new Array();

            for(let i = 0; i < totals.length; i++) {
                let curTPrice = 0;

                priceTRs.forEach((tr) => {
                    let curPrices = tr.querySelectorAll('.curPrice_number');
                    curTPrice += parseInt(curPrices[i].textContent.replace(",", "")); 
                });

                curPriceArr.push(curTPrice);
            } //for

            console.log("curPriceArr:", curPriceArr);
            return curPriceArr;
        } //comparePriceTotal

        function curPriceTotalList(curPriceArr) {
            console.log("curPriceTotalList invoked...");

            let str = "";

            str += "<tr aria-label='현재 가격 합계' class='curPriceTR'>";
            str += "    <td colspan='2'>";
            str += "        <span>현재 가격 합계</span></td>";

            for(let i = 0; i < curPriceArr.length; i++) {
                str += "    <td>";
                str += "        <span class='curPrice_total'>" + curPriceArr[i].toLocaleString() + "</span>";
                str += "        <span>원</span>"
                str += "    </td>";
            } //for

            str += "</tr>";

            if(document.querySelector('.curPriceTR') == null) {
                document.querySelector("tfoot").innerHTML = document.querySelector("tfoot").innerHTML + str;
            } else {
                document.querySelector('.curPriceTR').remove();
                document.querySelector("tfoot").innerHTML = document.querySelector("tfoot").innerHTML + str;
            } //if-else
            
        } //curPriceTotalList

        function minusCur() {
            console.log("minusCur invoked...");

            let totalPrice = document.querySelectorAll(".total_price");
            let curTotal = document.querySelectorAll(".curPrice_total");
            let totalWon = document.querySelectorAll(".total_won");

            for(let i = 0; i < totalPrice.length; i++) {
                let str = "";
                let totalMinus = curTotal[i].textContent.replace(",", "") - totalPrice[i].textContent.replace(",", "");
                console.log("totalMinus:", totalMinus);

                if(totalMinus >= 0) {
                    str += "<div class='compare_pluszero total_compare'>+";
                } else {
                    str += "<div class='compare_minus total_compare'>";
                } //if-else
                
                str += totalMinus;
                str += "</div>";
                
                if(document.querySelectorAll('.total_compare')[i] == null) {
                    totalWon[i].insertAdjacentHTML('afterend', str);
                } else {
                    document.querySelectorAll('.total_compare')[i].remove();
                    totalWon[i].insertAdjacentHTML('afterend', str);
                } //if-else
            } //for
        } //minusCur

        return {
            currentList : currentList,
            comparePrice : comparePrice,
            comparePriceTotal : comparePriceTotal,
            curPriceTotalList : curPriceTotalList,
            minusCur : minusCur
        }

    })();

    
    //현재 가격 비교 버튼
    const currentPriceBt = document.querySelector("#current_price_bt");
    currentPriceBt.addEventListener('click', function () {
        count.currentCompare(cart_id, member_id, api_date, function (currentPrices) {
            console.log("api_date:", api_date);
            console.log('currentPrices:', currentPrices);
            compare.currentList(currentPrices);
            compare.comparePrice();
            const curPriceArr = compare.comparePriceTotal();
            compare.curPriceTotalList(curPriceArr);
            compare.minusCur();
        });
    });
};  //.onload







