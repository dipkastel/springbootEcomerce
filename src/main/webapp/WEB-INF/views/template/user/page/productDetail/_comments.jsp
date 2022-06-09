<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 ">
        <div class="ps-block--average-rating">
            <div class="ps-block__header">
                <h3>${avgStar }</h3>
                <select id="avgRating" class="ps-rating"
                        data-read-only="true">
                    <c:choose>
                        <c:when test="${avgStar != null}">
                            <option
                                ${(avgStar==0 || avgStar> 0) && avgStar < 1
                                        ? "selected" : "" }
                                    value="0">0</option>
                            <option
                                ${(avgStar==1 || avgStar> 1) && avgStar < 2
                                        ? "selected" : "" }
                                    value="1">1</option>
                            <option
                                ${(avgStar==2 || avgStar> 2) && avgStar < 3
                                        ? "selected" : "" }
                                    value="2">2</option>
                            <option
                                ${(avgStar==3 || avgStar> 3) && avgStar < 4
                                        ? "selected" : "" }
                                    value="3">3</option>
                            <option
                                ${(avgStar==4 || avgStar> 4) && avgStar < 5
                                        ? "selected" : "" }
                                    value="4">4</option>
                            <option
                                ${avgStar==5 || avgStar> 5 ? "selected" :
                                        ""}
                                    value="5">5</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </c:otherwise>
                    </c:choose>
                </select><span>${numberReview } دیدگاه‌ها</span>
            </div>
            <div class="ps-block__star">
                <span>5 ستاره</span>
                <div class="ps-progress" data-value="${star5}">
                    <span></span>
                </div>
                <span>${nReview5}</span>
            </div>
            <div class="ps-block__star">
                <span>4 ستاره</span>
                <div class="ps-progress" data-value="${star4}">
                    <span></span>
                </div>
                <span>${nReview4}</span>
            </div>
            <div class="ps-block__star">
                <span>3 ستاره</span>
                <div class="ps-progress" data-value="${star3}">
                    <span></span>
                </div>
                <span>${nReview3}</span>
            </div>
            <div class="ps-block__star">
                <span>2 ستاره</span>
                <div class="ps-progress" data-value="${star2}">
                    <span></span>
                </div>
                <span>${nReview2}</span>
            </div>
            <div class="ps-block__star">
                <span>1 ستاره</span>
                <div class="ps-progress" data-value="${star1}">
                    <span></span>
                </div>
                <span>${nReview1}</span>
            </div>
        </div>
    </div>
    <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12 ">
        <form id="frmReview" class="ps-form--review"
              action="${pageContext.request.contextPath}/product/review"
              method="POST">
            <h4>نظر خود را ثبت کنید</h4>
            <div class="form-group form-group__rating">
                <label>امتیاز شما به این محصول</label>
                <jsp:include page="_stars.jsp"/>
            </div>
            <div class="form-group">
                <input type="hidden" id="user" name="user" value="${user }">
                <input type="hidden" name="product" value="${product.id }">
                <textarea class="form-control" rows="6" id="review"
                          name="review" placeholder="Write your review here"
                          maxlength="250"><c:if test="${rating != null}">${rating.review }</c:if>
													</textarea>
            </div>
            <div class="form-group submit">
                <button id="btnSubmitReview" class="ps-btn">ثبت نظر</button>
            </div>
        </form>
    </div>
</div>
