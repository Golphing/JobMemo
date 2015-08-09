<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
  <head>

    <title>登录</title>
	  <script src="http://s.ebaoyang.cn/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
	  <script type="text/javascript" src="http://s.ebaoyang.cn/custom-service/My97DatePicker/WdatePicker.js"></script>
	<style>
		body{}
		body, div, p, span, td, li {font-size: 34px;padding: 0;margin: 0;}
		.wrapDiv{width:550px;text-align:center;margin:0 auto;}
		form{margin-bottom: 15px}
		.borderTable{border-collapse:collapse;}
		.borderTable th{background:#a2eade}
		.borderTable td,.borderTable th{padding:2px;border:1px solid #000;font-size: 14px;text-align:center;}
		.redback:hover{background-color: red;}
	</style>
	
  </head>
 
  <body>
  	<div class="wrapDiv">
  		<h6>登录</h6>
  		<form action="/JobMemo/login1/logInn" method="post">
    	<table class="borderTable">
    		<tr>
    			<td>用户名：</td>
    			<td><input type="text" name="name"></td>
    		</tr>
    		<tr>
    			<td>密   码：</td>
    			<td><input type="text" name="password"></td>
    		</tr>
    		<tr>
    			<td><input type="button" value="注册" id="register"></td>
    			<td><input type="submit" value="登录"></td>
    		</tr>
    		<tr><td>${error}</td></tr>
    	</table>
    	</form>
    </div>

  </body>
</html>
