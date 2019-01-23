$(document).ready(function(){


  $(".closeCart").click(function (){

    $(".shopping-cart").slideUp(1000);
    $(".item-details").css("filter","blur(0px)");
  });

  /*
  $(".showCart").click(function (){

    //alert("triggered");
    $(".shopping-cart").show();
  });
  */
  $(".showCart").click(function (){


    $(".shopping-cart").slideDown(1000);
    $(".item-details").css("filter","blur(5px)");

  });


});
