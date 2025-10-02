package web2;

import jakarta.inject.Inject;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import static web2.MathFunctions.*;

@WebServlet("/checkArea")
public class AreaCheckServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = getServletContext();

        var x = request.getParameter("x");
        var y = request.getParameter("y");
        var r = request.getParameter("r");

        float parsedX = Float.parseFloat(x);
        float parsedY = Float.parseFloat(y);
        float parsedR = Float.parseFloat(r);

        var hitResult = hitCheck(parsedX, parsedY, parsedR);

        var newRow = new TableRow(parsedX, parsedY, parsedR, hitResult);
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
