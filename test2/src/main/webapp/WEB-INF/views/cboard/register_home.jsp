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

<title>Klaiver 회사정보 입력페이지(home)</title>
<link href="../resources/images/favicon.png" rel="shortcut icon"
	type="image/png" />
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Noto+Sans' />
<link rel='stylesheet' type='text/css' href='../resources/css/join.css' />

<script src="../resources/js/jquery-1.11.2.js"></script>
<script>
	$(document).ready(function() {
		$("#submit").click(function() {
			var form = $("#form1")[0];
			var formData = new FormData(form); 
			// 파일
			formData.append("test1", $("#imageFile")[0].files[0]);
			formData.append("test1_1", $("#imageFile1")[0].files[0]);
			// 문자열
			formData.append("test2", "String 문자열");
			// 숫자
			formData.append("test3", "12345");
			// 내용
			formData.append("test4", "context");
			
			$.ajax({
				url: './register_home', 
				// 앞에서 지정한 formData
				data: formData, 
				processData: false, 
				contentType: false, 
				type: 'POST',
				success: function(data){ 
					location.href="../cboard/register_about";
					} 
				});
		});

		$('#icon li').mouseenter(function() {
			$(this).find('.cover').stop().fadeIn(200);
		});

		$('#icon li').mouseleave(function() {
			$(this).find('.cover').stop().fadeOut(200);
		});
		$("#city_id").change(function() {
			var country = $("#country1 option:selected").text();
			var city = $("#city_id option:selected").text();
			$("#country").val(country+"/"+city); 
		});
		//
	});
</script>
<script>
         function resize(obj) {
             obj.style.height = "1px";
             obj.style.height = (20 + obj.scrollHeight) + "px";
             $("body").scrollTop($(document).height());
         }
    </script>
<script type="text/javascript">
	$(document).ready(function() {
		
		if ($("select[name='country1']").val() != "")
			getid();

		$("select[name='country1']").on("change", getid);

	});

	function getid() {
		var selected_ = $("select[name='country1']").val();
		$.getJSON("./registerhome/" + selected_, function(clist) {
			var htmlStr = "<option value=''>구</option>";
			$(clist).each(
					function(key, val) {
						console.log("val.city_number: " + val.city_number);
						console.log("val.city :" + val.city);
						htmlStr += "<option value='"+ val.city +"'>" + val.city
								+ "</option>";
					});
			$("select[name='city']").html(htmlStr);

		});
	}
</script>
<script type="text/javascript">
	function reload() {
		if (window.opener) {
			window.opener.document.location.href = window.opener.document.URL;
		}
	}
</script>

</head>
<body onload="javascript:reload();">
	<header>
		<div id="ci">
			<a href="../home"><img src="../resources/images/ci.png"
				alt="Klaiver" /></a>
		</div>
		<form id="Integrated_search" name="Integrated_search" method="get"
			action="#">
			<input type="text" id="search" name="qa_text" placeholder="ex)기업명, 대표자명, 이메일, 산업군" />
			<input type="image" id="search_btn"
				src="../resources/images/search_btn.png" alt="검색" />
		</form>
		<ul id="icon">
			<li class="icon1"><a href="../member/individual?keyword=${sessionScope.login}">
			<div class="cover"></div><img src="../resources/images/icon1.png" alt="개인페이지"/>
           <c:if test="${fn:length(updatenewpost) ne 0}">new</c:if>
           </a></li>
			<li class="icon2"><a
				href="../cboard/companylist?userid=${sessionScope.login}"><div
						class="cover"></div> <img src="../resources/images/icon2.png"
					alt="기업페이지" /></a></li>
			<li class="icon3"><a href="../klogin/logout"><div
						class="cover"></div> <img src="../resources/images/icon3.png"
					alt="로그아웃" /></a></li>
		</ul>
	</header>

	<!------------==============================  콘텐츠 영역  ==============================------------>
	<section id="container">
		<div id="paper">
			<!----기업등록 공통---->
			<div id="top_bg">
				<div id="color_box"></div>
			</div>

			<div id="company_profile">
				<div id="company_img"></div>
				<!--기업프로필이미지-->
				<div id="company_info">
					<!--기업정보-->
					<div id="company_name">회사등록</div>
					<div id="company_type">1.Home</div>

				</div>
			</div>
		</div>
		<!----기업 콘텐츠---->

		<div id="join_wrap">
		
			<form id="form1" method="post" encType="multipart/form-data" role="form" name="joinForm" >
				<div class="data_box">
					<p>회사소개/인사말</p>
					<textarea id="intro_company" name="introduce" wrap="hard" onkeyup="resize(this)"></textarea>
					<p>업장사진</p>
					<div class="file_input">
						<input type="file" id="imageFile"  />
					</div>
					<p>프로필 사진</p>
					<div class="file_input">
						<input type="file" id="imageFile1"  />
					</div>
					<p>도시,국가</p>
					<div class="info_box">
						<select class="info" name="country1" id="country1">
							<option value="">시</option>
							<c:forEach items="${clist}" var="CountryVO">
								<option value="${CountryVO.country}">${CountryVO.country}</option>
							</c:forEach>
						</select> <select class="info" name="city" id="city_id">
							<option value="">구</option>
						</select>
					</div>
					<input class="info_enter" type="hidden" id="country" name="country"/>

					<button class="prev_page" type="button" onclick="history.go(-1);">이전</button>
					<button class="next_page" type="button" id="submit">다음</button>
				</div>
			</form>
		</div>
	</section>
</body>
</html>