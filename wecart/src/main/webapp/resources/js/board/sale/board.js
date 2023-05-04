var currentUrl = window.location.href;

switch (true) {
  case currentUrl.indexOf("mate") !== -1:
    document.getElementById("mate").classList.add("now");
    break;
  case currentUrl.indexOf("sale") !== -1:
    document.getElementById("sale").classList.add("now");
    break;
}


var sortBtn = document.getElementById('board_sort');

sortBtn.addEventListener('change', function(){
var selectedSort = sortBtn.value;
location = '/board/sale/list?sort=' + selectedSort;
});

