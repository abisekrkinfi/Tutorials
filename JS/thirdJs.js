

function myFunction(){

  alert("linked")
  var Person={
    name: "RK",
    age:10,
    marks: 100,
    rank : 1,
    remarks: "Good",
    display: function(){

      return "Name: "+this.name+" and his age is "+this.age+ " and the remarks is : "+this.remarks;
    }
  };

  alert(Person.display());
}
