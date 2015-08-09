<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
	<meta charset="UTF-8">
    <title>投递更改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="http://s.ebaoyang.cn/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
	 <script type="text/javascript" src="http://s.ebaoyang.cn/custom-service/My97DatePicker/WdatePicker.js"></script>
	<style>
		
		body, div, p, span, td, li {font-size: 34px;padding: 0;margin: 0;}
		.wrapDiv{width:600px;margin:35px auto;text-align:center;}
		form{margin-bottom: 15px}
		.borderTable{border-collapse:collapse;}
		.borderTable th{background:#a2eade}
		.borderTable td,.borderTable th{padding:3px;border:1px solid #000;font-size: 14px;text-align:center;width:200px;}
	</style>
  </head>
  <script>
  		function newSend(even){
  			alert("sfds");
  		}
  		
  		function deteleSend(id){
  			
  		}
  </script>
  <body>
  	<div class="wrapDiv">
  		<h6></h6>
    	<table class="borderTable">
    		<tr>	<th>id:</th>	<td>${record.id}</td></tr>
    		<tr>	<th>公司名称:</th><td class="sel"><input type="text" value="${record.companyName}" name="companyName"></td>	</tr>
    		<tr>	<th>职位:</th><td class="sel"><input type="text" value="${record.position}" name="position"></td>	</tr>
    		<tr>	<th>招聘类型:</th><td class="sel"><input type="text" value="${record.recruitType}" name="recruitType"></td>		</tr>
    		<tr>	<th>开始时间:</th><td class="sel"><input class="date readonly valid" name="startTime" id="dateTime" type="text"
                           value='${record.startTime}'
                           onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-%d'})"></td>		</tr>
    		<tr>	<th>结束时间:</th><td class="sel"><input class="date readonly valid" name="endTime" id="dateTime" type="text"
                           value='${record.endTime}'
                           onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-%d'})"></td>		</tr>
    		<tr>	<th>投递时间:</th><td class="sel"><input class="date readonly valid" name="sendTime" id="dateTime" type="text"
                           value='${record.sendTime}'
                           onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-%d'})"></td>		</tr>
    		<tr>	<th>链接:</th><td class="sel"><input type="text" value="${record.url}" name="url"></td>		</tr>
    		<tr>	<th>备注:</th><td class="sel"><input type="text" value="${record.remark}" name="remark"></td>		</tr>
			<tr><td colspan="2"><input type="submit" value="提交" id="update"></td></tr>
    	</table>
    </div>
    <script>
    	$(function(){ 
		　　$("#update").click(function(){		
				var companyName=$(".sel input[name='companyName']").val();
				var recruitType=$(".sel input[name='recruitType']").val();
				var startTime=$(".sel input[name='startTime']").val();
				var endTime=$(".sel input[name='endTime']").val();
				var process=$(".sel input[name='process']").val();
				var url=$(".sel input[name='url']").val();
				var remark=$(".sel input[name='remark']").val();
				var position=$(".sel input[name='position']").val();
				var sendTime=$(".sel input[name='sendTime']").val();
				var id=${record.id};
				$.ajax({
			      url: '/JobMemo/jobRecord/update.do',
			      type: 'post',
			      dataType: 'json',
			      data: {
			        "companyName":companyName,
			        "recruitType":recruitType,
			        "startTime":startTime,
			        "endTime":endTime,
			        "process":process,
			        "url":url,
			        "remark":remark,
			        "id":id,
			        "position":position,
			        "sendTime":sendTime
			      },
			      async : false,
			      success: function(result) {
			        if(result.code==0)
			        {
			         	alert("更新成功！");
			          window.opener.subRefreshSearch();
			          window.close();
			        }
			        else
			        {
			          alert(result.msg);
			        }
			      }
			    });
			});
		
		});
    	
    </script>
  </body>
</html>
