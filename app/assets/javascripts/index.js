$( document ).ready(function() {
  console.log("hello");
  for(let i = 0; i < 6; i++){
    $( `div .${i} input`).click(function () {
      if(this.checked == false){
        $(`div .${i} .outline-lego${i}`).removeClass("hidden");
        $(`div .${i} .coloured-lego${i}`).addClass("hidden")
      } else {
        $(`div .${i} .outline-lego${i}`).addClass("hidden");
        $(`div .${i} .coloured-lego${i}`).removeClass("hidden")
      }
    })
  }
});
