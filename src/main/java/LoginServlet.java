import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database details
    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/chat_app"
            + "?useSSL=false"
            + "&allowPublicKeyRetrieval=true"
            + "&serverTimezone=UTC";
    private static final String DB_USERNAME = "root";

    private static final String DB_PASSWORD = "ADT23SOCB0172";


    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Set request and response encoding
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        // Get data entered in the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        // Check whether username or password is empty
        if (username == null || username.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            out.println("<h2>Please enter username and password.</h2>");

            out.println(
                    "<a href='login.jsp'>Go Back to Login</a>"
            );

            return;
        }


        try {

            // Load the latest MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");


            // Connect Java application to MySQL
            try (
                Connection con = DriverManager.getConnection(
                        DB_URL,
                        DB_USERNAME,
                        DB_PASSWORD
                );

                PreparedStatement ps = con.prepareStatement(
                        "SELECT id, username " +
                        "FROM users " +
                        "WHERE username = ? AND password = ?"
                )
            ) {

                // Add username and password to SQL query
                ps.setString(1, username.trim());
                ps.setString(2, password);


                // Execute SELECT query
                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {

                        // Create session after successful login
                        HttpSession session = request.getSession();

                        session.setAttribute(
                                "username",
                                rs.getString("username")
                        );


                        // Redirect user to chat page
                        response.sendRedirect(
                                request.getContextPath()
                                + "/chat.jsp"
                        );

                    } else {

                        // Invalid username or password
                        out.println("<h2>Invalid Username or Password ❌</h2>");

                        out.println(
                                "<br>"
                                + "<a href='login.jsp'>"
                                + "Try Again"
                                + "</a>"
                        );
                    }
                }
            }

        } catch (ClassNotFoundException e) {

            out.println("<h2>MySQL JDBC Driver Not Found ❌</h2>");

            out.println(
                    "<p>Please add MySQL Connector/J "
                    + "JAR file to the project.</p>"
            );

            e.printStackTrace(out);


        } catch (Exception e) {

            out.println("<h2>Database Error ❌</h2>");

            out.println(
                    "<p>"
                    + e.getMessage()
                    + "</p>"
            );

            e.printStackTrace(out);
        }
    }


    // This runs if LoginServlet URL is opened directly
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
                request.getContextPath()
                + "/login.jsp"
        );
    }
}