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
            <table class="graph-table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <svg class="graph__body" width="600" height="600" viewBox="-300 -300 600 600"
                             xmlns="http://www.w3.org/2000/svg">

                            <line x1="-300" x2="300" y1="0" y2="0" class="graph__axis"/>
                            <line x1="0" x2="0" y1="-300" y2="300" class="graph__axis"/>

                            <path d="M 280 10 L 300 0 L 280 -10" class="graph__arrow"/>
                            <path d="M 10 -280 L 0 -300 L -10 -280" class="graph__arrow"/>

                            <line x1="-200" x2="-200" y1="5" y2="-5" class="graph__serif"/>
                            <line x1="-100" x2="-100" y1="5" y2="-5" class="graph__serif"/>
                            <line x1="100" x2="100" y1="5" y2="-5" class="graph__serif"/>
                            <line x1="200" x2="200" y1="5" y2="-5" class="graph__serif"/>
                            <line x1="5" x2="-5" y1="-200" y2="-200" class="graph__serif"/>
                            <line x1="5" x2="-5" y1="-100" y2="-100" class="graph__serif"/>
                            <line x1="5" x2="-5" y1="100" y2="100" class="graph__serif"/>
                            <line x1="5" x2="-5" y1="200" y2="200" class="graph__serif"/>

                            <text x="282" y="33" class="graph__sub">X</text>
                            <text x="192" y="33" class="graph__sub sub-R">1</text>
                            <text x="82" y="33" class="graph__sub sub-R_div_2">0.5</text>
                            <text x="-135" y="33" class="graph__sub sub-R_div_2">-0.5</text>
                            <text x="-220" y="33" class="graph__sub sub-R">-1</text>
                            <text x="-33" y="-282" class="graph__sub">Y</text>
                            <text x="-30" y="-192" class="graph__sub sub-R">1</text>
                            <text x="-50" y="-92" class="graph__sub sub-R_div_2">0.5</text>
                            <text x="-67" y="108" class="graph__sub sub-R_div_2">-0.5</text>
                            <text x="-45" y="208" class="graph__sub sub-R">-1</text>

                            <path d="M0 -200 a200 200 0 0 1 200 200 l-200 0 z" fill="purple" fill-opacity="0.5"/>
                            <path d="M-100 0 l100 0 l0 -200 z" fill="purple" fill-opacity="0.5"/>
                            <path d="M-100 0 l100 0 l0 200 l-100 0 z" fill="purple" fill-opacity="0.5"/>

                            <circle r="0" class="graph__point"></circle>
                        </svg>
                    </td>
                </tr>
            </table>

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