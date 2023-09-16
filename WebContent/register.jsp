<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navBar.jsp"%>

	<div class="container-fluid">
		<div class="row mt-5">

			<div class="col-lg-4 col-sm-6 offset-lg-4 offset-sm-3">
				<div class="card">
					<div class="cart-header text-center text-white" style="background: #7986cb;">
						<h1>
							<i class="fa fa-user" aria-hidden="true"></i><br> Sign Up !!
						</h1>
					</div>
					<%@include file="components/Message.jsp"%>
					<div class="card-body px-5">
						<form action="UserRegister" method="post">
							<div class="form-group">
								<label for="username">User Name</label> <input type="text"
									class="form-control" name="username" placeholder="Enter here" required>
							</div>

							<div class="form-group">
								<label for="useremail">User Email</label> <input type="email"
									class="form-control" name="useremail" placeholder="Enter here" required>
							</div>

							<div class="form-group">
								<label for="userpass">User Password</label> <input type="text"
									class="form-control" name="userpass" placeholder="Enter here" required>
							</div>

							<div class="form-group">
								<label for="userph">User Phone</label> <input type="text"
									class="form-control" name="userph" placeholder="Enter here" required>
							</div>

							<div class="form-group">
								<label for="userpass">User Address</label>
								<textarea style="height: 150px" class="form-control"
									placeholder="Enter here" name="useradd" required>
					</textarea>
							</div>

							<div class="container text-center">
								<input type="submit" value="Register"
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