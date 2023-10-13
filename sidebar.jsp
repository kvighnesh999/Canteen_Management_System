<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar(Menu)</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<!-- Sidebar -->
        <div class="sidebar">
            <a href="index.jsp" style=" display:flex; align-items:center; border-radius: 17px;">
                <span style="background-color: transparent; color: black; font-weight: 600;">Dashboard</span>
                <lord-icon src="https://cdn.lordicon.com/zvllgyec.json" trigger="hover" colors="primary:#121331"
                    class="icon"></lord-icon>
            </a><br>
            <a href="preorder.jsp" style=" display:flex; align-items:center; flex-direction: row; border-radius: 17px;">
                <span style="background-color: transparent; color: black; font-weight: 600;">Previous Orders</span>
                <lord-icon src="https://cdn.lordicon.com/qhaguvvs.json" trigger="hover"
                    colors="outline:#121331,primary:#ebe6ef" stroke="80" class="icon"></lord-icon>

            </a><br>
            <a href="editfood.jsp" style=" display:flex; align-items:center; flex-direction: row; border-radius: 17px;">
                <span style="background-color: transparent; color: black; font-weight: 600;">Edit Food List</span>
                <lord-icon src="https://cdn.lordicon.com/lzaszlqv.json" trigger="hover"
                    colors="outline:#121331,primary:#3a3347,secondary:#b26836,tertiary:#f24c00,quaternary:#4bb3fd,quinary:#ebe6ef"
                    class="icon"></lord-icon>
            </a><br>
            <a href="AddNew.jsp" style=" display:flex; align-items:center; flex-direction: row; border-radius: 17px;">
                <span style="background-color: transparent; color: black; font-weight: 600;">Add Items</span>
                <lord-icon src="https://cdn.lordicon.com/qzwudxpy.json" trigger="hover"
                    colors="outline:#121331,primary:#ebe6ef,secondary:#ffc738,tertiary:#f24c00" class="icon">
                </lord-icon>
            </a><br>
            <a href="analysis.jsp" style=" display:flex; align-items:center; flex-direction: row; border-radius: 17px;">
                <span style="background-color: transparent; color: black; font-weight: 600;">Analysis</span>
                <lord-icon src="https://cdn.lordicon.com/hbwqfgcf.json" trigger="hover"
                    colors="outline:#121331,primary:#646e78,secondary:#ffc738,tertiary:#4bb3fd" class="icon">
                </lord-icon>
            </a>
        </div>
</body>
</html>