<%@ page import="com.example.milkteaweb.dto.CartDto" %>
<%@ page import="com.example.milkteaweb.entity.Product" %>
<%@ page import="com.example.milkteaweb.dto.CartItemDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CartDto cartDto = (CartDto) session.getAttribute("cart");
    if (cartDto == null) {
        cartDto = new CartDto();
    }
%>
<section class="h-100 h-custom" style="background-color: #d2c9ff;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
                <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                    <div class="card-body p-0">
                        <div class="row g-0">
                            <div class="col-lg-8">
                                <div class="p-5">
                                    <div class="d-flex justify-content-between align-items-center mb-5">
                                        <h1 class="fw-bold mb-0 text-black">Giỏ hàng của bạn</h1>
                                        <h6 class="mb-0 text-muted quantity-items"></h6>
                                    </div>
                                    <hr class="my-4">

                                    <% for (int i = 0; i < cartDto.getItems().size(); i++) {
                                        CartItemDto item = cartDto.getItems().get(i);
                                    %>


                                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img
                                                    src="<%=item.getProduct().getImage()%>"
                                                    class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <h6 class="text-muted"><%=item.getCategory().getName()%></h6>
                                            <h6 class="text-black mb-0"><%=item.getProduct().getName()%></h6>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            <button class="btn btn-link px-2"
                                                    onclick="minus(<%=item.getProduct().toJson()%>)">
                                                <i class="fas fa-minus"></i>
                                            </button>

                                            <input id="form1" min="0" name="quantity" value="<%= item.getQuantity() %>" type="number"
                                                   class="form-control form-control-sm"
                                                   style="min-width: 65px"
                                                   disabled
                                            />

                                            <button class="btn btn-link px-2"
                                                    onclick="plus(<%=item.getProduct().toJson()%>)">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h6 class="mb-0"><%=item.getProduct().getPrice()%> VNĐ</h6>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <a href="#!" class="text-muted"
                                               onclick="delItem(<%=item.getProduct().toJson()%>)">
                                                <i class="fas fa-times"></i>
                                            </a>
                                        </div>
                                    </div>

                                    <% } %>

                                    <hr class="my-4">

                                    <div class="pt-5">
                                        <h6 class="mb-0"><a href="${pageContext.request.contextPath}/product" class="text-body"><i
                                                class="fas fa-long-arrow-alt-left me-2"></i>Tiếp tục mua hàng</a></h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 bg-grey">
                                <div class="p-5">
                                    <h3 class="fw-bold mb-5 mt-2 pt-1">Thông tin nhận hàng</h3>
                                    <hr class="my-4">

                                    <div class="d-flex justify-content-between mb-4">
                                        <h5 class="text-uppercase">Sản phẩm: <%=cartDto.getItems().size()%></h5>
                                        <h5><%=cartDto.getTotalPrice()%> VNĐ</h5>
                                    </div>

                                    <div class="d-flex justify-content-between mb-4">
                                        <h5 class="text-uppercase">Phí vận chuyển</h5>
                                        <h5><%=cartDto.getShipFee()%> VNĐ</h5>
                                    </div>

                                    <div class="mb-5">
                                        <div class="form-outline">
                                            <label class="h5 form-label" for="phone">Số điện thoại</label>
                                            <input type="text" id="phone"
                                                   value="<%=cartDto.getPhone()%>"
                                                   class="form-control form-control-lg"/>
                                        </div>
                                    </div>

                                    <div class="mb-5">
                                        <div class="form-outline">
                                            <label class="h5 form-label" for="address">Địa chỉ nhận hàng</label>
                                            <input type="text" id="address"
                                                   class="form-control form-control-lg"/>
                                        </div>
                                    </div>

                                    <div class="mb-5">
                                        <div class="form-outline">
                                            <label class="h5 form-label" for="receiver">Tên người nhận</label>
                                            <input type="text" id="receiver"
                                                   value="<%=cartDto.getReceiver()%>"
                                                   class="form-control form-control-lg"/>
                                        </div>
                                    </div>

                                    <hr class="my-4">

                                    <div class="d-flex justify-content-between mb-5">
                                        <h5 class="text-uppercase">Thành tiền</h5>
                                        <h5><%=cartDto.getTotalPrice() + cartDto.getShipFee()%> VNĐ</h5>
                                    </div>

                                    <button type="button" class="btn btn-dark btn-block btn-lg"
                                            onclick="payment()"
                                            data-mdb-ripple-color="dark">Thanh toán
                                    </button>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>