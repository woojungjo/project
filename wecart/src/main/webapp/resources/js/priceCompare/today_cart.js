window.onload = function () {
    let member_id = $('input[name=member_id]').val();

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
                    minusBt.style.backgroundImage = "url(../resources/imgs/priceCompare/minus-xs-svgrepo-gray.svg)";
                } else {
                    minusBt.style.backgroundImage = "url(../resources/imgs/priceCompare/minus-xs-svgrepo-black.svg)";
                } //if-else
            });
        } //minusImage


        function countAmount(member_id, goods_id, amount, callback, error) {
            console.log("countAmount() invoked...");
            console.log("amount:", amount);

            $.ajax({
                type : 'put',
                data : JSON.stringify({"amount" : amount}),
                contentType: "application/json",
                url : '/todayCart/modifyAmount/' + member_id + '/' + goods_id,
                success : function (modifyResult) {
                    if(callback) {
                        callback(modifyResult);
                    }
                },
                error : function(xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        } //amountPlus

        return {
            totalPrice : totalPrice,
            minusImage : minusImage,
            countAmount : countAmount
        }
    })();

    //첫화면 토탈 & minus 이미지
    count.totalPrice();
    count.minusImage();

    //플러스버튼 -> 수량 1 증가
    var plusBts = document.querySelectorAll(".count_plus_bt");

    var plus = function (e) {
        console.log('plus invoked...');

        let amount = parseInt($(this).prev('.amount_div').text());
        amount++;
        console.log("amount:", amount);

        var index = Array.from(plusBts).indexOf(e.currentTarget);

        const priceTRs = document.querySelectorAll(".goods_price_tr");
        const priceSpans = priceTRs[index].querySelectorAll(".goods_price");

        priceSpans.forEach((span) => {
            const intialPrice = parseInt(span.dataset.price);
            
            const calPrice = intialPrice * amount;
            console.log("calPrice: ", calPrice);

            span.textContent = calPrice.toLocaleString();
        });

        const amountDiv = $(this).prev('.amount_div');
        amountDiv.text(amount);

        if (amount >= 2) {
            const minusBt = $(this).siblings(".count_minus_plus_bt.count_minus_bt");
            console.log("minusBt:", minusBt);
            minusBt.css('background-image', 'url(../resources/imgs/priceCompare/minus-xs-svgrepo-black.svg)');
        } //if

        //합계 구하기
        count.totalPrice();

        let goods_id = $(this).closest('tr').data('goods_id');

        //ajax
        count.countAmount(member_id, goods_id, amount, function(modifyResult) {
            console.log("amount plus update completed.");
        });
    };  //plus

    plusBts.forEach((bt) => {
        bt.addEventListener('click', plus);
    });

    //마이너스버튼 -> 수량 1 감소
    var minusBts = document.querySelectorAll(".count_minus_bt");

    var minus = function (e) {
        console.log('minus invoked...');

        var index = Array.from(minusBts).indexOf(e.currentTarget);

        let amount = parseInt($(this).next('.amount_div').text());
        if(amount > 1) amount--;
        console.log("amount:", amount);

        const priceTRs = document.querySelectorAll(".goods_price_tr");
        const priceSpans = priceTRs[index].querySelectorAll(".goods_price");

        priceSpans.forEach((span) => {
            const intialPrice = parseInt(span.dataset.price);
            
            const calPrice = intialPrice * amount;
            console.log("calPrice: ", calPrice);

            span.textContent = calPrice.toLocaleString();
        });

        const amountDiv = $(this).next('.amount_div');
        amountDiv.text(amount);

        if (amount == 1) {
            const minusBt = $(this);
            console.log("minusBt:", minusBt);

            minusBt.css('background-image', 'url(../resources/imgs/priceCompare/minus-xs-svgrepo-gray.svg)');
        } //if

        //합계 구하기
        count.totalPrice();

        let goods_id = $(this).closest('tr').data('goods_id');

        //ajax
        count.countAmount(member_id, goods_id, amount, function(modifyResult) {
            console.log("amount minus update completed.");
        });
    }; //minus

    minusBts.forEach((bt) => {
        bt.addEventListener('click', minus);
    });
    
    //전체선택
    var allSelect = document.querySelector("#allSelect");

    if(allSelect.checked) {
        const checkBoxs = document.querySelectorAll(".cart_select");
        checkBoxs.forEach((checkBox) => {
            checkBox.checked = true;
        });
    } //if
    
    allSelect.addEventListener('change', function () {
        if(allSelect.checked) {
            const checkBoxs = document.querySelectorAll(".cart_select");
            checkBoxs.forEach((checkBox) => {
                checkBox.checked = true;
            });
        } else {
            const checkBoxs = document.querySelectorAll(".cart_select");
            checkBoxs.forEach((checkBox) => {
                checkBox.checked = false;
            });
        } //if-else
    });    

    //선택삭제
    let removeGoods = (function () {
        //상품개별삭제
        function removeOne(member_id, goods_id, callback, error) {
            console.log('removeOne invoked...');

            $.ajax({
                type : 'delete',
                url : '/todayCart/remove/' + member_id + '/' + goods_id,
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
        } //removeOne

        //상품선택삭제
        function removeSelect(member_id, goodsIdArr, callback, error) {
            console.log('removeSelect invoked...');

            $.ajax({
                type : 'delete',
                data : JSON.stringify({"goodsIdArr": goodsIdArr}),
                contentType: "application/json",
                url : '/todayCart/remove/' + member_id,
                success : function (removeCheckedResult) {
                    if(callback) {
                        callback(removeCheckedResult);
                    }
                },
                error : function(xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        } //removeSelect

        return {
            removeOne : removeOne,
            removeSelect : removeSelect
        }
    })();   //removeGoods

    

    const checkBoxs = document.querySelectorAll(".cart_select");

    function checked() {
        console.log("checked() invoked...");
        
        let goodsIdArr = new Array();

        checkBoxs.forEach((checkBox) => {
            if(checkBox.checked === true) {
                let goods_id = checkBox.closest('tr').dataset.goods_id;
                goodsIdArr.push(goods_id);
            } //if
        }); //.forEach

        console.log("goodsIdArr:", goodsIdArr);

        return goodsIdArr;
    } //checked

    //상품 선택 삭제
    var allDelete = document.querySelector("#allDeletebt");

    allDelete.addEventListener('click', function () {      
        // allSelect.checked = false;

        // const checkBoxs = document.querySelectorAll(".cart_select");
        // checkBoxs.forEach((checkBox) => {
        //     checkBox.checked = false;
        // });

        if(confirm('삭제하시겠습니까?')) {
            const goodsIdArr = checked();
            console.log("goodsIdArr:", goodsIdArr);

            removeGoods.removeSelect(member_id, goodsIdArr, function (removeCheckedResult) {
                alert('선택된 상품이 삭제되었습니다.');

                checkBoxs.forEach((checkBox) => {
                    if(checkBox.checked === true) {
                        let goods_id = checkBox.closest('tr').dataset.goods_id
                        $('tr.goods_price_tr[data-goods_id="' + goods_id + '"]').remove();
                    } //if
                }); //.forEach
            })
        } //if

        //합계 구하기
        count.totalPrice();
    }); //.click    

    //상품 개별 삭제
    var deleteBts = document.querySelectorAll(".delete_bt");
    var deleteOne = function (e) {
        if(confirm('삭제하시겠습니까?')) {
            let goods_id = $(this).closest('tr').data('goods_id');
            console.log('goods_id:', goods_id);

            removeGoods.removeOne(member_id, goods_id, function (removeResult) {
                alert('상품이 삭제되었습니다.');

                $('tr.goods_price_tr[data-goods_id="' + goods_id + '"]').remove();
            });
        } //if  
        
        //합계 구하기
        count.totalPrice();
    };

    deleteBts.forEach((bt) => {
        bt.addEventListener('click', deleteOne)
    });
    
    //찜한상품, 장바구니 버튼 이동
    var mypickGoods = document.querySelector(".mypick_goods");
    mypickGoods.addEventListener('click', () => {
        location.href = "/mypage/cart/wishedPrds";
    });

    var mypickCart = document.querySelector(".mypick_cart");
    mypickCart.addEventListener('click', function (e) {
        console.log(e.target);
        location = "/todayCart/cartList";
    });
};