<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Food Items</title>
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
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<style>
		.container3 {
    user-select: none;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: calc(100vi - 300px);
    /* margin: 10px; */
    border-radius: 20px;
    height: calc(100vh - 120px);
}
.entryarea{
    user-select: none;
    margin: 25px 0 25px 0;
    position: relative;
    line-height: 50px;
    height: 50px;
    width: 500px;
    /* background-color: blueviolet; */
}
.inputtag{
    user-select: none;
    position: absolute;
    width: 100%;
    outline: none;
    padding: 0 10px;
    line-height: 45px ;
    font-size: 1.3rem;
    border-radius: 10px;
    border: 2px solid #000000;
    background: transparent;
    transition: 0.1s ease;
    z-index: 1111;
}
.labelline{
    position: absolute;
    padding: 0 5px;
    margin: 0 15px;
    transition: 0.2s ease;
}
input:focus + .labelline,
input:valid + .labelline{
    line-height: 30px;
    transform: translate(-20px , -16px) scale(0.80);
    z-index: 1111;
}
input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    appearance: none;
    margin: 0;
}
input[type="number"] {
    -moz-appearance: textfield;
}
#addfood_btn{
    outline: none;
    box-shadow: none;
    background-color: white; 
    border-radius: 15px; 
    height: 45px;
    width: 30%; 
    font-size: 1rem; 
    font-weight: bold;
}
#addfood_btn:hover{    
    background-color: #b8ff47;
}
#addfood_btn:active{    
    background-color: #95f100;
    border-color: transparent;
}
	</style>
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div style="display: flex; align-items:center;">
    	<!-- Side bar -->
        <%@ include file="sidebar.jsp" %>

				<div class="container3">
					<div>
						<h1>Add Food Items</h1>
					</div>
					<div>
						<form action="InsertFood" method="post">
							<div class="entryarea">
								<input class="inputtag" id="fno" name="fno" type="number"
									required>
								<div class="labelline">Enter Food Number</div>
							</div>

							<div class="entryarea">
								<input name="fname" type="text" class="inputtag" id="fname"
									required>
								<div class="labelline">Enter Food Name</div>
							</div>
							<div class="entryarea">
								<input name="ftype" type="text" class="inputtag" id="ftype"
									required>
								<div class="labelline">Enter Food
									Type(beverage/snacks/meals)</div>
							</div>
							<div class="entryarea">
								<input name="fprice" type="text" class="inputtag" id="ftype"
									required>
								<div class="labelline">Enter Food Price</div>
							</div>
							<br>
							<br>

							<div class="container text-center" style="margin-top: -10%;">
								<button id="addfood_btn" type="submit" class="btn">Add
									Item</button>
							</div>
						</form>
					</div>
				</div>
			</div>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
</body>
</html>