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

<body data-type="employerInfo" class="theme-black" ng-app="myApp" ng-controller="employerInfoCtr">
  <div class="am-g tpl-g">
    <div class="tpl-login">
      <div class="tpl-login-content">
        <div class="tpl-login-title">信息完善</div>
        <span class="tpl-login-content-info">完善商家的详细信息</span>

        <form class="am-form tpl-form-line-form" name="registForm">
          <div class="am-form-group">
            <input type="text" name="userName" placeholder="请输入店名" ng-model="userName" required>
          </div>

          <div class="am-form-group">
            <input type="text" name="userTel" placeholder="请输入联系电话" ng-model="userTel" required>
          </div>

          <div class="am-form-group">
            <input type="text" name="userAddress" placeholder="请输入联系地址" ng-model="userAddress" required>
          </div>

          <div class="am-form-group">
            <button type="button" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn am-btn-block"
            ng-click="doCommit()">提交</button>
            <button type="button" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn am-btn-block"
            ng-click="doBack()">返回</button>
          </div>
        </form>
      </div>
    </div>
  </div>

<script>
var app = angular.module('myApp', []);
app.controller('employerInfoCtr', function($scope, $http){
	$scope.doBack = function() {
		window.location = "<%=request.getContextPath()%>";
    };
    $scope.doCommit = function() {
    	var data = {employerName:$scope.userName, employerTel:$scope.userTel, employerAddress:$scope.userAddress};
    	$http.post("<%=request.getContextPath()%>/employer/doCommit", data)
    	    .then(function(response){
    		    window.location = "<%=request.getContextPath()%>/employer/addEmployee";
    	    });
    };
});
</script>

</body>
</html>