const buttons = document.querySelectorAll('.board_change input[type="button"]');
let activeButton = null;

buttons.forEach(function(button) {
  button.addEventListener('click', function() {
    if (activeButton !== null) {
      activeButton.style.color = '';
      activeButton.style.backgroundColor = '';
     
    }
    
    if (activeButton !== button) {
      button.style.color = 'white';
      button.style.backgroundColor = '#3f4945';
      activeButton = button;
    } else {
      activeButton = null;
    }
  });
});
