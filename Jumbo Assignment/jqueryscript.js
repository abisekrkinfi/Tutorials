$(document).ready(function(){


  $("#closeCart").click(function (){

    $(".shopping-cart").slideUp(1000);
  });

  /*
  $(".showCart").click(function (){

    //alert("triggered");
    $(".shopping-cart").show();
  });
  */
  $(".showCart").click(function (){


    $(".shopping-cart").slideDown(1000);

  });


});
