<!DOCTYPE html>
<html>
<title>L.ISTEN</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.myLink {display: none}
</style>
<body class="w3-light-grey">

<!-- Navigation Bar -->
<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
<a href="${pageContext.request.contextPath}/home.do" class="w3-bar-item w3-button w3-text-red w3-hover-red"><img alt="" src="${pageContext.request.contextPath}/resources/img/l_logo.jpg" style="width: 50px;height: 50px;"></a>
  <a href="#" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey"><i class="glyphicon glyphicon-user"></i></a>
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-hide-small" style="max-width:1500px">

</header>

<!-- Page content -->
<div class="w3-content" style="max-width:1100px;">



  <div class="w3-container row" style="margin-top: 200px">
    <div class="col-sm-6 w3-panel w3-padding-16 w3-red w3-opacity w3-card w3-hover-opacity-off" >
      <h1 style="font-weight: bold;">L.ISTEN</h1>
      <p>Sign in the L.ISTEN.</p>
      <form id="" action="login.do" method="post">
      <label>ID</label>
      <input class="w3-input w3-border" name="userId"type="text" placeholder="Your ID">
      <label>PASSWORD</label>
      <input class="w3-input w3-border"  name="passWord" type="password" placeholder="Your Password">
      <button type="submit" class="w3-button w3-black w3-margin-top">Sign in</button>
      </form>
    </div>
  </div>
  
 
  
<!-- End page content -->
</div>

<!-- Footer -->
<footer class="w3-container w3-center w3-opacity w3-margin-bottom" style="margin-top: 300px;">
  <h5>L.FLG Administration Service</h5>
  <div class="w3-xlarge w3-padding-16">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>



</body>
</html>
