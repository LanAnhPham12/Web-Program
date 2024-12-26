options = {
    form: '#form-register',
    errorSelector: '.error',
    rules: [
        {
            selector: '#first-name',
            test: checkBlank
        },
        {
            selector: '#last-name',
            test: checkBlank
        },
        {
            selector: '#email',
            test: validateEmail
        },
        {
            selector: '#username',
            test: checkBlank
        },
        {
            selector: '#password',
            test: validatePassword
        },
        {
            selector: '#re-password',
            test: validateRePassword
        },
    ]
}

Validator(options);
