<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/auth.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Login | Sign Up</title>

</head>
<body>

    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form id="signup_form">
                <h1>Create Account</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>or use your email for registration</span>
                <input id="signup-name" type="text" name="signup-name" placeholder="Name" />
                <input id="signup-email" type="email" name="signup-email" placeholder="Email" />
                <input id="signup-pwd" type="password" name="signup-pwd" placeholder="Password" />
                <input id="signup-pwd2" type="password" placeholder="Confirm Password" />
                <button id="signup-submit" type="button" name="submit" onclick="registerUser()">Sign Up</button>
                <p class="form-message" id="signup-message"></p>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form id="signin_form">
                <h1>Sign in</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>or use your account</span>
                <input id="signin-email" type="email" placeholder="Email" />
                <input id="signin-pwd" type="password" placeholder="Password" />
                <a href="#">Forgot your password?</a>
                <button id="signin-submit" type="button" name="signInButton" onclick="loginUser()" >Sign In</button>
                <p id="signin-message"></p>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal info</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend!</h1>
                    <p>Enter your personal details and start journey with us</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>

    <script src="./js/auth.js"></script>
    <script>
        // Button event listeners
            const signUpButton = document.getElementById("signUp");
            const signInButton = document.getElementById("signIn");
            const container = document.getElementById("container");

            signUpButton.addEventListener("click", () => {
                container.classList.add("right-panel-active");
            });

            signInButton.addEventListener("click", () => {
                container.classList.remove("right-panel-active");
            });

            if(isSignedIn()){
                location.href = "../index.php";
            }
    </script>
</body>
</html>

