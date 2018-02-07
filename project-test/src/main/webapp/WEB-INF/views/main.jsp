  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>L.isten</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.myLink {display: none}
</style>
<script type="text/javascript">
<c:if test="${empty sessionScope.user}">
	 location.href="${pageContext.request.contextPath}/home.do";
	</c:if>
</script>



<body class="w3-light-grey">

<!-- Navigation Bar -->
<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
<a href="${pageContext.request.contextPath}/main.do" class="w3-bar-item w3-button w3-text-red w3-hover-red"><img alt="" src="${pageContext.request.contextPath}/resources/img/l_logo.jpg" style="width: 50px;height: 50px;"></a>
  <a href="${pageContext.request.contextPath}/logout.do" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey"style="margin-right: 20px;margin-top: 10px;"><i class="glyphicon glyphicon-user"></i></a>
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-hide-small" style="max-width:1500px">

</header>
 
<!-- Page content --> 
<h1 class="w3-center" style="margin-bottom: 50px;"><b style="background-color: red;color: white;">FLAGSHIP STORE 상품 리스트</b></h1>
<div class="cover">

<div style="margin-top:50px;" >

<div class="w3-row w3-center" style="max-width: 1300px; margin-left: 400px;"> 
<c:forEach items="${requestScope.productList}" var="list">
	<div class="w3-half">
	<div class="w3-one w3-center w3-opacity w3-card w3-hover-opacity-off" style="width:70%;margin-top:100px;margin-bottom:30px;background-color: white">
		<a href="${pageContext.request.contextPath}/graph.do?item=${list}"><img src="${pageContext.request.contextPath}/resources/img/${list}.jpg"></a>
	</div>
</div> 
</c:forEach>
  
  
<!-- End page content -->
</div>
<!-- <div style="margin-top:200px;margin-bottom: 0px;"></div> -->
<footer class="w3-container w3-center w3-opacity w3-margin-bottom" style="margin-top:100px; background-color: white">
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
