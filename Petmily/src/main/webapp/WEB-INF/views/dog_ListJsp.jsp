<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{
border: 8px solid #FF6464;
border-radius: 10px;
display:block;
margin : 30px;
clear : nono;
-moz-border-radius: 7px;
-khtml-border-radius: 7px;
-webkit-border-radius: 7px;
float : left;

}
div:hover{
float : left;
clear : nono;
border: 8px solid #800080;
border-radius: 7px;
-moz-border-radius: 7px;
-khtml-border-radius: 7px;
-webkit-border-radius: 7px;
display:block;
margin : 30px;
}
img{
width : 300px;
height :400px;

}
#1,#2{
width : 10px;
height :20px;

}



</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* 좋아요 */
function like_func(num){
 
console.log("pet_number값은 넘어가냐 ㅅㅂ"+pet_number);
var pet_number = num;
  $.ajax({
	type: "GET",
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
function like_func2(num){
 console.log("pet_number값은 넘어가냐 ㅅㅂ"+pet_number);
 var pet_number = num;
  $.ajax({
	type: "GET",
    url: "likecancle",
    data:{"pet_number" : pet_number},
     dataType: "text",
    success: function(data){
    	var output ="";
    if(data =="0"){
    	output += "<img src='"${pageContext.request.contextPath}+"/resources/petUploadFile/하투.JPG'>";
    	} 
    
    if(data =="1"){
    		output += "<img src='"${pageContext.request.contextPath}+"/resources/petUploadFile/하투투.png'>";
    }      
    $("#a").html(output);
    },
    error: function(){
      alert("아주뭔가 잘못이야2");
    }
  });
}

</script>
</head>
<body>

<h2>미분양된 강아지 리스트all </h2>

<c:forEach var="List" items="${Pet_Dog_allList}">
<div>
<a href="Pet_Dog_View?pet_number=${List.pet_number}"><img src="${pageContext.request.contextPath}/resources/petUploadFile/${List.pet_profile}"></a><br>

<c:choose>
<c:when test="${(sessionScope.sessionHit eq '1')}">
<a href="javascript:like_func2(${List.pet_number});"><img id ="1" src="${pageContext.request.contextPath}/resources/petUploadFile/하투투.png">${List.pet_hit}</a>
</c:when>
<c:otherwise>
<a href="javascript:like_func(${List.pet_number});"><img id ="2" src="${pageContext.request.contextPath}/resources/petUploadFile/하투.JPG">${List.pet_hit}</a>
</c:otherwise>
</c:choose>

${List.pet_name}
</div>
</c:forEach>

</body>
</html>