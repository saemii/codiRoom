<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/hanna.css">
<script type="text/javascript">
	$(function(){
		$("#joinCom").click(function(){
			var id = $("#id").val();
			var pw = $("#pw").val();
			var pwc = $("#pwc").val();
			var name = $("#name").val();
			var birth = $("#birth").val();
			var gender = $('input:radio[name=gender]:checked').val();
			var tel0 = $("#tel0").val();
			var tel1 = $("#tel1").val();

			var check = false;
			if(id == '') {
				alert('이메일을 입력하세요.');
				$("#id").focus();
				return check;
			}
			var emailChar =  /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		        if(emailChar.test(id) == false){
		        	alert("이메일 형식이 아닙니다.");
		        	$("#id").focus();
		        	return check;
		        }
			//아이디 중복 체크 했는지
		/* 	if(idCount == '0') {
				alert('아이디 중복체크를 해 주세요.');
				$("#id").focus();
				return false;
			} */
			if(pw == ''){
				alert("패스워드를 입력해주세요.");
				$("#pw").focus();
				return check;
			}
			if($("#pw").val().length < 4){
				alert("비밀번호는 4자리 이상으로 입력해주세요.")
				$("#pw").focus();
				return check;
			}
			if(pwc == ''){
				alert("패스워드 확인을 입력해주세요.");
				$("#pwc").focus();
				return check;
			}
			if(pw != pwc){
				alert("패스워드와 패스워드 확인이 다릅니다.");
				 $("#pw").val("");
				 $("#pwc").val("");
				 $("#pw").focus();
				return check;
			}
			if(name == '') {
				alert("이름을 입력하세요.");
				$("#name").focus();
				return check;
			}
			var nameChar = /[가-힣]/;
			for(var i=0; i<name.length; i++){
		        if(nameChar.test(name.charAt(i)) == false ){
		        	alert("올바른 이름 형식이 아닙니다.");
		        	$("#name").focus();
		        	return check;
		        }
			}
			//생일
			if(birth == '') {
				alert('생년월일을 입력해 주세요.');
				$("#birth").focus();
				return check;
			}
			//성별​​
			if(gender == '' || gender == null) {
				alert('성별을 선택해 주세요.');
				return check;
			}
			if(tel0 == ''){
				alert("통신사를 입력해주세요.");
				$("#tel0").focus();
				return check;
			}
			if(tel1 == ''){
				alert("전화번호를 입력하세요.");
				$("#tel1").focus();
				return check;
			}
			var telChar = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})[0-9]{3,4}[0-9]{4}$/;
			 if(telChar.test(tel1) == false){
		        	alert("전화번호 형식이 다릅니다.");
		        	$("#tel1").focus();
		        	return check;
		        }
			if($("#tel1").val().length < 10){
				alert("전화번호를 입력해주세요.")
				$("#tel1").focus();
				return check;
			}
			check = true;
			if(check == true){
				alert(1);
				$("#jfrm").submit();
			}
		});
	});
	
function telCheck() {
	var tel1 = $("#tel1").val();
	var telChar = /[0-9]/;
	for(var i=0; i<tel1.length; i++){
        if(telChar.test(tel1.charAt(i)) == false ){
        	alert("잘못입력하였습니다..");
        	$("#tel1").focus();
        	return false;
        }
	}
};


//ID 중복 체크
function idCheck() {
	
}




</script>
<style>
.navbar{
	font-family: 'Hanna', sans-serif;
}
.separator {
    background: none;
    height: 34px;
    text-align: center;
}
.separator > span {
	background-color: #fff;
    display: inline-block;
    padding: 8px;
    font-size: 14px;
    font-weight: bold;
    color: #767676;
    margin-top: 0px;
    margin-bottom: 10px;
}
.separator > hr {
    margin: -25px auto 10px;
    width: 100%;
}
.decorative-input {
    background-image: url(/codi/resources/images/header/login-icon.png);
    background-repeat: no-repeat;
    background-position: right 15px;
    font-size: 14px;
    height: 50px;
    padding: 10px 35px 10px 10px;
    background-size: 40px 171px;
}	
#idL{
	background-position: right -28px;
	height: 64px;
}
#pwL{
	background-position: right -76px;
	height: 64px;	
}
.loginBtn{
	background-color:#1a1a1a;
	color:white;
	height: 64px;
}
.loginBtn:HOVER {
	background-color: #333333;
	color:white;
}
.fLoginBtn{
	background-color:#3B5998;
	color:white;
	height: 64px;
	font-size:16px;
}
.fLoginBtn:HOVER{
	color:white;
	background-color:#4568b2;
}
.nLoginBtn{
	background-color:#1eb501;
	color:white;
	height: 64px;
	font-size:16px;
}
.nLoginBtn:HOVER{
	color:white;
	background-color:#23cb01;
}
/* JOIN MODAL */
#id{
	background-position: right -35px;
}
#pw{
	background-position: right -85px;
}
#pwc{
	background-position: right -85px;
}

