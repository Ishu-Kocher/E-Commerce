<%@page import="com.cart.dao.UserDao"%>
<%@page import="com.factory.helper.FactoryProvider"%>
<%@page import="com.cart.dao.CategoryDao"%>
<%@page import="com.cart.dao.ProductDao"%>
<%@page import="com.cart.entities.Category"%>
<%@page import="com.cart.entities.Product"%>
<%@page import="com.cart.entities.User"%>
<%@page import="java.util.List"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	User user = (User) session.getAttribute("current-user");

	if (user == null) {
		session.setAttribute("message", "You are not logged in !! Login First");
		response.sendRedirect("login.jsp");
		return;
	} else {
		if (user.getUserType().equals("normal")) {
			session.setAttribute("message", "You are not admin !! Do not access this page");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>

<%
	CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
	List<Category> list = catDao.getCategory();

	ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
	List<Product> plist = pDao.getAllProducts();

	UserDao cDao = new UserDao(FactoryProvider.getFactory());
	List<User> clist = cDao.getAllUsers();
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navBar.jsp"%>

	<div class="container" id="admin">

		<div class="container-fluid">
			<%@include file="components/Message.jsp"%>
		</div>
		<div class="row mt-5">

			<div class="col-md-4 mb-4">
				<div class="card text-center" data-toggle="modal"
					data-target="#showUsers">
					<div class="card-body">
						<img alt="users" src="IMG/team.png"
							class="img-fluid rounded-circle" style="max-width: 125px;">
						<h1><%=clist.size()%></h1>
						<h1 class="text-uppercase text-muted">User's</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4">
				<div class="card text-center" data-toggle="modal"
					data-target="#showCategorys">
					<div class="card-body">
						<img alt="list" src="IMG/list.png"
							class="img-fluid rounded-circle" style="max-width: 125px;">
						<h1><%=list.size()%></h1>
						<h1 class="text-uppercase text-muted">Category's</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4">
				<div class="card text-center" data-toggle="modal"
					data-target="#showProducts">
					<div class="card-body">
						<img alt="buy" src="IMG/value.png"
							class="img-fluid rounded-circle" style="max-width: 125px;">
						<h1><%=plist.size()%></h1>
						<h1 class="text-uppercase text-muted">Product's</h1>
					</div>
				</div>
			</div>

		</div>

		<div class="row mt-5">

			<div class="col-md-6 mb-4">
				<div class="card text-center" data-toggle="modal"
					data-target="#addCategory">
					<div class="card-body">
						<img alt="buy" src="IMG/plus.png" class="img-fluid rounded-circle"
							style="max-width: 125px;">
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>

			<div class="col-md-6 mb-4">
				<div class="card text-center" data-toggle="modal"
					data-target="#addProduct">
					<div class="card-body">
						<img alt="buy" src="IMG/buy.png" class="img-fluid rounded-circle"
							style="max-width: 125px;">
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>


		</div>
	</div>




	<!-- Add Category Modal -->
	<!-- Modal -->
	<div class="modal fade" id="addCategory" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
						<div class="form-group">
							<div class="form-group">
								<input type="hidden" name="operation" value="addCategory">
							</div>

							<div class="form-group">
								<input type="text" class="form-control" name="catTitle"
									placeholder="Enter category title" required>
							</div>
							<div class="form-group">
								<textarea style="height: 200px;" name="catDesc"
									class="form-control" placeholder="Enter category description"
									required></textarea>
							</div>
							<div class="container text-center">
								<input type="submit" value="Add Category"
									class="btn btn-outline-success">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<!-- Add Product Modal -->
	<!-- Modal -->
	<div class="modal fade" id="addProduct" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<div class="form-group">
								<input type="hidden" name="operation" value="addProduct">
							</div>

							<div class="form-group">
								<input type="text" class="form-control" name="pTitle"
									placeholder="Enter product title" required>
							</div>
							<div class="form-group">
								<textarea style="height: 200px;" name="pDesc"
									class="form-control" placeholder="Enter product description"
									required></textarea>
							</div>

							<div class="form-group">
								<input type="text" class="form-control" name="pPrice"
									placeholder="Enter product price" required>
							</div>

							<div class="form-group">
								<input type="text" class="form-control" name="pdiscount"
									placeholder="Enter product discount in percent(%)" required>
							</div>

							<div class="form-group">
								<input type="text" class="form-control" name="pQuantity"
									placeholder="Enter product Quantity" required>
							</div>


							<select class="form-control" name="pCat" required>
								<option value="">Select Anyone</option>
								<%
									for (Category c : list) {
								%>

								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

								<%
									}
								%>
							</select> <br>
							<div class="form-group">
								<label for="pPic">Select Product Image</label><br> <input
									type="file" name="pPic" required>
							</div>

							<div class="container text-center">
								<input type="submit" value="Add Category"
									class="btn btn-outline-success">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<!-- Show User's -->
	<!-- Modal -->
	<div class="modal fade" id="showUsers" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Show Users</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">User id</th>
								<th scope="col">User name</th>
								<th scope="col">User email</th>
								<th scope="col">User Phone</th>
								<th scope="col">User Type</th>
								<th scope="col">Action</th>
							</tr>

							<%
								for (User u : clist) {
							%>
							<tr>
								<td><%=u.getUserId()%></td>
								<td><%=u.getUserName()%></td>
								<td><%=u.getUserEmail()%></td>
								<td><%=u.getUserPhone()%></td>
								<td><%=u.getUserType()%></td>
								<td><button class="btn btn-danger">Remove</button></td>
							</tr>
							<%
								}
							%>

						</thead>
						<tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Show Category's -->
	<!-- Modal -->
	<div class="modal fade" id="showCategorys" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Show Categorys</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Category id</th>
								<th scope="col">Category Title</th>
								<th scope="col">Category Description</th>
								<th scope="col">Action</th>
							</tr>

							<%
								for (Category cat : list) {
							%>
							<tr>
								<td><%=cat.getCategoryId()%></td>
								<td><%=cat.getCategoryTitle()%></td>
								<td><%=cat.getCategoryDescription()%></td>
								<td><button class="btn btn-danger">Remove</button></td>
							</tr>
							<%
								}
							%>

						</thead>
						<tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Show Product's -->
	<!-- Modal -->
	<div class="modal fade" id="showProducts" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Show Products</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Product id</th>
								<th scope="col">Product name</th>
								<th scope="col">Product Description</th>
								<th scope="col">Product Price</th>
								<th scope="col">Product Discount</th>
								<th scope="col">Product Quantity</th>
								<th scope="col">Product price after discount</th>
								<th scope="col">Action</th>
							</tr>

							<%
								for (Product p : plist) {
							%>
							<tr>
								<td><%=p.getpId()%></td>
								<td><%=p.getPname()%></td>
								<td><%=p.getpDesc()%></td>
								<td><%=p.getpPrice()%></td>
								<td><%=p.getpDiscount()%>%</td>
								<td><%=p.getpQuantity()%></td>
								<td><%=p.getPriceAfterDiscount()%></td>
								<td><button class="btn btn-danger">Remove</button></td>
							</tr>
							<%
								}
							%>

						</thead>
						<tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<%@include file="components/common_modals.jsp"%>
</body>
</html>