<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Create Account | ChatSphere</title>


<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;

    font-family:
        Arial,
        sans-serif;
}


body {

    min-height: 100vh;

    display: flex;

    justify-content: center;

    align-items: center;

    padding: 25px;

    background:

        linear-gradient(

            135deg,

            #667eea,

            #764ba2

        );

}


/* Main registration box */


.register-container {

    width: 100%;

    max-width: 950px;

    min-height: 600px;

    display: flex;

    overflow: hidden;

    background-color: white;

    border-radius: 25px;

    box-shadow:

        0 25px 60px

        rgba(

            34,

            20,

            80,

            0.35

        );

}


/* ========================= */
/* LEFT SECTION */
/* ========================= */


.welcome-section {

    width: 48%;

    display: flex;

    flex-direction: column;

    justify-content: center;

    padding: 60px;

    color: white;

    background:

        linear-gradient(

            145deg,

            #4f46c7,

            #764ba2

        );

}


.logo {

    display: flex;

    align-items: center;

    gap: 12px;

    margin-bottom: 60px;

    font-size: 27px;

    font-weight: bold;

}


.logo-icon {

    width: 50px;

    height: 50px;

    display: flex;

    justify-content: center;

    align-items: center;

    border-radius: 15px;

    background:

        rgba(

            255,

            255,

            255,

            0.17

        );

    font-size: 26px;

}


.welcome-section h1 {

    margin-bottom: 20px;

    font-size: 39px;

    line-height: 1.2;

}


.welcome-section p {

    color: #e3e0ff;

    font-size: 16px;

    line-height: 1.7;

}


.features {

    margin-top: 35px;

}


.feature {

    margin-top: 17px;

    color: #f3f1ff;

    font-size: 15px;

}


/* ========================= */
/* RIGHT REGISTRATION FORM */
/* ========================= */


.form-section {

    width: 52%;

    display: flex;

    justify-content: center;

    align-items: center;

    padding: 55px;

}


.form-content {

    width: 100%;

    max-width: 360px;

}


.form-content h2 {

    margin-bottom: 10px;

    color: #29283b;

    font-size: 30px;

}


.subtitle {

    margin-bottom: 35px;

    color: #858295;

    font-size: 14px;

}


/* Form labels */


.input-group {

    margin-bottom: 22px;

}


.input-group label {

    display: block;

    margin-bottom: 9px;

    color: #454254;

    font-size: 14px;

    font-weight: bold;

}


/* Input container */


.input-box {

    display: flex;

    align-items: center;

    padding: 0 15px;

    border:

        1px solid

        #deddea;

    border-radius: 13px;

    background-color:

        #f8f8fc;

    transition: 0.3s;

}


.input-box:focus-within {

    border-color:

        #7063db;

    background-color: white;

    box-shadow:

        0 0 0 4px

        rgba(

            112,

            99,

            219,

            0.1

        );

}


.input-icon {

    margin-right: 10px;

    font-size: 18px;

}


.input-box input {

    width: 100%;

    padding: 15px 5px;

    border: none;

    outline: none;

    color: #29283b;

    background: transparent;

    font-size: 15px;

}


/* Create account button */


.register-button {

    width: 100%;

    margin-top: 10px;

    padding: 16px;

    border: none;

    border-radius: 13px;

    color: white;

    background:

        linear-gradient(

            135deg,

            #667eea,

            #764ba2

        );

    font-size: 16px;

    font-weight: bold;

    cursor: pointer;

    transition: 0.3s;

}


.register-button:hover {

    transform:

        translateY(-3px);

    box-shadow:

        0 10px 25px

        rgba(

            102,

            92,

            210,

            0.35

        );

}


/* Login link */


.login-text {

    margin-top: 27px;

    color: #777487;

    text-align: center;

    font-size: 14px;

}


.login-text a {

    color: #6555ce;

    font-weight: bold;

    text-decoration: none;

}


.login-text a:hover {

    text-decoration: underline;

}


/* Error message */


