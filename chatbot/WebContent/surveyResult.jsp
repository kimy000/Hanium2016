<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap core CSS -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/jumbotron-narrow.css" rel="stylesheet">
<title>여행 설문조사 결과</title>
</head>
<body>
 <div class="container">
    <div class="header clearfix">
	<nav>
	<ul class="nav nav-pills pull-right">
            <li role="presentation"><a href="playInfo.html">경기일정/정보</a></li>
            <li role="presentation"><a href="cheer.html">응원댓글</a></li>
            <li role="presentation" class="active"><a href="survey.jsp">설문</a></li>
          </ul>
	</nav>
	<h3 class="text-muted">평창동계올림픽</h3>
	</div>
	<h2>여행 설문조사 결과</h2>
	<div>
	<table>
	<tr><td>장소</td><td><% %></td></tr>
	<tr><td>식사</td><td><% %></td></tr>
	<tr><td>카페</td><td><% %></td></tr>
	<tr><td colspan=2><input type="submit" value="지도보기"><input type="button" value="수정하기" onclick="courseEdit()"></td></tr>
	</table>
	</div>
	
	
	<footer><h3 class="text-muted" align="center">평창봇</h3></footer>
</div>
</body>
</html>