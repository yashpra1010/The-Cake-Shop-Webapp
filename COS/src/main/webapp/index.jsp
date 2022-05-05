<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/logo.png">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" ,initial-scale="1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>The Cake Shop</title>
<%@include file="components/common_css.jsp"%>
</head>

<body>
	<%@include file="components/header.jsp"%>
	<%@include file="message.jsp" %>
	<!--First Image-->
	<img src="images/slider_1.jpg" style="height: 700px; width: 1349px;"
		class="home_image">
	<h1 style="margin-top: -450px; text-align: center; color: white;"
		class="order_now">Order now!</h1>
	<br>
	<div style="text-align: center !important;" class="know_more">
	
		<a href="account.jsp"><button type="button" class="btn btn-danger order_now_btn">CLICK HERE</button></a>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div>
		<img src="images/bg_01.jpg" style="width: 1349px; height: 1700px;"
			class="bg">

		<div class="row" style="margin-top: -1600px;">

			<div class="col-sm-6">
				<div class="card" style="background: none; border: none !important;">
					<div class="card-body">
						<img src="images/triangle_1.png" style="width: 550px;"
							class="triangle_1" data-aos="fade-right" data-aos-duration="800">
						<h1
							style="font-family: 'Dancing Script'; margin-top: -330px; text-align: center; font-size: 50px; color: #fff;"
							class="triangle_1_heading" data-aos="fade-right"
							data-aos-duration="800">Macaroons</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card" style="background: none; border: none;">
					<div class="card-body">
						<img src="images/inner_macaroons_plate_01.png"
							class="macaroons_plate_01" data-aos="fade-left"
							data-aos-duration="800"> <img
							src="images/inner_macaroons_plate_02.png"
							class="macaroons_plate_02" data-aos="fade-up"
							data-aos-duration="800"
							style="height: 400px; margin-left: 200px;">
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>

		<div class="row">
			<div class="col-sm-6">
				<div class="card" style="background: none; border: none;">
					<div class="card-body">
						<img src="images/inner_eclair.png" style="height: 550px;"
							class="inner_eclair" data-aos="fade-right"
							data-aos-duration="800">
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card" style="background: none; border: none;">
					<div class="card-body">
						<img src="images/triangle_2.png" style="height: 550px;"
							class="triangle_2" data-aos="fade-left" data-aos-duration="800">
						<h1
							style="font-family: 'Dancing Script'; margin-top: -320px; text-align: center; font-size: 50px; color: #fff;"
							data-aos="fade-left" data-aos-duration="800">Eclairs</h1>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div>
		<img src="images/bg_02.jpg" style="width: 1349px; height: 700px;"
			class="bg bg2">

		<div class="row" style="margin-top: -600px;">

			<div class="col-sm-6">
				<div class="card" style="background: none; border: none !important;">
					<div class="card-body">
						<img src="images/triangle_1.png" style="width: 550px;"
							class="triangle_3" data-aos="fade-right" data-aos-duration="800">
						<h1
							style="font-family: 'Dancing Script'; margin-top: -330px; text-align: center; font-size: 50px; color: #fff;"
							class="triangle_3_heading" data-aos="fade-right"
							data-aos-duration="800">Cakes</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card" style="background: none; border: none;">
					<div class="card-body">
						<img src="images/inner_cake.png" style="height: 550px;"
							class="inner_cake" data-aos="fade-left" data-aos-duration="800">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<img src="images/bg_03.jpg" style="height: 700px;" class="bg bg3">
		<div class="row" style="margin-top: -700px;">
			<div class="col-sm-6">
				<div class="card" style="background: none; border: none;">
					<div class="card-body">
						<img src="images/inner_fruit_pizza_01.png" style="height: 250px;"
							class="inner_fruit_pizza_01" data-aos="fade-left"
							data-aos-duration="800"><br> <img
							src="images/inner_fruit_pizza_02.png"
							style="height: 250px; margin-left: 300px; margin-top: -40px;"
							class="inner_fruit_pizza_02" data-aos="fade-right"
							data-aos-duration="800"><br> <img
							src="images/inner_fruit_pizza_03.png" style="height: 250px;"
							class="inner_fruit_pizza_03" data-aos="fade-left"
							data-aos-duration="800">

					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card" style="background: none; border: none;">
					<div class="card-body">
						<img src="images/triangle_2.png" style="height: 550px;"
							class="triangle_4" data-aos="fade-right" data-aos-duration="800">
						<h1
							style="font-family: 'Dancing Script'; margin-top: -320px; text-align: center; font-size: 50px; color: #fff;"
							class="triangle_4_heading" data-aos="fade-right"
							data-aos-duration="800">Fruit Cake</h1>
					</div>
				</div>
			</div>
		</div>

	</div>
	<br>
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