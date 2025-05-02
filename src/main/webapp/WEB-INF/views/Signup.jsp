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
    <title>PocketBuddy-SignUp Page</title>
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
            min-height: 100vh;
            background-color: var(--background-color);
            padding: 68px;
            padding-top: 5px !important;
            
        }

        /* ANIMATIONS */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
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

        @keyframes slideInDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes slideInUp {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        /* WRAPPER */
        .wrapper {
            position: relative;
            width: 590px;
            max-width: 100%;
            background-color: var(--white-color);
            border-radius: 15px;
            padding: 120px 32px 24px;
            border: 1px solid var(--primary-color);
            box-shadow: 0 8px 15px var(--shadow-color);
            margin: 4px 4px;
            animation: fadeIn 0.8s ease-out;
        }
        
        .gender{
               width: 100% !important;
        }

        /* FORM HEADER */
        .form-header {
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

        .title-login {
            color: var(--white-color);
            font-size: 24px;
        }

        /* FORM STYLES */
        .login-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* INPUT BOX */
        .input-box {
            position: relative;
            opacity: 0;
            transform: translateY(20px);
            animation: slideInUp 0.5s ease-out forwards;
        }
        input[type="email"]{
            width: 100%;
        }

        /* Staggered animations for input fields */
        .input-box:nth-child(1) { animation-delay: 0.2s; }
        .input-box:nth-child(2) { animation-delay: 0.3s; }
        .input-box:nth-child(3) { animation-delay: 0.4s; }
        .input-box:nth-child(4) { animation-delay: 0.5s; }
        .input-box:nth-child(5) { animation-delay: 0.6s; }
        .input-box:nth-child(6) { animation-delay: 0.7s; }
        .input-box:nth-child(7) { animation-delay: 0.8s; }
        .input-box:nth-child(8) { animation-delay: 0.9s; }

        .input-field {
            width: 100%;
            height: 55px;
            padding: 0 20px;
            border: 1px solid var(--input-border-color);
            border-radius: 30px;
            font-size: 16px;
            outline: none;
            transition: all 0.3s ease;
        }

        .input-field:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(13, 25, 54, 0.1);
        }

        .label {
            position: absolute;
            top: 50%;
            left: 20px;
            transform: translateY(-50%);
            color: var(--secondary-color);
            transition: all 0.2s ease;
            pointer-events: none;
        }

        .input-field:focus ~ .label,
        .input-field:not(:placeholder-shown) ~ .label {
            top: 0;
            font-size: 14px;
            background-color: var(--white-color);
            padding: 0 10px;
            color: var(--primary-color);
        }

        .icon {
            position: absolute;
            top: 50%;
            right: 20px;
            transform: translateY(-50%);
            color: var(--secondary-color);
            transition: color 0.3s ease;
            cursor: pointer;
        }

        .input-field:focus ~ .icon {
            color: var(--primary-color);
        }

        /* FILE INPUT */
        .file-input-container {
            position: relative;
            margin-bottom: 5px;
        }
        
        .file-input-wrapper {
            display: flex;
            align-items: center;
            height: 55px;
            border: 1px solid var(--input-border-color);
            border-radius: 30px;
            padding: 0 20px;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .file-input-label {
            position: absolute;
            left: 20px;
            color: var(--secondary-color);
            pointer-events: none;
            transition: all 0.3s ease;
        }
        
        .file-input-wrapper input[type="file"] {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }
        
        .file-input-text {
            margin-left: 40px;
            color: var(--secondary-color);
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            transition: all 0.3s ease;
        }
        
        .file-input-wrapper:has(input:focus) {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(13, 25, 54, 0.1);
        }
        
        .file-input-note {
            color: red;
            font-size: 14px;
            margin-top: 5px;
            padding-left: 20px;
            animation: fadeIn 0.5s 1.1s both;
        }

        /* NAME FIELDS CONTAINER */
        .name-fields {
            display: flex;
            gap: 12px;
            width: 100%;
        }
        
        .name-field {
            position: relative;
            flex: 1;
        }
        
        /* PASSWORD FIELDS CONTAINER */
        .password-fields {
            display: flex;
            gap: 12px;
            width: 100%;
        }
        
        .password-field {
            position: relative;
            flex: 1;
        }

        /* SUBMIT BUTTON */
        .btn-submit {
            width: 100%;
            height: 50px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
            transition: all 0.3s ease;
            animation: fadeIn 0.5s 1s both;
        }

        .btn-submit:hover:not(:disabled) {
            background-color: #152857;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(13, 25, 54, 0.2);
        }

        .btn-submit:hover:not(:disabled) i {
            transform: translateX(5px);
        }

        .btn-submit i {
            transition: transform 0.3s ease;
        }

        .btn-submit:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
            opacity: 0.7;
        }

        /* PASSWORD MISMATCH MESSAGE */
        .password-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-top: -15px;
            margin-bottom: 10px;
            display: none;
        }

        /* FOOTER */
        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: var(--primary-color);
            color: var(--white-color);
            text-align: center;
            padding: 15px 0;
            z-index: 10;
            animation: fadeIn 0.8s 1.2s both;
        }
       span[style="color:red"] {
            display: block;
            text-align: center;
            margin-bottom: 15px;
            opacity: 0;
            animation: fadeInUp 0.6s forwards 1.0s;
        }
        
        /* LOADER STYLES */
        .signup-loader {
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

        /* RESPONSIVE */
        @media (max-width: 480px) {
            .wrapper {
                padding: 100px 20px 70px;
            }
            
            .input-field {
                height: 50px;
            }
            
            .name-fields,
            .password-fields {
                flex-direction: column;
                gap: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Loader Container -->
    <div class="signup-loader">
        <div class="loader-spinner"></div>
        <div class="loader-text">Creating your account...</div>
    </div>
    
    <div class="wrapper">
        <div class="form-header">
            <div class="title-login">SignUp</div>
        </div>
        
        <form action="saveuser" class="login-form" method="post" enctype="multipart/form-data" onsubmit="showLoader()">
            <div class="input-box">
                <div class="name-fields">
                    <div class="name-field">
                        <input type="text" class="input-field" id="firstName" name="firstName" placeholder=" " required>
                        <label for="firstName" class="label">First Name</label>
                        <i class='bx bx-user icon'></i>
                    </div>
                    <div class="name-field">
                        <input type="text" class="input-field" id="lastName" name="lastName" placeholder=" ">
                        <label for="lastName" class="label">Last Name</label>
                        <i class='bx bx-user icon'></i>
                    </div>
                </div>
            </div>
            

            <div class="input-box">
                <select class="input-field gender" id="gender" name="gender">
                    <option value="">--Select Gender--</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="trans">Transgender</option>
                    <option value="other">Other</option>
                </select>
                <label for="gender" class="label">Gender</label>
                <i class='bx bx-male-female icon'></i>
            </div>
            
            <div class="input-box">
                <input type="email" class="input-field" id="email" name="email" placeholder=" ">
                <label for="email" class="label">Email</label>
                <i class='bx bx-envelope icon'></i>
            </div>
            
            <div class="input-box">
                <div class="password-fields">
                    <div class="password-field">
                        <input type="password" class="input-field" id="password" name="password" placeholder=" " required>
                        <label for="password" class="label">Password</label>
                        <i class='bx bx-hide icon toggle-password'></i>
                    </div>
                    <div class="password-field">
                        <input type="password" class="input-field" id="confirmpassword" name="confirmpassword" placeholder=" " required>
                        <label for="confirmpassword" class="label">Confirm Password</label>
                        <i class='bx bx-hide icon toggle-password'></i>
                    </div>
                </div>
                <div id="password-message" class="password-message">Passwords do not match!</div>
            </div>
            
            <div class="input-box">
                <div class="name-fields">
                    <div class="name-field">
                        <input type="tel" class="input-field" id="contactNum" name="contactNum" placeholder=" ">
                        <label for="contactNum" class="label">Contact No.</label>
                        <i class='bx bxs-phone icon'></i>
                    </div>
                    <div class="name-field">
                        <input type="date" class="input-field" id="bornYear" name="bornYear" placeholder=" ">
                        <label for="bornYear" class="label">Date of Birth</label>
                    </div>
                </div>
            </div>
            
            <div class="input-box file-input-container">
                <div class="file-input-wrapper">
                    <label class="file-input-label"></label>
                    <input type="file" id="profilePic" name="profilePic" accept="image/*">
                    <span class="file-input-text" id="fileDisplay">No file chosen</span>
                    <i class='bx bx-upload icon'></i>
                </div>
                <div class="file-input-note">*Upload Photo</div>
            </div>

            <button type="submit" class="btn-submit" disabled>
                Submit <i class='bx bx-log-in'></i>
            </button>
        </form><br>
        
        <p>You already SignUp !<a href="login"> <span>Click Here</span></a></p>
    </div>
    <footer>
        © Copyright <strong><span>Pocketbuddy</span></strong>. All Rights Reserved
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const passwordField = document.getElementById('password');
            const confirmPasswordField = document.getElementById('confirmpassword');
            const submitButton = document.querySelector('.btn-submit');
            const passwordMessage = document.getElementById('password-message');
            const togglePasswordIcons = document.querySelectorAll('.toggle-password');
            
            // Function to validate password match
            function validatePasswords() {
                const password = passwordField.value;
                const confirmPassword = confirmPasswordField.value;
                
                // Check if passwords match and meet minimum length
                const isValid = password === confirmPassword && password.length >= 3;
                
                // Update button state
                submitButton.disabled = !isValid;
                
                // Show/hide error message
                if (confirmPassword.length > 0 && password !== confirmPassword) {
                    passwordMessage.style.display = 'block';
                    passwordField.style.borderColor = 'red';
                    confirmPasswordField.style.borderColor = 'red';
                } else {
                    passwordMessage.style.display = 'none';
                    passwordField.style.borderColor = '';
                    confirmPasswordField.style.borderColor = '';
                }
            }
            
            // Add event listeners for real-time validation
            passwordField.addEventListener('input', validatePasswords);
            confirmPasswordField.addEventListener('input', validatePasswords);
            
            // Toggle password visibility
            togglePasswordIcons.forEach(icon => {
                icon.addEventListener('click', function() {
                    const inputField = this.parentElement.querySelector('input');
                    const isPassword = inputField.type === 'password';
                    
                    inputField.type = isPassword ? 'text' : 'password';
                    this.classList.toggle('bx-hide');
                    this.classList.toggle('bx-show');
                });
            });
            
            // File input display
            document.getElementById('profilePic').addEventListener('change', function(e) {
                const fileName = e.target.files[0] ? e.target.files[0].name : 'No file chosen';
                document.getElementById('fileDisplay').textContent = fileName;
            });
            
            // Input field interactions
            document.querySelectorAll('.input-field').forEach(input => {
                // Focus/blur effects
                input.addEventListener('focus', function() {
                    this.parentNode.querySelector('.icon').style.color = 'var(--primary-color)';
                    if (this === passwordField || this === confirmPasswordField) {
                        this.style.borderColor = '';
                    }
                });
                
                input.addEventListener('blur', function() {
                    this.parentNode.querySelector('.icon').style.color = 'var(--secondary-color)';
                });
            });
            
            // Initial validation
            validatePasswords();
        });
        
        // Show loader when form is submitted
        function showLoader() {
            document.querySelector('.signup-loader').style.display = 'flex';
        }
        
        // Hide loader when page is fully loaded (fallback)
        window.addEventListener('load', function() {
            document.querySelector('.signup-loader').style.display = 'none';
        });
    </script>
</body>
</html>