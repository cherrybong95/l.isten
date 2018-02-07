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



<body class="w3-light-grey">
<!-- Navigation Bar -->
<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
  <a href="${pageContext.request.contextPath}/main.do" class="w3-bar-item w3-button w3-text-red w3-hover-red"><img alt="" src="${pageContext.request.contextPath}/resources/img/l_logo.jpg" style="width: 50px;height: 50px;"></a>
  <a href="${pageContext.request.contextPath}/logout.do" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey"style="margin-right: 20px;margin-top: 10px;"><i class="glyphicon glyphicon-user"></i></a></div>

<!-- Header -->
<header class="w3-display-container w3-content w3-hide-small" style="max-width:1500px">
<style>
canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
</style>
</header>
 


<div class="w3-row" style="margin-top: 100px;margin-bottom: 200px;">
<div class="w3-center" style="margin-bottom: 100px;"><h1 style="font-size: 50">${param.item} &nbsp;
 <c:choose>
<c:when test="${param.type=='flavor'}">맛 평가
<script>
	var color = Chart.helpers.color;
	var barChartDataP = {
		labels: [<c:forEach items="${requestScope.map.pList}" var="list" varStatus="status">
				  '${list.key}'
				<c:if test="${not status.last}">,</c:if>
 			</c:forEach>
				],
		datasets: [{
			label: '긍정적 표현',
			fontSize: 18,
			backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
			borderColor: window.chartColors.red,
			borderWidth: 1,
			data: [
				  <c:forEach items="${requestScope.map.pList}" var="list" varStatus="status">
     				  ${list.value}
     				<c:if test="${not status.last}">,</c:if>
      			</c:forEach>
				
				]
		}, ]

	};
	var barChartDataN = {
			labels: [
				<c:forEach items="${requestScope.map.nList}" var="list" varStatus="status">
				'${list.key}'
				<c:if test="${not status.last}">,</c:if>
			</c:forEach>
				
					],
			datasets: [{
				label: '부정적 표현',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					<c:forEach items="${requestScope.map.nList}" var="list" varStatus="status">
    				  ${list.value}
    				<c:if test="${not status.last}">,</c:if>
     			</c:forEach>
						]
			}, ]

		};


	window.onload = function() {
		var ctx = document.getElementById('chart-area-p').getContext('2d');
		window.myBar = new Chart(ctx, {
			type: 'bar',
			data: barChartDataP,
			options: {
				  scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        },
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '긍정적인 의견',
					fontSize: 22
				}
			}
		});
		
		 var ctx = document.getElementById('chart-area-n').getContext('2d');
		window.myBar = new Chart(ctx, {
			type: 'bar',
			data: barChartDataN,
			options: {
				  scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        },
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '부정적인 의견',
					fontSize: 22
				}
			}
		});  

	};

    </script>

</c:when>
<c:when test="${param.type=='price'}">가격 평가
<script>
	var color = Chart.helpers.color;
	var barChartDataP = {
		labels: [
			<c:forEach items="${requestScope.map.pList}" var="list" varStatus="status">
			  '${list.key}'
			<c:if test="${not status.last}">,</c:if>
		</c:forEach>
				],
		datasets: [{
			label: '긍정적 표현',
			backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
			borderColor: window.chartColors.red,
			borderWidth: 1,
			data: [
				
				 <c:forEach items="${requestScope.map.pList}" var="list" varStatus="status">
				  ${list.value} 
				<c:if test="${not status.last}">,</c:if>
 			</c:forEach>
				
					]
		}, ]

	};
	var barChartDataN = {
			labels: [
				<c:forEach items="${requestScope.map.nList}" var="list" varStatus="status">
				  '${list.key}'
				<c:if test="${not status.last}">,</c:if>
			</c:forEach>
					],
			datasets: [{
				label: '부정적 표현',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					<c:forEach items="${requestScope.map.nList}" var="list" varStatus="status">
					  ${list.value}
					<c:if test="${not status.last}">,</c:if>
				</c:forEach>
			]
			}, ]

		};


	window.onload = function() {
		var ctx = document.getElementById('chart-area-p').getContext('2d');
		window.myBar = new Chart(ctx, {
			type: 'bar',
			data: barChartDataP,
			options: {
				 scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        },
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '긍정적인 의견',
					fontSize: 22
				}
			}
		});
		
		var ctx = document.getElementById('chart-area-n').getContext('2d');
		window.myBar = new Chart(ctx, {
			type: 'bar',
			data: barChartDataN,
			options: {
				 scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        },
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '부정적인 의견',
					fontSize: 22
				}
			}
		});

	};

    </script>
</c:when>
<c:when test="${param.type=='design'}">디자인 평가
<script>
	var color = Chart.helpers.color;
	
	var barChartDataP = {
			labels: [
				
				<c:forEach items="${requestScope.map.pList}" var="list" varStatus="status">
				  '${list.key}'
				<c:if test="${not status.last}">,</c:if>
			</c:forEach>
				],
			datasets: [{
				label: '긍정적 표현',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					<c:forEach items="${requestScope.map.pList}" var="list" varStatus="status">
					  ${list.value}
					<c:if test="${not status.last}">,</c:if>
				</c:forEach>
					
					
						]
			}, ]

		};
	var barChartDataN = {
			labels: [ 
				<c:forEach items="${requestScope.map.nList}" var="list" varStatus="status">
				  '${list.key}'
				<c:if test="${not status.last}">,</c:if>
			</c:forEach>
				
					],
			datasets: [{
				label: '부정적 표현',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					<c:forEach items="${requestScope.map.nList}" var="list" varStatus="status">
					  ${list.value}
					<c:if test="${not status.last}">,</c:if>
				</c:forEach>
					
					
						]
			}, ]

		};


	window.onload = function() {
		var ctx = document.getElementById('chart-area-p').getContext('2d');
		window.myBar = new Chart(ctx, {
			type: 'bar',
			data: barChartDataP,
			options: {
				 scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        },
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '긍정적인 의견',
					fontSize: 22
				}
			}
		});
		
		var ctx = document.getElementById('chart-area-n').getContext('2d');
		window.myBar = new Chart(ctx, {
			type: 'bar',
			data: barChartDataN,
			options: {
				 scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        },
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '부정적인 의견',
					fontSize: 22
				}
			}
		});

	};

    </script>

</c:when>

</c:choose></h1></div>


				
<div class="content w3-half" > 

 
<div id="canvas-holder col-sm-4" style="margin: 20px;">
       <canvas id="chart-area-p" ></canvas>
    </div>
</div>
  <div class="content w3-half" > 
  <div id="canvas-holder col-sm-4" style="margin: 20px;">
         <canvas id="chart-area-n"></canvas>
    </div>
  </div>
  
</div>




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
