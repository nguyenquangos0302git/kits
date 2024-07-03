<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file = "/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<section class="ftco-section">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><a href="<c:url value="/"/>"><img src="resources/web/images/signin-image.jpg" alt="sing up image"></a></figure>
                        <a href="<c:url value="/register"/>" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Log in</h2>
                        <c:if test="${param.invalid != null}">
					         <div style="color:red;font-size: 20px;">
					                Username or Password is wrong !!!
					         </div>
					    </c:if>
					    <c:if test="${param.accessDenied != null}">
					         <div style="color:red;font-size: 20px;">
					                No permission!!!
					         </div>
					    </c:if>
					    <c:if test="${param.cart != null}">
					         <div style="color:red;font-size: 20px;">
					               	Please login!!!
					         </div>
					    </c:if>
					    <c:if test="${empty ACCOUNT}">
	                        <form method="POST" class="register-form" id="login-form">
	                            <div class="form-group">
	                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
	                                <input type="text" name="username" id="username" placeholder="Username"/>
	                            </div>
	                            <div class="form-group">
	                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
	                                <input type="password" name="password" id="password" placeholder="Password"/>
	                            </div>
	                            <div class="form-group">
	                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
	                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
	                            </div>
	                           
	                            <div class="form-group form-button">
	                                <input type="submit" id="login" class="form-submit" value="Log in"/>
	                            </div>
	                        </form>
					    </c:if>
                        
                    </div>
                </div>
            </div>
        </section>
        <script>
            const formLogin = document.querySelector('#login-form');
            formLogin.addEventListener('submit',function () {
	               var data = {};
	               data["username"] = document.querySelector('#username').value;
	               data["password"] = document.querySelector('#password').value;
	               data["remember"] = document.querySelector('#remember-me').checked;
	               $.ajax({
	                    url : '${pageContext.request.contextPath}/api/login',
	                    type : 'post',
                        async : false,
	                    contentType : 'application/json',
	                    data : JSON.stringify(data),
	                    dataType: 'text',
	                    success: function (result) {
	                    	console.log(result);
	                    	if(result != ""){	                    		
	                    		setCookie("authorization",result,1);
	                    	}
	    				},
	                    error : function (error) {
	                    	console.log(error);
	                    }
	               });
            });

            function setCookie(name,value,days) {
                var expires = "";
                if (days) {
                    var date = new Date();
                    date.setTime(date.getTime() + (days*24*60*60*1000));
                    expires = "; expires=" + date.toUTCString();
                }
                
                document.cookie = name + "=" + (value || "")  + expires + "; path=${pageContext.request.contextPath}";
            }
            
        </script>
</body>
</html>