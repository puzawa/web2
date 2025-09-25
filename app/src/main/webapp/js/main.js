const XCheckboxes = document.querySelectorAll('.X-input__checkbox');
const RSelect = document.querySelector('.R-input__select');
const YInput = document.querySelector('.form-input');

let activeXCheckbox = null;

const RSubs = document.querySelectorAll('.sub-R');
const RDiv2Subs = document.querySelectorAll('.sub-R_div_2');

const userPoint = document.querySelector('.graph__point');

const submitBtn = document.querySelector('.form-submit');

const archiveContainer = document.querySelector('.archive__table-wrapper');
const archive = document.querySelector('.table-archive');

function handlePoint() {
    const y_str = YInput.value;
    const parts = y_str.split(".");

    const num = parseFloat(y_str);
    if ((activeXCheckbox) === null ||
        ['-', ''].includes(YInput.value)||
        ['-', ''].includes(RSelect.value) ||
        (!isNaN(num) && (num > 5 || num < -5)) ||
        parts.length > 2 ||
        ((num === 5 || num === -5) && (parts.length > 1 && !/^0*$/.test(parts[1])))
    ) {
        userPoint.setAttribute('r', '0');
        submitBtn.disabled = true;
    } else {

        submitBtn.disabled = false;

        if (!(isFinite(activeXCheckbox.value) && isFinite(YInput.value) && isFinite(RSelect.value))) return;

        const scale = 200 / RSelect.value;
        const X = activeXCheckbox.value * scale;
        const Y = -YInput.value * scale;

        userPoint.setAttribute('cx', X.toString());
        userPoint.setAttribute('cy', Y.toString());
        userPoint.setAttribute('r', '5');
    }
}

function handleRSubs(subs, value) {
    subs.forEach(sub => sub.textContent = sub.textContent[0] !== '-' ? value : '-' + value);
}

XCheckboxes.forEach(checkbox => checkbox.addEventListener('change', () => {
    if (checkbox === activeXCheckbox) activeXCheckbox = null; else {
        if (activeXCheckbox !== null) activeXCheckbox.checked = false;
        activeXCheckbox = checkbox;
    }
    handlePoint();
}));


RSelect.addEventListener('change', () => {
    const value = parseFloat(RSelect.value);
    handleRSubs(RSubs, value);
    handleRSubs(RDiv2Subs, value / 2);
    handlePoint();
});

YInput.addEventListener('paste', event => event.preventDefault());
YInput.addEventListener('input', function () {
    if (!/^-?\d*\.?\d*$/.test(this.value)) this.value = this.value.slice(0, -1);

    handlePoint();
});

async function exchange(event) {
    event.preventDefault();

    const X = activeXCheckbox.value;
    let Y = YInput.value;
    const R = RSelect.value;

    const postData = JSON.stringify({
        x: X,
        y: Y,
        r: R
    });

    const startExec = Date.now();
    const sendTime = new Date().toLocaleTimeString();

    try {
        const response = await fetch('fcgi-bin/FcgiServer.jar', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: postData
        });

        if (!response.ok) {
            alert('Server error: ' + response.status);
            return;
        }

        const responseData = await response.json();

        if ('error' in responseData) {
            alert('Error: ' + responseData.error);
            return;
        }

        if (!('result' in responseData)) {
            alert('Invalid data from server');
            return;
        }

        const endExec = Date.now();
        addNewRow(X, Y, R, responseData.result, sendTime, `${endExec - startExec} мс`);
    } catch (err) {
        alert('Request failed: ' + err.message);
    }
}



function addNewRow(X, Y, R, hit, sent, exec) {
    const newRow = archive.insertRow();
    [X, Y, R, hit, sent, exec].forEach(value => newRow.insertCell().textContent = value);

    archiveContainer.scrollTop = archiveContainer.scrollHeight;
}