</style>
<div class="container-fluid">
	<nav class="navbar navbar-inverse navbar-fixed-top"
		style="z-index: 100;" id="header">
		<div class="container">
			<div class="navbar-header">
				<h1 style="margin-top: 40px;">
					<a href="${pageContext.request.contextPath}/"><img
						src="${pageContext.request.contextPath}/resources/images/ci2.png"
						alt="MAPSSI"></a>
				</h1>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
	
				<ul class="nav navbar-nav" style="margin-top: 60px; margin-left: 50px;">
					<!--  test li s -->
	
					<li><a href="${pageContext.request.contextPath}/basket/basketList">BASKET</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList">ITEM</a></li>
					<li><a href="${pageContext.request.contextPath}/basket/log">TESTLOGIN</a></li>
					
	
					<!--  test li e -->
	
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a
						href="${pageContext.request.contextPath}/board/findList?board_kind=1">고객센터</a></li>
					<!-- 기본적으로 notice로 가게 -->
					<li><a href=""><span
							class="glyphicon glyphicon-shopping-cart"></span> CART</a></li>
					<c:if test="${sessionScope.member eq null}">
						<li><a href="" data-toggle="modal" data-target="#loginModal"
							data-backdrop="true"><span class="glyphicon glyphicon-log-in"></span>
								LOGIN</a></li>
						<li><a href="" data-toggle="modal" data-target="#signModal"
							data-backdrop="true"><span class="glyphicon glyphicon-user"></span>
								Sign Up</a></li>
					</c:if>
					<c:if test="${sessionScope.member ne null}">
						<li><a href="${pageContext.request.contextPath}/member/myPage?subMenu=showMyinfo">MY PAGE</a></li>
						<li><a href="${pageContext.request.contextPath}/member/memberLogout">LOGOUT</a></li>
					</c:if>
				</ul>
				<form class="navbar-form navbar-right" style="margin-left: 200px;">
					<!-- <div class="col-lg-6"> -->
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search Product"> <span
							class="input-group-btn"> <a class="btn btn-default"
							type="button"><span class="glyphicon glyphicon-search"></span></a>
						</span>
					</div>
					<!-- /input-group -->
				</form>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
</div>
<!-- Modal -->
<div class="modal fade" id="loginModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">LOGIN</h4>
			</div>
			<div class="modal-body">
				<form action="" >
					<input type="submit" class="btn btn-default form-control fLoginBtn" value="페이스북 계정으로 로그인">
				</form>
				<form action="" >
					<input type="submit" class="btn btn-default form-control nLoginBtn" value="네이버 계정으로 로그인">
				</form>
				<div class="separator">
				    <span class="separator-text">또는</span>
				    <hr>
				</div>
				<form action="${pageContext.request.contextPath}/member/memberLogin" method="post">
					<div class="form-group"  style="color:#eee;">
						<input type="email" class="form-control decorative-input" id="idL" name="id" maxlength="30" placeholder="이메일" style="height: ">
					</div>
					<div class="form-group">
						<input type="password" class="form-control decorative-input" id="pwL" name="pw" maxlength="15" placeholder="비밀번호">
					</div>
					<input type="submit" class="btn btn-default form-control loginBtn" value="LOGIN">
				</form>
			</div>
			<div class="modal-footer">
				<span>취향저격의 계정이 없으세요?</span>
				<button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal" data-target="#signModal">회원 가입</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="signModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">SIGN IN</h4>
			</div>
			<div class="modal-body">
				<form action="${pageContext.request.contextPath}/member/memberJoin" method="post" name="jfrm" id="jfrm">
					<div class="form-group">
						<input type="email" class="form-control decorative-input" id="id" name="id" maxlength="30" placeholder="이메일">
					</div>
					<div class="form-group">
						<input type="password" class="form-control decorative-input" id="pw" name="pw" maxlength="15" placeholder="비밀번호">
					</div>
					<div class="form-group">
						<input type="password" class="form-control decorative-input" id="pwc" name="pwc" maxlength="15" placeholder="비밀번호 확인">
					</div>
					<div class="form-group">
						<input type="text" class="form-control decorative-input" id="name" name="name" maxlength="10" placeholder="이름">
					</div>
					<div class="form-group">
						<input type="date" class="form-control decorative-input" id="birth" name="birth" placeholder="생년월일을 입력하세요">
					</div>
					<div class="form-group">
						<label for="gender">GENDER</label>
						<label class="radio-inline"><input type="radio" class="gender" name="gender" value="men">Men</label> 
						<label class="radio-inline"><input type="radio" class="gender" name="gender" value="women">Women</label>
					</div>
					<div class="form-group form-group-sm">
						<div>
							<label for="tel">TEL</label>
						</div>
						<div class="col-sm-12">
							<span class="col-sm-3"> <select class="form-control" id="tel0" name="tel0">
								<option value="">통신사 선택</option>
								<option value="SKT">SKT</option>
								<option value="KT">KT</option>
								<option value="LGU">LGU</option>
							</select>
							</span>
							<span class="col-sm-3">
							 <input type="tel" class="form-control" id="tel1" name="tel1" maxlength="11" placeholder="'-' 없이 입력해주세요." onkeyup="telCheck()">
							</span>
						</div>
					</div>
					<div class="form-group" style="height: 15px;"></div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="joinCom" class="btn btn-md btn-success">Sign
					In</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>