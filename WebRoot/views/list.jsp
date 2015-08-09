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
    <title>简历投递记录</title>
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
  		<h1>简历投递记录一览表</h1>
  		<div class="header">
	  		<form action="/JobMemo/jobRecord/list.do" method="post">
	  			<table class="headT">
	  				<tr>
	  					<td colspan="2">招聘类型：
	  						<select name="recruitType">
	  							<option value="">--选择类型--</option>
	  							<c:forEach items="${types}" var="item">
	  								<option value="${item}" <c:if test="${searchParams.recruitType==item}">selected</c:if> >${item}</option>
	  							</c:forEach>
	  						</select>
	  					</td>
	  					<td  colspan="2">状态：
	  						<select name="process">
	  							<option value="">--选择状态--</option>
	  							<c:forEach items="${status}" var="item">
	  								<option value="${item}" <c:if test="${searchParams.process==item}">selected</c:if>>${item}</option>
	  							</c:forEach>
	  						</select>
	  					</td>
	  				</tr>
	  				<tr>
	  					<td>共${count}条</td><td>每页显示<input name="limit" type="text" value="${limit}" style="width: 28px;"/>条</td>
	  					<td>页数${page}/${totalPage}:
	  						<select name="page">
								<c:forEach  var="it" begin="1" end="${totalPage }" step="1">
									<option value="${it }" >${it }</option>
								</c:forEach>
							</select>
					</td><td><input type="submit" value="查询" id="search"></td>
	  				</tr>
	  				
	  			</table>
	  		</form>
	  	</div>
    	<table class="borderTable">
    		<tr>
    			<th style="width:2%;">id</th>
    			<th style="width:6%;">公司名称</th>
    			<th style="width:6%;">职位</th>
    			<th style="width:5%;">招聘类型</th>
    			<th>开始时间</th>
    			<th>结束时间</th>
    			<th>投递时间</th>
    			<th style="width:5%;">状态</th>
    			<th style="width:7%;">链接</th>
    			<th style="width:23%;">备注 </th>
    			<th style="width:15%;">操作</th>
    		</tr>
    		<c:forEach var="item" items="${records}">
    			<tr class="redback">
    				<td>${item.id}</td>
    				<td>${item.companyName}</td>
    				<td>${item.position}</td>
    				<td>${item.recruitType}</td>
    				<td>${item.startTime}</td>
    				<td>${item.endTime }</td>
    				<td>${item.sendTime }</td>
    				<td>${item.process}</td>
    				<td><c:if test="${item.url !=''}"><a href="${item.url}" target="blank">去 ${item.companyName} 招聘网站</a></c:if></td>
    				<td>${item.remark}</td>
    				<td id="caozuo"><input type="submit" value="编辑" id="edit" onclick="edit(${item.id});"/> | <input type="submit" value="删除" id="del" onclick="del(${item.id});"/> |<input type="submit" value="状态" id="statusMap" onclick="getStatus(${item.id});"/></td>
    			</tr>
    		</c:forEach>
    		<tr id="new1">
    					<td></td>
    				<td class="sel">
    					<select name="companyId" onchange="changeCompany();">
    						<option>--请选择公司--</option>
    						<c:forEach items="${companies}" var="company">
    							<option value="${company.id}">${company.name}</option>
    						</c:forEach>
    					</select>
    				</td>
    				<td class="sel"><input type="text" name="position" placeholder="职位"/></td>
    				<td class="sel">
    					<select name="recruitType">
	  							<option value="">--选择类型--</option>
	  							<c:forEach items="${types}" var="item">
	  								<option value="${item}">${item}</option>
	  							</c:forEach>
	  					</select>
    				</td>
    				<td class="sel"><input class="date readonly valid" name="startTime" id="dateTime" type="text"                      
                           onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-%d'})" placeholder="开始时间"></td>
    				<td class="sel"><input class="date readonly valid" name="endTime" id="dateTime" type="text"                             
                           onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-%d'})" placeholder="结束时间"></td>
    				<td class="sel"><input class="date readonly valid" name="sendTime" id="dateTime" type="text" 
                           onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-%d'})" placeholder="投递时间"></td>
    				<td class="sel" ></td>
    				<td class="sel"><input type="text" name="url" placeholder="url"/></td>
    				<td class="sel"><input type="text" name="remark" placeholder="备注"/></td>
    				<td><input type="submit" value="+新投递" id="newSend"></input></td>
    		</tr>
    	
    	</table>
    	<div style="text-align: right;padding-right:80px;">
    		<br>
    		<span>使用人数：</span><span>${userCount} 人</span>&nbsp;<span><a href="/JobMemo/login1/logOut.do">退出登录</a></span><br>
    		<span><a href="/JobMemo/jobRecord/listCompany.do" target="_blank">分享平台</a></span>&nbsp;&nbsp;<span><a href="/JobMemo/views/readme.jsp" target="_blank">使用说明</a></span>
    		
    	</div>
    </div>
    <script>
    	$(function(){ 
		　　$("#newSend").click(function(){
				var companyId=$(".sel select[name='companyId']").val();
				var recruitType=$(".sel select[name='recruitType']").val();
				var startTime=$(".sel input[name='startTime']").val();
				var endTime=$(".sel input[name='endTime']").val();
				var process=$(".sel input[name='process']").val();
				var url=$(".sel input[name='url']").val();
				var remark=$(".sel input[name='remark']").val();
				var position=$(".sel input[name='position']").val();
				var sendTime=$(".sel input[name='sendTime']").val();
				$.ajax({
			      url: '/JobMemo/jobRecord/add.do',
			      type: 'post',
			      dataType: 'json',
			      data: {
			        "companyId":companyId,
			        "recruitType":recruitType,
			        "startTime":startTime,
			        "endTime":endTime,
			        "process":process,
			        "url":url,
			        "remark":remark,
			        "position":position,
			        "sendTime":sendTime
			      },
			      async : false,
			      success: function(result) {
			        if(result.code==0)
			        {
			         alert("新增成功！");
			          window.location.href="/JobMemo/jobRecord/list.do";
			        }
			        else
			        {
			          alert(result.msg);
			        }
			      }
			    });
			});
			
			
		});
    	
    	function changeCompany(){
    			var id1=$(".sel select[name='companyId']").val();
    	//		alert(id1);
    			$.ajax({
			      url: '/JobMemo/jobRecord/getCompany.do',
			      type: 'post',
			      dataType: 'json',
			      data: {
			        "id":id1
			      },
			      async : false,
			      success: function(result) {
			        if(result.code==0)
			        {
			//         alert("获取成功！");
			         var companyDetail=result;
			         console.log(result.data.name);
			 		var type=result.data.type;
			 		var url=result.data.url;
			//         alert(type);
			  //       alert(url);
			         $(".sel input[name='url']").val(url);
			         $(".sel select[name='recruitType']").val(type);
			        }
			        else
			        {
			          alert(result.msg);
			        }
			      }
			    });
    	}
    	
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
