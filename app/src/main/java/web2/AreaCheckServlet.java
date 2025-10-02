package web2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;

import static web2.MathFunctions.*;

@WebServlet("/checkArea")
public class AreaCheckServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        var rawX = request.getParameter("x");
        var rawY = request.getParameter("y");
        var rawR = request.getParameter("r");

        var x = new BigDecimal(rawX);
        var y = new BigDecimal(rawY);
        var r = new BigDecimal(rawR);

        var hitResult = hitCheck(x, y, r);

        var newRow = new TableRow(x, y, r, hitResult);
        PointsBean pointsBean = (PointsBean) request.getSession().getAttribute("pointsBean");
        if (pointsBean == null) {
            pointsBean = new PointsBean();
            request.getSession().setAttribute("pointsBean", pointsBean);
        }
        pointsBean.add(newRow);

        request.setAttribute("newRow", newRow);

        request.getRequestDispatcher("/results.jsp").forward(request, response);
    }
}
