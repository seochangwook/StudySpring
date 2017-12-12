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
	<!-- ProgressBar -->
	<link rel="stylesheet" href="resources/css/progressbar/progressbarcss.css" type="text/css"/>
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
	<div id="study6_study9">
		<p><strong style="color:Blue; font-size: 20px">6. JSTL, Table tag / 9. Zebra_Dialog, Ajax</strong></p>
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
						<th>조회</th>
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
		                    <td><button data-pid='${user.userName}'>조회</button></td>
		                    <td><button data-pid2='${user.userName}'>삭제</button></td>
		                </tr>
		        		</c:forEach>
		        </tbody>
	        </c:if>
	        <c:if test="${fn:length(userlist) == 0}">
	        		<p id='info_sub1' style='font-size:14px;color:#586069; margin:0px'><b>등록된 사용자가 없습니다.</b></p>
	        </c:if>
		</table>
	<div id="study9">
	
	</div>
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
			<p><button type="submit">페이지 이동</button></p>
		</form>
	</div>
	<br>
	<div id="study10">
		<p><strong style="color:Blue; font-size: 20px">10. File Upload</strong></p>
		<div id="filetransdiv">
			<form>
				<label>* 주제:</label>&nbsp<input type="text" id="subject" placeholder="input subject"><br>
				<label>* 내용:</label>&nbsp<textarea class="form-control" rows="5" id="content" placeholder="input content"></textarea><br>
				<label>* 첨부파일 :</label>&nbsp<input type="file" class="btn btn-default form-join" id="uploadfile" multiple="multiple"/><br>
			</form>
			<div id="filelist">
			</div>
			<button type="button" class="btn btn-primary" id="btn-enroll">등록</button>
		</div>
	</div>
	<br>
	<div id="study11">
		<p><strong style="color:Blue; font-size: 20px">11. Database (MyBatis)</strong></p>
		<div id="conditionfield">
			<label>* 조회영역</label>
			<div>
				<label>- 이름: </label>&nbsp;<input type="text" id="in_name">
				<label>, 나이: </label>&nbsp;<input type="number" id="in_age">
				<label>, 번호: </label>&nbsp;<input type="text" id="in_no">
				<br>
				<button type="button" class="btn btn-primary" id="btn-search">검색</button>
			</div>
		</div>
		<br>
		<div id="tablefield">
			<p>table field...</p>
		</div>
	</div>
	<div class="wrap-loading display-none">
    		<div><img src="resources/images/ajaxprogress/ajax-loader.gif" /></div>
	</div> 
