package web2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static web2.Validator.*;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        var x = request.getParameter("x");
        var y = request.getParameter("y");
        var r = request.getParameter("r");

        String ERROR_MESSAGE = "Cause: %s";
        if (x == null || y == null || r == null) {
            request.setAttribute("error", String.format(ERROR_MESSAGE, "Values are required"));
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        try {
            float parsedX = Float.parseFloat(x);
            float parsedY = Float.parseFloat(y);
            float parsedR = Float.parseFloat(r);

            System.out.println(parsedX + " " + parsedY + " " + parsedR);

            var xCheck = checkX(parsedX);
            var yCheck = checkY(parsedY);
            var rCheck = checkR(parsedR);

            System.out.println(xCheck + " " + yCheck + " " + rCheck);

            StringBuilder builder = new StringBuilder();
            if (!xCheck)
                builder.append(String.format(ERROR_MESSAGE, "Unexpected X value\n"));
            if (!yCheck)
                builder.append(String.format(ERROR_MESSAGE, "Unexpected Y value\n"));
            if (!rCheck)
                builder.append(String.format(ERROR_MESSAGE, "Unexpected R value\n"));

            if(!xCheck || !yCheck || !rCheck){
                request.setAttribute("error", builder.toString());
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            System.out.println("goto calc");
            request.getRequestDispatcher("/checkArea").forward(request, response);


        } catch (NumberFormatException e) {
            request.setAttribute("error", String.format(ERROR_MESSAGE, "Unexpected inputs"));
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
