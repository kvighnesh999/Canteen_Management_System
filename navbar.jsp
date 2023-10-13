<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CMS Navbar</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light navbar-custom">
        <div class="container-fluid">
            <!-- Logo on the left -->
            <a class="navbar-brand" href="#" style="display: flex; align-items: center;">
                <img src="logo.png" alt="Hotel Logo" width="105px" height="auto">
                <h1 class="name">Lazeez</h1>
            </a>
            <div class="navbar-text ml-auto" style="margin: 0%; padding: 0%;">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <span class="nav-link"
                            style="display: flex; gap: 20px; color: black; margin-right: -2.4rem; margin: 0%; padding: 0%;">
                            <div
                                style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                <span style="font-size: 40px;" id="current-time"></span>
                                <span id="current-date"></span>
                            </div>
                            <div style="transform: rotate(270deg);">
                                <span style="font-weight:700;" id="current-day"></span>
                            </div>

                        </span>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
    <!-- JavaScript for displaying time, date, and day -->
    <script>
        function updateClock() {
            const now = new Date();
            const time = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
            const date = now.toLocaleDateString(undefined, { year: 'numeric', month: 'long', day: 'numeric' });
            const day = now.toLocaleDateString(undefined, { weekday: 'long' });
            document.getElementById('current-time').textContent = time;
            document.getElementById('current-date').textContent = date;
            document.getElementById('current-day').textContent = day;
        }

        // Update the clock every second
        setInterval(updateClock, 1000);

        // Initial update
        updateClock();
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
</body>
</html>