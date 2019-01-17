
function launch(){

  //alert("coming inside");
  var op1=document.getElementById("op1").value;
  //alert(op1);
  var op2=document.getElementById("op2").value;
  var ans= Math.pow(op1,op2);
  //alert(ans);
  document.getElementById("para").innerHTML="The answer is : "+ans;

  var x="some value";
  alert ( typeof(x))

  x=undefined;
  alert ( typeof(x))
}
