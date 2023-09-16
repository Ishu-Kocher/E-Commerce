<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	User user = (User) session.getAttribute("current-user");

	if (user == null) {
		session.setAttribute("message", "You are not logged in !! Login First");
		response.sendRedirect("login.jsp");
		return;
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body onload="updateCart()">
	<%@include file="components/navBar.jsp"%>

	<div class="container">

		<div class="row mt-5">

			<div class="col-md-6">

				<div class="card">

					<div class="card-body">
						<h3 class="text-center mb-5">Your selected items</h3>
						<div class="cart-body"></div>
					</div>

				</div>

			</div>

			<div class="col-md-6">

				<div class="card">

					<div class="card-body">
						<h3 class="text-center mb-5">Your details for order</h3>
						
						<!-- Form -->
						<form action="BookingProducts" method="post" id="myform">
							<div class="form-group">
								<label for="ordname">Name</label> <input type="text" value="<%=user.getUserName()%>"
									class="form-control" id="ordname" placeholder="Enter here"
									required>
							</div>

							<div class="form-group">
								<label for="ordph">Phone</label> <input type="text" value="<%=user.getUserPhone()%>"
									class="form-control" id="ordph" placeholder="Enter here"
									required>
							</div>

							<div class="form-group">
								<label for="ordadd">Address</label>
								<textarea class="form-control" id="ordadd"
									placeholder="Enter here" style="height: 200px;" required></textarea>
							</div>
							
							
							<!-- <input type="hidden" name="cart" id="cart" value="" /> -->
							
							
							<div class="container text-center">
								<input type="submit" value="Place Order"
									class="btn btn-outline-success checkout-btn"> 
								
								<a href="index.jsp" class="btn btn-outline-warning">
									Continue Shopping</a>
							</div>
						</form>
					</div>

				</div>

			</div>

		</div>

	</div>
	
	
	
	<h5 id="demo"></h5>


	<%@include file="components/common_modals.jsp"%>
	
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	
	//document.getElementById("demo").innerHTML = i;
	/*
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	
	document.getElementById("cart").value = cart;
	
	console.log(cart);
	
	var storedNames = JSON.parse(localStorage.getItem("cart")); */
	 
	
	//var cartString = localStorage.getItem("cart");
	//var cart = JSON.parse(cartString);
	
	//console.log(cart);
	//console.log(typeof cart);
	//console.log(cart[0].productId);
	
	
	//var cart = JSON.stringify(cartString);
	
	
	
	//document.getElementById("cart").value = cart;
	
	
	$(document).ready(function(){
		
		/* Getting LocalStorage Data */
		var cartString = localStorage.getItem("cart");
		var cart = JSON.parse(cartString);
		
		var ordId = [];
		var ordQuan = [];
		var arrayLength = cart.length;
		for(let i=0;i< arrayLength;i++){
			ordId[i] = cart[i].productId;
			ordQuan[i] = cart[i].productQuantity;
		}
		
		
		
		$("#myform").on('submit',function(event){
			
			var data={
				ordname: $('#ordname').val(),
				ordph: $('#ordph').val(),
				ordadd: $('#ordadd').val(),
				ordId: ordId,
				ordQuan: ordQuan
			}
			
			
			event.preventDefault();
			
			//var f=$(this).serialize();
			
			
			console.log(data);
			
			
			$.ajax({
				url: "BookingProducts",
				data: data,
				type: 'POST',
				success: function (data, textStatus, jqXHR){
					console.log(data);
					console.log("Success...");
					
					swal("Your order has been placed!", "successfully!!", "success");
				},
				error: function(jqXHR, textStatus, errorThrown){
					console.log(data);
					console.log("Error...");
					
					swal ( "Oops" ,  "Something went wrong!" ,  "error" )
				}
			})
			
		})
		
	})
	
	
	
	
	
	/*
	var cartString = localStorage.getItem("cart");
	var cart = JSON.parse(cartString);
	
	var json = [];
	
	var arrayLength = cart.length;
	
	for(let i=0;i< arrayLength;i++){
		document.write(cart[i].productId);
		json[i] = cart[i].productId;
	}
	
	
	
	
	 //ajax pass parameter JS code snippet
	function loginAjax(){
		//var uname=$("#uname").val();
		//var upass=$("#upass").val();
		
		$.ajax({
			type:"post",
 
                         //Use JSON object to pass values
			data: {json:json},
                         //passed to the servlet interface
			url:"BookingProducts",
			async:true,
			success:function(data){
				if(data.trim()=="1")
				{
					console.log("Done");
				}else{
					 console.log("Error");
				}
			}
			
		});
	}
	*/
	
	
	
	
		
	
	</script>
</body>
</html>