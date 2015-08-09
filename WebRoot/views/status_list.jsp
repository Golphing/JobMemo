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
    <title>简历状态</title>
	  <script src="http://s.ebaoyang.cn/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
	  <script type="text/javascript" src="http://s.ebaoyang.cn/custom-service/My97DatePicker/WdatePicker.js"></script>
	<style>
		table,tr,td{
			border:0px;
			text-align: center;
		}
		.wrapDiv{
			width:95%;
			height:120px;
			border:2px solid red;
			margin:0 auto;
			margin-top:200px;
			padding:10px;
		}
	</style>
	
  </head>
 
  <body>
  	<div class="wrapDiv">
    	<table class="borderTable">
    		<tr>
    			<td>开始</td>
	    		<c:forEach items="${statuses}" var="item">
					<td>  <b>-----></b>  </td><td> ${item.status} </td>	
	    		</c:forEach>
    		</tr>
    		<tr>
    			<td>    </td>
	    		<c:forEach items="${statuses}" var="item">
					<td>    </td><td> ${item.updateTime} </td>
	    		</c:forEach>
    		</tr>
    		
    	</table>
    	
    </div >
    	
    <div style="margin:0 auto;margin-top:10px;height:30px;text-align:right;width:900px;">
    	<select name="status">
	  							<option value="">--选择状态--</option>
	  							<c:forEach items="${status}" var="item">
	  								<option value="${item}" <c:if test="${searchParams.process==item}">selected</c:if>>${item}</option>
	  							</c:forEach>
	  	</select>
    	<input type="submit" id="newStatus" value="增加状态"/>
    </div>
    <script>
    	$(function(){ 
		　　$("#newStatus").click(function(){
				var status=$("select[name='status']").val();
				$.ajax({
			      url: '/JobMemo/jobRecord/alterStatus.do',
			      type: 'post',
			      dataType: 'json',
			      data: {
			       		"id":${recordId},
			       		"status":status
			      },
			      async : false,
			      success: function(result) {
			        if(result.code==0)
			        {
			         	alert("新增成功！");
			         	window.opener.refreshPage();
			          	window.location.href="/JobMemo/jobRecord/statusList.do?id=${recordId}";
			          	
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
    		window.open("http://localhost:11000/JobMemo/jobRecord/detail.do?id="+id);
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
			          window.location.href="http://localhost:11000/JobMemo/jobRecord/list.do";
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
 </script>
  </body>
</html>
