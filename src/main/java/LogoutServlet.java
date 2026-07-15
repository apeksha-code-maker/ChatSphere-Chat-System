import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LogoutServlet")

public class LogoutServlet extends HttpServlet {


    private static final long serialVersionUID = 1L;


    /*
     * This method runs when the user
     * clicks the Logout button.
     */


    @Override

    protected void doGet(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException, IOException {


        // Get the current session.
        // false means:
        // do not create a new session.

        HttpSession session =

                request.getSession(false);



        // Check whether a session exists.

        if (session != null) {


            // Delete the complete login session.

            session.invalidate();


        }



        // Redirect the user to login.jsp.

        response.sendRedirect(

                request.getContextPath()

                + "/login.jsp"

        );


    }



    /*
     * This allows POST logout requests
     * to work in the future.
     */


    @Override

    protected void doPost(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException, IOException {


        // Use the same logout process.

        doGet(

                request,

                response

        );


    }


}