package com.notable.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notable.business.Cart;
import com.notable.business.LineItem;
import com.notable.business.Product;
import com.notable.business.User;

import java.util.*;

@WebServlet("/cart")
public class OrderController extends HttpServlet {
//    private static final String "/views/cart.jsp" = ""/views/cart.jsp"";
    
    @Override
    public void doPost(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/views/cart.jsp";
        
        String action  = request.getParameter("action");
               
        if (action.equals("Add")) /* requestURI.endsWith("/addItem")*/ {
            url = addItem(request, response);
        } else if (action.equals("Update")) {
            url = updateItem(request, response);
        } else if (action.equals("Remove")) {
            url = removeItem(request, response);
		} else {
			url= showCart(request,response);
		} 
        /*
		}
			 * else if (requestURI.endsWith("/checkUser")) { url = checkUser(request,
			 * response); } else if (requestURI.endsWith("/processUser")) { url =
			 * processUser(request, response); } else if
			 * (requestURI.endsWith("/displayInvoice")) { url = displayInvoice(request,
			 * response); } else if (requestURI.endsWith("/displayUser")) { url =
			 * "/cart/user.jsp"; } else if (requestURI.endsWith("/displayCreditCard")) { url
			 * = "/cart/credit_card.jsp"; } else if (requestURI.endsWith("/completeOrder"))
			 * { url = completeOrder(request, response); }
			 */
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url=showCart(request, response);
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
    
    private String showCart(HttpServletRequest request,
            HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getCount() == 0|| user == null) {
            request.setAttribute("emptyCart", "Your cart is empty");
        } else {
            request.getSession().setAttribute("cart", cart);
        }
        return "/views/cart.jsp";
    }
    
    private String addItem(HttpServletRequest request,
            HttpServletResponse response) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null)
            cart = new Cart();
//        String productCode = request.getParameter("productCode");
        
//        Product product = ProductDB.selectProduct(productCode);
        //Create product here with values from parameter.
        Product product = new Product();
       // int productId = Integer.parseInt(request.getParameter("productId"));
    	String name = request.getParameter("name");
    	
    	double price = Double.parseDouble(request.getParameter("price"));
    	//product.setProductId(productId);
    	product.setName(name);
    	
    	product.setPrice(price);    	
        if (product != null) {
            LineItem lineItem = new LineItem();
            lineItem.setLineItemId(cart.getCount() + 1);
            lineItem.setProduct(product);
            cart.addItem(lineItem);
        }
        
        
        
        //Add the item to the cookie
        Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if (cookie.getName().equalsIgnoreCase("firstNameCookie")) { //find name
				StringTokenizer values = new StringTokenizer(cookie.getValue(),"|"); //find cart cookie
				values.nextToken();
				if(values.hasMoreTokens()) {
					String cartToken = values.nextToken();
					for(Cookie temp  : cookies) {
						if(temp.getName().equalsIgnoreCase(cartToken)) { //get cart cookie
							temp.setValue(temp.getValue() + "|" +name+","+price); //add to cart cookie
						}
					}
				} else { //cart cookie not yet made
					String cartToken = cookie.getValue() + "|"+cookie.getValue()+"cart"; //give cartcookie name
					cookie.setValue(cartToken); //set the value of the cookie to this new name
					StringTokenizer temps = new StringTokenizer(cookie.getValue(),"|"); //get the values of the new cookie
					temps.nextToken(); //skip first value
					String cartCookie = temps.nextToken();
					Cookie newCart = new Cookie(cartCookie,""); //make a new cart cookie
					response.addCookie(newCart);
					Cookie[] cookiesNew = request.getCookies(); //add stuff to new cart cookie
					for(Cookie temp  : cookiesNew) {
						System.out.println(temp.getName());
						if(temp.getName().equalsIgnoreCase(cartCookie)) {
							temp.setValue(temp.getValue() + "|" +name+"," +price);
						}
						System.out.println(temp.getName() +":" + temp.getValue());
					}
				}
			}
		}
        
        session.setAttribute("cart", cart);
//        List<LineItem> a = new ArrayList<LineItem>();
//        a = cart.getItems();
//        for(LineItem b : a) {
//        	System.out.println(b);
//        }
        return "/views/cart.jsp";
    }
    
    private String updateItem(HttpServletRequest request,
            HttpServletResponse response) {
        String quantityString = request.getParameter("quantity");
//        String productName = request.getParameter("name");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        int quantity;
        try {
            quantity = Integer.parseInt(quantityString);
            if (quantity < 0)
                quantity = 1;
        } catch (NumberFormatException ex) {
            quantity = 1;
        }
        
//        Product product = ProductDB.selectProduct(productCode);
        Product product = new Product();
//        int productId = Integer.parseInt(request.getParameter("productId"));
    	String name = request.getParameter("name");
    	double price = Double.parseDouble(request.getParameter("price"));
//    	product.setProductId(productId);
    	product.setName(name);
    	
    	product.setPrice(price);  
        
        if (product != null && cart != null) {
            LineItem lineItem = new LineItem();
            lineItem.setProduct(product);
            lineItem.setQuantity(quantity);
            if (quantity > 0)
                cart.addItem(lineItem);
            else
                cart.removeItem(lineItem);
        }
        return "/views/cart.jsp";
    }
    
    private String removeItem(HttpServletRequest request,
            HttpServletResponse response) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Product product = new Product();
//        int productId = Integer.parseInt(request.getParameter("productId"));
    	String name = request.getParameter("name");
    	double price = Double.parseDouble(request.getParameter("price"));
//    	product.setProductId(productId);
    	product.setName(name);
    	
    	product.setPrice(price);  
        if (product != null && cart != null) {
            LineItem lineItem = new LineItem();
            lineItem.setProduct(product);
            cart.removeItem(lineItem);
        }
        return "/views/cart.jsp";
    }
}
