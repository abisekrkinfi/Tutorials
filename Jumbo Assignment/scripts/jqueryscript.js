$(document).ready(function(){



  $(".closeCart,.clickable").click(function (){


    $(".shopping-cart").hide();
    $(".item-details").css("filter","blur(0px)");
  });


  $(".showCart").click(function (){



    $(".shopping-cart").show();

    $(".item-details").css("filter","blur(5px)");
    $(".clickable").css("filter","blur(5px)");

  });


});
