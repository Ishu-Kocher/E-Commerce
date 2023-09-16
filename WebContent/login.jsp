<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navBar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-lg-4 col-sm-6 offset-lg-4 offset-sm-3">
				<div class="card">
					<div class="cart-header text-center text-white"
						style="background: #7986cb;">
						<h1>
							<i class="fa fa-user" aria-hidden="true"></i><br> Log In !!
						</h1>
					</div>
					<%@include file="components/Message.jsp"%>
					<div class="card-body px-5">
						<form action="UserLogin" method="post">
							<div class="form-group">
								<label for="username">User Email</label> <input type="email"
									class="form-control" name="useremail" placeholder="Enter here" required>
							</div>

							<div class="form-group">
								<label for="userpass">User Password</label> <input type="password"
									class="form-control" name="userpass" placeholder="Enter here" required>
							</div>

							<div class="container text-center">
								<a href="register.jsp">If not register click here</a><br>
								<br> <input type="submit" value="Login"
									class="btn btn-outline-success"> <input type="reset"
									value="Reset" class="btn btn-outline-warning">
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>

	</div>

	<%@include file="components/common_modals.jsp"%>
</body>
</html>