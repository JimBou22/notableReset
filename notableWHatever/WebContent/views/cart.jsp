<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>Cart</title>
</head>

<body>
  <c:import url="/sharedViews/header.jsp" />
    <c:choose>
      <c:when test="${emptyCart != null}">
          <p>Your cart is empty.</p>
      </c:when>
      <c:otherwise>
        <table>
           <tr>
            <th>Qty</th>
            <th>Name</th>
            <th>Price</th>
            <th>Amount</th>
            <th>&nbsp;</th>
         </tr>
          <c:forEach var="item" items="${cart.items}">
            <tr class="cart_row">
              <td>
                <form action="<c:url value='cart'/>" method="post">
                   <input type="hidden" name="productId"
                  			value="<c:out value='${item.product.productId}'/>">
                  <input type="hidden" name="name" 
                         value="<c:out value='${item.product.name}'/>">
                  <input type="hidden" name="description"
                  			value="<c:out value='${item.product.description}'/>">
                  <input type="hidden" name="price"
                  			value="<c:out value='${item.product.price}'/>">
                  <input type=text name="quantity" 
                         value="<c:out value='${item.quantity}'/>" id="quantity">
                  <input type="submit" name = "action" value="Update">
                </form>                  
              </td>
              <td>${item.product.name}</td>
              <td>${item.product.priceCurrencyFormat}</td>
              <td>${item.totalCurrencyFormat}</td>
              <td>
                <form action="<c:url value='cart'/>" method="post">
                  <input type="hidden" name="productId"
                  			value="<c:out value='${item.product.productId}'/>">
                  <input type="hidden" name="name" 
                         value="<c:out value='${item.product.name}'/>">
                  <input type="hidden" name="description"
                  			value="<c:out value='${item.product.description}'/>">
                  <input type="hidden" name="price"
                  			value="<c:out value='${item.product.price}'/>">
                  <input type="submit" name= "action" value="Remove">
                </form>                  
              </td>
            </tr>
          </c:forEach>
            <tr>
              <td colspan="1">
                <p><b>To change the quantity for an item</b>, enter the new quantity 
                      and click on the Update button.</p>
                <p><b>To remove an item</b>, click on the Remove button.</p>
              </td>
              <td colspan="1">&nbsp;</td>
            </tr>
          </table>
      </c:otherwise>
  </c:choose>

     <c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>