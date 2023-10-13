<%@page import="com.cms.connection.connProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Analysis</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&family=Rubik:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11" />
<style>
	*{
		overflow:hidden;
	}
	.container4 {
    display: grid;
    grid-template-columns: 1fr 1fr; /* Two equal-width columns */
    grid-template-rows: 1fr 1fr; /* Two equal-height rows */
    width: calc(100vw - 300px);
    height: calc(100vh - 120px);
  }
  
  .container4 > div {
    border: 1px solid #00c3ff;
    border-radius: 20px;
    padding: 10px; /* Optional: Add padding for spacing */
    display: flex;
    justify-content: center;
    align-items: center;
    /* Ensure the chart container fills the available space */
    width: 100%; /* Adjust as needed */
    height: 100%; /* Adjust as needed */
  }
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div style="display: flex;">
		<!-- Sidebar -->
		<%@ include file="sidebar.jsp"%>

		<!-- Page content -->
		<div class="container4">
            <div>
                <canvas id="salesChart"></canvas>
            </div>
            <div>
                <canvas id="salesChart2"></canvas>    
            </div>
            <div>
                <div style="height: 260px;">
                    <canvas id="profitPieChart"></canvas>
                </div>
            </div>
            <div>
                <canvas id="salesChart3"></canvas>
            </div>
        </div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
	<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
	<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
	<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
	<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
	<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
	<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
        // Sample data for weekly sales (you can replace this with your actual data)
        const weeklySalesData = {
            labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
            datasets: [{
                label: 'Weekly Sales',
                data: [1500, 2200, 1800, 2500], // Replace with your sales data
                borderColor: 'rgb(75, 192, 192)',
                borderWidth: 2,
                fill: false
            }]
        };
        
        // Function to create the chart
        function createSalesChart() {
            const ctx = document.getElementById('salesChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'line', // You can change the chart type here (e.g., 'bar', 'pie', etc.)
                data: weeklySalesData,
                options: {
                    scales: {
                        y: {
                            beginAtZero: true // Start the y-axis at zero
                        }
                    }
                }
            });
        }
        
        // Call the function to create the chart
        createSalesChart();
        // __________________________________________________________________________________
        const weeklySalesData2 = {
    labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
    datasets: [{
        label: 'Weekly Sales (Chart 2)',
        data: [1200, 1800, 1400, 2000, 1900, 2500, 2100], // Replace with your sales data for each day
        backgroundColor: [
            'rgba(255, 99, 132, 0.6)',   // Red
            'rgba(54, 162, 235, 0.6)',  // Blue
            'rgba(255, 206, 86, 0.6)',  // Yellow
            'rgba(75, 192, 192, 0.6)',  // Green
            'rgba(153, 102, 255, 0.6)', // Purple
            'rgba(255, 159, 64, 0.6)',  // Orange
            'rgba(0, 0, 0, 0.6)',       // Black
        ],
        borderWidth: 1
    }]
};



// Function to create the second chart
function createSalesChart2() {
    const ctx2 = document.getElementById('salesChart2').getContext('2d');
    const myChart2 = new Chart(ctx2, {
        type: 'bar', // Set the chart type to 'bar' for a bar graph
        data: weeklySalesData2,
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Sales in Rupees (Chart 2)' // Label for the y-axis
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Days' // Label for the x-axis
                    }
                }
            }
        }
    });
}

// Call the function to create the second chart
createSalesChart2();
// ______________________________________________________________________________________

const totalRevenue = 25000; // Total revenue for the chosen period
const totalExpenses = 18000; // Total expenses for the chosen period

// Calculate the profit
const profit = totalRevenue - totalExpenses;

// Function to create the pie chart
function createprofitPieChart() {
    const ctx = document.getElementById('profitPieChart').getContext('2d');
    // const labels = trendingFoodData.map(item => item.name);
    // const data = trendingFoodData.map(item => item.quantity);

    const myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['Profit', 'Expenses', 'Revenue'],
            datasets: [{
                data: [profit, totalExpenses, totalRevenue],
                backgroundColor: [
                'rgba(75, 192, 192, 0.6)', // Color for profit
                'rgba(255, 99, 132, 0.6)', // Color for expenses
                'rgba(153, 102, 255, 0.6)', // color for revenue
                ],
            }],
        },
        options: {
            title: {
                display: true,
                text: 'Trending Food Items',
            },
            plugins: {
                legend: {
                    position: 'right', // Set the legend position to 'right'
                },
            },
        },
    });

    // Populate the legend with labels and colors
    const legendContainer = document.getElementById('legend');
    labels.forEach((label, index) => {
        const color = myChart.data.datasets[0].backgroundColor[index];
        const listItem = document.createElement('li');
        listItem.innerHTML = `
            <div style="background-color: ${color}; width: 20px; height: 20px; display: inline-block; margin-right: 5px;"></div>
            ${label}
        `;
        legendContainer.appendChild(listItem);
    });
}

// Call the function to create the pie chart
createprofitPieChart();
</script>
<script>
    // Sample data for weekly sales (you can replace this with your actual data)
    const weeklySalesData3 = {
            labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
            datasets: [{
                label: 'Weekly Sales',
                data: [1500, 2200, 1800, 2500], // Replace with your sales data
                borderColor: 'rgb(75, 192, 192)',
                borderWidth: 2,
                fill: false
            }]
        };
        
        // Function to create the chart
        function createSalesChart() {
            const ctx = document.getElementById('salesChart3').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'line', // You can change the chart type here (e.g., 'bar', 'pie', etc.)
                data: weeklySalesData,
                options: {
                    scales: {
                        y: {
                            beginAtZero: true // Start the y-axis at zero
                        }
                    }
                }
            });
        }
        
        // Call the function to create the chart
        createSalesChart();
</script>
</body>

</html>