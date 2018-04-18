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

<body data-type="regist" class="theme-black" ng-app="myApp" ng-controller="registCtr">
  <div ng-init="init()"></div>
  <div class="am-g tpl-g">
    <div class="tpl-login">
      <div class="tpl-login-content">
        <div class="tpl-login-title">注册用户</div>
        <span class="tpl-login-content-info">创建一个新的用户</span>

        <form class="am-form tpl-form-line-form" name="registForm">
          <div class="error-style" ng-show="errorFlg">
            <span ng-show="registForm.email.$error.required">
              	请输入邮箱！
            </span>
            <span ng-show="registForm.email.$error.email">
              	请输入正确的邮箱！
            </span>
            <span ng-show="userIdExist">
              	用户已存在请重新输入！
            </span>
          </div>
          <div class="am-form-group">
            <input type="email" name="email" placeholder="请输入邮箱" ng-model="email" required>
          </div>

          <div class="am-form-group">
            <input type="text" name="userId" placeholder="请输入用户ID" ng-model="userId" required>
          </div>

          <div class="am-form-group">
            <input type="password" name="pwd" placeholder="请输入密码" ng-model="pwd" required>
          </div>

          <div class="am-form-group">
            <input type="password" name="confirmPwd" placeholder="请再次输入密码" ng-model="confirmPwd" required>
          </div>

          <div class="am-form-group tpl-login-remember-me">
            <input name="agreement" type="checkbox" ng-model="agreement">
            <label for="agreement">我已阅读并同意 <a href="javascript:;" ng-click="goRegistProtocal()">《用户注册协议》</a></label>
          </div>

          <div class="am-form-group">
            <button type="button" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn am-btn-block"
            ng-click="doRegist()">注册</button>
            <button type="button" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn am-btn-block"
            ng-click="doBack()">返回</button>
          </div>
        </form>
      </div>
    </div>
  </div>

<script>
var app = angular.module('myApp', []);
app.controller('registCtr', function($scope, $http){
	$scope.doBack = function() {
		$http.post("<%=request.getContextPath()%>/regist/doBack")
		    .then(function(response){
		    	window.location = "<%=request.getContextPath()%>";
		    });
    };
    $scope.goRegistProtocal = function() {
    	var data = {userId:$scope.userId, email:$scope.email};
    	$http.post("<%=request.getContextPath()%>/regist/goRegistProtocal", data)
    	    .then(function(response){
    		    window.location = "<%=request.getContextPath()%>/regist/registProtocal";
    	    });
    };
    $scope.init = function() {
    	$http.post("<%=request.getContextPath()%>/regist/getRegistInfo")
	        .then(function(response){
		        $scope.email = response.data.email;
		        $scope.userId = response.data.userId;
		        $scope.agreement = (response.data.agreed == "0" ? true : false);
	        });
    };
    $scope.doRegist = function() {
    	$scope.errorFlg = false;
    	if(!$scope.registForm.$valid){
    		$scope.errorFlg = true;
    		return;
    	}
    	var data = {userId:$scope.userId, email:$scope.email, pwd:$scope.pwd};
    	$http.post("<%=request.getContextPath()%>/regist/doRegist", data)
    	    .then(function(response){
    	    	if(response.data == "1"){
    	    		$scope.errorFlg = true;
    	    		$scope.userIdExist = true;
    	    	} else {
    	    		window.location = "<%=request.getContextPath()%>/employer/employer";
    	    	}
    	    });
    }
});
</script>

</body>
</html>