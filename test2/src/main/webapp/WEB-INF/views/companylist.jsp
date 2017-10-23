<%@page import="com.test.domain.PageMaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="description" content="실시간 기업정보 서비스, 페이지, 정보공유" />

<title>Klaiver</title>
<link href="../resources/images/favicon.png" rel="shortcut icon"
	type="image/png" />
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Noto+Sans' />
<link rel='stylesheet' type='text/css'
	href='./resources/css/klaiver.css' />
<script src="./resources/js/jquery-1.11.2.js"></script>
<script type="text/javascript">
function sendmemID(id,kr,en) {
	opener.setmemID(id);
	opener.setmemIDcom(kr,en);
	window.close();
}
</script>
</head>
<body>
	<!------------==============================  콘텐츠 영역  ==============================------------>
	<section id="container">
		<c:forEach items="${companylist}" var="companylist">
			<div><a href="javascript:sendmemID('${companylist.companyCode}','${companylist.comname_kr}','${companylist.comname_en}')">
			<input type="hidden" value="${companylist.companyCode}">
			${companylist.comname_kr}(${companylist.comname_en}) ${companylist.country}</a></div>
		</c:forEach>
	</section>
</body>

</html>