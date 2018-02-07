  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>L.FLG</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/Chart.bundle.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/utils.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.myLink {display: none}
</style>
<script type="text/javascript">
<c:if test="${empty sessionScope.user}">
	 location.href="${pageContext.request.contextPath}/home.do";
	</c:if>
</script>
<script type="text/javascript">
 function timedRefresh(timeoutPeriod) {
	setTimeout("location.reload(true);",timeoutPeriod);
}

window.onload = timedRefresh(7000); 
</script>



<body class="w3-light-grey">
<!-- Navigation Bar -->
<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
  <a href="${pageContext.request.contextPath}/main.do" class="w3-bar-item w3-button w3-text-red w3-hover-red"><img alt="" src="${pageContext.request.contextPath}/resources/img/l_logo.jpg" style="width: 50px;height: 50px;"></a>
  <a href="${pageContext.request.contextPath}/logout.do" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey"style="margin-right: 20px;margin-top: 10px;"><i class="glyphicon glyphicon-user"></i></a></div>

<!-- Header -->
<header class="w3-display-container w3-content w3-hide-small" style="max-width:1500px">

</header>
 <script>
    var randomScalingFactor = function() {
        return Math.round(Math.random() * 100);
    };

    var configd = {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [
                        ${requestScope.graph.design},
                        100-${requestScope.graph.design},
                    ],
                    backgroundColor: [
                        window.chartColors.blue,
                        window.chartColors.red,
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                	 "긍정적",
                     "부정적"
                ]
            },
            options: {
            	
            	responsive: true,
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: "디자인 평가",
                    fontSize:20
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        };
    var configf = {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [
                    	 ${requestScope.graph.flavor},
                         100-${requestScope.graph.flavor},
                    ],
                    backgroundColor: [
                        window.chartColors.blue,
                        window.chartColors.red,
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                	 "긍정적",
                     "부정적"
                ]
            },
            options: {
            	
            	responsive: true,
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: "맛 평가",
                    fontSize:20
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        };

    var configp = {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [
                    	 ${requestScope.graph.price},
                         100-${requestScope.graph.price},
                    ],
                    backgroundColor: [
                        window.chartColors.blue,
                        window.chartColors.red,
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                	 "긍정적",
                     "부정적"
                ]
            },
            options: {
            	responsive: true,
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: "가격 평가",
                    fontSize:20
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        };


    window.onload = function() {
        
       
        var ctxp = document.getElementById("chart-area-p").getContext("2d");
        window.myDoughnut = new Chart(ctxp, configp);
        var ctxd = document.getElementById("chart-area-d").getContext("2d");
        window.myDoughnut = new Chart(ctxd, configd);
        var ctxf = document.getElementById("chart-area-f").getContext("2d");
        window.myDoughnut = new Chart(ctxf, configf);
        
    };

   	

    </script>
<script type="text/javascript">

function godetailF(){
	location.href="detail.do?item=${param.item}&&type=flavor";
} 
function godetailP(){
	location.href="detail.do?item=${param.item}&&type=price";
} 
function godetailD(){
	location.href="detail.do?item=${param.item}&&type=design";
} 

</script>
<h1 class="w3-center" style="margin-top: 100px;"><b>${param.item} 평가내용</b></h1>
<div class="w3-row" style="margin-top: 200px;margin-bottom: 200px;">

<div class="content w3-third"> 
 
<div id="canvas-holder col-sm-6" >
       <canvas id="chart-area-f" onclick="godetailF()"></canvas>
    </div>
</div>
  <div class="content w3-third"> 
  <div id="canvas-holder col-sm-6" >
         <canvas id="chart-area-p"onclick="godetailP()"></canvas>
    </div>
  </div>
  <div class="content w3-third">
  <div id="canvas-holder col-sm-6" >
          <canvas id="chart-area-d"onclick="godetailD()"></canvas>
    </div>
   </div>

</div>

<b>${requestScope.graph}</b>


<!-- Footer -->
<footer class="w3-container w3-center w3-opacity w3-margin-bottom" style="background-color: white">
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
