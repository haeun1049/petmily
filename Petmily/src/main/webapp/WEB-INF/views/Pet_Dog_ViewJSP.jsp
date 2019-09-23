<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table{
border-top: 1px solid #444444;
border-collapse: collapse;
 width: 1000px;
height: 150px;
}
 th, td {
border-bottom: 1px solid #FFC7AD;
 padding: 10px;
text-align: center;
      }
 th{
 background: #FFC7AD;
 }
body{

text-align: center;
}

#h{
  width:60px;
  height:55px;

}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* 좋아요 */
function like_func(){
  var pet_number ="${DogView.pet_number}";
console.log("pet_number값은 넘어가냐 ㅅㅂ"+pet_number);
var shit = "${sessionScope.sessionHit}";

	 $.ajax({
			type: "post",
		    url: "liketo",
		    data:{"pet_number" : pet_number},
		     dataType: "text",
		    success: function(data){
		    	var output ="";
		    if(data =="1"){
		    	output += "<img src='"${pageContext.request.contextPath}+"/resources/petUploadFile/하투투.png'>";
		    	} else {
		    	output += "<img src='"${pageContext.request.contextPath}+"/resources/petUploadFile/하투.JPG'>";
		    }      
		    $("#a").html(output);
		    },
		    error: function(){
		      alert("아주뭔가 잘못이야");
		    }
		  });
	}


/* 분ㅇ양추천 취소 */
function like_func2(){
  var pet_number = "${DogView.pet_number}";
 console.log("pet_number값은 넘어가냐 ㅅㅂ"+pet_number);
  $.ajax({
	type: "GET",
    url: "likecancle",
    data:{"pet_number" : pet_number},
     dataType: "text",
    success: function(data){
    	var output ="";
    if(data =="0"){
    	output += "<img src='"${pageContext.request.contextPath}+"/resources/petUploadFile/하투.JPG'>";
    	} else {
    		output += "<img src='"${pageContext.request.contextPath}+"/resources/petUploadFile/하투투.png'>";
    }      
    $("#a").html(output);
    },
    error: function(){
      alert("아주뭔가 잘못이야2");
    }
  });
}

function idconfirm(){
	if(${sessionScope.sessionId == null}){
		alert('로그인 후 신청가능합니다.로그인 후 이용해주세요.');
		history.back();
	} else if(${sessionScope.sessionId != null}){
		idid.submit();
	}
	
}
</script>
</head>
<body>

<table style="margin-left: auto; margin-right: auto;">
<tr>
<th>펫번호</th><th>견종</th><th>나이</th><th>분양 가격</th> 
</tr>
<tr>
<td>${DogView.pet_number}</td>
<td>${DogView.pet_name}</td>
<td>${DogView.pet_live}</td>
<td>${DogView.pet_price}</td>
<td>${DogView.pet_price}</td>
</tr>
</table>
<br>
소개글 : ${DogView.pet_contents}
<br>
<iframe width="400" height="305" src="${DogView.pet_trailer}?autoplay=1" frameborder="0"></iframe><br>
<img id="hi" src="${pageContext.request.contextPath}/resources/petUploadFile/${DogView.pet_profile}">
<br>
<div id = "a">
<c:choose>
<c:when test="${(sessionScope.sessionHit eq '1')}">
<a href="javascript:like_func2();"><img src="${pageContext.request.contextPath}/resources/petUploadFile/하투투.png">${DogView.pet_hit}</a>
</c:when>
<c:otherwise>
<a href="javascript:like_func();"><img src="${pageContext.request.contextPath}/resources/petUploadFile/하투.JPG">${DogView.pet_hit}</a>
</c:otherwise>
</c:choose>
</div>
<form action="goadopt" method="post" name="idid"> 
<input type="text" name="a_petnumber" value="${DogView.pet_number}">
<input type="hidden" name="a_petcategorie" value="${DogView.pet_kategorie}">
<input type="hidden" name="a_petname" value="${DogView.pet_name}">
<input type="hidden" name="a_petprice" value="${DogView.pet_price}">
</form>
<c:if test="${sessionScope.sessionId ne 'admin'}">
<button onclick="idconfirm()">분양신청</button>
</c:if>
</body>
</html>