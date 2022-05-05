
<%
String user = (String) session.getAttribute("email");

if (user == null) {
	session.setAttribute("Message", "Unauthorized Login !!!");
	session.invalidate();
	response.sendRedirect("account.jsp");
	return;
} else {
	if (!user.contains("@tcs.com")) {
		session.setAttribute("Message", "You are not Admin !!!");
		response.sendRedirect("account.jsp");
		return;
	}
}
%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="True" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo.png">
<meta charset="ISO-8859-1">
<title>Admin - Home Page</title>
<%@include file="components/common_css.jsp"%>
</head>
<body>
	<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/myproject" user="root" password="" />
	<%@include file="components/header.jsp"%>
	<%@include file="message.jsp"%><br>

	<div class="container admin">
		<div class="row mt-5">
			<!-- first-column -->
			<div class="col-md-4">
				<!-- first-box -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="image-fluid rounded-cirlce"
								src="images/users.png" alt="Users">
						</div>
						<sql:query var="nouser" dataSource="${con}">
					SELECT count(*) as count FROM `user`;
					</sql:query>
						<c:forEach var="data" items="${nouser.rows}">
							<h1>${data.count}</h1>
						</c:forEach>
						<h1>Users</h1>
					</div>
				</div>
			</div>
			<!-- second-column -->
			<div class="col-md-4">
				<!-- first-box -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="image-fluid rounded-cirlce"
								src="images/categories.png" alt="num_category_pic">
						</div>
						<sql:query var="nocat" dataSource="${con}">
					SELECT count(*) as count FROM `category`;
					</sql:query>
						<c:forEach var="data" items="${nocat.rows}">
							<h1>${data.count}</h1>
						</c:forEach>
						<h1>No. Categories</h1>
					</div>
				</div>
			</div>
			<!-- third-column -->
			<div class="col-md-4">
				<!-- first-box -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="image-fluid rounded-cirlce"
								src="images/noproduct.png" alt="num_product_pic">
						</div>
						<sql:query var="noprod" dataSource="${con}">
					SELECT count(*) as count FROM `product`;
					</sql:query>
						<c:forEach var="data" items="${noprod.rows}">
							<h1>${data.count}</h1>
						</c:forEach>
						<h1>No. Products</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- second-row -->
		<div class="row mt-3">
			<!-- first-col -->
			<div class="col-md-6">
				<!-- first-box -->
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="image-fluid rounded-cirlce"
								src="images/addcat.png" alt="add_category_pic">
						</div>
						<h1>Add Categories</h1>
					</div>
				</div>
			</div>
			<!-- second-col -->
			<div class="col-md-6">
				<!-- first-box -->
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="image-fluid rounded-cirlce"
								src="images/addprod.png" alt="add_product_pic">
						</div>
						<h1>Add Products</h1>
					</div>
				</div>
			</div>
		</div>

		<!-- third-row -->
		<div class="row mt-3">
			<!-- first-col -->
			<div class="col-md-6">
				<!-- first-box -->
				<div class="card" data-toggle="modal"
					data-target="#mod-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="image-fluid rounded-cirlce"
								src="images/modcat.png" alt="del_category_pic">
						</div>
						<h1>Modify Category</h1>
					</div>
				</div>
			</div>
			<!-- second-col -->
			<div class="col-md-6">
				<!-- first-box -->
				<div class="card" data-toggle="modal"
					data-target="#mod-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="image-fluid rounded-cirlce"
								src="images/modprod.png" alt="del_product_pic">
						</div>
						<h1>Modify Products</h1>
					</div>
				</div>
			</div>
		</div>




		<!-- fourth row -->
		<div class="row mt-3">
			<!-- first-col -->
			<div class="col-md-6">
				<!-- first-box -->
				<div class="card" data-toggle="modal"
					data-target="#del-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="image-fluid rounded-cirlce"
								src="images/delcat.png" alt="del_category_pic">
						</div>
						<h1>Delete Categories</h1>
					</div>
				</div>
			</div>
			<!-- second-col -->
			<div class="col-md-6">
				<!-- first-box -->
				<div class="card" data-toggle="modal"
					data-target="#del-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="image-fluid rounded-cirlce"
								src="images/delprod.png" alt="del_product_pic">
						</div>
						<h1>Delete Products</h1>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- --------ADD CATEGORY MODAL----------- -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header text-white"
					style="background-color: #ff4562;">
					<h5 class="modal-title" id="add-category-modal">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
						<input type="hidden" name="operation" value="addcategory">
						<div class="form-group">
							<b>Title</b><input type="text" class="form-control" name="ctitle"
								placeholder="Enter Title" required>
						</div>
						<div class="form-group">
							<b>Description</b><br>
							<textarea style="height: 200px;" name="cdesc"
								class="form-control" placeholder="Enter your Description"
								required></textarea>
							<br>
							<b>Category Picture</b><br> <input type="file"
								class="form-control" name="cpic" required><br>
						</div>
						<div class="container text-center">
							<button type="button" class="btn" data-dismiss="modal">Close</button>
							<button class="btn btn-success" type="submit">Add
								Category</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- --------END CATEGORY MODAL----------- -->
	<!-- --------ADD PRODUCT MODAL----------- -->
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header text-white"
					style="background-color: #ff4562;">
					<h5 class="modal-title" id="add-product-modal">Fill Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
						<input type="hidden" name="operation" value="addproduct">
						<div class="form-group">
							<b>Product Title</b> <input type="text" class="form-control"
								name="pTitle" placeholder="Enter Title" required><br>
							<b>Product Description</b><br>
							<textarea style="height: 100px;" name="pDesc"
								class="form-control"
								placeholder="Enter your Product Description" required></textarea>
							<br>
							<b>Product Picture</b><br> <input type="file"
								class="form-control" name="pPic" required><br> <b>Product
								Price</b> <input type="number" class="form-control" name="pPrice"
								placeholder="Enter Price" required><br> <b>Product
								Discount</b> <input type="number" class="form-control"
								name="pDiscount" placeholder="Enter Discount (%)" required><br>
							<b>Product Quantity</b> <input type="number" class="form-control"
								name="pQuantity" placeholder="Enter Quantity" required><br>

							<sql:query var="rs" dataSource="${con}">
		SELECT * FROM `category`;
		</sql:query>

							<b>Category</b> <select class="browser-default custom-select"
								name="flexRadioDefault" id="flexRadioDefault2">
								<c:forEach var="data" items="${rs.rows}">
									<option value="${data.cId}">${data.cTitle}</option>
								</c:forEach>
							</select>
						</div>

						<div class="container text-center">
							<button type="button" class="btn" data-dismiss="modal">Close</button>
							<button class="btn btn-success" type="submit">Add
								Product</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- --------END PRODUCT MODAL----------- -->

	<!-- --------MODIFY CATEGORY MODAL----------- -->
	<div class="modal fade" id="mod-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header text-white"
					style="background-color: #ff4562;">
					<h5 class="modal-title" id="mod-category-modal">Which category
						you want to modify?</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
						<input type="hidden" name="operation" value="modcategory">

						<div class="form-group">
							<sql:query var="rs" dataSource="${con}">
		SELECT * FROM `category`;
		</sql:query>


							<div class="form-check" aria-label="Default select">
								<b>Select Category To Modify</b> <select
									class="browser-default custom-select" name="modcat" id="cat">
									<c:forEach var="data" items="${rs.rows}">
										<option value="${data.cId}">${data.cTitle}</option>
									</c:forEach>
								</select> <br> <br> <b>Which field you want to modify?</b> <select
									class="browser-default custom-select" name="colname"
									id="colname">
									<option value="1">Title</option>
									<option value="2">Photo</option>
								</select> <br> <br> <b>Which value for the field?</b> <input
									type="text" class="form-control" name="data"
									placeholder="Enter New Value" required><br> <b>Password</b>
								<input type="password" class="form-control" name="pass"
									placeholder="Enter Your Password" required><br>
							</div>
						</div>

						<div class="container text-center">
							<button type="button" class="btn" data-dismiss="modal">Close</button>
							<button class="btn btn-success" type="submit">Modify
								Category</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- --------END CATEGORY MODAL----------- -->


	<!-- --------MODIFY PRODUCT MODAL----------- -->
	<div class="modal fade" id="mod-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header text-white"
					style="background-color: #ff4562;">
					<h5 class="modal-title" id="mod-product-modal">Which product
						you want to modify?</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
						<input type="hidden" name="operation" value="modproduct">

						<div class="form-group">
							<sql:query var="rs" dataSource="${con}">
		SELECT * FROM `product`;
		</sql:query>


							<div class="form-check" aria-label="Default select">
								<b>Select Product To Modify</b> <select
									class="browser-default custom-select" name="modprod" id="prod">
									<c:forEach var="data" items="${rs.rows}">
										<option value="${data.pId}">${data.pTitle}</option>
									</c:forEach>
								</select> <br> <br> <b>Which field you want to modify?</b> <select
									class="browser-default custom-select" name="colname"
									id="colname">
									<option value="1">Title</option>
									<option value="2">Price</option>
									<option value="3">Quantity</option>
									<option value="4">Photo</option>
								</select> <br> <br> <b>Which value for the field?</b> <input
									type="text" class="form-control" name="data"
									placeholder="Enter New Value" required><br> <b>Password</b>
								<input type="password" class="form-control" name="pass"
									placeholder="Enter Your Password" required><br>
							</div>
						</div>

						<div class="container text-center">
							<button type="button" class="btn" data-dismiss="modal">Close</button>
							<button class="btn btn-success" type="submit">Modify
								Product</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- --------END CATEGORY MODAL----------- -->


	<!-- --------DELETE CATEGORY MODAL----------- -->
	<div class="modal fade" id="del-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header text-white"
					style="background-color: #ff4562;">
					<h5 class="modal-title" id="add-category-modal">Which category
						you want to delete?</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
						<input type="hidden" name="operation" value="delcategory">

						<div class="form-group">
							
							<sql:query var="rs" dataSource="${con}">
		SELECT * FROM `category`;
		</sql:query>


							<div class="form-check">
								<b>Category</b> <select class="browser-default custom-select"
									name="incid" id="flexRadioDefault2">
									<c:forEach var="data" items="${rs.rows}">
										<option value="${data.cId}">${data.cTitle}</option>
									</c:forEach>
								</select> <b>Password</b> <input type="password" class="form-control"
									name="pass" placeholder="Enter Your Password" required><br>
							</div>
						</div>

						<div class="container text-center">
							<button type="button" class="btn" data-dismiss="modal">Close</button>
							<button class="btn btn-danger" type="submit">Delete
								Category</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- --------END CATEGORY MODAL----------- -->



	<!-- --------DELETE PRODUCT MODAL----------- -->
	<div class="modal fade" id="del-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header text-white"
					style="background-color: #ff4562;">
					<h5 class="modal-title" id="add-category-modal">Which product
						you want to delete?</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
						<input type="hidden" name="operation" value="delproduct">

						<div class="form-group">

							<sql:query var="rs" dataSource="${con}">
		SELECT * FROM `product`;
		</sql:query>

							<div class="form-check">
								<b>Select Product to Delete</b> <select
									class="browser-default custom-select" name="inpid"
									id="flexRadioDefault2">
									<c:forEach var="data" items="${rs.rows}">
										<option value="${data.pId}">${data.pTitle}</option>
									</c:forEach>
								</select> <b>Password</b> <input type="password" class="form-control"
									name="pass" placeholder="Enter Your Password" required><br>

							</div>

						</div>

						<div class="container text-center">
							<button type="button" class="btn" data-dismiss="modal">Close</button>
							<button class="btn btn-danger" type="submit">Delete
								Product</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- --------END CATEGORY MODAL----------- -->

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%@include file="components/footer.jsp"%>
</body>
<%@include file="components/common_js.jsp"%>
</html>