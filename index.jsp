<%@page import="com.cms.connection.connProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Canteen Management System</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&family=Rubik:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
<link rel="stylesheet" href="custom-sweetalert.css">
<link rel="stylesheet" href="style.css">
<style>
.swal2-popup {
    background-color: white;
}
.swal2-title {
    background-color: white;
    font-family: 'Rubik', sans-serif;
}
.swal2-html-container{
    background-color: white;
}
.swal2-success-ring{
	background-color: white;
}
.swal2-actions{
	background-color: white;
}
.parent {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.child {
	padding: 10px 20px 10px 20px;
	justify-content: center;
	text-align: center;
	align-items: center;
	border-radius: 12px;
	background-color: #B4D9F4;
	width: 35%;
	height: 50px;
}

.chat-content::-webkit-scrollbar {
	width: 8px;
}

.chat-content::-webkit-scrollbar-thumb {
	background-color: #0072c3be;
	border-radius: 4px;
}

.chat-content::-webkit-scrollbar-thumb:hover {
	background-color: #555;
}

.chat-content::-webkit-scrollbar-track {
	background-color: #B4D9F4;
	border-radius: 4px;
}
.quantity{
	background-color:transparent;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div style="display: flex;">
		<!-- Side bar -->
		<%@ include file="sidebar.jsp"%>
		<!-- Page content -->
		<div class="content">
			<div
				style="display: flex; align-items: center; justify-content: space-between;">
				<div class="search-container">
					<input type="text" class="form-control" id="searchInput"
						placeholder="Search food by food Name">
					<button class="btn" id="search-button">
						<lord-icon src="https://cdn.lordicon.com/osbjlbsb.json"
							trigger="click"
							style="width:30px;height:30px; background-color: transparent;"></lord-icon>
					</button>
				</div>
				<button style="margin-right: 156px;" class="btn btn-primary"
					id="orderAllButton">Order All</button>
			</div>
			<div class="container-fluid" id="table-container">
				<div style="overflow-y: scroll; height: 75vh;" class="chat-content">
					<!-- Create the table -->
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Food No</th>
								<th>Food Name</th>
								<th>Food Type</th>
								<th>Food Price</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							try {
								Class.forName("org.postgresql.Driver");
								Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cms", "postgres", "postgres");
								Statement st = c.createStatement();
								String sq = "select * from food order by food_no";
								ResultSet rs = st.executeQuery(sq);
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getInt("food_no")%></td>
								<td><%=rs.getString("food_name")%></td>
								<td><%=rs.getString("food_type")%></td>
								<td><%=rs.getInt("food_price")%></td>
								<td>
									<button class="btn btn-success orderButton"
										style="width: 80px;"
										data-food-id="<%=rs.getInt("food_no")%>"
										data-food-name="<%=rs.getString("food_name")%>"
										data-food-type="<%=rs.getString("food_type")%>"
										data-food-price="<%=rs.getInt("food_price")%>">Add</button>
								</td>
							</tr>
							<%
							}
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
						</tbody>
					</table>
					
					<!-- modal  -->
					<div class="modal fade" id="orderModal" tabindex="-1" role="dialog"
						aria-labelledby="orderModalLabel" aria-hidden="true"
						style="background-color: transparent;">
						<div class="modal-dialog modal-dialog-centered  modal-lg"
							role="document"
							style="width: 80%; height: 500px; background-color: transparent;">
							<div class="modal-content">
								<div class="modal-header">
									<h5 style="font-weight: 600;" class="modal-title"
										id="orderModalLabel">Confirm Order</h5>
									<button type="button" class="close" data-bs-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true" style="color: red;">&times;</span>
									</button>
								</div>
								<div class="modal-body" style="height: 100%;">
									<div class="parent">
										<div class="child">
											<h4 style="background-color: transparent;">
												Total Price :<span
													style="font-weight: 700; background-color: transparent;"
													id="total-price">0</span>₹
											</h4>
										</div>
										<div class="child">
											<h4 style="background-color: transparent;">
												Total Items :<span
													style="font-weight: 700; background-color: transparent;"
													id="selectedItemCount">0</span>
											</h4>
										</div>
									</div>

									<table class="table">
										<thead>
											<tr>
												<th>Food Name</th>
												<th>Quantity</th>
												<th>Food Type</th>
												<th>Total Price</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody id="orderedItemsTableBody">
											<!-- Display ordered items here -->
										</tbody>
									</table>
								</div>
								<div class="modal-footer" style="background:#D2E8F9;">
									<input style="box-shadow:none;" class="form-control col-3 border-primary" type="text" placeholder="Enter Table Number..">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="button" class="btn btn-success"
										id="OrderButton" onclick="confirmorder()">Order</button>
									<!-- Add a button here to proceed with the order -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
       const selectedFoods = [];
       let totalPrice = 0; 
       document.addEventListener('click', function (e) {
       if (e.target.classList.contains('orderButton')) {
            const foodId = e.target.getAttribute('data-food-id');
            toggleOrder(e.target, foodId);
        }
    });

    function toggleOrder(button, foodId) {
        const foodName = button.getAttribute('data-food-name');
        const foodType = button.getAttribute('data-food-type');
        const foodPrice = parseInt(button.getAttribute('data-food-price'));

        if (button.innerText === 'Add') {
            button.innerText = 'Added';
            button.classList.remove('btn-success');
            button.classList.add('btn-dark');

            selectedFoods.push({
                id: foodId,
                name: foodName,
                type: foodType,
                price: foodPrice,
                quantity: 1
            });
            totalPrice += foodPrice;
            updateOrderModal();
        }
    }

    function updateOrderModal() {
        document.getElementById('total-price').textContent = totalPrice;
        document.getElementById('selectedItemCount').textContent = selectedFoods.length;

        const orderedItemsTableBody = document.getElementById('orderedItemsTableBody');
        orderedItemsTableBody.innerHTML = '';

        selectedFoods.forEach(function (f) {
            const row = document.createElement('tr');

            const nameCell = document.createElement('td');
            nameCell.textContent = f.name;
            row.appendChild(nameCell);

            const quantityCell = document.createElement('td');
            const decreaseButton = document.createElement('button');
            decreaseButton.className = 'btn btn-sm decreaseQuantity';
            decreaseButton.setAttribute('data-food-id', f.id);
            decreaseButton.textContent = '-';
            quantityCell.appendChild(decreaseButton);

            const quantitySpan = document.createElement('span');
            quantitySpan.className = 'quantity';
            quantitySpan.textContent = f.quantity;
            quantityCell.appendChild(quantitySpan);

            const increaseButton = document.createElement('button');
            increaseButton.className = 'btn btn-sm increaseQuantity';
            increaseButton.setAttribute('data-food-id', f.id);
            increaseButton.textContent = '+';
            quantityCell.appendChild(increaseButton);

            row.appendChild(quantityCell);

            const typeCell = document.createElement('td');
            typeCell.textContent = f.type;
            row.appendChild(typeCell);

            const totalPriceCell = document.createElement('td');
            totalPriceCell.textContent = f.price * f.quantity;
            row.appendChild(totalPriceCell);
			
            const cancelCell = document.createElement('td');
            const cancelButton = document.createElement('button');
            cancelButton.className = 'btn btn-warning cancelItem';
            cancelButton.setAttribute('data-food-id', f.id);
            cancelButton.textContent = 'Cancel';
            cancelCell.appendChild(cancelButton);
            row.appendChild(cancelCell);
            
            const increaseButtonElement = row.querySelector('.increaseQuantity');
            const decreaseButtonElement = row.querySelector('.decreaseQuantity');
            const quantitySpanElement = row.querySelector('.quantity');

            increaseButtonElement.addEventListener('click', function () {
                f.quantity++;
                quantitySpanElement.textContent = f.quantity;
                totalPrice += f.price;
                updateOrderModal();
            });

            decreaseButtonElement.addEventListener('click', function () {
                if (f.quantity > 1) {
                    f.quantity--;
                    quantitySpanElement.textContent = f.quantity;
                    totalPrice -= f.price;
                    updateOrderModal();
                }
            });
			
            cancelButton.addEventListener('click', function () {
                const index = selectedFoods.findIndex(item => item.id === f.id);
                if (index !== -1) {
                    selectedFoods.splice(index, 1);
                    totalPrice -= f.price * f.quantity;
                    updateOrderModal();
                }
            });
            orderedItemsTableBody.appendChild(row);
        });
	}
		
		document.querySelector('#orderAllButton').addEventListener('click',
				function() {
					if (selectedFoods.length === 0) {
						alert('Please Select Item for Order');
					} else {
						$('#orderModal').modal('show');
					}
				});

		
		function confirmorder() {
	        Swal.fire({
	            title: 'THANK YOU!',
	            text: 'Your Order Placed, Enjoy Your Meal!',
	            icon: 'info',
	            showCancelButton: true,
	            confirmButtonText: 'Done!',
	        }).then((result) => {
	            if (result.isConfirmed) {
	                window.location.href = 'preorder.jsp';
	            }
	        });
	    }

	</script>

	<script>
        function filterFoods() {
            var searchInput = document.getElementById("searchInput");
            var searchText = searchInput.value.toLowerCase();
            var table = document.querySelector(".table");
            var rows = table.getElementsByTagName("tr");

            for (var i = 1; i < rows.length; i++) {
                var foodName = rows[i].getElementsByTagName("td")[1].textContent.toLowerCase();
                var foodType = rows[i].getElementsByTagName("td")[2].textContent.toLowerCase();

                if (foodName.includes(searchText) || foodType.includes(searchText)) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }
        var searchInput = document.getElementById("searchInput");
        searchInput.addEventListener("keyup", filterFoods);

        function hideRows() {
            var table = document.querySelector(".table");
            var rows = table.getElementsByTagName("tr");

            for (var i = 1; i < rows.length; i++) {
                rows[i].style.display = "none";
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
</body>
</html>