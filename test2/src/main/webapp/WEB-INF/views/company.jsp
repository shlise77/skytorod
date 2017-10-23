<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="description" content="실시간 기업정보 서비스, 페이지, 정보공유" />
    
     <title>Klaiver 회원가입 | 로그인 1</title>
    <link href="./resources/images/favicon.png" rel="shortcut icon" type="image/png" />
    <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Noto+Sans' />
    <link rel='stylesheet' type='text/css' href='./resources/css/main.css' />

    <script src="./resources/js/jquery-1.11.2.js"></script>
<script>

$(document).ready(function(){
	$('#login_btn').click(login);
	$("#pw").keypress(function(e) {					
		if (e.which=='13'){
			if ($("#pw").val()!="") {
				login();
			}
			return false;
		}
	});
	$('#submit').click(function() {
			$("#stage1").submit();
	});
	$("#company_btn").click(function() {
		opencompany();
	});
});
function opencompany() {
	event.preventDefault();
	var Url = "./companylist";
	var Option = "width=370, height=670, resizable=no, scrollbars=no, status=yes;"; 
	window.open(Url,"검사선택",Option);
}
 function setmemID(id) {
	document.getElementById("companyCode").value = id;
} 
function setmemIDcom(kr,en) {
	document.getElementById("company").value = kr+"("+en+")";
}
function login() {
	$.ajax({
		url:'./klogin/login',
		type:'POST',
		data:{
			email 		: $('#email').val(),
			password 	: $('#pw').val()
		},
		success:function(message){
			
			if(message == 'success'){
				alert('로그인');
				location.href="./home";
			}
			else if(message == 'fault'){
				alert('등록되지 않은 이메일이거나 패스워드가 맞지 않습니다');
			}
		},
		error:function(){
			alert('error');
		}
	});
}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		if ($("select[name='mc_number']").val() != "")
			getid();

		$("select[name='mc_number']").on("change", getid);
	});

	function getid() {
		var selected_mc_number = $("select[name='mc_number']").val();
		$.getJSON("./company/" + selected_mc_number, function(list) {
			var htmlStr = "<option value=''>업종</option>";
			$(list).each(
					function(key, val) {
						console.log("val.kc_number: "+val.kc_number);
						console.log("val.ks_name :"+val.ks_name);
						htmlStr += "<option value='"+ val.ks_name +"'>"
								+ val.ks_name + "</option>";
					});
			$("select[name='industry']").html(htmlStr);

		});
	}
	</script>
</head>
<body>
    <header>
        <div id="ci">
			<a href="./"><img src="./resources/images/ci.png"
				alt="Klaiver" /></a>
		</div>
        <div id="input_box">
            <input id="login_btn" type="button" title="로그인" value="로그인" />
            <span id="enter">
                <input type="password" id="pw" name="pw" placeholder="비밀번호" />
                <input type="email" id="email" name="email" placeholder="이메일" />
            </span>       
        </div>
    </header>
    <section id="container">
        <p id="side">SOCIAL NETWORKING SERVICE KLAIVER</p>

        <!------------==============================  회원가입 2단계  ==============================------------>
        <div id="Form_box">
            <p><img src="./resources/images/ci.png" alt="Klaiver"/></p>
            <p><strong>Klaiver 무료 회원가입</strong></p>
            <p>전 세계 기업의 실시간 정보를 만나보세요.</p>
            <form id="stage1" name="commonForm" method="post" >
                <div class="info_box">
                    <input class="info1" type="text" id="company" name="company" placeholder="회사명" readonly="readonly"
                    onclick="opencompany();"/>
                    <input class="info1" type="hidden" id="companyCode" name="companyCode"/>
                    <input class="info_btn" type="button" id="company_btn" value="검색" />
                    <input class="info" type="text" id="position" name="title" placeholder="직함" />
                    <p>산업군을 선택해 주세요.</p>
                    <select class="info half"  name="mc_number" id="mc_number" title="산업군">
                        <option value="">산업군</option>
						<c:forEach items="${list}" var="CategoryVO">
							<option value="${CategoryVO.mc_number}">${CategoryVO.mc_name}</option>
						</c:forEach>
                    </select>
                    <select class="info half"  name="industry" id="ks_id" title="산업">
                        <option value="">업종</option>
                    </select>
                </div>
                <p><a href="#">가입하면 <strong>Klaiver</strong>의 <strong>약관</strong> 및 <strong>개인정보처리방침</strong>에 동의하게 됩니다.</a></p>
                <button class="previous"  onclick="history.go(-1);" >이전</button>
                <button class="next" id="submit">다음</button>
            </form>
        </div>
    </section>
</body>
</html>