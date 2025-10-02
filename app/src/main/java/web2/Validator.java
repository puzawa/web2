package web2;
import java.math.BigDecimal;

public class Validator {

    private static BigDecimal bd(double d) {
        return BigDecimal.valueOf(d);
    }

    public static boolean checkX(BigDecimal x){
        return (x.compareTo(bd(-3)) >= 0) && (x.compareTo(bd(5)) <= 0);
    }

    public static boolean checkY(BigDecimal y){
        return (y.compareTo(bd(-5)) >= 0) && (y.compareTo(bd(3)) <= 0);
    }

    public static boolean checkR(BigDecimal r){
        return (r.compareTo(bd(1)) >= 0) && (r.compareTo(bd(3)) <= 0);
    }
}