.error-message {

    margin-bottom: 20px;

    padding: 12px;

    border-radius: 10px;

    color: #b42318;

    background-color: #fee4e2;

    text-align: center;

    font-size: 13px;

}


/* Success message */


.success-message {

    margin-bottom: 20px;

    padding: 12px;

    border-radius: 10px;

    color: #067647;

    background-color: #dcfae6;

    text-align: center;

    font-size: 13px;

}


/* ========================= */
/* MOBILE RESPONSIVE */
/* ========================= */


@media(max-width: 800px) {


    body {

        padding: 15px;

    }


    .register-container {

        max-width: 500px;

    }


    .welcome-section {

        display: none;

    }


    .form-section {

        width: 100%;

        padding:

            50px 30px;

    }

}


</style>

</head>


<body>


<div class="register-container">


<!-- ========================= -->
<!-- LEFT WELCOME SECTION -->
<!-- ========================= -->


<div class="welcome-section">


    <div class="logo">


        <div class="logo-icon">

            💬

        </div>


        ChatSphere


    </div>


    <h1>

        Join the

        conversation.

    </h1>


    <p>

        Create your ChatSphere account

        and start connecting with people

        through simple and secure messages.

    </p>


    <div class="features">


        <div class="feature">

            ✓ Simple and attractive chat

        </div>


        <div class="feature">

            ✓ Messages saved securely

        </div>


        <div class="feature">

            ✓ Easy communication

        </div>


    </div>


</div>



<!-- ========================= -->
<!-- RIGHT REGISTRATION FORM -->
<!-- ========================= -->


<div class="form-section">


<div class="form-content">


    <h2>

        Create Account

    </h2>


    <p class="subtitle">

        Enter your details to join ChatSphere.

    </p>



    <!-- ERROR MESSAGE -->


    <%

        String error =

            request.getParameter(

                "error"

            );


        if (

            error != null

        ) {

    %>


    <div class="error-message">


        <%

            if (

                error.equals(

                    "empty"

                )

            ) {

        %>


        Please enter all the required details.


        <%

            }


            else if (

                error.equals(

                    "password"

                )

            ) {

        %>


        Password and confirm password do not match.


        <%

            }


            else if (

                error.equals(

                    "exists"

                )

            ) {

        %>


        This username is already registered.


        <%

            }


            else {

        %>


        Registration failed. Please try again.


        <%

            }

        %>


    </div>


    <%

        }

    %>



    <!-- REGISTRATION FORM -->


    <form

        action="<%= request.getContextPath() %>/RegisterServlet"

        method="post">


        <!-- USERNAME -->


        <div class="input-group">


            <label>

                Username

            </label>


            <div class="input-box">


                <span class="input-icon">

                    👤

                </span>


                <input

                    type="text"

                    name="username"

                    placeholder="Create a username"

                    maxlength="50"

                    autocomplete="username"

                    required>


            </div>


        </div>



        <!-- PASSWORD -->


        <div class="input-group">


            <label>

                Password

            </label>


            <div class="input-box">


                <span class="input-icon">

                    🔒

                </span>


                <input

                    type="password"

                    name="password"

                    placeholder="Create a password"

                    maxlength="50"

                    autocomplete="new-password"

                    required>


            </div>


        </div>



        <!-- CONFIRM PASSWORD -->


        <div class="input-group">


            <label>

                Confirm Password

            </label>


            <div class="input-box">


                <span class="input-icon">

                    🔐

                </span>


                <input

                    type="password"

                    name="confirmPassword"

                    placeholder="Enter password again"

                    maxlength="50"

                    autocomplete="new-password"

                    required>


            </div>


        </div>



        <!-- CREATE ACCOUNT BUTTON -->


        <button

            type="submit"

            class="register-button">


            Create Account

        </button>


    </form>



    <!-- LOGIN LINK -->


    <div class="login-text">


        Already have an account?


        <a

            href="<%= request.getContextPath() %>/login.jsp">


            Login here


        </a>


    </div>


</div>


</div>


</div>


</body>

</html>