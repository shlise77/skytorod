﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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

<title>Klaiver 회사정보 수정페이지(about)</title>
<link href="../resources/images/favicon.png" rel="shortcut icon"
	type="image/png" />
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Noto+Sans' />
<link rel='stylesheet' type='text/css'
	href='../resources/css/klaiver.css' />
<link rel='stylesheet' type='text/css' href='../resources/css/join.css' />
<script src="../resources/js/jquery-1.11.2.js"></script>
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
        
    });
    </script>
    <script>
         function resize(obj) {
             obj.style.height = "1px";
             obj.style.height = (20 + obj.scrollHeight) + "px";
         }
    </script>
<script type="text/javascript">
$(document).ready(function () {
	 var formObj = $("form[role='form']");
		console.log(formObj);

	$("#modify").click(function() {
				formObj.submit();
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
});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		if ($("select[name='mc_number']").val() != "")
			getid();

		$("select[name='mc_number']").on("change", getid);
	});

	function getid() {
		var selected_mc_number = $("select[name='mc_number']").val();

		$.getJSON("../cboard/register_about/" + selected_mc_number, function(list) {
			var htmlStr = "<option value=''>업종</option>";
			$(list).each(
					function(key, val) {
						console.log("val.kc_number: " + val.kc_number);
						console.log("val.ks_name :" + val.ks_name);
						htmlStr += "<option value='"+ val.ks_name +"'>"
								+ val.ks_name + "</option>";
					});
			$("select[name='businessname']").html(htmlStr);

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
						class="cover"></div>
					<img src="../resources/images/icon3.png" alt="로그아웃" /></a></li>
		</ul>
	</header>

	<!------------==============================  콘텐츠 영역  ==============================------------>
	<section id="container">
		<div id="paper">
			<!----기업페이지 공통---->
			<div id="top_bg">
				<div id="color_box"></div>
			</div>

			<div id="company_profile">
				<div id="company_img">

					<img src="../resources/img/${k_homeVO.pimage}" onclick="doImgPop('../resources/img/${k_homeVO.pimage}')"/> 

				</div>
				<!--기업프로필이미지-->
				<div id="company_info">
					<!--기업정보-->
					<div id="company_name">${k_aboutVO.compname_kr}</div>
                    <div id="company_type">${k_aboutVO.businessname}</div>
                    <div id="company_loc">${k_homeVO.country}</div>
					<ul id="page_move">
						<!--페이지 이동-->
						<li><a href="readPage_home?code=${k_homeVO.companyCode}">Home</a></li>
						<li class="on"><a
							href="readPage_about?code=${k_homeVO.companyCode}">About</a></li>
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
				<form id="form2" name="joinForm" role="form" method="post">
					<div>
						<div class="array">
							<span>기업명</span> <input type="hidden" name="aid"
								value="${k_aboutVO.aid}"> <input type="hidden"
								name="companyCode" value="${k_aboutVO.companyCode}"> <input
								class="info_enter" type="text" id="input1" name="compname_kr"
								value="${k_aboutVO.compname_kr}" />
						</div>
						<div class="array">
							<span>영문 기업명</span> <input class="info_enter" type="text"
								id="input2" name="compname_en" value="${k_aboutVO.compname_en}" />
						</div>
						<div class="array">
							<span>기업형태</span> <input class="info_enter" type="text"
								id="input3" name="businessType" placeholder="ex. 개인, 상장, 대중소기업"
								value="${k_aboutVO.businessType}" />
						</div>
						<div class="array">
							<span>대표자명</span> <input class="info_enter" type="text"
								id="input4" name="repname" value="${k_aboutVO.repname}" />
						</div>
						<div class="array">

							<span>업종명</span> <select class="info_enter" name="mc_number"
								id="mc_number">
								<option value="">산업군</option>
								<c:forEach items="${list}" var="CategoryVO">
									<option value="${CategoryVO.mc_number}">${CategoryVO.mc_name}</option>
								</c:forEach>
							</select>
						</div>

						<div class="array">
							<select class="info_enter" name="businessname" id="ks_id">
								<option value="${k_aboutVO.businessname}">${k_aboutVO.businessname}</option>
							</select>
						</div>
						<div class="array">
							<span>주요상품</span> <input class="info_enter" type="text"
								id="input6" name="main_product"
								value="${k_aboutVO.main_product}" />
						</div>
						<div class="array">
							<span>인증현황</span> <input class="info_enter" type="text"
								id="input7" name="certificationStatus"
								value="${k_aboutVO.certificationStatus}" />
						</div>
						<div class="array">
							<span>종웝원 수</span> <input class="info_enter" type="text"
								id="input8" name="employees" value="${k_aboutVO.employees}" />
						</div>
						<div class="array">
							<span>웹페이지</span> <input class="info_enter" type="text"
								id="input9" name="homepage" value="${k_aboutVO.homepage}" />
						</div>
						<div class="array">
							<span>주소</span> <input class="info_enter" type="text"
								id="input10" name="address" value="${k_aboutVO.address}" />
						</div>
						<div class="array">
							<div class="h_array">
								<span>전화번호</span> <input class="h_infoBox" type="text"
									id="input11" name="phonenumber"
									value="${k_aboutVO.phonenumber}" />
							</div>
							<div class="h_array">
								<span class="t_p">Fax</span> <input class="h_infoBox"
									type="text" id="input12" name="fax" value="${k_aboutVO.fax}" />
							</div>
						</div>
						<div class="array">
							<span>사업장 현황</span> <input class="info_enter" type="text"
								id="input13" name="businessStatus" placeholder="ex. 지사, 대리점 현황"
								value="${k_aboutVO.businessStatus}" />
						</div>
						<div class="array">
							<div class="h_array">
								<span>매출액</span> <input class="h_infoBox" type="text"
									id="input14" name="take" value="${k_aboutVO.take}" />
							</div>
							<div class="h_array">
								<span class="t_p">자본금</span> <input class="h_infoBox"
									type="text" id="input15" name="capital"
									value="${k_aboutVO.capital}" />
							</div>
						</div>
						<div class="array">
							<div class="h_array">
								<span>당기순이익</span> <input class="h_infoBox" type="text"
									id="input16" name="netincome" value="${k_aboutVO.netincome}" />
							</div>
							<div class="h_array">
								<span class="t_p">설립일</span> <input class="h_infoBox"
									type="text" id="input17" name="establish"
									value="${k_aboutVO.establish}" />
							</div>
						</div>
						<span class="array">회사소개글</span>
						<textarea id="intro_company2" name="AboutUs" wrap="hard"
							onkeyup="resize(this)">${k_aboutVO.aboutUs}</textarea>

						<button class="prev_page1" type="button" value="수정" id="modify">저장</button>
					</div>
				</form>
			</div>
		</div>

		<!------------==============================  메세지 박스  ==============================------------>
		   <!-- 		팔로우리스트  			-->
		<%@ include file="../follow/followlist.jsp" %>
		
<!-- 		팔로우리스트  			-->
	</section>
</body>
</html>