<%@page import="com.cms.entity.foodEntity"%>
<%@page import="com.cms.connection.connProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EditFoodList</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&family=Rubik:wght@300&display=swap"
	rel="stylesheet">
<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
<link rel="stylesheet" href="style.css">
<!-- Add jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Add SweetAlert2 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11"></link>
<link rel="stylesheet" href="custom-sweetalert.css">
<style>
	.swal2-popup {
    background-color: white;
}
.swal2-title {
    background-color: white;
}
.swal2-html-container{
    background-color: white;
}
.swal2-actions{
	background-color: white;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div style="display: flex;">
		<!-- Sidebar -->
		<%@ include file="sidebar.jsp"%>

		<!-- Page content -->
		<div class="content">
			<div
				style="display: flex; align-items: center; justify-content: center; gap: 40px;">
				<h1>Edit Food List</h1>
			</div>
			<div class="container-fluid" id="table-container">
				<div style="overflow-y: scroll; height: 75vh;">
					<!-- Create the table -->
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Food No</th>
								<th>Food Name</th>
								<th>Food Type</th>
								<th>Food Price</th>
								<th>Action</th>
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
								<td>
									<%
									out.print(rs.getInt("food_no"));
									%>
								</td>
								<td>
									<%
									out.print(rs.getString("food_name"));
									%>
								</td>
								<td>
									<%
									out.print(rs.getString("food_type"));
									%>
								</td>
								<td>
									<%
									out.print(rs.getInt("food_price"));
									%>
								</td>
								<td><button class="btn btn-primary edit-btn"
										data-bs-toggle="modal" data-bs-target="#foodedit">Edit</button></td>
								<td><button class="btn btn-primary"
										onclick="confirmDelete(<%=rs.getInt("food_no")%>)">Delete</button></td>
							</tr>
							<%
								}
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
						</tbody>
					</table>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="foodedit" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true"
					style="background-color: transparent;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Update
									Food Details</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!--food Edit Modal  -->
								<div id="food-edit">
									<form id="food-edit-form" action="foodeditservlet"
										method="post">
										<table class="table">
											<tr>
												<th>FoodNo :</th>
												<td><input type="text"
													class="form-control border-success" name="fno" id="mid" readonly>
												</td>
											</tr>
											<tr>
												<th>FoodName :</th>
												<td><input type="text"
													class="form-control border-success" name="fname" id="mname">
												</td>
											</tr>
											<tr>
												<th>FoodType :</th>
												<td><input type="text"
													class="form-control border-success" name="ftype" id="mtype"></td>
											</tr>
											<tr>
												<th>FoodPrice :</th>
												<td><input type="text"
													class="form-control border-success" name="fprice"
													id="mprice"></td>
											</tr>
										</table>
										<div class="container">
											<button type="submit" class="btn btn-outline-primary">Update</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
	<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
	<script>
    function confirmDelete(foodNo) {
        Swal.fire({
            title: 'Are you sure?',
            text: 'You will not be able to recover this food item!',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel',
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = 'delete?foodId=' + foodNo;
            }
        });
    }
	</script>
	<script type="text/javascript">
    	const editBtn = document.querySelectorAll('.edit-btn')
    	editBtn.forEach(b=>{
	    	b.addEventListener('click',(e)=>{
	    		let id = e.target.parentElement.parentElement.childNodes[1].innerText;
	    		let name = e.target.parentElement.parentElement.childNodes[3].innerText;
	    		let type = e.target.parentElement.parentElement.childNodes[5].innerText;
	    		let price = e.target.parentElement.parentElement.childNodes[7].innerText;
	    		document.getElementById('mid').value=id;
	    		document.getElementById('mname').value=name;
	    		document.getElementById('mtype').value=type;
	    		document.getElementById('mprice').value=price;
	    	})
       	})
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
</body>
</html>
