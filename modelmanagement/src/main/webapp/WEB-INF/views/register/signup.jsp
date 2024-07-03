<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<!-- Sign up form -->
	<section class="signup">
		<div class="container">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">Sign up</h2>
					<form:form method="POST" class="register-form" id="register-form"
						modelAttribute="registerForm" accept-charset="UTF-8">
						<div class="form-group" style="margin-bottom: 0">
							<form:label path="username">
								<i class="zmdi zmdi-account material-icons-name"></i>
							</form:label>
							<form:input type="text" path="username" id="username"
								placeholder="User Name" required="required" value="" min="6"/>
						</div>
						<p class="notifyerror" style="margin: 0; padding: 0; color: red"></p>

						<div class="form-group" style="margin-bottom: 0">
							<form:label path="email">
								<i class="zmdi zmdi-email"></i>
							</form:label>
							<form:input type="email" path="email" id="email"
								placeholder="Your Email" required="required" />
						</div>
						<p class="notifyerror" style="margin: 0; padding: 0; color: red"></p>

						<div class="form-group" style="margin-bottom: 0">
							<form:label path="password">
								<i class="zmdi zmdi-lock"></i>
							</form:label>
							<form:input type="password" path="password" id="password"
								placeholder="Password" required="required" />
						</div>
						<p class="notifyerror" style="margin: 0; padding: 0; color: red"></p>

						<div class="form-group" style="margin-bottom: 0">
							<form:label path="repassword">
								<i class="zmdi zmdi-lock-outline"></i>
							</form:label>
							<form:input type="password" path="repassword" id="repassword"
								placeholder="Repeat your password" required="required" />
						</div>
						<p class="notifyerror" style="margin: 0; padding: 0; color: red"></p>

						<div class="form-group" style="margin-bottom: 0">
							<form:label path="name">
								<i class="zmdi zmdi-account material-icons-name"></i>
							</form:label>
							<form:input type="text" path="name" id="name"
								placeholder="Your Name" required="required" />
						</div>
						<p class="notifyerror" style="margin: 0; padding: 0; color: red"></p>

						<div class="form-group" style="margin-bottom: 0">
							<form:label path="phone">
								<i
									class="zmdi zmdi-smartphone-android zmdi-hc-fw material-icons-name"></i>
							</form:label>
							<form:input type="number" path="phone" id="phone"
								placeholder="Phone number" required="required" />
						</div>
						<p class="notifyerror" style="margin: 0; padding: 0; color: red"></p>

						<div class="form-group" style="margin-bottom: 0">
							<form:radiobutton path="gender" id="male" name="gender" value="true" style="width: 5%;margin: 0;display: inline-block;" checked = "checked" />&nbsp;Male
							<br> <form:radiobutton path="gender"
								id="female" name="gender" value="false" style="width: 5%;margin: 0;display: inline-block;" />&nbsp;Female
						</div>

						<div class="form-group" style="margin-bottom: 0">
							<form:checkbox path="agreeterm" id="agree-term"
								class="agree-term" style="display: inline-block" checked = "checked"/>
							<form:label path="agreeterm" class="label-agree-term">
								<span><span></span></span>I
								agree all statements in <a href="#" class="term-service">Terms
									of service</a>
							</form:label>
						</div>
						<p class="notifyerror" style="margin: 0; padding: 0; color: red"></p>
						
						<div class="form-group form-button">
							<button formaction="<%=contextPath%>/register" id="signup"
								class="form-submit" style="border: none; outline: none">Register</button>
						</div>
						<p class="notifyerror" style="margin: 0; padding: 0; color: red"></p>
					</form:form>
				</div>
				<div class="signup-image">
					<figure>
						<a href="http://localhost:8080/model/home">
							<img
								src="<%=contextPath%>/resources/register/images/signup-image.jpg"
								alt="sing up image">
						</a>
						
					</figure>
					<a href="<c:url value="/login"/>" class="signup-image-link">I am already member</a>
				</div>
			</div>
		</div>
	</section>
	<script>
		
	let listForUserName = [];
	let listForEmail = [];
	<c:forEach items="${model}" var="listItem">
	  var arrUser = [];
	  var arrEmail = [];

	  arrUser.push("<c:out value="${listItem.username}" />");
	  
	  arrEmail.push("<c:out value="${listItem.email}" />");

	  listForUserName.push(arrUser);
	  listForEmail.push(arrEmail);
	</c:forEach>
	
	const registerForm = document.querySelector('#register-form');
	const agreeTerm = document.querySelector('#agree-term');
	const signUp = document.querySelector('#signup');
	const userName = document.querySelector('#username');
	const passWord = document.querySelector('#password');
	const repassWord = document.querySelector('#repassword');
	const nameUser = document.querySelector('#name');
	const phoneUser = document.querySelector('#phone');
	const emailUser = document.querySelector('#email');
	const notifyError = document.querySelectorAll('.notifyerror');

	const REGX = /^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/;

	const SPECIAL_CHARACTER = "!@#$%^&*()_+-=|][';/.,<>?:'";

	let count = 0;

	for (let i = 0; i < notifyError.length; i++) {
		notifyError[i].innerHTML = 'Invalid';
		notifyError[i].style.visibility = "hidden";
	}

	const checkUserName = () => {

		notifyError[0].style.visibility = "visible";

		notifyError[0].innerHTML = 'Invalid. Must be 6 character and not exist special character';

		for (let i = 0; i < userName.value.length; i++) {
			if (SPECIAL_CHARACTER.includes(userName.value[i])) {
				return false;
			}
		}

		if (userName.value.length < 6) {
			notifyError[0].style.color = "red";
			return false;
		} else {
			
			for (let i = 0; i < listForUserName.length; i++) {
				if (listForUserName[i] == userName.value) {
					notifyError[0].innerHTML = 'Invalid. User existed';
					notifyError[0].style.color = "red";
					return false;
				}
			}
			
			notifyError[0].innerHTML = 'OK';
			notifyError[0].style.color = "green";
			return true;
		}
	};

	const checkEmail = () => {

		notifyError[1].style.visibility = "visible";

		notifyError[1].innerHTML = 'Invalid. Must be format xxxxx@x.x[...]';

		if (emailUser.value.match(REGX)) {
			notifyError[1].innerHTML = 'OK';
			notifyError[1].style.color = "green";
			
			for (let i = 0; i < listForEmail.length; i++) {
				if (listForEmail[i] == emailUser.value) {
					notifyError[1].innerHTML = 'Invalid. Email existed';
					notifyError[1].style.color = "red";
					return false;
				}
			}
			
			return true;
		} else {
			notifyError[1].style.color = "red";
			return false;
		}
	};

	const checkPassWord = () => {
		notifyError[2].style.visibility = "visible";

		notifyError[2].innerHTML = 'Invalid. Must be 6 character and least has a special letter';

		if (passWord.value.length < 6) {
			notifyError[2].style.color = "red";
			return false;
		} else {
			for (let i = 0; i < passWord.value.length; i++) {
				if (SPECIAL_CHARACTER.includes(passWord.value[i])) {
					count++;
				}
			}
		}

		if (count > 0) {
			notifyError[2].innerHTML = 'OK';
			notifyError[2].style.color = "green";
			return true;
		} else {
			notifyError[2].style.color = "red";
			return false;
		}

	};

	const checkRePassWord = () => {
		notifyError[3].style.visibility = "visible";

		notifyError[3].innerHTML = 'Invalid. Not Match';

		if (repassWord.value === passWord.value) {
			notifyError[3].innerHTML = 'OK';
			notifyError[3].style.color = "green";
			return true;
		}

		notifyError[3].style.color = "red";
		return false;
	};

	const checkName = () => {

		notifyError[4].style.visibility = "visible";

		notifyError[4].innerHTML = 'Invalid. Must be 6 character and not exist special character';

		for (let i = 0; i < nameUser.value.length; i++) {
			if (SPECIAL_CHARACTER.includes(nameUser.value[i])) {
				notifyError[4].style.color = "red";
				return false;
			}
		}

		if (nameUser.value.length < 6) {
			notifyError[4].style.color = "red";
			return false;
		} else {
			notifyError[4].innerHTML = 'OK';
			notifyError[4].style.color = "green";
			return true;
		}

	};

	const checkPhone = () => {
		notifyError[5].style.visibility = "visible";

		notifyError[5].innerHTML = 'Invalid. Must be from 9 to 11.';

		if (phoneUser.value.length < 9 || phoneUser.value.length > 11 || parseInt(phoneUser.value) < 0) {
			notifyError[5].style.color = "red";
			return false;
		} else {
			notifyError[5].innerHTML = 'OK';
			notifyError[5].style.color = "green";
			return true;
		}
	};

	userName.addEventListener('keyup', checkUserName);
	passWord.addEventListener('keyup', checkPassWord);
	repassWord.addEventListener('keyup', checkRePassWord);
	nameUser.addEventListener('keyup', checkName);
	phoneUser.addEventListener('keyup', checkPhone);
	emailUser.addEventListener('keyup', checkEmail);

	signUp.addEventListener('click', function(event) {

		console.log(checkUserName(), checkPassWord(), checkRePassWord(), checkName(), checkPhone(), checkEmail());

		if (checkUserName() === false || checkPassWord() === false || checkRePassWord() === false || checkName() === false || checkPhone() === false || checkEmail() === false || agreeTerm.checked === false) {
			event.preventDefault();
			notifyError[7].style.visibility = "visible";
			notifyError[7].innerHTML = 'Invalid. Try again';
		} else {
			registerForm.addEventListener('submit', function(event) {
				registerForm.action = "/model/register";
			});
		}
	});

	
	</script>
</body>
</html>