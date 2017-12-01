<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>Main Page</title>
	<!-- jQuery, bootstrap CDN -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<!-- Zebra-Dialog CDN -->
	<script src="resources/js/dialog/zebra_dialog.src.js"></script>
	<link rel="stylesheet" href="resources/css/dialog/zebra_dialog.css" type="text/css"/>
</head>
<body>
	<div>
		<p id="intro"><strong style="color:Green; font-size: 40px">* Spring Framework Study</strong></p>
	</div>
	<br>
	<div id="study1">
		<p><strong style="color:Blue; font-size: 20px">1. Model,View - 1</strong></p>
		<label>* EL표기법 : 표현언어로 JSP 2.0에서 새로 추가된 스크립트 언어. 스프링 프레임워크에서 Model값 매핑 시 사용</label>
		<br>
		<label>Study topic : ${modelvalue}</label>
	</div>
	<br>
	<div id="study2">
		<p><strong style="color:Blue; font-size: 20px">2. Model, View - 2</strong></p>
		<input type="hidden" id="value1" value="${value1}"/>
		<input type="hidden" id="value2" value="${value2}"/>
		<label>(Console print...)</label>
	</div>
	<br>
	<div id="study3">
		<p><strong style="color:Blue; font-size: 20px">3. @Service, @Repository, @Autowired - 1</strong></p>
		<label>Search name is ${searchname}</label>
	</div>
	<br>
	<div id="study4">
		<p><strong style="color:Blue; font-size: 20px">4. @Service, @Repository, @Autowired - 2</strong></p>
		<label>Enroll is ${result.flag}</label>
	</div>
	<br>
	<div id="study5">
		<p><strong style="color:Blue; font-size: 20px">5. JSTL</strong></p>
		<a href="http://www.oracle.com/technetwork/java/index-jsp-135995.html">(JSTL 오라클 공식 사이트)</a>
		<br><br>
		<c:if test="${value == true}">
			<label>value is false</label>
			<br>
			<c:choose>
			<c:when test="${retType.type == 1}">
				<label>Choose type 1</label>
			</c:when>
			<c:when test="${retType.type == 2}">
				<label>Choose type 2</label>
			</c:when>
			</c:choose>
		</c:if>
		<c:if test="${value == false}">
			<label>value is false</label>
		</c:if>
	</div>
	<br>
	<div id="study6">
		<p><strong style="color:Blue; font-size: 20px">6. JSTL, Table tag</strong></p>
		<table border="1">
		<!-- HTML에서 프로그래밍 적용 : JSTL -->
		<c:set var='userlist' value='${listuser}'/>
		<c:if test="${fn:length(userlist) > 0}">
			<thead>
				<tr>
					<th>구분</th>
					<th>이름</th>
					<th>나이</th>
					<th>이미지</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items='${listuser}' var='user'>
	                <c:set var='i' value='${i+1}'/>
	                <tr>
	                    <td><c:out value='${i}'/></td>
	                    <td><c:out value='${user.userName}'/></td>
	                    <td><c:out value='${user.userAge}'/></td>
	                    <td><img src="./resources/images/${user.userImage}" width="100" height="100"></td>
	                    <td><button data-pid='${user.userName}'>수정</button></td>
	                    <td><button data-pid2='${user.userName}'>삭제</button></td>
	                </tr>
	        		</c:forEach>
	        </tbody>
        </c:if>
        <c:if test="${fn:length(userlist) == 0}">
        		<p id='info_sub1' style='font-size:14px;color:#586069; margin:0px'><b>등록된 사용자가 없습니다.</b></p>
        </c:if>
	</table>
	</div>
	<br>
	<div id="study7">
		<p><strong style="color:Blue; font-size: 20px">7. @Component</strong></p>
		<c:if test="${resultmail.code == '1000'}">
			<label>Mail Trans Success...</label>
		</c:if>
		<c:if test="${resultmail.code == '2000'}">
			<label>Mail Trans Fail...</label>
		</c:if>
	</div>
	<br>
	<div id="study8">
		<p><strong style="color:Blue; font-size: 20px">8. Form tag</strong></p>
		<form method="post" action='http://localhost:8080/controller/samplepage.do'>
			<label>* Name: </label>&nbsp;&nbsp;<input type="text" name="inputname">
			<br>
			<label>* Age: </label>&nbsp;&nbsp;<input type="text" name="inputage">
			<br>
			<p><button type='submit'>페이지 이동</button></p>
		</form>
	</div>
</body>
<script type="text/javascript">
$(function(){
	/*$("[data-pid]").on("click", function(){    
		var selUserName = $(this).data("pid");
		
		console.log('click modify name: ' + selUserName);
	});
	
	$("[data-pid2]").on("click", function(){    
		var selUserName = $(this).data("pid2");
		
		console.log('click delete name: ' + selUserName);
	});*/
	
	/*var value1 = Number($('#value1').val());
	var value2 = Number($('#value2').val());
	
	var result = value1 + value2;*/
	
	console.log(value1 + '+' + value2 + '=' + (value1 + value2));
});
</script>
</html>
