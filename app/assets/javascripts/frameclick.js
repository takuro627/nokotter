function DivFrameClick() {
  var idValue = document.querySelector('.main__tweet__content').id;
  
  document.location.href = `/tweets/${idValue}` ;

}