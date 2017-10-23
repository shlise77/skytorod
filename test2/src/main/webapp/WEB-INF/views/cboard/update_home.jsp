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
<title>Klaiver 회사정보 수정페이지(home)</title>
<link href="../resources/images/favicon.png" rel="shortcut icon"
	type="image/png" />
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Noto+Sans' />
<link rel='stylesheet' type='text/css'
	href='../resources/css/klaiver.css' />
<link rel='stylesheet' type='text/css' href='../resources/css/join.css' />
<script src="../resources/js/jquery-1.11.2.js"></script>
<script>
         function resize(obj) {
             obj.style.height = "1px";
             obj.style.height = (20 + obj.scrollHeight) + "px";
         }
    </script>
<script>
    // 이미지 클릭시 원본 크기로 팝업 보기
    function doImgPop(img) {
		if(img!='../resources/img/noimg.jpg'){
			img1 = new Image();
			img1.src = (img);
			imgControll(img);
		}
	}
      
    function imgControll(img){ 
     if((img1.width!=0)&&(img1.height!=0)){ 
        viewImage(img); 
      } 
      else{ 
         controller="imgControll('"+img+"')"; 
         intervalID=setTimeout(controller,20); 
      } 
    }
    function viewImage(img){ 
     W=img1.width; 
     H=img1.height; 
     O="width="+W+",height="+H+",scrollbars=yes"; 
     imgWin=window.open("","",O); 
     imgWin.document.write("<body topmargin=0 leftmargin=0>");
     imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;'>");
     imgWin.document.close();
    }
    </script>
               <script>
               function myComfollower(code){
               	var code = code;
                	var popUrl = "../member/soloComfollower?code="+code;
            		var windowW = 400;  // 창의 가로 길이
                   var windowH = 400;  // 창의 세로 길이
                   var left = Math.ceil((window.screen.width - windowW)/2);
                   var top = Math.ceil((window.screen.height - windowH)/2);
           		window.open(popUrl,"목록보기","l top="+top+", left="+left+", height="+windowH+", width="+windowW);
               }
    function myComfollowing(email){
    	var email = email;
     	var popUrl = "../member/soloComfollowing?email="+email;
 		var windowW = 400;  // 창의 가로 길이
        var windowH = 400;  // 창의 세로 길이
        var left = Math.ceil((window.screen.width - windowW)/2);
        var top = Math.ceil((window.screen.height - windowH)/2);
		window.open(popUrl,"목록보기","l top="+top+", left="+left+", height="+windowH+", width="+windowW);
    }
    </script>
<script>
         $(document).ready(function () {
             $('#icon li').mouseenter(function () {
                 $(this).find('.cover').stop().fadeIn(200);
             });

             $('#icon li').mouseleave(function () {
                 $(this).find('.cover').stop().fadeOut(200);
             });
             $("#city_id").change(function() {
     			var country = $("#country1 option:selected").text();
     			var city = $("#city_id option:selected").text();
     			$("#city").val(country+"/"+city); 
     		});
         });
    </script>
<script type="text/javascript">
$(document).ready(function () {
	$("#modify").click(function() {
		var form = $("#form1")[0];
		var formData = new FormData(form); 
		// 파일
		formData.append("test1", $("#imageFile")[0].files[0]);
		formData.append("test1_1", $("#imageFilecom")[0].files[0]);
		// 문자열
		formData.append("test2", "String 문자열");
		// 숫자
		formData.append("test3", "12345");
		// 내용
		formData.append("test4", "context");
		
		$.ajax({
			url: './update_home', 
			// 앞에서 지정한 formData
			data: formData, 
			processData: false, 
			contentType: false, 
			type: 'POST',
			success: function(data){ 
				var id = $("#userid").val();
				location.href="../cboard/readPage_home?code="+id;
				} 
			});
			});
	$("#search").keypress(
            function(e) {
               if (e.which == '13') {
                  if ($("#search").val() != "") {
                     var str = $("#search").val();
                     var regExp =  /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>\#$%&\'\"\\(\=]/gi;
             	     if(regExp.test(str)){
             	    	 var keyword = str.replace(regExp, "");
             	    	document.location.href = "../search/alllist?keyword="
                            + keyword;
             	    }else{
             	    	document.location.href = "../search/alllist?keyword="
                            + str;
             	    }
                     
                  } else {
                     alert("검색어를 입력하세요");

                  }
                  return false;
               }
            });
         $("#search_btn").click(
            function() {
               if ($("#search").val() != "") {
                  var keyword = $("#search").val();
                  var str = $("#search").val();
                  var regExp =  /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>\#$%&\'\"\\(\=]/gi;
          	     if(regExp.test(str)){
          	    	 var keyword = str.replace(regExp, "");
          	    	document.location.href = "../search/alllist?keyword="
                         + keyword;
          	    }else{
          	    	document.location.href = "../search/alllist?keyword="
                         + str;
          	    }
                  return false;
               } else {
                  alert("검색어를 입력하세요");
                  return false;
               }
            });
       $("#delpimage").click(function() {
           var fakehimgcom = $("#fakehimgcom").val();
           var companyCode = $("#companyCode").val();
           var hid = $("#hid").val();
           var result = confirm('삭제 하시겠습니까?');
           if(result) { 
              if(fakehimgcom=='noimg.jpg'){
                  alert("이미지가 없습니다.");
                  location.reload();
               }else{
                  $.ajax({
                     url: './delpimage', 
                     type: 'POST',
                     data: {fakehimgcom :fakehimgcom,
                    	 companyCode :companyCode
                     }
                     });
                  window.location.reload();
               }   
           }
           
        });
        $("#delcompanyimg").click(function() {
           var fakehimg = $("#fakehimg").val();
           var companyCode = $("#companyCode").val();
           var hid = $("#hid").val();
           var result1 = confirm('삭제 하시겠습니까?');
           if(result1) { 
              if(fakehimg=='noimg.jpg'){
                  alert("이미지가 없습니다.");
                  location.reload();
               }else{
                  $.ajax({
                     url: './delcompanyimg', 
                     type: 'POST',
                     data: {fakehimg :fakehimg,
                    	 companyCode :companyCode
                     }
                     });
                  window.location.reload();
               }   
           }
           
        });
});
</script>
<script>
$(document).ready(function() {
	if ($("select[name='country1']").val() != "")
		getid();

	$("select[name='country1']").on("change", getid);

});

