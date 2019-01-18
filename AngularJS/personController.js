
var app= angular.module("myApp",[]);
app.controller("personCtrl", function($scope){
  $scope.firstName="Raja";
  $scope.lastName="Kala";
  $scope.fullName= function () {
    return $scope.firstName+" and "+$scope.lastName;
  }
}

);

/*
angular.module('myApp', []).controller('personCtrl', function($scope) {
    $scope.firstName = "John",
    $scope.lastName = "Doe",
    $scope.fullName = function() {
        return $scope.firstName + " " + $scope.lastName;
    }
});
*/
