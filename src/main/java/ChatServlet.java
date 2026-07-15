import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ChatServlet")

public class ChatServlet extends HttpServlet {


    private static final long serialVersionUID = 1L;


    // ==============================
    // DATABASE DETAILS
    // ==============================


    private static final String DB_URL =

            "jdbc:mysql://localhost:3306/chat_app"

            + "?useSSL=false"

            + "&allowPublicKeyRetrieval=true"

            + "&serverTimezone=UTC";


    private static final String DB_USERNAME =

            "root";


    private static final String DB_PASSWORD =

            "ADT23SOCB0172";



    // ==============================
    // POST METHOD
    // Saves messages in MySQL
    // ==============================


    @Override

    protected void doPost(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException, IOException {


        // Use UTF-8 encoding

        request.setCharacterEncoding("UTF-8");

        response.setCharacterEncoding("UTF-8");



        // Get the current login session

        HttpSession session =

                request.getSession(false);



        // Check whether the user is logged in

        if (

            session == null

            ||

            session.getAttribute("username") == null

        ) {


            // Send user back to login page

            response.sendRedirect(

                    request.getContextPath()

                    + "/login.jsp"

            );


            return;

        }



        // Get logged-in username

        String sender =

                (String)

                session.getAttribute(

                        "username"

                );



        // Currently all messages are sent
        // to the General Chat

        String receiver =

                "General";



        // Get the message entered in chat.jsp

        String message =

                request.getParameter(

                        "message"

                );



        // Check whether message is empty

        if (

            message == null

            ||

            message.trim().isEmpty()

        ) {


            // Return to chat page

            response.sendRedirect(

                    request.getContextPath()

                    + "/chat.jsp"

            );


            return;

        }



        // Remove extra spaces

        message =

                message.trim();



        // Maximum message length

        if (

            message.length() > 1000

        ) {


            message =

                    message.substring(

                            0,

                            1000

                    );

        }



        // SQL query according to your
        // existing messages table

        String sql =

                "INSERT INTO messages "

                + "(sender, receiver, message) "

                + "VALUES (?, ?, ?)";



        try {


            // Load MySQL JDBC driver

            Class.forName(

                    "com.mysql.cj.jdbc.Driver"

            );



            // Connect to MySQL

            try (

                Connection con =

                    DriverManager.getConnection(

                        DB_URL,

                        DB_USERNAME,

                        DB_PASSWORD

                    );


                PreparedStatement ps =

                    con.prepareStatement(

                        sql

                    )

            ) {


                // Insert sender

                ps.setString(

                        1,

                        sender

                );



                // Insert receiver

                ps.setString(

                        2,

                        receiver

                );



                // Insert message

                ps.setString(

                        3,

                        message

                );



                // Save message in MySQL

                int rowsInserted =

                        ps.executeUpdate();



                // Check whether message
                // was successfully saved

                if (

                    rowsInserted > 0

                ) {


                    System.out.println(

                        "Message saved successfully!"

                    );


                }


            }



            // Return to chat page
            // after saving the message

            response.sendRedirect(

                    request.getContextPath()

                    + "/chat.jsp"

            );



        }


        catch (

            ClassNotFoundException e

        ) {


            e.printStackTrace();


            throw new ServletException(

                "MySQL JDBC Driver was not found.",

                e

            );


        }


        catch (

            Exception e

        ) {


            e.printStackTrace();


            throw new ServletException(

                "Message could not be saved in MySQL.",

                e

            );


        }


    }



    // ==============================
    // GET METHOD
    // Prevents HTTP 405 error
    // ==============================


    @Override

    protected void doGet(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException, IOException {


        // Check the login session

        HttpSession session =

                request.getSession(false);



        // If user is not logged in,
        // open login page

        if (

            session == null

            ||

            session.getAttribute("username") == null

        ) {


            response.sendRedirect(

                    request.getContextPath()

                    + "/login.jsp"

            );


        }


        // If user is logged in,
        // open chat page

        else {


            response.sendRedirect(

                    request.getContextPath()

                    + "/chat.jsp"

            );


        }


    }


}