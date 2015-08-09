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
    <title>分享平台</title>
	  <script src="http://s.ebaoyang.cn/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
	  <script type="text/javascript" src="http://s.ebaoyang.cn/custom-service/My97DatePicker/WdatePicker.js"></script>
	<style>
		body, div, p, span, td, li {padding:0;margin:0;}
		.wrapDiv{text-align:center;margin-left:10px;margin-right:10px;table-layout: fixed;word-break: break-all;}
		.borderTable{border-collapse:collapse;}
		.borderTable th{background:#a2eade}
		.borderTable td,.borderTable th{border:1px solid #000;text-align:center;}
		.redback:hover{background-color: red;}
		.header{width:70%;margin-left:50%;}
		.headT{width:60%;}
		.sel input{width:90%;}
		td,th{font-size:4px;}
	</style>
	
  </head>
 
  <body>
  	<div class="wrapDiv">
  		<h1>已经开始校招的公司</h1>
  		<div class="header">
	  		<form action="/JobMemo/jobRecord/listCompany.do" method="post">
	  			<table class="headT">
	  				<tr>
	  					<td colspan="2">招聘类型：
	  						<select name="type">
	  							<option value="">--选择类型--</option>
	  							<c:forEach items="${types}" var="item">
	  								<option value="${item}" <c:if test="${type==item}">selected</c:if> >${item}</option>
	  							</c:forEach>
	  						</select>
	  				<input type="submit" value="查询" id="search"></td>
	  				</tr>
	  			</table>
	  		</form>
	  	</div>
    	<table class="borderTable">
    		<tr>
    			<th style="width:2%;">id</th>
    			<th style="width:6%;">公司名称</th>
    			<th style="width:5%;">招聘类型</th>
    			<th style="width:27%;">链接</th>
    			<th style="width:23%;">备注 </th>
    			<th style="width:10%;"></th>
    		</tr>
    		<c:forEach var="item" items="${companies}">
    			<tr class="redback">
    				<td>${item.id}</td>
    				<td>${item.name}</td>
    				<td>${item.type}</td>
    				<td style="text-align:left;"><a href="${item.url}" target="_blank">${item.url}</a></td>
    				<td>${item.remark}</td>
    				<td id="caozuo"></td>
    			</tr>
    		</c:forEach>
    		<tr id="new1">
    					<td></td>
    				<td class="sel">  					
    						<input type="text" name="name" placeholder="公司名称"/>
    				</td>
    				
    				<td class="sel">
    					<select name="type">
	  							<option value="">--选择类型--</option>
	  							<c:forEach items="${types}" var="item">
	  								<option value="${item}">${item}</option>
	  							</c:forEach>
	  					</select>
    				</td>

    				<td class="sel"><input type="text" name="url" placeholder="url"/></td>
    				<td class="sel"><input type="text" name="remark" placeholder="备注"/></td>
    				<td><input type="submit" value="+新投递" id="newSend"></input></td>
    		</tr>
    	
    	</table>
    	<div style="text-align: right;padding-right:80px;">
    		<br>
    		<span>使用人数：</span><span>${userCount} 人</span>&nbsp;<span><a href="/JobMemo/login1/logOut.do">退出登录</a></span><br>
    		<span><a href="/JobMemo/views/readme.jsp" target="_blank">使用说明</a></span>
    		
    	</div>
    </div>
    <script>
    	$(function(){ 
		　　$("#newSend").click(function(){
				var type=$(".sel select[name='type']").val();
				var name=$(".sel input[name='name']").val();
				var url=$(".sel input[name='url']").val();
				var remark=$(".sel input[name='remark']").val();
				$.ajax({
			      url: '/JobMemo/jobRecord/addCompany.do',
			      type: 'post',
			      dataType: 'json',
			      data: {
			        "name":name,
			        "type":type,
			        "url":url,
			        "remark":remark
			      },
			      async : false,
			      success: function(result) {
			        if(result.code==0)
			        {
			         alert("新增成功！");
			         window.opener.refreshPage();
			          window.location.href="/JobMemo/jobRecord/listCompany.do";
			        }
			        else
			        {
			          alert(result.msg);
			        }
			      }
			    });
			});
		
		});
    	
    	function edit(id){
    		window.open("/JobMemo/jobRecord/detail.do?id="+id);
    	}
    	
    	function getStatus(id){
    		window.open("/JobMemo/jobRecord/statusList.do?id="+id);
    	}
    	
    	function del(id){
    		$.ajax({
			      url: '/JobMemo/jobRecord/delete.do',
			      type: 'post',
			      dataType: 'json',
			      data: {
			        "id":id
			      },
			      async : false,
			      success: function(result) {
			        if(result.code==0)
			        {
			         alert("删除成功！");
			          window.location.href="/JobMemo/jobRecord/list.do";
			        }
			        else
			        {
			          alert(result.msg);
			        }
			      }
			    });
    	}
    	
    	function subRefreshSearch(){
    		window.location.href="/JobMemo/jobRecord/list.do";
    	}
    	
    	function refreshPage(){
    		$("#search").click();
    		
    	}
 </script>
  </body>
</html>
