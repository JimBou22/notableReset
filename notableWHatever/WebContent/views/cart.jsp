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

    <!--Actual Cart Stuff-->
<!--     <button id="tCart" onclick="display()" class="headerButton">View</button>
    <form id="shopping-cart" action="cart.jsp" method="post">
      <table class="shopping-cart" id="cart-table">
              <tr>
                  <th scope="col">Item</th>
                  <th scope="col">Qty</th>
                  <th scope="col">Price</th>
              </tr>
              <div id="cart-stuff">
              <tr>
                <td id ="n1"></td>
                <td id ="q1"></td>
                <td id ="p1"></td>
                <td id="del1">
                  <button type="button" class="headerButton" onclick="productDelete()">DELETEME</button>
                </td>
              </tr>
              <tr>
              <td id ="n2"></td>
              <td id ="q2"></td>
              <td id ="p2"></td>
              <td id="del2"></td>
              </tr>
              <tr>
              <td id ="n3"></td>
              <td id ="q3"></td>
              <td id ="p3"></td>
              <td id="del3"></td>
              </tr>
              <tr>
              <td id ="n4"></td>
              <td id ="q4"></td>
              <td id ="p4"></td>
              <td id="del4"></td>
              </tr>
              <tr>
              <td id ="n5"></td>
              <td id ="q5"></td>
              <td id ="p5"></td>
              <td id="del5"></td>
              </tr>
              </div>
          <tbody></tbody>
      </table>
      <p id="sub-total">
        <strong>Sub Total</strong>: <span id="stotal"></span>
      </p>
      <ul id="shopping-cart-actions">
        <li>
          <input type="submit" name="update" id="update-cart" class="headerButton buttons my-2 my-sm-0" value="Update Cart" />
        </li>
        <li>
          <input type="submit" name="delete" id="empty-cart" class="headerButton buttons my-2 my-sm-0" value="Empty Cart" />
        </li>
        <li>
          <a href="home.jsp" class="buttons my-2 my-sm-0">Continue Shopping</a>
        </li>
        <li>
          <a href="checkout.jsp" class="buttons my-2 my-sm-0">Go To Checkout</a>
        </li>
      </ul>
    </form> -->
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