function getid() {
var selected_ = $("select[name='country1']").val();
$.getJSON("./update_home/" + selected_, function(clist) {
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
		<form id="Integrated_search" name="Integrated_search" method="get">
			<input type="text" id="search" name="qa_text" placeholder="ex)기업명, 대표자명, 이메일, 산업군"/>
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
			<form id="form1" name="joinForm" role="form" method="post"
				encType="multipart/form-data">
				<!----기업페이지 공통---->
				<div id="top_bg">
					<div id="color_box"></div>
				</div>

				<div id="company_profile">
					<div id="company_img">
					
						<img src="../resources/img/${k_homeVO.pimage}" onclick="doImgPop('../resources/img/${k_homeVO.pimage}')"/> 
						<input type="button" id="delpimage" value="프로필사진 삭제">
					</div>
					<!--기업프로필이미지-->
					<div id="company_info">
						<!--기업정보-->
						<div id="company_name">${k_aboutVO.compname_kr}</div>
						<div id="company_type">${k_aboutVO.businessname}</div>
						<div id="company_loc">${k_homeVO.country}</div>
						<div>회사 프로필사진<input type="file" id="imageFilecom" /> 
						<input type="hidden"id="fakehimgcom"
								name="fakehimgcom" value="${k_homeVO.pimage}"></div>
						<ul id="page_move">
							<!--페이지 이동-->
							<li class="on"><a
								href="readPage_home?code=${k_homeVO.companyCode}">Home</a></li>
							<li><a href="readPage_about?code=${k_homeVO.companyCode}">About</a></li>
							<li><a href="readPage_product?code=${k_homeVO.companyCode}">Product</a></li>
							<li><a href="readPage_contact?code=${k_homeVO.companyCode}">Contact</a></li>
						</ul>
					</div>
					<div id="commu">
						<!-- 
                    <div id="follow_btn"> fllow botton
                        <button type="submit" id="follow" name="follow"  >Follow</button>
                        <button type="submit" id="message" name="message"  >Message</button>
                    </div> -->
						<div id="follow_num_home1">
							<!--팔로워/팔로잉-->
						<p>
						회사 팔로워 <span id="follower_num_home"><a href="#" onclick="myComfollower('${k_homeVO.companyCode}');">${followerComcount}</a></span>명
					</p>
						</div>
					</div>
				</div>

				<!----기업 콘텐츠---->
				<div id="join_wrap">

					<div>
						<p>회사소개/인사말</p>
						<textarea id="intro_company" wrap="hard" name="introduce"
							onkeyup="resize(this)">${k_homeVO.introduce}</textarea>
						<p>업장사진&nbsp;&nbsp;<input type="button" id="delcompanyimg" value="업상사진 삭제"></p>
						<div class="file_input">
							<input type="hidden" id="hid"name="hid" value="${k_homeVO.hid}">
							<input type="hidden" id="companyCode" name="companyCode"
								value="${k_homeVO.companyCode}" />
								<input type="hidden" id="companyCode" name="companyCode"
								value="${k_homeVO.companyCode}" />
							<div id="business_photo">
								<img src="../resources/img/${k_homeVO.companyimg}">
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="file" id="imageFile" /> <input type="hidden" id="fakehimg"
								name="fakehimg" value="${k_homeVO.companyimg}">
						</div>
						<p>도시,국가</p>
						<input class="info_enter" type="text" id="city" name="country"
							placeholder="ex. seoul, Korea" value="${k_homeVO.country}" readonly="readonly"/>
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

						<button class="prev_page1" type="button" id="modify">저장</button>
					</div>

				</div>
			</form>
		</div>

		<!------------==============================  메세지 박스  ==============================------------>
				<!-- 		팔로우리스트  			-->
		<%@ include file="../follow/followlist.jsp"%>

		<!-- 		팔로우리스트  			-->
	</section>
</body>
</html>