const plane = document.getElementById('coordinate-plane')
const form = document.getElementById('coords-form')
const submitBtn = document.querySelector('.form-submit');

const XCheckboxes = document.querySelectorAll('.X-input__checkbox');
const RCheckboxes = document.querySelectorAll('.R-input__checkbox');

window.activeXCheckbox = null;
window.activeRCheckbox = null;

const YInput = document.querySelector('.form-input');

function saveDot(x, y, r) {
    localStorage.setItem("x", x.toString())
    localStorage.setItem("y", y.toString())
    localStorage.setItem("r", r.toString())
}

function drawDot(canvas, x, y, r){
    const ctx = canvas.getContext('2d')

    ctx.beginPath();
    ctx.translate(canvas.width/2, canvas.height/2);
    let plotX = x*(canvas.rw/r);
    let plotY = -y*(canvas.rh/r);

    ctx.arc(plotX, plotY, 5, 0, 2*Math.PI);
    ctx.fillStyle = 'purple';
    ctx.fill();

    ctx.resetTransform();
    ctx.closePath()

    saveDot(x, y, r);
}

function handlePoint() {
    window.redrawCanvas();

    const y_str = YInput.value;
    const parts = y_str.split(".");
    const num = parseFloat(y_str);

    if (window.activeXCheckbox === null ||
        window.activeRCheckbox === null ||
        ['-', ''].includes(YInput.value)||
        (!isNaN(num) && (num > 3 || num < -5)) ||
        parts.length > 2 ||
        ((num === 3 || num === -5) && (parts.length > 1 && !/^0*$/.test(parts[1])))
    ) {
        submitBtn.disabled = true;
    } else {

        submitBtn.disabled = false;

        if (!(isFinite(activeXCheckbox.value) && isFinite(YInput.value) && isFinite(activeRCheckbox.value))) return;

        drawDot(plane, activeXCheckbox.value, YInput.value, activeRCheckbox.value);
    }
}

XCheckboxes.forEach(checkbox => checkbox.addEventListener('change', () => {
    if (checkbox === window.activeXCheckbox) window.activeXCheckbox = null; else {
        if (window.activeXCheckbox !== null) window.activeXCheckbox.checked = false;
        window.activeXCheckbox = checkbox;
    }
    handlePoint();
}));

RCheckboxes.forEach(checkbox => checkbox.addEventListener('change', () => {
    if (checkbox === window.activeRCheckbox) window.activeRCheckbox = null; else {
        if (window.activeRCheckbox !== null) window.activeRCheckbox.checked = false;
        window.activeRCheckbox = checkbox;
    }
    handlePoint();
}));

YInput.addEventListener('paste', event => event.preventDefault());
YInput.addEventListener('input', function () {
    if (!/^-?\d*\.?\d*$/.test(this.value)) this.value = this.value.slice(0, -1);
    handlePoint();
});

function checkX(x){
    return !((-3 <= x) && (x <= 5));
}

function checkY(y){
    return !((-5 <= y) && (y <= 3));
}

function checkR(r){
    return !((1 <= r) && (r <= 5));
}

async function sendData(x, y, r){
    let formData = new URLSearchParams()
    formData.set('x', x)
    formData.set('y', y)
    formData.set('r', r)

    await fetch('http://127.0.0.1:8080/web2/controller',
        {
            method: 'POST',
            body: formData
        })
        .then(function (response) {return response.text()}).then((html) => {
            document.body.innerHTML = html
        });
    console.log("data fetched")
}

function parseFormData(){
    let x = document.getElementById("x-selector")
    let r = document.querySelector(".r-checkbox:checked")

    if (r == null){
        alert("Введите R");
        return
    }

    const xValue = parseInt(x.options[x.selectedIndex].value);
    const yValue = parseFloat(document.getElementById("YInput").value);
    const rValue = parseFloat(r.value)

    console.log(xValue, yValue, rValue)

    let errorsStr = "";

    if (isNaN(xValue)){
        errorsStr += "Введите X\n";
    } else if (checkX(xValue)){
        errorsStr += ("X введён неверно\n");
    }

    if (isNaN(yValue)){
        errorsStr += ("Введите Y\n");
    } else if (checkY(yValue)){
        errorsStr += ("Y введён неверно\n");
    }

    if (isNaN(rValue)){
        errorsStr += ("Введите R\n");
    } else if (checkR(rValue)){
        errorsStr += ("R введён неверно\n");
    }

    if (errorsStr){
        alert(errorsStr);
        return
    }

    sendData(x.options[x.selectedIndex].value, document.getElementById("YInput").value, r.value)
    drawDot(plane, xValue, yValue, rValue)
}
// form.addEventListener("submit", (event) =>{
//     event.preventDefault()
//     parseFormData()
// })

plane.addEventListener("mousedown", async (event) => {
    event.preventDefault()

    let r = document.querySelector(".R-input__checkbox:checked")
    if (r == null) {
        alert("Введите R");
        return
    }

    let canvasPos = canvas.getBoundingClientRect()
    const clickX = event.clientX - canvasPos.left
    const clickY = event.clientY - canvasPos.top

    console.log(clickX, clickY)
    const rVal = r.value;
    const x = ((clickX - canvas.cx) / (canvas.rw / rVal)).toFixed(4);
    const y = ((canvas.cy - clickY) / (canvas.rh / rVal)).toFixed(4);

    console.log(x, y, rVal)

    //sendData(x.toString(), y.toString(), rVal.toString())
    drawDot(plane, x, y, rVal)
})
