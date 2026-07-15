import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RegisterServlet")

public class RegisterServlet extends HttpServlet {


    private static final long serialVersionUID = 1L;


    // ==================================
    // DATABASE DETAILS
    // ==================================


    private static final String DB_URL =

            "jdbc:mysql://localhost:3306/chat_app"

            + "?useSSL=false"

            + "&allowPublicKeyRetrieval=true"

            + "&serverTimezone=UTC";


    private static final String DB_USERNAME =

            "root";


    private static final String DB_PASSWORD =

            "ADT23SOCB0172";



    // ==================================
    // POST METHOD
    // ==================================


    @Override

    protected void doPost(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException, IOException {


        // Support usernames and passwords
        // containing special characters

        request.setCharacterEncoding("UTF-8");

        response.setCharacterEncoding("UTF-8");



        // Get values entered in register.jsp

        String username =

                request.getParameter(

                        "username"

                );


        String password =

                request.getParameter(

                        "password"

                );


        String confirmPassword =

                request.getParameter(

                        "confirmPassword"

                );



        // ==================================
        // REMOVE EXTRA SPACES
        // ==================================


        if (

            username != null

        ) {


            username =

                    username.trim();


        }



        // ==================================
        // CHECK EMPTY FIELDS
        // ==================================


        if (

            username == null

            ||

            username.isEmpty()

            ||

            password == null

            ||

            password.isEmpty()

            ||

            confirmPassword == null

            ||

            confirmPassword.isEmpty()

        ) {


            response.sendRedirect(

                    request.getContextPath()

                    + "/register.jsp?error=empty"

            );


            return;


        }



        // ==================================
        // CHECK USERNAME LENGTH
        // ==================================


        if (

            username.length() > 50

        ) {


            response.sendRedirect(

                    request.getContextPath()

                    + "/register.jsp?error=empty"

            );


            return;


        }



        // ==================================
        // CHECK PASSWORD LENGTH
        // ==================================


        if (

            password.length() > 50

        ) {


            response.sendRedirect(

                    request.getContextPath()

                    + "/register.jsp?error=empty"

            );


            return;


        }



        // ==================================
        // CHECK BOTH PASSWORDS
        // ==================================


        if (

            !password.equals(

                    confirmPassword

            )

        ) {


            response.sendRedirect(

                    request.getContextPath()

                    + "/register.jsp?error=password"

            );


            return;


        }



        // ==================================
        // MYSQL QUERIES
        // ==================================


        String checkUsernameSQL =

                "SELECT id "

                + "FROM users "

                + "WHERE username = ?";


        String insertUserSQL =

                "INSERT INTO users "

                + "(username, password) "

                + "VALUES (?, ?)";



        try {


            // Load MySQL JDBC driver

            Class.forName(

                    "com.mysql.cj.jdbc.Driver"

            );



            // Connect to the chat_app database

            try (

                Connection connection =

                    DriverManager.getConnection(

                        DB_URL,

                        DB_USERNAME,

                        DB_PASSWORD

                    )

            ) {



                // ==================================
                // CHECK DUPLICATE USERNAME
                // ==================================


                try (

                    PreparedStatement checkStatement =

                        connection.prepareStatement(

                            checkUsernameSQL

                        )

                ) {


                    checkStatement.setString(

                            1,

                            username

                    );


                    try (

                        ResultSet result =

                            checkStatement.executeQuery()

                    ) {


                        // Username already exists

                        if (

                            result.next()

                        ) {


                            response.sendRedirect(

                                request.getContextPath()

                                + "/register.jsp"

                                + "?error=exists"

                            );


                            return;


                        }


                    }


                }



                // ==================================
                // SAVE NEW USER
                // ==================================


                try (

                    PreparedStatement insertStatement =

                        connection.prepareStatement(

                            insertUserSQL

                        )

                ) {


                    insertStatement.setString(

                            1,

                            username

                    );


                    insertStatement.setString(

                            2,

                            password

                    );


                    int rowsInserted =

                            insertStatement.executeUpdate();



                    // Registration successful

                    if (

                        rowsInserted > 0

                    ) {


                        response.sendRedirect(

                            request.getContextPath()

                            + "/login.jsp"

                            + "?registered=true"

                        );


                        return;


                    }


                }


            }



            // Registration failed

            response.sendRedirect(

                    request.getContextPath()

                    + "/register.jsp"

                    + "?error=database"

            );


        }


        catch (

            Exception error

        ) {


            error.printStackTrace();


            response.sendRedirect(

                    request.getContextPath()

                    + "/register.jsp"

                    + "?error=database"

            );


        }


    }



    // ==================================
    // GET METHOD
    // Prevents HTTP 405 error
    // ==================================


    @Override

    protected void doGet(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException, IOException {


        // If RegisterServlet is opened
        // directly, open register.jsp


        response.sendRedirect(

                request.getContextPath()

                + "/register.jsp"

        );


    }


}