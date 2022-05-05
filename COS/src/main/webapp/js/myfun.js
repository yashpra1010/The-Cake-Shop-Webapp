
 function add_to_cart(pID, pName, pPrice,pQuant) {
	let pQuantStock = pQuant;
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		//no cart
		let products = [];
		let product = { prodId: pID, prodName: pName, prodQuantity: 1, prodPrice: pPrice };

		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		//console.log("Product added for first time.");
		showToast("Item is added to cart.")
	} else {
		//cart present
		let pcart = JSON.parse(cart);
		
		let oldProd = pcart.find((item) => item.prodId == pID)
		if (oldProd) {
			
			if(oldProd.prodQuantity < pQuantStock){
				//increase quantity
				oldProd.prodQuantity = oldProd.prodQuantity + 1

				pcart.map((item) => {
					if (item.prodId == oldProd.prodId) {
						item.prodQuantity = oldProd.prodQuantity;
					}
				})

				localStorage.setItem("cart", JSON.stringify(pcart));
				//console.log("Product quantity is increased.");
				showToast("Product quantity is increased.")
			}
			else {
				//console.log("Prodcut Not in Stock.");
				showToast("Product not in stock.")
			}
		}
		else {
			//add product quantity

			let product = { prodId: pID, prodName: pName, prodQuantity: 1, prodPrice: pPrice };
			pcart.push(product)
			localStorage.setItem("cart", JSON.stringify(pcart));
			//console.log("Product is added.");
			showToast("Product is added.")
		}

	}
	updateCart();
}

//update-cart
function updateCart(){
	let cartString = localStorage.getItem("cart");
	
	let cart = JSON.parse(cartString);
	
	if(cart==null || cart.length==0){
		console.log("Cart is empty!")
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3>Cart is Empty </h3>");
		$(".checkout-btn").attr('disabled',true);
	}
	else{
		$(".cart-items").html(`( ${cart.length} )`);
		$(".checkout-btn").attr('disabled',false);
		let table=`
		 <table class="table">
		 	<thead class="thead-light">
		 	<tr>
		 	<th>Product Name</th>
		 	<th>Product Price</th>
		 	<th>Product Quantity</th>
		 	<th>Total Price</th>
		 	<th>Action</th>
		 	</tr>
			</thead>
		
		
		`;
		
		let totalPrice = 0;
		
		cart.map((item)=>{
			table+=`
			<tr>
			
			<td>${item.prodName}</td>
			<td>&#8377; ${item.prodPrice}</td>
			<td>${item.prodQuantity}</td>
			<td>&#8377; ${item.prodQuantity*item.prodPrice}</td>
			<td><button class="btn btn-danger btn-sm" onclick="del_from_cart(${item.prodId})">Remove</button></td>
			</tr>
			`
			totalPrice += item.prodPrice*item.prodQuantity;
		})			

		table=table+`
		
		<tr><td colspan=5 class="text-right font-weight-bold"> Total Price = &#8377; ${totalPrice}</td></tr></table>`;
		$(".cart-body").html(table);
	}
}

function del_from_cart(pID){
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newcart = cart.filter((item)=>item.prodId != pID)
	
	localStorage.setItem('cart',JSON.stringify(newcart))
	updateCart();
	showToast("Product removed from cart.")
}

$(document).ready(function() {
	updateCart()
})

/* TOAST FUNCTION */

function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(()=>{
		$("#toast").removeClass("display");
	},2000);
}


function goToCheckout() {
	window.location="checkout.jsp";
}
