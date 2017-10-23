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
    
    <title>Klaiver 회사정보 입력페이지(최종 정보 확인)</title>
    <link href="../resources/images/favicon.png" rel="shortcut icon" type="image/png" />
    <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Noto+Sans' />
    <link rel='stylesheet' type='text/css' href='../resources/css/join.css' />

    <script src="../resources/js/jquery-1.11.2.js"></script>
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
        <div id="ci"><a href="../home"><img src="../resources/images/ci.png" alt="Klaiver"/></a></div>
        <form id="Integrated_search" name="Integrated_search" method="get" action="#">
            <input type="text" id="search" name="qa_text" placeholder="ex)기업명, 대표자명, 이메일, 산업군"  />
            <input type="image" id="search_btn" src="../resources/images/search_btn.png" alt="검색"/>
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
           <li class="icon3"><a href="../klogin/logout"><div class="cover"></div><img src="../resources/images/icon3.png" alt="로그아웃"/></a></li>
        </ul>
    </header>

    <!------------==============================  콘텐츠 영역  ==============================------------>
    <section id="container">
    <form method="post" role='form'>
    	<input type="hidden" name="first" value="${getcodeid.first}">
    	<input type="hidden" name="last" value="${getcodeid.last}">
    	<input type="hidden" name="title" value="${getcodeid.title}">
    	<input type="hidden" name="country" value="${K_homeVO.country}">
        <div id="finish_box">
            <p id="upper_text">등록이 완료 되었습니다. 확인을 누르면 회사페이지로 이동 됩니다.</p>
            
            <table id="finish_table">
                <tr>
                    <td colspan="4" class="subtitle">회사소개/인사말</td>
                </tr>
                <tr>
                    <td colspan="4">${K_homeVO.introduce}</td>
                </tr>
                <tr>
                    <td colspan="4" class="subtitle">사용자 지정관련 해쉬태그</td>
                </tr>
                <tr>
                    <td colspan="4">${K_homeVO.hashtag}</td>
                </tr>
                <tr>
                    <td class="subtitle">도시/국가</td>
                    <td>${K_homeVO.country}</td>
                    <td class="subtitle">사업장 현황</td>
                    <td>${K_aboutVO.businessStatus}</td>
                </tr>
                 <tr>
                    <td class="subtitle">기업명</td>
                    <td>${K_aboutVO.compname_kr}</td>
                    <td class="subtitle">영문 기업명</td>
                    <td>${K_aboutVO.compname_en}</td>
                </tr>
                <tr>
                    <td class="subtitle">매출액</td>
                    <td>${K_aboutVO.businessStatus}</td>
                    <td class="subtitle">당기순이익</td>
                    <td>${K_aboutVO.netincome}</td>
                    
                </tr>
                <tr>
                    <td class="subtitle">자본금</td>
                    <td>${K_aboutVO.capital}</td>
                    <td class="subtitle">기업형태</td>
                    <td>${K_aboutVO.businessType}</td>
                </tr>
               
                
                <tr>
                    <td class="subtitle">설립일</td>
                    <td>${K_aboutVO.establish}</td>
                    <td class="subtitle">대표자명</td>
                    <td>${K_aboutVO.repname}</td>
                </tr>
                <tr>
                    <td class="subtitle">전화번호</td>
                    <td>${K_aboutVO.phonenumber}</td>
                    <td class="subtitle">업종명</td>
                    <td>${K_aboutVO.businessname}</td>
                </tr>
                <tr>
                    <td class="subtitle">Fax</td>
                    <td>${K_aboutVO.fax}</td>
                    <td class="subtitle">주요상품</td>
                    <td>${K_aboutVO.main_product}</td>
                </tr>
                <tr>
                    <td class="subtitle">Email</td>
                    <td>${K_contactVO.email}</td>
                    <td class="subtitle">업종현황</td>
                    <td>${K_aboutVO.businessStatus}</td>
                </tr>
                <tr>
                    <td class="subtitle">주소</td>
                    <td>${K_contactVO.address}</td>
                     <td class="subtitle">종업원 수</td>
                    <td>${K_aboutVO.employees}</td>
                </tr>
                <tr>
                    <td class="subtitle">조직도</td>
                    <td>${K_contactVO.organizationChart}</td>
                    <td class="subtitle">웹페이지</td>
                    <td>${K_aboutVO.homepage}</td>
                </tr>
                <tr>
                    <td colspan="2"><button class="prev_page" type="submit" onclick="history.go(-1);" >이전</button></td>
                    <td colspan="2"><button class="next_page" type="submit" id="submit">완료</button></td>
                </tr>
            </table>
         
            
        </div>
           </form>
    </section>
</body>
</html>