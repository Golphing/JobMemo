<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
	<meta charset="UTF-8">
    <title>PDF格式小工具</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <script src="http://s.ebaoyang.cn/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
	<style>
		div{
			width:70%;
			margin:auto;
			
		}
		#content{
			
			width:70%;
			
		}
	</style>

  </head>
  
  <body>
    	<div>
    		<form action="/JobMemo/wang/utils/strTrim.do" method="post">
    			<textarea rows="20" cols="120" name="str" >${str }</textarea>
    		
    	</div>
    	<div id="content">
    		${str1}
    	</div>
    	<div>
    		<input type="button" value="清空" onclick="clearContent();">
    		<input value="转换" type="submit"">
    		<input type='button' name="复制" value="复制" onclick="copyContent();">
    	</div>
    	</form>
  </body>
  <script>
  		function copyContent(){
  				var clipBoardContent = document.getElementById("content").innerHTML;
                if (window.clipboardData) {
                    window.clipboardData.setData("Text", clipBoardContent);
                    alert("已复制到剪切板！");
                }
                else {
                    alert("浏览器不支持！");
                }
  		
  		}
  		
  		function clearContent(){
  			$("textarea[name='str']").val("");
  			$("#content").html("");
  		}
  		
  </script>
</html>
