<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    // Get logged-in username
    String username =
            (String) session.getAttribute("username");

    // If user is not logged in,
    // redirect to login page
    if (username == null
            || username.trim().isEmpty()) {

        response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
        );

        return;
    }
%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta
    name="viewport"
    content="width=device-width, initial-scale=1.0">

<title>ChatSphere</title>


<style>


/* ============================= */
/* GENERAL DESIGN */
/* ============================= */


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



/* ============================= */
/* MAIN CHAT APPLICATION */
/* ============================= */


.chat-app {

    width: 100%;

    max-width: 1100px;

    height: 680px;

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



/* ============================= */
/* LEFT SIDEBAR */
/* ============================= */


.sidebar {

    width: 300px;

    display: flex;

    flex-direction: column;

    padding: 30px 22px;

    color: white;

    background:

        linear-gradient(

            180deg,

            #4f46c7,

            #6c42b5

        );

}



/* ============================= */
/* LOGO */
/* ============================= */


.logo {

    display: flex;

    align-items: center;

    gap: 12px;

    margin-bottom: 40px;

    font-size: 25px;

    font-weight: bold;

}


.logo-icon {

    width: 45px;

    height: 45px;

    display: flex;

    justify-content: center;

    align-items: center;

    border-radius: 14px;

    background:

        rgba(

            255,

            255,

            255,

            0.18

        );

    font-size: 24px;

}



/* ============================= */
/* PROFILE */
/* ============================= */


.profile {

    display: flex;

    align-items: center;

    gap: 14px;

    padding: 18px;

    border-radius: 18px;

    background:

        rgba(

            255,

            255,

            255,

            0.13

        );

}


.profile-picture {

    width: 50px;

    height: 50px;

    display: flex;

    justify-content: center;

    align-items: center;

    flex-shrink: 0;

    border-radius: 50%;

    color: #5a43bd;

    background-color: white;

    font-size: 22px;

    font-weight: bold;

}


.profile-name {

    max-width: 150px;

    overflow: hidden;

    color: white;

    font-size: 17px;

    font-weight: bold;

    text-overflow: ellipsis;

    white-space: nowrap;

}


.online-status {

    margin-top: 5px;

    color: #c9ffd7;

    font-size: 13px;

}



/* ============================= */
/* CONVERSATIONS */
/* ============================= */


.menu-title {

    margin-top: 40px;

    margin-bottom: 15px;

    color: #dcd8ff;

    font-size: 12px;

    letter-spacing: 1.5px;

}


.menu-item {

    padding: 15px;

    border-radius: 12px;

    background:

        rgba(

            255,

            255,

            255,

            0.15

        );

    font-size: 15px;

}



/* ============================= */
/* LOGOUT BUTTON */
/* ============================= */


.logout-button {

    width: 100%;

    margin-top: auto;

    padding: 13px;

    border: none;

    border-radius: 12px;

    color: #513bb3;

    background-color: white;

    font-size: 15px;

    font-weight: bold;

    cursor: pointer;

    transition: 0.3s;

}


.logout-button:hover {

    transform:

        translateY(-2px);

    background-color:

        #f0edff;

}



/* ============================= */
/* CHAT SECTION */
/* ============================= */


.chat-section {

    flex: 1;

    display: flex;

    flex-direction: column;

    min-width: 0;

    background-color:

        #f7f7fc;

}



/* ============================= */
/* CHAT HEADER */
/* ============================= */


.chat-header {

    min-height: 90px;

    display: flex;

    justify-content:

        space-between;

    align-items: center;

    padding: 20px 35px;

    background-color: white;

    border-bottom:

        1px solid

        #eeeef5;

}


.chat-user {

    display: flex;

    align-items: center;

    gap: 15px;

}


.chat-avatar {

    width: 50px;

    height: 50px;

    display: flex;

    justify-content: center;

    align-items: center;

    border-radius: 15px;

    color: white;

    background:

        linear-gradient(

            135deg,

            #667eea,

            #764ba2

        );

    font-size: 24px;

}


.chat-header h2 {

    color: #29283b;

    font-size: 20px;

}


.active-text {

    margin-top: 5px;

    color: #28ae60;

    font-size: 13px;

}


.header-icon {

    width: 42px;

    height: 42px;

    display: flex;

    justify-content: center;

    align-items: center;

    border-radius: 12px;

    color: #6254cc;

    background-color:

        #efedff;

    font-size: 20px;

}



/* ============================= */
/* MESSAGES */
/* ============================= */


.messages {

    flex: 1;

    padding: 35px;

    overflow-x: hidden;

    overflow-y: auto;

    scroll-behavior: smooth;

}



/* ============================= */
/* WELCOME MESSAGE */
/* ============================= */


.welcome-box {

    width: fit-content;

    max-width: 500px;

    margin:

        0 auto 35px;

    padding:

        13px 25px;

    border-radius: 30px;

    color: #716d86;

    background-color:

        #ecebf5;

    text-align: center;

    font-size: 13px;

}



/* ============================= */
/* RECEIVED MESSAGE */
/* ============================= */


.received-message {

    width: fit-content;

    max-width: 65%;

    margin-bottom: 20px;

    padding:

        15px 18px;

    color: #444054;

    background-color: white;

    border-radius:

        5px

        18px

        18px

        18px;

    box-shadow:

        0 5px 15px

        rgba(

            70,

            60,

            120,

            0.08

        );

    line-height: 1.5;

    overflow-wrap: anywhere;

}



/* ============================= */
/* SENT MESSAGE */
/* ============================= */


.sent-message {

    width: fit-content;

    max-width: 65%;

    margin-left: auto;

    margin-bottom: 20px;

    padding:

        15px 18px;

    color: white;

    background:

        linear-gradient(

            135deg,

            #667eea,

            #7651bc

        );

    border-radius:

        18px

        5px

        18px

        18px;

    box-shadow:

        0 7px 18px

        rgba(

            101,

            82,

            200,

            0.25

        );

    line-height: 1.5;

    overflow-wrap: anywhere;

}



/* ============================= */
/* MESSAGE USERNAME */
/* ============================= */


.message-sender {

    display: block;

    margin-bottom: 5px;

    font-size: 12px;

    font-weight: bold;

}



/* ============================= */
/* MESSAGE TIME */
/* ============================= */


.message-time {

    display: block;

    margin-top: 7px;

    font-size: 10px;

    opacity: 0.75;

}



/* ============================= */
/* MESSAGE INPUT FORM */
/* ============================= */


.message-input-area {

    display: flex;

    align-items: center;

    gap: 15px;

    padding:

        20px 30px;

    background-color: white;

    border-top:

        1px solid

        #eeeef5;

}


.message-input {

    flex: 1;

    min-width: 0;

    padding:

        16px 20px;

    border:

        1px solid

        #e2e1ec;

    border-radius: 15px;

    outline: none;

    color: #29283b;

    background-color:

        #f7f7fb;

    font-size: 15px;

    transition: 0.3s;

}


.message-input:focus {

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



/* ============================= */
/* SEND BUTTON */
/* ============================= */


.send-button {

    width: 53px;

    height: 53px;

    flex-shrink: 0;

    border: none;

    border-radius: 16px;

    color: white;

    background:

        linear-gradient(

            135deg,

            #667eea,

            #764ba2

        );

    font-size: 21px;

    cursor: pointer;

    transition: 0.3s;

}


.send-button:hover {

    transform:

        translateY(-3px);

    box-shadow:

        0 8px 20px

        rgba(

            102,

            126,

            234,

            0.4

        );

}



/* ============================= */
/* MOBILE DESIGN */
/* ============================= */


@media(max-width: 750px) {


    body {

        padding: 0;

    }


    .chat-app {

        height: 100vh;

        border-radius: 0;

    }


    .sidebar {

        display: none;

    }


    .chat-header {

        padding:

            15px 20px;

    }


    .messages {

        padding: 20px;

    }


    .message-input-area {

        padding: 15px;

    }


    .received-message,

    .sent-message {

        max-width: 85%;

    }

}


</style>

</head>


<body>


<div class="chat-app">



<!-- ============================= -->
<!-- LEFT SIDEBAR -->
<!-- ============================= -->


<div class="sidebar">


    <div class="logo">


        <div class="logo-icon">

            💬

        </div>


        ChatSphere


    </div>



    <!-- USER PROFILE -->


    <div class="profile">


        <div class="profile-picture">

            <%= username
                    .substring(0, 1)
                    .toUpperCase() %>

        </div>


        <div>


            <div class="profile-name">

                <%= username %>

            </div>


            <div class="online-status">

                ● Online

            </div>


        </div>


    </div>



    <!-- GENERAL CHAT -->


    <div class="menu-title">

        CONVERSATIONS

    </div>


    <div class="menu-item">

        💬 &nbsp;

        General Chat

    </div>



    <!-- LOGOUT -->


    <button

        type="button"

        class="logout-button"

        onclick="logout()">


        ↪ Logout


    </button>


</div>



<!-- ============================= -->
<!-- RIGHT CHAT SECTION -->
<!-- ============================= -->


<div class="chat-section">



<!-- CHAT HEADER -->


<div class="chat-header">


    <div class="chat-user">


        <div class="chat-avatar">

            💬

        </div>


        <div>


            <h2>

                General Chat

            </h2>


            <div class="active-text">

                ● Active now

            </div>


        </div>


    </div>


    <div class="header-icon">

        ⋮

    </div>


</div>



<!-- ============================= -->
<!-- DISPLAY MYSQL MESSAGES -->
<!-- ============================= -->


<div

    class="messages"

    id="messageBox">


<div class="welcome-box">

    Welcome to ChatSphere ✨

    Your messages are saved.

</div>


<%


/* ============================= */
/* DATABASE INFORMATION */
/* ============================= */


String databaseURL =

        "jdbc:mysql://localhost:3306/chat_app"

        + "?useSSL=false"

        + "&allowPublicKeyRetrieval=true"

        + "&serverTimezone=UTC";


String databaseUsername =

        "root";


String databasePassword =

        "ADT23SOCB0172";



/* ============================= */
/* MYSQL SELECT QUERY */
/* ============================= */


String selectMessages =

        "SELECT "

        + "sender, "

        + "message, "

        + "timestamp "

        + "FROM messages "

        + "WHERE receiver = ? "

        + "ORDER BY timestamp ASC, id ASC";



try {


    // Load MySQL JDBC driver


    Class.forName(

            "com.mysql.cj.jdbc.Driver"

    );



    // Connect to MySQL


    try (

        Connection connection =

            DriverManager.getConnection(

                databaseURL,

                databaseUsername,

                databasePassword

            );


        PreparedStatement statement =

            connection.prepareStatement(

                selectMessages

            )

    ) {



        // Display General Chat messages


        statement.setString(

                1,

                "General"

        );



        try (

            ResultSet result =

                statement.executeQuery()

        ) {



            boolean messageFound =

                    false;



            while (

                result.next()

            ) {



                messageFound =

                        true;



                String messageSender =

                    result.getString(

                        "sender"

                    );



                String savedMessage =

                    result.getString(

                        "message"

                    );



                String messageTime =

                    result.getString(

                        "timestamp"

                    );



                // Check whether this message
                // was sent by logged-in user


                boolean myMessage =

                    username.equals(

                        messageSender

                    );



                if (

                    myMessage

                ) {


%>



<!-- LOGGED-IN USER MESSAGE -->


<div class="sent-message">


    <span class="message-sender">

        You

    </span>


    <%= savedMessage %>


    <span class="message-time">

        <%= messageTime %>

        &nbsp;

        ✓✓

    </span>


</div>



<%


                }


                else {


%>



<!-- OTHER USER MESSAGE -->


<div class="received-message">


    <span class="message-sender">

        <%= messageSender %>

    </span>


    <%= savedMessage %>


    <span class="message-time">

        <%= messageTime %>

    </span>


</div>



<%


                }


            }



            // If database has no messages


            if (

                !messageFound

            ) {


%>



<div class="welcome-box">


    No messages yet.

    Send the first message 💬


</div>



<%


            }


        }


    }


}


catch (

    Exception error

) {


    error.printStackTrace();


%>



<!-- DATABASE ERROR -->


<div class="received-message">


    Unable to load previous messages.


    <span class="message-time">

        Please check the database connection.

    </span>


</div>



<%


}


%>


</div>



<!-- ============================= -->
<!-- SEND MESSAGE FORM -->
<!-- ============================= -->


<form

    class="message-input-area"

    action="<%= request.getContextPath() %>/ChatServlet"

    method="post">


<input

    type="text"

    class="message-input"

    id="messageInput"

    name="message"

    placeholder="Write your message..."

    maxlength="1000"

    autocomplete="off"

    required>


<button

    type="submit"

    class="send-button"

    title="Send message">


    ➤


</button>


</form>


</div>


</div>



<script>


/* ============================= */
/* SCROLL TO NEWEST MESSAGE */
/* ============================= */


window.addEventListener(

    "load",

    function() {


        const messageBox =

            document.getElementById(

                "messageBox"

            );


        messageBox.scrollTop =

            messageBox.scrollHeight;



        document

            .getElementById(

                "messageInput"

            )

            .focus();


    }

);



/* ============================= */
/* LOGOUT */
/* ============================= */

function logout() {

    window.location.href =

        "<%= request.getContextPath() %>/LogoutServlet";

}

</script>


</body>

</html>