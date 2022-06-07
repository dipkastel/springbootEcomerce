<%@ page contentType="text/html; charset=UTF-8" %>
<div class="ps-popup" id="subscribe" data-time="500">
    <div class="ps-popup__content bg--cover"
         data-background="${pageContext.servletContext.contextPath}/img/bg/subscribe.jpg">
        <a class="ps-popup__close" ><i class="icon-cross"></i></a>
        <form class="ps-form--subscribe-popup" action="index.html"
              method="get">
            <div class="ps-form__content">
                <h4>
                    دریافت <strong>25%</strong> تخفیف
                </h4>
                <p>
                    عضویت در خبرنامه بایچه <br /> برای اطلاع از محصولات جدید <br /> و تخفیف ها.
                </p>
                <div class="form-group">
                    <input class="form-control" type="text" placeholder="Email Address"
                           required>
                    <button class="ps-btn">عضویت</button>
                </div>
                <div class="ps-checkbox">
                    <input class="form-control" type="checkbox" id="not-show"
                           name="not-show"> <label for="not-show">دیگر نمایش نده</label>
                </div>
            </div>
        </form>
    </div>
</div>
