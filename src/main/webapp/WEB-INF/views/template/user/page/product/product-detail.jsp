<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="../../components/head.jsp"></jsp:include>

<body>
	<jsp:include page="../../components/header.jsp"></jsp:include>
	<jsp:include page="../../components/sidebar.jsp"></jsp:include>
	<div class="fix-offset"></div>
	<div class="ps-page--product">
		<div class="ps-container">
			<div class="ps-page__container">
				<div class="ps-page__left">
					<div class="ps-product--detail ps-product--fullwidth">
						<div class="ps-product__header">
							<div class="ps-product__thumbnail" data-vertical="true">
								<figure>
									<div class="ps-wrapper">
										<c:if test="${product.stockStatus == 'outofstock'}">
											<div class="ps-product__badge out-stock"
												style="background-color: #000; color: #fff; font-size: 14px; font-weight: 600; line-height: 20px; padding: 5px 10px; border-radius: 4px;">
												ناموجود</div>
										</c:if>
										<div class="ps-product__gallery" data-arrow="true">
											<c:forEach items="${product.images}" var="i">
												<div class="item">
													<a
															href="${pageContext.request.contextPath}/image/display/${i.id}?w=600"><img
															src="${pageContext.request.contextPath}/image/display/${i.id}?w=600" class="product-image"></a>
												</div>
											</c:forEach>
										</div>
									</div>
								</figure>
								<div class="ps-product__variants" data-item="10" data-md="$10"
									data-sm="10" data-arrow="false">

									<c:forEach items="${product.images}" var="i" >
										<div class="item">
											<img src="${pageContext.request.contextPath}/image/display/${i.id}?w=100" class="product-thumbnail">
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="ps-product__info">
								<h1>${product.name }</h1>
								<div class="remember">
									<form action="">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="remember-me">
											<label class="form-check-label" for="remember-me">
												به من خبر بده
											</label>
										</div>
									</form>
								</div>
								<h4 class="ps-product__price">
									<fmt:formatNumber type="number" value="${product.price}"/> تومان </h4>
								<div class="ps-product__desc">
									<p>
										فروشنده:<a href="${pageContext.servletContext.contextPath}/"><strong>
												بایچه</strong></a>
									</p>
									<div class="ps-list--dot">${product.shortDescription }</div>
								</div>

								<div class="ps-product__meta">
									<p>
										برند:<a>${product.brand.name }</a>
									</p>
									<div class="ps-product__rating">
										<select class="ps-rating" data-read-only="true">
										</select>
										<jsp:include page="stars.jsp"/>
										<span>(${numberReview} نظر)</span>
									</div>
								</div>
								<c:if test="${product.stockStatus != 'outofstock'}">
									<div class="ps-product__shopping">
										<figure>
											<span style="color: red" class="invalid-${product.id}"></span>
											<figcaption>تعداد</figcaption>
											<div class="form-group--number">
												<button class="up" value="${product.id}">
													<i class="fa fa-plus"></i>
												</button>
												<button class="down" value="${product.id}">
													<i class="fa fa-minus"></i>
												</button>
												<div>
													<input class="form-control itemQty-${product.id}"
														type="text" placeholder="1" value="1" readonly>
												</div>
											</div>
										</figure>
										<a class="ps-btn ps-btn--black toCartDetail"
											value="${product.id}">افزودن به سبد خرید</a><a
											class="ps-btn buyNowDetail" value="${product.id}">خرید</a>
										<div class="ps-product__actions">
											<a onClick="addToWishList(${product.id})"
												data-toggle="tooltip" data-placement="top"
												title="Add to Wishlist"><i class="icon-heart"></i></a>
										</div>
									</div>
								</c:if>
							</div>
						</div>
						<div class="ps-product__content ps-tab-root">
							<ul class="ps-tab-list">
								<li class="active"><a href="#tab-1">توضیحات تکمیلی</a></li>
								<li><a href="#tab-4">دیدگاه‌ها</a></li>
							</ul>
							<div class="ps-tabs">
								<div class="ps-tab active" id="tab-1">

									<div class="container product-attr">

										<c:forEach items="${product.attributes}" var="i">
											<div class="row product-attr-row">
												<div class="col-4 product-attr-name">${i.name}</div>
												<div class="col-8 product-attr-option">${i.option}</div>
											</div>
										</c:forEach>
									</div>
									<div class="ps-document">${product.description }</div>
								</div>
								<div class="ps-tab" id="tab-4">
									<jsp:include page="_comments.jsp"/>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ps-page__right">
					<jsp:include page="_facilities.jsp"/>
				</div>
			</div>

			<div class="ps-section--default">
				<div class="ps-section__header">
					<h3>بازدید های اخیر</h3>
				</div>
				<div class="ps-section__content">

				</div>
			</div>

			<div class="ps-section--default">
				<div class="ps-section__header">
					<h3>محصولات مشابه</h3>
				</div>
				<div class="ps-section__content">

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../components/footer.jsp"></jsp:include>
	<jsp:include page="js/script.jsp"></jsp:include>
</body>
