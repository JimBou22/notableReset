<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<c:import url="/sharedViews/headMeta.jsp" />
<title>Onesie</title>
</head>

<body>
  <c:import url="/sharedViews/header.jsp" />

  <div class="container">
    <div class="card">
      <div class="container-fluid">
        <div class="wrapper row">
          <div class="col-sm-6">
            <div class="preview-pic tab-content product">
              <div class="tab-pane active" id="pic-1"><img src="images/onesie.jpg" /></div>
            </div>
          </div>
          <div class="details col-sm-6 product-details">
            <h3 class="product-title">Onesie</h3>
            <div class="rating">
              <div class="stars">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span>
              </div>
              <span class="review-no">134 reviews</span>
            </div>
            <p class="product-description">Never take your clothes off again!</p>
            <h4 class="price">Price: <span>$49.99</span></h4>
            <p class="vote"><strong>98%</strong> of buyers enjoyed this product! <strong>(84 votes)</strong></p>
            <p> Status: <span>Available</span></p>
            <form class="add-to-cart" action="cart.jsp" method="POST">
              <label for="qty-1">Quantity</label>
              <input type="text" name="qty-1" id="qty-1" class="qty" value="1" />
              <button id="cart" value="Add to cart" class="headerButton btn">Add to cart</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <c:import url="/sharedViews/footer.jsp" />
	<c:import url="/sharedViews/scripts.jsp" />

</body>

</html>