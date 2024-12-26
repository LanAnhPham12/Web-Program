Validator({
        form: '.form-login',
        errorSelector: '.error',
        rules: [
            {
                selector: '#username',
                test: checkBlank
            },
            {
                selector: '#password',
                test: validatePassword
            },
        ]
    }
)
