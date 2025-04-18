<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- BOXICONS -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link href="img/logo.png" rel="icon">
    <title>PocketBuddy-Change Password</title>
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
    justify-content: center;
    align-items: center;
    height: 140vh;
    background-color: var(--background-color);
}

/* WRAPPER */
.wrapper{
    position: relative;
    width: 430px;
    height: 630px;
    background-color: var(--white-color);
    border-radius: 15px;
    padding: 120px 32px 64px;
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
    width: 240px;
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
    cursor: pointer;
}
.password-toggle {
    right: 50px !important;
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
.btn-submit:disabled {
    background-color: #cccccc;
    cursor: not-allowed;
    opacity: 0.7;
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
.error-msg{
    color: red;
    text-align: center;
}  
.password-mismatch {
    border-color: red !important;
}
.password-match {
    border-color: green !important;
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
/* Toast Notification Styles */
.toast-notification {
    position: fixed;
    bottom: 30px;
    right: 30px;
    background-color: #4BB543;
    color: white;
    padding: 15px 25px;
    border-radius: 5px;
    display: flex;
    align-items: center;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    z-index: 99999;
    transform: translateY(100px);
    opacity: 0;
    transition: all 0.3s ease;
}

.toast-notification.show {
    transform: translateY(0);
    opacity: 1;
}

.toast-icon {
    margin-right: 15px;
    font-size: 24px;
}

.toast-message {
    font-size: 16px;
    font-weight: 500;
}
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="form-header">
            <div class="titles">
                <div class="title-login">Changepassword</div>
            </div>
        </div>
        <p style="text-align: center;">Enter Your OTP To Change Password</p>
        <!-- LOGIN FORM -->
<form action="updatepassword" method="post" onsubmit="return validatePasswords()">
    <div class="input-box">
        <input type="text" class="input-field" id="otp" name="otp" required>
        <label for="otp" class="label">OTP</label>
        <i class='bx bxs-key icon'></i>
    </div>
    <div class="input-box">
        <input type="email" class="input-field" id="email" name="email" required>
        <label for="email" class="label">Email</label>
        <i class='bx bx-envelope icon'></i>
    </div>
    <div class="input-box">
        <input type="password" class="input-field" id="password" name="password" required>
        <label for="password" class="label">New Password</label>
        <i class='bx bx-hide icon' id="togglePassword"></i>
    </div>
    <div class="input-box">
        <input type="password" class="input-field" id="confirmPassword" name="confirmPassword" required>
        <label for="confirmPassword" class="label">Confirm Password</label>
        <i class='bx bx-hide icon' id="toggleConfirmPassword"></i>
    </div>
    <div class="form-cols">
        <div class="col-1"></div>
        <div class="col-2">
        </div>
    </div>
     <span class="error-msg">${error }</span>
     <span id="passwordError" class="error-msg" style="display:none;">Passwords do not match!</span>
    <div class="input-box">
        <button type="submit" class="btn-submit" id="submitBtn" disabled>Update Password <i class='bx bxs-lock'></i></button>
    </div>
    <div class="switch-form">
        <span>Don't have an account? <a href="signup" onclick="registerFunction()">SignUp Here</a></span>
    </div>
</form>
    </div>
    <footer id="footer" class="footer">
        © Copyright <strong><span>Pocketbuddy</span></strong>. All Rights Reserved
    </footer>
    <div id="loginToast" class="toast-notification">
        <div class="toast-icon">
            <i class="fas fa-bell"></i>
        </div>
        <div class="toast-message">Sent OTP Successfully!</div>
    </div>
    <script>
        // Password validation function
        function validatePasswords() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const errorMsg = document.getElementById('passwordError');
            const submitBtn = document.getElementById('submitBtn');
            
            if (password !== confirmPassword) {
                errorMsg.style.display = 'block';
                document.getElementById('confirmPassword').classList.add('password-mismatch');
                document.getElementById('confirmPassword').classList.remove('password-match');
                submitBtn.disabled = true;
                return false;
            } else {
                errorMsg.style.display = 'none';
                document.getElementById('confirmPassword').classList.remove('password-mismatch');
                document.getElementById('confirmPassword').classList.add('password-match');
                submitBtn.disabled = false;
                return true;
            }
        }

        // Real-time password validation
        document.getElementById('password').addEventListener('input', validatePasswords);
        document.getElementById('confirmPassword').addEventListener('input', validatePasswords);

        // Toggle password visibility
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');
        
        togglePassword.addEventListener('click', function() {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('bx-show');
            this.classList.toggle('bx-hide');
        });

        // Toggle confirm password visibility
        const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
        const confirmPassword = document.querySelector('#confirmPassword');
        
        toggleConfirmPassword.addEventListener('click', function() {
            const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            confirmPassword.setAttribute('type', type);
            this.classList.toggle('bx-show');
            this.classList.toggle('bx-hide');
        });

        // Function to show toast notification
        function showLoginToast() {
            const toast = document.getElementById('loginToast');
            toast.classList.add('show');
            
            // Hide after 3 seconds
            setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }

        // Check for login success parameter in URL
        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const loginSuccess = urlParams.get('login');
            
            if (loginSuccess === 'success') {
                showLoginToast();
                
                // Clean the URL (remove the parameter)
                const cleanUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
                window.history.replaceState({}, document.title, cleanUrl);
            }
            
            // Initial password validation
            validatePasswords();
        });
    </script>
</body>
</html>