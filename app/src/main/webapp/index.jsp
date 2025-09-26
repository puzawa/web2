<%@ page import="java.util.List" %>
<%@ page errorPage="error.jsp" %>
<%@ page import="web2.TableRow" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

<main  class="main">
    <div class="container">
        <div class="main__inner">
            <div class="form">
                <form class="form__body" method="get" onsubmit="exchange(event)">
                    <div class="X-input">
                        <p class="X-input__text form-text">X</p>
                        <ul class="X-input__list form-list">
                            <li class="X-input__item form-item">
                                <label>
                                    <input type="checkbox" name="X-input" value="-3" class="X-input__checkbox form-checkbox">
                                    <span class="X-input__checkbox-style form-checkbox-style"></span>
                                    <span class="X-input__checkbox-text form-checkbox-text">-3</span>
                                </label>
                            </li>
                            <li class="X-input__item form-item">
                                <label>
                                    <input type="checkbox" name="X-input" value="-2" class="X-input__checkbox form-checkbox">
                                    <span class="X-input__checkbox-style form-checkbox-style"></span>
                                    <span class="X-input__checkbox-text form-checkbox-text">-2</span>
                                </label>
                            </li>
                            <li class="X-input__item form-item">
                                <label>
                                    <input type="checkbox" name="X-input" value="-1" class="X-input__checkbox form-checkbox">
                                    <span class="X-input__checkbox-style form-checkbox-style"></span>
                                    <span class="X-input__checkbox-text form-checkbox-text">-1</span>
                                </label>
                            </li>
                            <li class="X-input__item form-item">
                                <label>
                                    <input type="checkbox" name="X-input" value="0" class="X-input__checkbox form-checkbox">
                                    <span class="X-input__checkbox-style form-checkbox-style"></span>
                                    <span class="X-input__checkbox-text form-checkbox-text">0</span>
                                </label>
                            </li>
                            <li class="X-input__item form-item">
                                <label>
                                    <input type="checkbox" name="X-input" value="1" class="X-input__checkbox form-checkbox">
                                    <span class="X-input__checkbox-style form-checkbox-style"></span>
                                    <span class="X-input__checkbox-text form-checkbox-text">1</span>
                                </label>
                            </li>
                            <li class="X-input__item form-item">
                                <label>
                                    <input type="checkbox" name="X-input" value="2" class="X-input__checkbox form-checkbox">
                                    <span class="X-input__checkbox-style form-checkbox-style"></span>
                                    <span class="X-input__checkbox-text form-checkbox-text">2</span>
                                </label>
                            </li>
                            <li class="X-input__item form-item">
                                <label>
                                    <input type="checkbox" name="X-input" value="3"
                                           class="X-input__checkbox form-checkbox">
                                    <span class="X-input__checkbox-style form-checkbox-style"></span>
                                    <span class="X-input__checkbox-text form-checkbox-text">3</span>
                                </label>
                            </li>
                            <li class="X-input__item form-item">
                                <label>
                                    <input type="checkbox" name="X-input" value="4"
                                           class="X-input__checkbox form-checkbox">
                                    <span class="X-input__checkbox-style form-checkbox-style"></span>
                                    <span class="X-input__checkbox-text form-checkbox-text">4</span>
                                </label>
                            </li>
                            <li class="X-input__item form-item">
                                <label>
                                    <input type="checkbox" name="X-input" value="5"
                                           class="X-input__checkbox form-checkbox">
                                    <span class="X-input__checkbox-style form-checkbox-style"></span>
                                    <span class="X-input__checkbox-text form-checkbox-text">5</span>
                                </label>
                            </li>
                        </ul>
                    </div>
                    <div class="Y-input">
                        <p class="Y-input__text form-text">Y</p>
                        <label>
                            <input type="text" name="Y-input" placeholder="Введите Y" class="Y-input__input form-input">
                        </label>
                    </div>
                    <div class="R-input">
                        <p class="R-input__text form-text">R</p>
                        <ul class="R-input__list form-list">
                            <li class="R-input__item form-item">
                                <label>
                                    <input type="checkbox" name="R-input" value="1" class="R-input__checkbox form-checkbox">
                                    <span class="R-input__checkbox-style form-checkbox-style"></span>
                                    <span class="R-input__checkbox-text form-checkbox-text">1</span>
                                </label>
                            </li>
                            <li class="R-input__item form-item">
                                <label>
                                    <input type="checkbox" name="R-input" value="1.5" class="R-input__checkbox form-checkbox">
                                    <span class="R-input__checkbox-style form-checkbox-style"></span>
                                    <span class="R-input__checkbox-text form-checkbox-text">1.5</span>
                                </label>
                            </li>
                            <li class="R-input__item form-item">
                                <label>
                                    <input type="checkbox" name="R-input" value="2"
                                           class="R-input__checkbox form-checkbox">
                                    <span class="R-input__checkbox-style form-checkbox-style"></span>
                                    <span class="R-input__checkbox-text form-checkbox-text">2</span>
                                </label>
                            </li>
                            <li class="R-input__item form-item">
                                <label>
                                    <input type="checkbox" name="R-input" value="2.5"
                                           class="R-input__checkbox form-checkbox">
                                    <span class="R-input__checkbox-style form-checkbox-style"></span>
                                    <span class="R-input__checkbox-text form-checkbox-text">2.5</span>
                                </label>
                            </li>
                            <li class="R-input__item form-item">
                                <label>
                                    <input type="checkbox" name="R-input" value="3"
                                           class="R-input__checkbox form-checkbox">
                                    <span class="R-input__checkbox-style form-checkbox-style"></span>
                                    <span class="R-input__checkbox-text form-checkbox-text">3</span>
                                </label>
                            </li>
                        </ul>
                    </div>
                    <input type="submit" class="form-submit" disabled>
                </form>
            </div>

            <div class="graph-table">
                <div class="coordinate-plane">
                    <canvas id="coordinate-plane"></canvas>
                </div>
            </div>

            <div class="archive">
                <h2 class="archive__heading">История</h2>
                <div class="archive__table-wrapper">
                    <table class="archive__table table-archive">
                        <thead class="table-archive__head">
                        <tr>
                            <th>X</th>
                            <th>Y</th>
                            <th>R</th>
                            <th>Hit</th>
                            <th>Sent</th>
                            <th>Exec</th>
                        </tr>
                        </thead>
                        <tbody class="table-archive__main">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="static/js/canvas.js"></script>
<script src="static/js/sendRequest.js"></script>

<script>
    window.onload = function (){
        const plane = document.getElementById('coordinate-plane')
        drawDot(plane, Number(localStorage.getItem("x")), Number(localStorage.getItem("y")), Number(localStorage.getItem("r")))
    }
</script>

</body>
</html>