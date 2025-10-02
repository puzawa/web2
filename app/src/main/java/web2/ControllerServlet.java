package web2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;

import static web2.Validator.*;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        var rawX = request.getParameter("x");
        var rawY = request.getParameter("y");
        var rawR = request.getParameter("r");

        String ERROR_MESSAGE = "Cause: %s";
        if (rawX == null || rawY == null || rawR == null) {
            request.setAttribute("error", String.format(ERROR_MESSAGE, "Values are required"));
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        try {
            var x = new BigDecimal(rawX);
            var y = new BigDecimal(rawY);
            var r = new BigDecimal(rawR);

            System.out.println("ControllerServlet BigDecimals: " + x.toString() + " " + y.toString() + " " + r.toString());

            var xCheck = checkX(x);
            var yCheck = checkY(y);
            var rCheck = checkR(r);

            System.out.println("ControllerServlet Checks: " + xCheck + " " + yCheck + " " + rCheck);

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
