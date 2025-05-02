<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link href="img/logo.png" rel="icon">
    <title>PocketBuddy-Forgot Password</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');
        
        :root {
            --primary-color: #0D1936;
            --secondary-color: #535354;
            --background-color: #EFEFEF;
            --shadow-color: rgba(0, 0, 0, 0.1);
            --white-color: #FFF;
            --black-color: #000;
            --input-border-color: #E3E4E6;
            --transition-3s: 0.3s;
            --error-color: #ff4444;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: var(--background-color);
        }

        .wrapper {
            position: relative;
            width: 430px;
            height: 400px;
            background-color: var(--white-color);
            border-radius: 15px;
            padding: 120px 32px 64px;
            border: 1px solid var(--primary-color);
            box-shadow: 0 8px 15px var(--shadow-color);
        }

        .form-header {
            position: absolute;
            top: 0;
            left: 25%;
            width: 230px;
            height: 70px;
            background-color: var(--primary-color);
            border-radius: 0 0 20px 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-header::before, .form-header::after {
            content: "";
            position: absolute;
            top: 0;
            width: 30px;
            height: 30px;
        }

        .form-header::before {
            left: -30px;
            border-top-right-radius: 50%;
            box-shadow: 15px 0 0 var(--primary-color);
        }

        .form-header::after {
            right: -30px;
            border-top-left-radius: 50%;
            box-shadow: -15px 0 0 var(--primary-color);
        }

        .title-login {
            color: var(--white-color);
            font-size: 24px;
        }

        .input-box {
            position: relative;
            margin: 20px 0;
        }

        .input-field {
            width: 100%;
            height: 55px;
            padding: 0 20px;
            border: 1px solid var(--input-border-color);
            border-radius: 30px;
            outline: none;
        }

        .input-field:focus {
            border: 1px solid var(--primary-color);
        }

        .label {
            position: absolute;
            top: 50%;
            left: 20px;
            transform: translateY(-50%);
            color: var(--secondary-color);
        }

        .input-field:focus ~ .label,
        .input-field:valid ~ .label {
            top: 0;
            font-size: 14px;
            background-color: var(--white-color);
            padding: 0 10px;
        }

        .icon {
            position: absolute;
            top: 50%;
            right: 25px;
            transform: translateY(-50%);
        }

        .btn-submit {
            width: 100%;
            height: 50px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-submit:hover {
            background-color: #152857;
        }

        .btn-submit:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }

        .error-msg {
            color: var(--error-color);
            text-align: center;
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: var(--primary-color);
            color: white;
            text-align: center;
            padding: 15px 0;
        }

        .otp-loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            display: none;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            z-index: 1000;
        }

        .loader-spinner {
            width: 50px;
            height: 50px;
            border: 5px solid #f3f3f3;
            border-top: 5px solid var(--primary-color);
            border-radius: 50%;
            animation: spin 2s linear infinite;
        }

        .loader-text {
            margin-top: 20px;
            color: var(--primary-color);
            font-size: 18px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @media (max-width: 768px) {
            .wrapper {
                width: 90%;
                padding: 100px 20px 40px;
            }
        }
    </style>
</head>
<body>
    <div class="otp-loader">
        <div class="loader-spinner"></div>
        <div class="loader-text">Sending Link...</div>
    </div>

    <div class="wrapper">
        <div class="form-header">
            <div class="title-login">Forgot Password</div>
        </div>
        
        <p style="text-align:center;margin-bottom:20px;">Enter Your Email or Phone No. To Send Update Password Link</p>
        
        <form action="sendLink" method="post" class="login-form" onsubmit="return validateForm()">
            <div class="input-box">
                <input type="text" class="input-field" id="log-email" name="input" required>
                <label for="log-email" class="label">Email Or Phone No.</label>
                <i class='bx bx-envelope icon'></i>
                <div style="color:#ff4444;font-size:12px;display:none;" id="email-error">Invalid email or phone number</div>
            </div>
            
            <input type="hidden" name="contactNum" value="${users.contactNum}">
            <input type="hidden" name="email" value="${users.email}">
            <input type="hidden" id="formattedPhone" name="formattedPhone">
            
            <div style="margin-top:30px;">
                <button class="btn-submit" id="SignInBtn" type="submit">
                    Send Link <i class='bx bxs-link'></i>
                </button>
            </div>
            <div class="error-msg">${error}</div>
        </form>
    </div>

    <footer>
        © Copyright <strong>Pocketbuddy</strong>. All Rights Reserved
    </footer>

    <script>
        const contactInput = document.getElementById('log-email');
        const submitBtn = document.getElementById('SignInBtn');
        const emailError = document.getElementById('email-error');
        const formattedPhone = document.getElementById('formattedPhone');
        const storedContact = document.querySelector('[name="contactNum"]').value;
        const storedEmail = document.querySelector('[name="email"]').value;
        const loader = document.querySelector('.otp-loader');

        submitBtn.disabled = true;

        contactInput.addEventListener('input', function() {
            validateInput();
        });

        function isPhoneNumber(input) {
            return /^[\d+]+$/.test(input);
        }

        function formatPhone(input) {
            let digits = input.replace(/\D/g, '');
            
            if (digits.length >= 6) {
                if (digits.startsWith('91') && digits.length >= 10) {
                    return '+' + digits;
                }
                return '+91' + digits;
            }
            return digits;
        }

        function validateInput() {
            const input = contactInput.value.trim();
            let isValid = false;
            
            if (isPhoneNumber(input)) {
                const formatted = formatPhone(input);
                const digitsOnly = formatted.replace(/\D/g, '');
                const storedDigits = storedContact.replace(/\D/g, '');
                
                if (digitsOnly === storedDigits) {
                    isValid = true;
                    emailError.style.display = 'none';
                    formattedPhone.value = formatted;
                } else {
                    emailError.style.display = 'block';
                }
            } 
            else if (input === storedEmail) {
                isValid = true;
                emailError.style.display = 'none';
                formattedPhone.value = '';
            }
            else {
                emailError.style.display = 'block';
            }
            
            submitBtn.disabled = !isValid;
            return isValid;
        }

        function validateForm() {
            const input = contactInput.value.trim();
            
            if (validateInput()) {
                if (isPhoneNumber(input)) {
                    const formatted = formatPhone(input);
                    contactInput.value = formatted;
                    formattedPhone.value = formatted;
                }
                
                // Show loader for 2 seconds before submitting
                loader.style.display = 'flex';
                
                // Disable submit button during loading
                submitBtn.disabled = true;
                
                // Submit form after 2 seconds
                setTimeout(() => {
                    loader.style.display = 'none';
                    document.querySelector('form').submit();
                }, 2000);
                
                return false; // Prevent immediate form submission
            }
            return false;
        }
    </script>
</body>
</html>