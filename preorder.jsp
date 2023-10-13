<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Previous Order</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&family=Rubik:wght@300&display=swap"
        rel="stylesheet">
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11"></link>
<style>
		.content2 {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    width: calc(100vi - 300px);
    margin: 10px;
    border-radius: 20px;
    height: calc(100vh - 120px);
}

.order_cards {
    padding: 5px 10px 5px 10px;
    background-color: #B4D9F4;
    height: 70px;
    width: 50vi;
    border-radius: 20px;
}
#order_btn{
    outline: none;
    box-shadow: none;
    background-color: white; 
    border-radius: 20px; 
    height: 30px; 
    font-size: 0.75rem; 
    font-weight: bold;
}
#order_btn:hover{    
    background-color: #b8ff47;
}
#order_btn:active{    
    background-color: #95f100;
}
.content2 {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: calc(100vi - 300px);
    border-radius: 20px;
    height: calc(100vh - 120px);
}

.order_container{
    display: flex;
    align-items: center; 
    flex-direction: column; 
    gap: 30px; 
    margin-bottom: 10px;
    height:550px;
    overflow-y: scroll;
    
}
::-webkit-scrollbar {
    width: 0px;
}
.order_cards {
    padding: 5px 10px 5px 10px;
    background-color: #B4D9F4;
    height: 70px;
    width: 50vi;
    border-radius: 20px;
}
#order_btn{
    outline: none;
    box-shadow: none;
    background-color: white; 
    border-radius: 20px; 
    height: 30px; 
    font-size: 0.75rem; 
    font-weight: bold;
}
#order_btn:hover{    
    background-color: #b8ff47;
}
#order_btn:active{    
    background-color: #95f100;
    border-color: transparent;

}
#bg{
    background-color: transparent;
}
	</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div style="display: flex;">
		<!-- Sidebar -->
		<%@ include file="sidebar.jsp"%>
		<div class="content2">
			<h1>Check Previous Orders</h1>
			<div class="order_container">
				<%
				try {
					Class.forName("org.postgresql.Driver");
					Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cms", "postgres", "postgres");
					Statement st = c.createStatement();

					String sq = "SELECT o.order_no,o.order_date,of.food_no,f.food_name,of.quantity,f.food_price,b.total_amount,of.table_no FROM orders o LEFT JOIN order_food of ON o.order_no = of.order_no LEFT JOIN food f ON of.food_no = f.food_no LEFT JOIN bill b ON o.order_no = b.order_no;";
					ResultSet rs = st.executeQuery(sq);
					while (rs.next()) {
				%>
				<div class="order_cards">
					<div id="bg"
						style="height: 30px; display: flex; justify-content: space-between;">
						<div id="bg">
							<h4 id="bg">
								Order no.<span id="bg">
									<%
									out.print(rs.getInt(1));
									%>
								</span>
							</h4>
						</div>
						<div style="background-color: transparent;">
							<button class="btn" id="order_btn" type="button"
                                data-bs-toggle="modal" data-bs-target="#vieworder"
                                data-order-id="<%out.print(rs.getInt(1));%>"
                                data-order-date="<%out.print(rs.getDate(2));%>"
                                <%-- data-food-no="<%out.print(rs.getInt(3));%>" --%>
                                data-food-name="<%out.print(rs.getString(4));%>"
                                data-quantity="<%out.print(rs.getInt(5));%>"
                                data-food-price="<%out.print(rs.getInt(6));%>"
                                data-total-amount="<%out.print(rs.getInt(7));%>"
                                data-table-number="<%out.print(rs.getInt(8));%>">View
                                Order</button>
						</div>
					</div>
					<hr style="margin: 3px 0px 0px 0px; border-color: black;">
					<div id="bg"
						style="display: flex; align-items: center; justify-content: space-between; margin-top: 5px;">
						<div id="bg"
							style="width: 170px; height: 27px; display: flex; justify-content: center;">
							<h5 id="bg">
								Price : <span id="bg">
									<%
									out.print(rs.getInt(7));
									%>
								</span>₹
							</h5>
						</div>
						<div id="bg"
							style="width: 170px; height: 27px; display: flex; justify-content: center;">
							<h5 id="bg">
								Items Order : <span id="bg">
									<%
									out.print(rs.getInt(5));
									%>
								</span>
							</h5>
						</div>
						<div id="bg"
							style="width: 170px; height: 27px; display: flex; justify-content: center;">
							<h5 id="bg">
								Date : <span id="bg">
									<%
									out.print(rs.getDate(2));
									%>
								</span>
							</h5>
						</div>
					</div>

				</div>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</div>
		</div>

		<!-- Modal for Order Details -->
<div class="modal fade" id="vieworder" tabindex="-1"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Order Details</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h1><span id="orderNo"></span></h1>
                <h3>Date: <span id="orderDate"></span></h3>
                <br>
                <table class="table">
                    <thead>
                        <tr>
                            <!-- <th>FOOD NO</th> -->
                            <th>FOOD NAME</th>
                            <th>QUANTITY</th>
                            <th>PRICE</th>
                            <th>TOTAL PRICE</th>
                            <th>TABLE NUMBER</th>
                        </tr>
                    </thead>
                    <tbody id="orderItems">
                        <!-- Rows for food items will be added dynamically here -->
                    </tbody>
                </table>
                <br>
                <h3>TOTAL ITEMS: <span id="totalItems"></span></h3>
                <h3>TOTAL PRICE: <span id="totalPrice"></span></h3>
                <br>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary primary-background" id="bb">Print Bill</button>
                </div>
            </div>
        </div>
    </div>
</div>


    
	</div>
	
	<script>
        $(document).on('click', '#order_btn', function () {
            var orderId = $(this).data('order-id');
            var orderDate = $(this).data('order-date');
            /* var foodNo = $(this).data('food-no'); */
            var foodName = $(this).data('food-name');
            var quantity = $(this).data('quantity');
            var foodPrice = $(this).data('food-price');
            var totalAmount = $(this).data('total-amount');
            var tableNumber = $(this).data('table-number');
            
            $('#orderNo').text('Order No: ' + orderId);
            $('#orderDate').text(orderDate);
			var tableRow = '<tr>';
			/* tableRow += '<td>' + foodNo + '</td>'; */
			tableRow += '<td>' + foodName + '</td>';
			tableRow += '<td>' + quantity + '</td>';
			tableRow += '<td>' + 'Rs. ' + foodPrice.toFixed(2)+ '</td>';
			tableRow += '<td>' + 'Rs. '+ (quantity * foodPrice).toFixed(2) + '</td>';
			tableRow += '<td>' + tableNumber + '</td>';
			tableRow += '</tr>';

			$('#orderItems').append(tableRow);
			$('#totalItems').text(quantity);
			$('#totalPrice').text('Rs. ' + totalAmount.toFixed(2));
		});
	</script>
    <script type="text/javascript">
    document.getElementById("bb").addEventListener("click", function() {
    	const modalBody = document.getElementById("vieworder").querySelector(".modal-body");
        const modalBodyClone = modalBody.cloneNode(true);
 	    document.getElementById("bb").style.display = "none";
   		window.print();
 });
    </script>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
</body>
</html>
