var currentUrl = window.location.href;

switch (true) {
  case currentUrl.indexOf("RegionBoard") !== -1:
    document.getElementById("region").classList.add("now");
    break;
  case currentUrl.indexOf("UsedBoard") !== -1:
    document.getElementById("used").classList.add("now");
    break;
  case currentUrl.indexOf("MateBoard") !== -1:
    document.getElementById("mate").classList.add("now");
    break;
  case currentUrl.indexOf("CrawlingBoard") !== -1:
    document.getElementById("crawling").classList.add("now");
    break;
  case currentUrl.indexOf("SaleBoard") !== -1:
    document.getElementById("sale").classList.add("now");
    break;
}


var sortBtn = document.getElementById('board_sort');

sortBtn.addEventListener('change', function(){
var selectedSort = sortBtn.value;
location = '/board/qna/list?sort=' + selectedSort;
});

