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
    <title>PocketBuddy-Update Password</title>
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
            height: 100vh;
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

        /* WRAPPER */
        .wrapper{
            position: relative;
            width: 430px;
            height: 400px;
            background-color: var(--white-color);
            border-radius: 15px;
            padding: 120px 32px 64px;
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
            left: 23%;
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
            width: 242px;
            transform: translate(-50%,-50%);
            color: var(--white-color);
            font-size: 21px;
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
        }

        /* FORGOT PASSWORD & TERMS AND CONDITIONS */
        .form-cols{
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            opacity: 0;
            animation: fadeInUp 0.6s forwards 1.2s;
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
            animation: fadeInUp 0.6s forwards 1.4s;
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
            animation: fadeInUp 0.6s forwards 1.6s;
        }
        .switch-form a{
            font-weight: 500;
        }

        /* ERROR MESSAGE */
        .error-msg{
            color: red;
            text-align: center;
            margin-bottom: 15px;
            opacity: 0;
            animation: fadeInUp 0.6s forwards 1.0s;
        }

        /* INSTRUCTION TEXT */
        .instruction-text {
            text-align: center;
            margin-bottom: 20px;
            opacity: 0;
            animation: fadeInUp 0.6s forwards 0.6s;
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
            opacity: 0;
            animation: fadeInUp 0.6s forwards 1.8s;
        }
        #footer{
            padding: 15px;
            margin: 0;
        }

        /* LOADER STYLES */
        .otp-loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            display: none;
        }
        
        .loader-spinner {
            width: 50px;
            height: 50px;
            border: 5px solid rgba(13, 25, 54, 0.2);
            border-radius: 50%;
            border-top-color: var(--primary-color);
            animation: spin 1s ease-in-out infinite;
            margin-bottom: 20px;
        }
        
        .loader-text {
            color: var(--primary-color);
            font-size: 18px;
            font-weight: 500;
        }
        
        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* RESPONSIVE STYLES */
        @media only screen and (max-width: 992px) {
            body {
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
                margin: 20px;
            }
            
            .text-main .p1 {
                font-size: 32px;
            }
        }
    </style>
</head>
<body> 
    <!-- OTP Loader -->
    <div class="otp-loader">
        <div class="loader-spinner"></div>
        <div class="loader-text">Update Password...</div>
    </div>
    
    <div class="wrapper">
        <div class="form-header">
            <div class="titles">
                <div class="title-login">&nbsp;&nbsp;&nbsp;Enter New Password</div>
            </div>
        </div>
        
     
        
        <!-- FORGOT PASSWORD FORM -->
        <form action="userupdatepassword" method="post" class="login-form" onsubmit="showLoader()">
          
            <div class="input-box">
                <input type="password" class="input-field" id="log-password" name="password" required>
                <label for="log-password" class="label">Password</label>
                <i class='bx bx-lock icon'></i>
            </div>
            
            <div class="input-box">
                <input type="password" class="input-field" id="log-Confirmpassword" name="Confirmpassword" required>
                <label for="log-Confitmpassword" class="label">Confirm Password</label>
                <i class='bx bx-lock icon'></i>
            </div>
             <input type="hidden" name="userId" value="${userId}">
            <div class="input-box" style="display: contents;">
                <button class="btn-submit" id="SignInBtn" type="submit">Submit<i class='bx bxs-bell-ring'></i></button>
            </div>
        </form>
    </div>
    
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
        
        // Show loader when form is submitted
        function showLoader() {
            document.querySelector('.otp-loader').style.display = 'flex';
        }
        
        // Hide loader when page is fully loaded (fallback)
        window.addEventListener('load', function() {
            document.querySelector('.otp-loader').style.display = 'none';
        });
    </script>
</body>
</html>