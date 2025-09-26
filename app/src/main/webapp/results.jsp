<%@ page import="web2.TableRow" %>
<%@ page errorPage="error.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Web Lab 2</title>

    <link rel="stylesheet" href="static/css/reset.css">
    <link rel="stylesheet" href="static/css/styles.css">

</head>

<body>

<header  class="header">
    <div class="container">
        <table class="header__inner">
            <tr>
                <td id="student-name">Плотников Алексей Алексеевич</td>
                <td class="group">P3214</td>
                <td class="option">Вариант 42321</td>
            </tr>
        </table>
    </div>
</header>

<main>
    <table class="res-table">
        <thead id="table-head">
        <tr>
            <th>
                X
            </th>
            <th>
                Y
            </th>
            <th>
                R
            </th>
            <th>
                Результат
            </th>
        </tr>
        </thead>

        <% Object resultRow = request.getAttribute("newRow"); %>

        <tbody>
        <% if (resultRow != null) {
            TableRow newRow = (TableRow) resultRow;
        %>
            <tr>
                <td>
                    <%= newRow.getX() %>
                </td>

                <td>
                    <%= newRow.getY() %>
                </td>

                <td>
                    <%= newRow.getR() %>
                </td>

                <td>
                    <%= newRow.getResult() ? "Hit" : "Miss" %>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <br>
    <div class="home-link">
        <a href="index.jsp">На главную</a>
    </div>
</main>

</body>
</html>
