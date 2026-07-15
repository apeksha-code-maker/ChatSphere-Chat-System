<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Login | ChatSphere</title>


<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
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


/* ========================= */
/* MAIN LOGIN CONTAINER */
/* ========================= */


.login-container {

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
/* LEFT WELCOME SECTION */
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
/* RIGHT LOGIN SECTION */
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

    margin-bottom: 32px;

    color: #858295;

    font-size: 14px;

}


/* ========================= */
/* SUCCESS MESSAGE */
/* ========================= */


.success-message {

    margin-bottom: 22px;

    padding: 13px;

    border:

        1px solid

        #abefc6;

    border-radius: 11px;

    color: #067647;

    background-color:

        #dcfae6;

    text-align: center;

    font-size: 13px;

}


/* ========================= */
/* ERROR MESSAGE */
/* ========================= */


.error-message {

    margin-bottom: 22px;

    padding: 13px;

    border:

        1px solid

        #fecdca;

    border-radius: 11px;

    color: #b42318;

    background-color:

        #fee4e2;

    text-align: center;

    font-size: 13px;

}


/* ========================= */
/* INPUT FIELDS */
/* ========================= */


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


.input-box {

    display: flex;

    align-items: center;

    padding:

        0 15px;

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

    padding:

        15px 5px;

    border: none;

    outline: none;

    color: #29283b;

    background: transparent;

    font-size: 15px;

}


/* ========================= */
/* SHOW PASSWORD BUTTON */
/* ========================= */


.show-password {

    border: none;

    outline: none;

    color: #6657ca;

    background: transparent;

    font-size: 17px;

    cursor: pointer;

}


/* ========================= */
/* LOGIN BUTTON */
/* ========================= */


.login-button {

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


.login-button:hover {

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


/* ========================= */
/* REGISTER LINK */
/* ========================= */


.register-text {

    margin-top: 27px;

    color: #777487;

    text-align: center;

    font-size: 14px;

}


.register-text a {

    color: #6555ce;

    font-weight: bold;

    text-decoration: none;

}


.register-text a:hover {

    text-decoration: underline;

}


/* ========================= */
/* MOBILE DESIGN */
/* ========================= */


@media(max-width: 800px) {


    body {

        padding: 15px;

    }


    .login-container {

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


<div class="login-container">


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

        Welcome

        back!

    </h1>


    <p>

        Log in to continue your conversations

        and connect with people through

        ChatSphere.

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
<!-- RIGHT LOGIN SECTION -->
<!-- ========================= -->


<div class="form-section">


<div class="form-content">


    <h2>

        Welcome Back 👋

    </h2>


    <p class="subtitle">

        Enter your account details to continue.

    </p>



<!-- ========================= -->
<!-- REGISTRATION SUCCESS -->
<!-- ========================= -->


<%

String registered =

        request.getParameter(

                "registered"

        );


if (

    "true".equals(

            registered

    )

) {

%>


<div class="success-message">

    ✅ Account created successfully!

    Please log in.

</div>


<%

}

%>



<!-- ========================= -->
<!-- LOGIN ERROR -->
<!-- ========================= -->


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

            "invalid"

    )

) {

%>


❌ Invalid username or password.


<%

}

else {

%>


❌ Login failed. Please try again.


<%

}

%>


</div>


<%

}

%>



<!-- ========================= -->
<!-- LOGIN FORM -->
<!-- ========================= -->


<form

    action="<%= request.getContextPath() %>/LoginServlet"

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

            placeholder="Enter your username"

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

            id="password"

            name="password"

            placeholder="Enter your password"

            maxlength="50"

            autocomplete="current-password"

            required>


        <button

            type="button"

            class="show-password"

            id="passwordButton"

            onclick="togglePassword()"

            title="Show password">


            👁


        </button>


    </div>


</div>



<!-- LOGIN BUTTON -->


<button

    type="submit"

    class="login-button">


    Login to ChatSphere

</button>


</form>



<!-- ========================= -->
<!-- REGISTER LINK -->
<!-- ========================= -->


<div class="register-text">


    Don't have an account?


    <a

        href="<%= request.getContextPath() %>/register.jsp">


        Create account

    </a>


</div>


</div>


</div>


</div>



<script>


/* ========================= */
/* SHOW OR HIDE PASSWORD */
/* ========================= */


function togglePassword() {


    const password =

        document.getElementById(

            "password"

        );


    const passwordButton =

        document.getElementById(

            "passwordButton"

        );


    if (

        password.type ===

        "password"

    ) {


        password.type =

            "text";


        passwordButton.innerHTML =

            "🙈";


        passwordButton.title =

            "Hide password";


    }


    else {


        password.type =

            "password";


        passwordButton.innerHTML =

            "👁";


        passwordButton.title =

            "Show password";


    }


}


</script>


</body>

</html>