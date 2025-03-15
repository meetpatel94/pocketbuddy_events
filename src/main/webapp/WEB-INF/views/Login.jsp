<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- BOXICONS -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <!-- CSS -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    />
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link href="img/logo.png" rel="icon">
    <title>PocketBuddy-Login Page</title>
    <style>
        /* IMPORT FONT */
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

/* COLOR VARIABLES */
:root {
    --primary-color: #0D1936;
    --secondary-color: #535354;
    --background-color: #EFEFEF;
    --shadow-color: rgba(0, 0, 0, 0.1);
    --white-color: #FFF;
    --black-color: #000;
    --input-border-color: #E3E4E6;
    --transition-3s: 0.3s;
}

/* GLOBAL STYLES */
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

/* REUSABLE ELEMENTS */
a{
    text-decoration: none;
    color: var(--black-color);
    transition: var(--transition-3s);
}
a:hover{
    text-decoration: underline;
}

body{
    display: flex;
    justify-content: flex-end;
    align-items: center;
    height: 90vh;
    background-color: var(--background-color);
    margin-right: 180px;
}

/* WRAPPER */
.wrapper{
    position: relative;
    width: 430px;
    height: 480px;
    background-color: var(--white-color);
    border-radius: 15px;
    padding: 120px 25px 64px;
    border: 1px solid var(--primary-color);
    box-shadow: 0 8px 15px var(--shadow-color);
    transition: var(--transition-3s);
    overflow: hidden;
}
/* FORM HEADER */
.form-header{
    position: absolute;
    top: 0;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    align-items: center;
    justify-content: center;
    width: 140px;
    height: 70px;
    background-color: var(--primary-color);
    border-radius: 0 0 20px 20px;
}
.form-header::before, .form-header::after{
    content: "";
    position: absolute;
    top: 0;
    width: 30px;
    height: 30px;
}
.form-header::before{
    left: -30px;
    border-top-right-radius: 50%;
    box-shadow: 15px 0 0 var(--primary-color);
}
.form-header::after{
    right: -30px;
    border-top-left-radius: 50%;
    box-shadow: -15px 0 0 var(--primary-color);
}
/* TITLES */
.titles{
    position: relative;
}
.title-login, .title-register{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    color: var(--white-color);
    font-size: 24px;
    transition: var(--transition-3s);
}
.title-register{
    top: 50px;
}

/* FORMS */
.login-form, .register-form{
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    width: 85%;
    transition: var(--transition-3s);
}
.register-form{
    left: 150%;
}

/* INPUT FIELDS */
.input-box{
    position: relative;
    display: flex;
    flex-direction: column;
    margin: 20px 0;
}
.input-field{
    width: 100%;
    height: 55px;
    font-size: 16px;
    background: transparent;
    color: var(--black-color);
    padding: 0 20px;
    border: 1px solid var(--input-border-color);
    border-radius: 30px;
    outline: none;
    transition: var(--transition-3s);
}
.input-field:focus{
    border: 1px solid var(--primary-color);
}
.label{
    position: absolute;
    top: 50%;
    left: 20px;
    transform: translateY(-50%);
    color: var(--secondary-color);
    transition: 0.2s;
    cursor: text;
}
.input-field:focus ~ .label,
.input-field:valid ~ .label{
    top: 0;
    font-size: 14px;
    background-color: var(--white-color);
    color: var(--primary-color);
    padding: 0 10px;
}
.input-field:valid ~ .label{
    color: var(--secondary-color);
}
.icon{
    position: absolute;
    top: 50%;
    right: 25px;
    transform: translateY(-50%);
    font-size: 20px;
    color: var(--secondary-color);
}
/* FORGOT PASSWORD & TERMS AND CONDITIONS */
.form-cols{
    display: flex;
    justify-content: space-between;
    font-size: 14px;
}
.col-1{
    display: flex;
    align-items: center;
    gap: 6px;
}
/* SUBMIT BUTTON */
.btn-submit{
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    width: 100%;
    height: 50px;
    background-color: var(--primary-color);
    color: var(--white-color);
    font-size: 16px;
    font-weight: 500;
    border: none;
    border-radius: 30px;
    cursor: pointer;
    transition: var(--transition-3s);
}
.btn-submit:hover{
    gap: 15px;
}
.btn-submit i{
    font-size: 20px;
}
/* SWITCH FORM */
.switch-form{
    text-align: center;
}
.switch-form a{
    font-weight: 500;
}
.text-main{
    position: fixed;
    left: 60px;
}
.text-main .p1{
    font-size: 60px;
    color: var(--primary-color);
    font-weight: 600;
}
.text-main .p2{
    font-size: 16px;
    color: var(--secondary-color);
    font-weight: 500;
}
p{
    margin: 0;
    padding: 0;
}
footer{
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    background-color: var(--primary-color);
    color: var(--white-color);
    text-align: center;
    padding: 1px 0;
}
#footer{
    padding: 15px;
    margin: 0;
}
/* RESPONSIVE STYLES */
@media only screen and (max-width: 564px){
    .wrapper{
        margin: 20px;
    }
}
    </style>
</head>
<body>
<div class="text-main">
        <p class="p1"><i class="fa-solid fa-location-dot"></i> Pocket Buddy</p>
        <p class="p2">&emsp;Your go-to site for discovering nearby events,</p>
        <p class="p2">&emsp;concerts, and shows.Stay updated, explore, and never miss out </p>
        <p class="p2">&emsp;on exciting happenings around you!</p>
    </div>
    <div class="wrapper">
        <div class="form-header">
            <div class="titles">
                <div class="title-login">Login</div>
            </div>
        </div>
        <!-- LOGIN FORM -->
<form action="authenticate" method="post">
    <div class="input-box">
        <input type="text" class="input-field" id="log-email" name="email" required>
        <label for="log-email" class="label">Email</label>
        <i class='bx bx-envelope icon'></i>
    </div>
    <div class="input-box">
        <input type="password" class="input-field" id="log-pass" name="password" required>
        <label for="log-pass" class="label">Password</label>
        <i class='bx bx-lock-alt icon'></i>
    </div>
    <span style="color:red">${error }</span>
    <div class="form-cols">
        <div class="col-1"></div>
        <div class="col-4">
            <a href="forgetpassword">Forgot password?</a>
        </div>
    </div>
    <div class="input-box">
        <button class="btn-submit" id="SignInBtn">Login <i class='bx bx-log-in'></i></button>
    </div>
    <div class="switch-form">
        <span>Don't have an account? <a href="signup" onclick="registerFunction()">SignUp Here</a></span>
    </div>
</form>
</div>
<footer id="footer" class="footer">
        
            © Copyright <strong><span>Pocketbuddy</span></strong>. All Rights
            Reserved
        
    </footer>
</body>
</html>