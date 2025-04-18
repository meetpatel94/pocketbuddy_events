<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- BOXICONS -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
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
            margin-right: 180px;
            align-items: center;
            height: 90vh;
            background-color: var(--background-color);
        }

        /* ANIMATIONS */
        @keyframes fadeInLeft {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes fadeInRight {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes scaleIn {
            from {
                transform: scale(0.8);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        /* TEXT MAIN SECTION */
        .text-main {
            position: fixed;
            left: 60px;
            opacity: 0;
            animation: fadeInLeft 0.8s forwards 0.3s;
        }

        .text-main .p1 {
            font-size: 55px;
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 15px;
        }
        
        .text-main .p1 i {
            animation: pulse 2s infinite 1s;
            color: var(--primary-color);
        }

        .text-main .p2 {
            font-size: 16px;
            color: var(--secondary-color);
            font-weight: 500;
            line-height: 1.6;
            opacity: 0;
            transform: translateY(20px);
        }

        .text-main .p2:nth-child(2) { animation: fadeInUp 0.6s forwards 0.6s; }
        .text-main .p2:nth-child(3) { animation: fadeInUp 0.6s forwards 0.8s; }
        .text-main .p2:nth-child(4) { animation: fadeInUp 0.6s forwards 1.0s; }

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
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 0.8s forwards 0.5s;
        }

        /* FORM HEADER */
        .form-header{
            position: absolute;
            top: 0;
            left: 34%;
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
            opacity: 0;
            transform: translateY(20px);
        }

        .input-box:nth-child(1) { animation: fadeInUp 0.6s forwards 0.8s; }
        .input-box:nth-child(2) { animation: fadeInUp 0.6s forwards 1.0s; }
        .input-box:nth-child(3) { animation: fadeInUp 0.6s forwards 1.2s; }
        .input-box:nth-child(4) { animation: fadeInUp 0.6s forwards 1.4s; }

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
            box-shadow: 0 0 0 3px rgba(13, 25, 54, 0.1);
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

        /* FORGOT PASSWORD & TERMS AND CONDITIONS */
        .form-cols{
            display: flex;
            justify-content: space-between;
            font-size: 16px;
            opacity: 0;
            animation: fadeInUp 0.6s forwards 1.4s;
            margin-bottom: 3px;
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
            opacity: 0;
            animation: fadeInUp 0.6s forwards 1.6s;
        }
        .btn-submit:hover{
            gap: 15px;
            background-color: #152857;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(13, 25, 54, 0.2);
        }
        .btn-submit i{
            font-size: 20px;
        }

        /* SWITCH FORM */
        .switch-form{
            text-align: center;
            opacity: 0;
            animation: fadeInUp 0.6s forwards 1.8s;
        }
        .switch-form a{
            font-weight: 500;
        }

        /* ERROR MESSAGE */
        span[style="color:red"] {
            display: block;
            text-align: center;
            margin-bottom: 15px;
            opacity: 0;
            animation: fadeInUp 0.6s forwards 1.0s;
        }

        p{
            margin: 0;
            padding: 0;
        }

       
        /* FOOTER */
        footer{
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: var(--primary-color);
            color: var(--white-color);
            text-align: center;
            padding: 1px 0;
            opacity: 0;
            animation: fadeInUp 0.6s forwards 2.0s;
        }
        #footer{
            padding: 15px;
            margin: 0;
        }

        /* RESPONSIVE STYLES */
        @media only screen and (max-width: 992px) {
            body {
                justify-content: center;
                margin-right: 0;
                flex-direction: column;
                height: auto;
                padding: 40px 20px;
            }
            
            .text-main {
                position: relative;
                left: 0;
                text-align: center;
                margin-bottom: 40px;
                width: 100%;
            }
            
            .text-main .p1 {
                font-size: 40px;
            }
            
            .wrapper {
                margin-top: 20px;
            }
        }

        @media only screen and (max-width: 564px){
            .wrapper{
                width: 100%;
                max-width: 380px;
            }
            
            .text-main .p1 {
                font-size: 32px;
            }
            
            .text-main .p2 {
                font-size: 14px;
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
<!-- Toast Notification -->
<div id="loginToast" class="toast-notification">
  <div class="toast-icon">
    <i class="fas fa-check-circle"></i>
  </div>
  <div class="toast-message">Password Updated!</div>
</div>
    <div class="text-main">
        <p class="p1"><i class="fa-solid fa-location-dot"></i> Pocket Buddy</p>
        <p class="p2">&emsp;Your go-to site for discovering nearby events,</p>
        <p class="p2">&emsp;concerts, and shows. Stay updated, explore, and never miss out </p>
        <p class="p2">&emsp;on exciting happenings around you!</p>
    </div>
    
    <div class="wrapper">
        <div class="form-header">
            <div class="titles">
                <div class="title-login">Login</div>
            </div>
        </div>
        
        <!-- LOGIN FORM -->
        <form action="authenticate" method="post" class="login-form">
            <div class="input-box">
                <input type="text" class="input-field" id="log-email" name="email" required>
                <label for="log-email" class="label">Email</label>
                <i class='bx bx-envelope icon'></i>
            </div>
            <div class="input-box">
                <input type="password" class="input-field" id="log-pass" name="password" required>
                <label for="log-pass" class="label">Password</label>
                <i class='bx bx-hide icon' id="togglePassword"></i>
            </div>
            <span style="color:red">${error }</span>
            <div class="input-box">
                <button class="btn-submit" id="SignInBtn">Login <i class='bx bx-log-in'></i> </button>
            </div>
            <div class="form-cols">
                <div class="col-1"></div>
                <div class="col-5">
                    <a href="forgetpassword">Forgot password?</a>
                </div>
            </div>
            
            <div class="switch-form">
                <span>Don't have an account? <a href="signup" onclick="registerFunction()">SignUp Here</a></span>
            </div>
        </form>
    </div>
    
    <!-- Toast Notification -->
    
    
    <footer id="footer" class="footer">
        © Copyright <strong><span>Pocketbuddy</span></strong>. All Rights Reserved
    </footer>

    <script>
        // Add focus effects to input fields
        document.querySelectorAll('.input-field').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.querySelector('.icon').style.color = 'var(--primary-color)';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.querySelector('.icon').style.color = 'var(--secondary-color)';
            });
        });

        // Button hover effect
        document.querySelector('.btn-submit').addEventListener('mouseenter', function() {
            this.querySelector('i').style.transform = 'translateX(5px)';
        });
        
        document.querySelector('.btn-submit').addEventListener('mouseleave', function() {
            this.querySelector('i').style.transform = 'translateX(0)';
        });

        // Toggle password visibility
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#log-pass');

        togglePassword.addEventListener('click', function() {
            // Toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            
            // Toggle the eye icon between show/hide states
            this.classList.toggle('bx-show');
            this.classList.toggle('bx-hide');
        });

    </script>
    <script>
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
});
</script>
</body>
</html>