</body>
<script type="text/javascript">
$(function(){
	$("[data-pid]").on("click", function(){    
		var selUserName = $(this).data("pid");
		
		//수정 선택관련 다이얼로그//
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>['+selUserName+'] 정보를 조회하시겠습니까?</p>',{
			title: 'Blog Test Dialog',
			type: 'question',
			print: false,
			width: 760,
			position: ['right - 20', 'top + 20'],
			buttons: ['취소', '조회'],
			onClose: function(caption){
				if(caption == '조회'){
					var trans_objeect = 
			    		{
			        		'name': selUserName
				    }
					var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
					
					//ajax call//
					$.ajax({
						url: "http://localhost:8080/controller/searchuser",
						type: 'POST',
						dataType: 'json',
						data: trans_json,
						contentType: 'application/json',
						mimeType: 'application/json',
						beforeSend:function(){
			            		$('.wrap-loading').removeClass('display-none');
			            	},
			            	complete:function(){
			            		$('.wrap-loading').addClass('display-none');
			            	},
						success: function(retVal){
							alert("success ajax..." + '/' + retVal.val + '/' + retVal.info);
							
							//페이지에 나타내기 위한 스크립트 코드//
							var script = '<p>search name is: '+retVal.info+'</p>'
							
							$('#study9').empty(); //기존 스크립트 초기화//
							$('#study9').append(script);
						},
						error: function(retVal, status, er){
							alert("error: "+retVal+" status: "+status+" er:"+er);
						}
					});
				} else if(caption == '취소'){
					console.log('update cancel');
				}
			}
		});
	});
	
	$("[data-pid2]").on("click", function(){    
		var selUserName = $(this).data("pid2");
		
		//수정 선택관련 다이얼로그//
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>['+selUserName+'] 정보를 삭제하시겠습니까?</p>',{
			title: 'Blog Test Dialog',
			type: 'warning',
			print: false,
			width: 760,
			position: ['right - 20', 'top + 20'],
			buttons: ['취소', '삭제'],
			onClose: function(caption){
				if(caption == '삭제'){
					var trans_objeect = 
			    		{
			        		'userName': selUserName
				    }
					var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
					
					//ajax call//
					$.ajax({
						url: "http://localhost:8080/controller/deleteuser",
						type: 'POST',
						dataType: 'json',
						data: trans_json,
						contentType: 'application/json',
						mimeType: 'application/json',
						beforeSend:function(){
			            		$('.wrap-loading').removeClass('display-none');
			            	},
			            	complete:function(){
			            		$('.wrap-loading').addClass('display-none');
			            	},
						success: function(retVal){
							alert("success ajax..." + '/' + retVal.val + '/' + retVal.deleteval);
						},
						error: function(retVal, status, er){
							alert("error: "+retVal+" status: "+status+" er:"+er);
						}
					});
				} else if(caption == '취소'){
					console.log('delete cancel');
				}
			}
		});
	});
	
	var value1 = Number($('#value1').val());
	var value2 = Number($('#value2').val());
	
	var result = value1 + value2;
	
	console.log(value1 + '+' + value2 + '=' + (value1 + value2));
	
	var files = []; //파일이 저장될 배열//
	var filecount = 0;
	$('[data-toggle="tooltip"]').tooltip(); 
	//파일선택 시 발생하는 이벤트 처리(전송할 파일 목록에 등록)//
	$('#uploadfile').change(function(event){
		files[filecount]=event.target.files[0];
		
		var printHTML = "<label>첨부파일("+(filecount+1)+") " + event.target.files[0].name + "</label><br>";
		
		$('#filelist').append(printHTML);
		
		filecount++;
	});
	$('#btn-enroll').click(function(){
		var subjecttext = $('#subject').val();
		var contenttext = $('#content').val();
		var arraycount = files.length;
		
		//파일전송을 위한 FormData설정//
		var formData = new FormData();
		
		formData.append("subject", subjecttext);
		formData.append("content", contenttext);
		
		for(var i=0; i<arraycount; i++){
			formData.append("uploadfile["+i+"]", files[i]);
		}
		
		if(arraycount == 0){
			//수정 선택관련 다이얼로그//
			var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>현재 선택된 파일이 없습니다.</p>',{
				title: 'Blog Test Dialog',
				type: 'warning',
				print: false,
				width: 760,
				position: ['right - 20', 'top + 20'],
				buttons: ['닫기'],
				onClose: function(caption){
	
				}
			});
		} else{
			//ajax call//
			$.ajax({
				type : 'POST',
	    			url : 'http://localhost:8080/controller/enrollajax',
	    			data : formData,
	    			//파일 전송 시 processData, contentType을 null로 설정//
	   		 	processData : false,
	    			contentType : false,
		    		beforeSend:function(){
		                $('.wrap-loading').removeClass('display-none');
		            },
		            complete:function(){
		                $('.wrap-loading').addClass('display-none');
		            },
		    		success : function(retVal) {
		    			alert('enroll success...');
		    			
		    			$('#filelist').empty();
		    			filecount=0;
		    		},
		    		error : function(retVal, status, er) {
		    			alert("error: "+retVal+" status: "+status+" er:"+er);
		    		}
			});	
		}
	});	
	
	//유저조회//
	$('#btn-search').click(function(){
		var in_name = $('#in_name').val();
		var in_age = $('#in_age').val();
		var in_no = $('#in_no').val();
		
		//console.log(in_name + ',' + in_age + ',' + in_no);
		var trans_objeect = 
		{
			'searchName': in_name,
			'searchAge' : in_age,
			'searchNo'  : in_no
		}
		var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
		
		$.ajax({
			url: "http://localhost:8080/controller/searchuserdb",
			type: 'POST',
			dataType: 'json',
			data: trans_json,
			contentType: 'application/json',
			mimeType: 'application/json',
			beforeSend:function(){
            		$('.wrap-loading').removeClass('display-none');
            	},
            	complete:function(){
            		$('.wrap-loading').addClass('display-none');
            	},
			success: function(retVal){
				//alert("success ajax..." + '/' + retVal.val);
				
				var userlist = []; //배열 데이터 저장//
				userlist = retVal.val;
				
				var listcount = userlist.length;
				
				$('#tablefield').empty(); //수정된 테이블을 다시 로드하기 위해서 기존 테이블 영역을 지운다.//
				
				var printHTML = '';
				
				if(listcount > 0){
					printHTML = "<div id='userlist'>";
					printHTML += "<table border='1'>";
			        	printHTML += "<thead>";
			        	printHTML += "<tr>";
			        	printHTML += "<th>구분</th>";
			        	printHTML += "<th>이름</th>";
			        	printHTML += "<th>나이</th>";
			        	printHTML += "<th>이미지</th>";
			        	printHTML += "<th>수정</th>";
			        	printHTML += "<th>제거</th>";
			        	printHTML += "</tr>";
			        	printHTML += "</thead>"; 
			        	printHTML += "<tbody>";
		            
		            //테이블에 들어갈 데이터를 삽입//
		            $.each(userlist, function(index,value) {
		            		printHTML += "<tr>";
			            	printHTML += "<td>"+value.USER_NO+"</td>";
			            	printHTML += "<td>"+value.USER_NAME+"</td>";
			            	printHTML += "<td>"+value.USER_AGE+"</td>";
			            	printHTML += "<td><img src='./resources/images/"+value.USER_IMAGE+"' width='100' height='100'></td>";
			            	printHTML += "<td><button value='"+value.USER_NAME+"' onclick='userinfoupdate(this.value)'>수정</button></td>";
			            	printHTML += "<td><button value='"+value.USER_NAME+"' onclick='userinfodelete(this.value)'>삭제</button></td>";
			            	printHTML += "</tr>";          			  
	       	 		});
		            
		            printHTML += "</tbody>";
		            printHTML += "</table>";
		            printHTML += "</div>";
				} else{
					printHTML = "<div id='userlist'>";
					printHTML += "<p id='info_sub1' style='font-size:14px;color:#586069; margin:0px'><b>조회된 사용자가 없습니다.</b></p>";
					printHTML += "</div>";
				}
				
				$('#tablefield').append(printHTML); //다시 테이블을 보여주기 위해서 HTML코드 적용//
			},
			error: function(retVal, status, er){
				alert("error: "+retVal+" status: "+status+" er:"+er);
			}
		});
	});
});
////////////////////////////
function userinfoupdate(userName){
	var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>* ['+userName+'] 수정사항</p>'
			+ '- 나이: &nbsp;<input type=text id=updateage></input>'
	,{
		title: 'Blog Test Dialog',
		type: 'question',
		print: false,
		width: 760,
		position: ['right - 20', 'top + 20'],
		buttons: ['닫기', '수정'],
		onClose: function(caption){
			if(caption == '수정'){
				console.log('update userinfo');
				
				var updateAge = $('#updateage').val();
				
				var trans_objeect = 
				{
					'updateName': userName,
					'updateAge' : updateAge
				}
				var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
				
				$.ajax({
					url: "http://localhost:8080/controller/updateuserdb",
					type: 'POST',
					dataType: 'json',
					data: trans_json,
					contentType: 'application/json',
					mimeType: 'application/json',
					beforeSend:function(){
		            		$('.wrap-loading').removeClass('display-none');
		            	},
		            	complete:function(){
		            		$('.wrap-loading').addClass('display-none');
		            	},
					success: function(retVal){
						//alert("success ajax..." + '/' + retVal.val);
						if(retVal.resultCode == 1){
							var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>수정성공</p>',{
								title: 'Blog Test Dialog',
								type: 'confirmation',
								print: false,
								width: 760,
								position: ['right - 20', 'top + 20'],
								buttons: ['닫기'],
								onClose: function(caption){
									
								}
							});
						} else if(retVal.resultCode == 0){
							var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>수정실패</p>',{
								title: 'Blog Test Dialog',
								type: 'warning',
								print: false,
								width: 760,
								position: ['right - 20', 'top + 20'],
								buttons: ['닫기'],
								onClose: function(caption){
									
								}
							});
						}
						
						//console.log(in_name + ',' + in_age + ',' + in_no);
						var trans_objeect = 
						{
							'searchName': '',
							'searchAge' : '',
							'searchNo'  : ''
						}
						var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
						
						$.ajax({
							url: "http://localhost:8080/controller/searchuserdb",
							type: 'POST',
							dataType: 'json',
							data: trans_json,
							contentType: 'application/json',
							mimeType: 'application/json',
							beforeSend:function(){
				            		$('.wrap-loading').removeClass('display-none');
				            	},
				            	complete:function(){
				            		$('.wrap-loading').addClass('display-none');
				            	},
							success: function(retVal){
								//alert("success ajax..." + '/' + retVal.val);
								
								var userlist = []; //배열 데이터 저장//
								userlist = retVal.val;
								
								var listcount = userlist.length;
								
								$('#tablefield').empty(); //수정된 테이블을 다시 로드하기 위해서 기존 테이블 영역을 지운다.//
								
								var printHTML = '';
								
								if(listcount > 0){
									printHTML = "<div id='userlist'>";
									printHTML += "<table border='1'>";
							        	printHTML += "<thead>";
							        	printHTML += "<tr>";
							        	printHTML += "<th>구분</th>";
							        	printHTML += "<th>이름</th>";
							        	printHTML += "<th>나이</th>";
							        	printHTML += "<th>이미지</th>";
							        	printHTML += "<th>수정</th>";
							        	printHTML += "<th>제거</th>";
							        	printHTML += "</tr>";
							        	printHTML += "</thead>"; 
							        	printHTML += "<tbody>";
						            
						            //테이블에 들어갈 데이터를 삽입//
						            $.each(userlist, function(index,value) {
						            		printHTML += "<tr>";
							            	printHTML += "<td>"+value.USER_NO+"</td>";
							            	printHTML += "<td>"+value.USER_NAME+"</td>";
							            	printHTML += "<td>"+value.USER_AGE+"</td>";
							            	printHTML += "<td><img src='./resources/images/"+value.USER_IMAGE+"' width='100' height='100'></td>";
							            	//onclick속성을 이용해서 직접 함수를 호출하고 값으로 현재 button태그에 value값을(pid) 이용한다.//
							            	printHTML += "<td><button value='"+value.USER_NAME+"' onclick='userinfoupdate(this.value)'>수정</button></td>";
							            	printHTML += "<td><button value='"+value.USER_NAME+"' onclick='userinfodelete(this.value)'>삭제</button></td>";
							            	printHTML += "</tr>";          			  
					       	 		});
						            
						            printHTML += "</tbody>";
						            printHTML += "</table>";
						            printHTML += "</div>";
								} else{
									printHTML = "<div id='userlist'>";
									printHTML += "<p id='info_sub1' style='font-size:14px;color:#586069; margin:0px'><b>조회된 사용자가 없습니다.</b></p>";
									printHTML += "</div>";
								}
								
								$('#tablefield').append(printHTML); //다시 테이블을 보여주기 위해서 HTML코드 적용//
							},
							error: function(retVal, status, er){
								alert("error: "+retVal+" status: "+status+" er:"+er);
							}
						});
					},
					error: function(retVal, status, er){
						var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>잘못된 입력값으로 수정실패</p>',{
							title: 'Blog Test Dialog',
							type: 'warning',
							print: false,
							width: 760,
							position: ['right - 20', 'top + 20'],
							buttons: ['닫기'],
							onClose: function(caption){
								
							}
						});
					}
				});
			} else if(caption == '닫기'){
				console.log('close dialog');
			}
		}
	});
}
////////////////////////////
function userinfodelete(userName){
	console.log('delete user name: ' + userName);
	
	var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>* ['+userName+'] 를 삭제하시겠습니까?</p>',{
		title: 'Blog Test Dialog',
		type: 'question',
		print: false,
		width: 760,
		position: ['right - 20', 'top + 20'],
		buttons: ['닫기', '삭제'],
		onClose: function(caption){
			if(caption == '삭제'){
				console.log('delete userinfo');
				
				var updateAge = $('#updateage').val();
				
				var trans_objeect = 
				{
					'deleteName': userName,
				}
				var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
				
				$.ajax({
					url: "http://localhost:8080/controller/deleteuserdb",
					type: 'POST',
					dataType: 'json',
					data: trans_json,
					contentType: 'application/json',
					mimeType: 'application/json',
					beforeSend:function(){
		            		$('.wrap-loading').removeClass('display-none');
		            	},
		            	complete:function(){
		            		$('.wrap-loading').addClass('display-none');
		            	},
					success: function(retVal){
						//alert("success ajax..." + '/' + retVal.val);
						if(retVal.resultCode == 1){
							var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>삭제성공</p>',{
								title: 'Blog Test Dialog',
								type: 'confirmation',
								print: false,
								width: 760,
								position: ['right - 20', 'top + 20'],
								buttons: ['닫기'],
								onClose: function(caption){
									
								}
							});
						} else if(retVal.resultCode == 0){
							var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>삭제실패</p>',{
								title: 'Blog Test Dialog',
								type: 'warning',
								print: false,
								width: 760,
								position: ['right - 20', 'top + 20'],
								buttons: ['닫기'],
								onClose: function(caption){
									
								}
							});
						}
						
						//console.log(in_name + ',' + in_age + ',' + in_no);
						var trans_objeect = 
						{
							'searchName': '',
							'searchAge' : '',
							'searchNo'  : ''
						}
						var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
						
						$.ajax({
							url: "http://localhost:8080/controller/searchuserdb",
							type: 'POST',
							dataType: 'json',
							data: trans_json,
							contentType: 'application/json',
							mimeType: 'application/json',
							beforeSend:function(){
				            		$('.wrap-loading').removeClass('display-none');
				            	},
				            	complete:function(){
				            		$('.wrap-loading').addClass('display-none');
				            	},
							success: function(retVal){
								//alert("success ajax..." + '/' + retVal.val);
								
								var userlist = []; //배열 데이터 저장//
								userlist = retVal.val;
								
								var listcount = userlist.length;
								
								$('#tablefield').empty(); //수정된 테이블을 다시 로드하기 위해서 기존 테이블 영역을 지운다.//
								
								var printHTML = '';
								
								if(listcount > 0){
									printHTML = "<div id='userlist'>";
									printHTML += "<table border='1'>";
							        	printHTML += "<thead>";
							        	printHTML += "<tr>";
							        	printHTML += "<th>구분</th>";
							        	printHTML += "<th>이름</th>";
							        	printHTML += "<th>나이</th>";
							        	printHTML += "<th>이미지</th>";
							        	printHTML += "<th>수정</th>";
							        	printHTML += "<th>제거</th>";
							        	printHTML += "</tr>";
							        	printHTML += "</thead>"; 
							        	printHTML += "<tbody>";
						            
						            //테이블에 들어갈 데이터를 삽입//
						            $.each(userlist, function(index,value) {
						            		printHTML += "<tr>";
							            	printHTML += "<td>"+value.USER_NO+"</td>";
							            	printHTML += "<td>"+value.USER_NAME+"</td>";
							            	printHTML += "<td>"+value.USER_AGE+"</td>";
							            	printHTML += "<td><img src='./resources/images/"+value.USER_IMAGE+"' width='100' height='100'></td>";
							            	//onclick속성을 이용해서 직접 함수를 호출하고 값으로 현재 button태그에 value값을(pid) 이용한다.//
							            	printHTML += "<td><button value='"+value.USER_NAME+"' onclick='userinfoupdate(this.value)'>수정</button></td>";
							            	printHTML += "<td><button value='"+value.USER_NAME+"' onclick='userinfodelete(this.value)'>삭제</button></td>";
							            	printHTML += "</tr>";          			  
					       	 		});
						            
						            printHTML += "</tbody>";
						            printHTML += "</table>";
						            printHTML += "</div>";
								} else{
									printHTML = "<div id='userlist'>";
									printHTML += "<p id='info_sub1' style='font-size:14px;color:#586069; margin:0px'><b>조회된 사용자가 없습니다.</b></p>";
									printHTML += "</div>";
								}
								
								$('#tablefield').append(printHTML); //다시 테이블을 보여주기 위해서 HTML코드 적용//
							},
							error: function(retVal, status, er){
								alert("error: "+retVal+" status: "+status+" er:"+er);
							}
						});
					},
					error: function(retVal, status, er){
						var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>잘못된 입력값으로 삭제실패</p>',{
							title: 'Blog Test Dialog',
							type: 'warning',
							print: false,
							width: 760,
							position: ['right - 20', 'top + 20'],
							buttons: ['닫기'],
							onClose: function(caption){
								
							}
						});
					}
				});
			} else if(caption == '닫기'){
				console.log('close dialog');
			}
		}
	});
}
</script>
</html>
