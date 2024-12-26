const BASE_URL = 'http://localhost:8082';

function isBlank(field) {
    return field === null || field === undefined || field === '';
}

const callbackCartPage = res => {
    if (res.status === 200) {
        window.location.reload();
    }
};

function addToCart(product) {
    call(`${BASE_URL}/cart/add-product`, product, res => {
        if (res.status === 200) {
            success('Đã thêm sản phẩm vào giỏ hàng');
        }
    });
}

function minus(product) {
    call(`${BASE_URL}/cart/minus-product`, product, callbackCartPage);
}

function plus(product) {
    call(`${BASE_URL}/cart/add-product`, product, callbackCartPage);
}

function delItem(product) {
    call(`${BASE_URL}/cart/del-item`, product, callbackCartPage);
}

function payment() {
    // validate
    const phone = document.getElementById('phone').value.trim();
    const address = document.getElementById('address').value.trim();
    const receiver = document.getElementById('receiver').value.trim();

    if (isBlank(phone) || isBlank(address) || isBlank(receiver)) {
        error("Vui lòng nhập đầy đủ thông tin")
        return;
    }

    call(`${BASE_URL}/cart/payment`, {phone, address, receiver}, (res) => {
        if (res.status === 200) {
            success("Bạn đã đặt hàng thành công. Đơn hàng đang chờ xác nhận!");
            setTimeout(() => {
                window.location.href = `${BASE_URL}/home`
            }, 4000);
        }
    });
}

function call(url, body, callback) {
    fetch(url, {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(body)
    }).then(res => res.json())
        .then(callback)
        .catch(err => {
            console.error(err);
            error("Vui lòng đăng nhập vào tài khoản")
            window.location.href = `${BASE_URL}/login`
        });
}
