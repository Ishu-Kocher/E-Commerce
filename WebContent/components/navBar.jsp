<style>
#navSet li a{
	border-right: 1px solid white;
	color: white; 	
}

nav#customer-bg .navbar-brand {
	color: white;
}
#navbarSupportedContent ul li a{
	color: white;
}
</style>
<%@page import="com.cart.entities.User"%>
<%
	User user1 = (User) session.getAttribute("current-user");
%>
<body onload="updateCart()">
<nav class="navbar navbar-expand-lg navbar-darkt" id="customer-bg">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">MyCart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="#">Contact</a></li>
			</ul>
			<ul class="navbar-nav ml-auto" id="navSet">
				<li class="nav-item active"><a class="nav-link"
					href="#" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> Cart <span class="cart-items">( 0 )</span></a>
				</li>
			
				<%
					if (user1 == null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login <i class="fa fa-user" aria-hidden="true"></i></a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Register <i class="fa fa-user-plus"
						aria-hidden="true"></i></a></li>

				<%
					} else {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal-user.jsp"  %>">Welcome, <%=user1.getUserName()%> <i class="fa fa-user" aria-hidden="true"></i></a>
				</li>
				
				<li class="nav-item active"><a class="nav-link"
					href="#">My Orders <i class="fa fa-shopping-bag" aria-hidden="true"></i></a></li>
				
				<li class="nav-item active"><a class="nav-link"
					href="Logout">Logout <i class="fa fa-sign-out" aria-hidden="true"></i></a></li>
					
				
				<%
					}
				%>
			</ul>
		</div>
	</div>
</nav>
</body>