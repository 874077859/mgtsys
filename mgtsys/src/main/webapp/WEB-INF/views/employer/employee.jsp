<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>vip home system</title>
<meta name="description" content="欢迎使用vip之家系统">
<meta name="keywords" content="vip">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/resources/img/favicon.png">
<link rel="apple-touch-icon-precomposed" href="<%=request.getContextPath()%>/resources/img/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="vip home system" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/app.css">
<script src="<%=request.getContextPath()%>/resources/js/common/echarts.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common/angular.min.js"></script>
</head>

<body data-type="login" class="theme-black">
<div ng-app="myApp" ng-controller="loginCtr">
  <p ng-style="{color:'white'}">welcom {{userName}} !!!</p>
</div>

<script>
var app = angular.module('myApp', []);
app.controller('loginCtr', function($scope, $http){
	$http.get("<%=request.getContextPath()%>/employer/getEmployeeInfo")
	        .then(function(response){
				$scope.userName = response.data.usrNm;
			});
});
</script>

</body>
</html>