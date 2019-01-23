
var app= angular.module("myApp",[]);
app.controller("myCtrl", function($scope){

    $scope.phoneDetails=[
      {img:"j7prime.jpg"  ,model:"J7 prime",brand:"samsung",price:15000,count:0},
      {img:"motog5.jpg" ,model:"G5 turbo",brand:"Moto",price:16000,count:0},
      {img:"motog3.jpg" ,model:"G3 turbo",brand:"Moto",price:16000,count:0}
    ];

    $scope.cartItems=[];
    $scope.count=0;
    $scope.item="";
    $scope.cartLength=0;
    $scope.showToggle=true;
    $scope.totalCost=0;


    $scope.updateCost= function updateCost(){

      var i;
      $scope.totalCost=0;
      for(i=0;i<$scope.cartItems.length;++i){

        $scope.totalCost+= $scope.cartItems[i].count* $scope.cartItems[i].price;
      }
    }
    $scope.alreadyPresent=function alreadyPresent(phoneModel){

      var i;
      for(i=0;i< $scope.cartItems.length;++i){
        var toCheck= $scope.cartItems[i].model;
        //alert("p: "+phoneModel+" checK: "+toCheck);
        if(phoneModel==toCheck   ){
          $scope.cartIndex=i;
          return true;
        }
      }

      return false;
    }


    $scope.changeView= function changeView(){
      $scope.showToggle= !$scope.showToggle;
    }

    $scope.increaseCount=function increaseCount(index){
      //alert(index);
      $scope.cartItems[index].count+=1;
      //$scope.checkoutCount=$scope.cartItems[index].count;
      $scope.updateCost();
    }


    $scope.decreaseCount= function decreaseCount(index){

          //  alert(index);
        if( $scope.cartItems[index].count!=1){
                      $scope.cartItems[index].count-=1;
                      $scope.checkoutCount=$scope.cartItems[index].count;
        }
        $scope.updateCost();

    }

    $scope.removeItem= function removeItem(index){

      $scope.cartItems.splice(index,1);
      $scope.updateCost();
    }

    $scope.addToCart=function addToCart(index) {
      $scope.count+=1;
      $scope.item="You clicked"+ index +" item";

      //$scope.cartItems.push($scope.phoneDetails[index]);
      //alert($scope.cartItems.length);
      $scope.cartLength=$scope.cartItems.length;
      //$scope.cartItems[ $scope.cartItems.length ]= $scope.phoneDetails[index];
      //$scope.cartItems.push({});
      //alert($scope.phoneDetails[index].model);
      //$scope.cartLength=count;

      $scope.cartIndex;
      if($scope.alreadyPresent($scope.phoneDetails[index].model)){

        $scope.cartItems[$scope.cartIndex].count+=1;

      }
      else{

        $scope.cartItems.push($scope.phoneDetails[index]);
        $scope.cartItems[$scope.cartItems.length-1].count=1;
      }

      $scope.updateCost();
    }
});
