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

<body data-type="login" class="theme-black" ng-app="myApp" ng-controller="loginCtr">
  <div class="am-g tpl-g">
    <div class="tpl-login">
      <div class="tpl-login-content">
        <div class="tpl-login-logo" ></div>
        
        <form class="am-form tpl-form-line-form">
          <div class="error-style" ng-show="errorFlg">
            {{error}}
          </div>
          
          <div class="am-form-group">
            <input type="text" name="userId" placeholder="请输入用户ID" ng-model="userId">
          </div>

          <div class="am-form-group">
            <input type="password" name="pwd" placeholder="请输入密码" ng-model="pwd">
          </div>
          
          <div class="am-form-group tpl-login-remember-me">
            <input name="remember-me" type="checkbox">
            <label for="remember-me">记住密码</label>
          </div>

          <div class="am-form-group">
            <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success tpl-login-btn am-btn-block"
              ng-click="doLogin()">登录</button>
            <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success tpl-login-btn am-btn-block"
              ng-click="goRegist()">注册</button>
          </div>
        </form>
      </div>
    </div>
  </div>

<script>
var app = angular.module('myApp', []);
app.controller('loginCtr', function($scope, $http){
	$scope.doLogin = function() {
		$http.post("<%=request.getContextPath()%>/doLogin?userId="+$scope.userId+"&pwd="+$scope.pwd)
				.then(function(response){
					if(response.data.employerId != null) {
						window.location = "<%=request.getContextPath()%>/employer/employee";
					} else {
						$scope.errorFlg = true;
						$scope.error = "用户不存在或密码有误！";
					}
				});
    };
    $scope.goRegist = function() {
    	window.location = "<%=request.getContextPath()%>/goRegist";
    }
});
</script>

</body>
</html>