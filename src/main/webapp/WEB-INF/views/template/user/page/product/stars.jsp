
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<select
        id="starNumber" name="starNumber" class="ps-rating"
        data-read-only="false">
    <c:choose>
        <c:when test="${rating != null}">
            <option ${rating.starNumber==0 ? "selected" : "" }
                    value="0">0</option>
            <option ${rating.starNumber==1 ? "selected" : "" }
                    value="1">1</option>
            <option ${rating.starNumber==2 ? "selected" : "" }
                    value="2">2</option>
            <option ${rating.starNumber==3 ? "selected" : "" }
                    value="3">3</option>
            <option ${rating.starNumber==4 ? "selected" : "" }
                    value="4">4</option>
            <option ${rating.starNumber==5 ? "selected" : "" }
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

</select>
