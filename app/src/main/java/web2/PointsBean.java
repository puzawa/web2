package web2;

import java.util.ArrayList;
import java.util.List;

public class PointsBean {
    private final List<TableRow> history = new ArrayList<>();

    public void addPoint(TableRow row) {
        history.add(row);
    }

    public List<TableRow> getHistory() {
        return new ArrayList<>(history); // возвращаем копию
    }
}
