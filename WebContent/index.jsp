<%@page import="com.factory.helper.HelperDesc"%>
<%@page import="com.cart.entities.Category"%>
<%@page import="com.cart.dao.CategoryDao"%>
<%@page import="com.cart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.cart.dao.ProductDao"%>
<%@page import="com.factory.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="components/common_css_js.jsp"%>

<style type="text/css">
.list-group-item.active {
	background: #7986cb !important;
	border-color: #7986cb !important;
}

</style>

</head>
<body>
	<%@include file="components/navBar.jsp"%>


	<div class="row mt-3 mx-2">

		<%
			String cat = request.getParameter("Category");

			ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
			List<Product> plist = null;

			if (cat == null || cat.trim().equals("all")) {
				plist = pDao.getAllProducts();
			} else {
				int cid = Integer.parseInt(cat);
				plist = pDao.getAllProductsById(cid);
			}

			CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cDao.getCategory();
		%>

		<!-- Show Category -->
		<div class="col-md-2">

			<div class="list-group">
				<a href="index.jsp?Category=all"
					class="list-group-item list-group-item-action active">All
					Products</a>

				<%
					for (Category c : clist) {
				%>

				<a href="index.jsp?Category=<%=c.getCategoryId()%>"
					class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

				<%
					}
				%>
			</div>


		</div>

		<!-- Show Products -->
		<div class="col-md-10">


			<div class="row mt-4">

				<div class="col-md-12">

					<div class="card-columns">
						<%
							for (Product p : plist) {
						%>

						<div class="card">

							<div class="container text-center">
								<img class="card-img-top m-2"
									src="ProductsImg/<%=p.getpPhoto()%>"
									style="max-height: 270px; max-width: 100%; width: auto;">
							</div>

							<div class="card-body">
								<h5 class="card-title"><%=p.getPname()%></h5>

								<p class="card-text">
									<%=HelperDesc.get10Words(p.getpDesc())%>
								</p>

							</div>

							<div class="card-footer text-center">
								<button class="btn text-white" style="background: #7986cb;"
									onclick="add_to_cart(<%=p.getpId()%>, '<%=p.getPname()%>', <%=p.getPriceAfterDiscount()%>)">Add
									to Cart</button>
								
							
								<h6>
									<h4>&#8377;<%=p.getPriceAfterDiscount()%>/-</h4>
									<span class="text-secondary">
										<del>&#8377;<%=p.getpPrice()%></del>
				                        <%=p.getpDiscount()%>% off</span>
								</h6>
							</div>


						</div>

						<%
							}

							if (plist.size() == 0) {
								out.println("<h2>No item in this category !!</h2>");
							}
						%>
					</div>

				</div>

			</div>

		</div>

	</div>

	<%@include file="components/common_modals.jsp"%>
</body>
</html>