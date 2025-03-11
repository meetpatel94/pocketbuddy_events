<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pocket Buddy Navbar</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* General Styles */
body {
    margin: 0;
    font-family: Arial, sans-serif;
}

/* Navbar */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #007bff;
    padding: 15px 20px;
    color: white;
}

.logo {
    font-size: 1.5em;
    font-weight: bold;
}

.nav-links {
    list-style: none;
    display: flex;
    gap: 25px;
}

.nav-links li {
    display: inline;
}

.nav-links a {
    text-decoration: none;
    color: white;
    font-size: 1em;
}

.sign-in {
    background: white;
    color: #007bff;
    padding: 8px 15px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
}

/* Mobile Menu */
.menu-toggle {
    font-size: 1.8em;
    display: none;
    cursor: pointer;
}

.mobile-menu {
    display: none;
    flex-direction: column;
    background: #007bff;
    position: absolute;
    top: 60px;
    width: 100%;
    text-align: center;
    padding: 10px 0;
}

.mobile-menu li {
    list-style: none;
    padding: 10px 0;
}

.mobile-menu a {
    color: white;
    text-decoration: none;
    font-size: 1.2em;
}

.mobile-menu.open {
    display: flex;
}

/* Responsive */
@media screen and (max-width: 768px) {
    .nav-links, .sign-in {
        display: none;
    }
    .menu-toggle {
        display: block;
    }
}

    </style>
</head>
<body>

    <nav class="navbar">
      <div class="logo">Pocket Buddy</div>
        <ul class="nav-links">
            <li><a href="#events">Events</a></li>
            <li><a href="#concerts">Concerts</a></li>
            <li><a href="#shows">Shows</a></li>
            <li><a href="#about">About</a></li>
        </ul>
        <a href="logout" class="sign-in">LogOut</a>
        <div class="menu-toggle" onclick="toggleMenu()">☰</div>
    </nav>

    <ul class="mobile-menu">
        <li><a href="#events">Events</a></li>
        <li><a href="#concerts">Concerts</a></li>
        <li><a href="#shows">Shows</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="logout">LogOut</a></li>
    </ul>

    <script>
        function toggleMenu() {
            document.querySelector('.mobile-menu').classList.toggle('open');
        }
    </script>

</body>
</html>
    