package web2;

import java.math.BigDecimal;

public class MathFunctions {

    public static boolean hitCheck(BigDecimal x, BigDecimal y, BigDecimal r) {
        return (checkCircle(x, y, r) || checkRectangle(x, y, r) || checkTriangle(x, y, r));
    }

    private static boolean checkCircle(BigDecimal x, BigDecimal y, BigDecimal r) {
        // x >= 0 && x <= r
        boolean withinX = x.compareTo(BigDecimal.ZERO) >= 0 && x.compareTo(r) <= 0;
        // y >= 0
        boolean aboveY = y.compareTo(BigDecimal.ZERO) >= 0;
        // y <= sqrt(r*r - x*x)
        BigDecimal rSquared = r.multiply(r);
        BigDecimal xSquared = x.multiply(x);
        BigDecimal limitY = new BigDecimal(Math.sqrt(rSquared.subtract(xSquared).doubleValue()));
        boolean belowCurve = y.compareTo(limitY) <= 0;

        return withinX && aboveY && belowCurve;
    }

    private static boolean checkTriangle(BigDecimal x, BigDecimal y, BigDecimal r) {
        BigDecimal minusHalfR = r.divide(new BigDecimal(2));
        // x >= -r/2 && x <= 0
        boolean withinX = x.compareTo(minusHalfR.negate()) >= 0 && x.compareTo(BigDecimal.ZERO) <= 0;
        // y >= 0 && y <= r
        boolean withinY = y.compareTo(BigDecimal.ZERO) >= 0 && y.compareTo(r) <= 0;
        // y <= 2 * (x + r/2)
        BigDecimal lineY = (x.add(minusHalfR)).multiply(new BigDecimal(2));
        boolean belowLine = y.compareTo(lineY) <= 0;

        return withinX && withinY && belowLine;
    }

    private static boolean checkRectangle(BigDecimal x, BigDecimal y, BigDecimal r) {
        BigDecimal minusHalfR = r.divide(new BigDecimal(2));
        // x >= -r/2 && x <= 0
        boolean withinX = x.compareTo(minusHalfR.negate()) >= 0 && x.compareTo(BigDecimal.ZERO) <= 0;
        // y >= -r && y <= 0
        boolean withinY = y.compareTo(r.negate()) >= 0 && y.compareTo(BigDecimal.ZERO) <= 0;

        return withinX && withinY;
    }

}
