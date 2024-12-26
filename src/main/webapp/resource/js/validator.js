function Validator(options) {
    function validate(inputElement, rule) {
        const errorMessage = rule.test(inputElement.value);
        const errorElement = inputElement.parentElement.querySelector(
            options.errorSelector
        );
        // Add or remove error message
        if (errorMessage) {
            errorElement.innerText = errorMessage;
            inputElement.parentElement.classList.remove("valid");
            inputElement.parentElement.classList.add("invalid");
        } else {
            errorElement.innerText = "";
            inputElement.parentElement.classList.remove("invalid");
            inputElement.parentElement.classList.add("valid");
        }
        // Return true if it don't have error
        return !errorMessage;
    }

    function submit() {
        let isValid = true;
        const objectForm = {};
        options.rules.forEach((rule) => {
            const inputElement = formElement.querySelector(rule.selector);
            //Get data to craeate Object return
            objectForm[rule.name] = inputElement.value ? inputElement.value.trim() : '';
            if (!validate(inputElement, rule)) {
                isValid = false;
            }
        });
        if (isValid) {
            //If not error, return object include info register
            console.log({objectForm});
        }

        return isValid;
    }

    const formElement = document.querySelector(options.form);

    console.log(formElement);

    if (formElement) {
        // Handle onsubmit
        formElement.onsubmit = () => {
            return submit();
        }

        // For each rule defined below
        options.rules.forEach((rule) => {
            const inputElement = formElement.querySelector(rule.selector);
            if (inputElement) {
                // Handle user blur out input
                inputElement.onblur = function () {
                    validate(inputElement, rule);
                };

                //Handle user on input
                inputElement.oninput = function () {
                    const errorElement = inputElement.parentElement.querySelector(
                        options.errorSelector
                    );
                    errorElement.innerText = "";
                    inputElement.parentElement.classList.remove("invalid");
                    inputElement.parentElement.classList.add("valid");
                };
            }
        });
    }
}

function checkBlank(value) {
    if (!value) {
        return 'Vui lòng nhập thông tin'
    }

    return ''
}

function validateEmail(email) {
    if (!email) {
        return 'Vui lòng nhập thông tin'
    }

    const regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return regex.test(email) ? '' : 'Email không hợp lệ';
}

function validatePassword(value) {
    if (!value) {
        return 'Vui lòng nhập thông tin'
    }

    if (value.length < 6) {
        return 'Vui lòng nhập lớn hơn 6 ký tự';
    }

    return '';
}

function validateRePassword(value) {
    if (!value) {
        return 'Vui lòng nhập thông tin'
    }

    const password = document.getElementById('password').value;

    if (!password) {
        return 'Vui lòng nhập mật khẩu trước';
    }

    if (password !== value) {
        return 'Mật khẩu không khớp nhau';
    }

    return '';
}
