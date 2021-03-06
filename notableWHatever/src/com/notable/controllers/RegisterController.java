package com.notable.controllers;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notable.business.User;
import com.notable.data.UserDB;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

	// private static final String defaultURL = "/cart/cart.jsp";

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		//System.out.println("URI:" + requestURI);
		// String url = processUser(request, response);
		String url = "";

		String action = request.getParameter("action");

		if (action.equals("add")) {
			url = registerUser(request, response);
		} else if (action.equals("login")) {
			url = loginUser(request, response);
			// setting an attribute to be used in home controller
			// the url returned will be "/home" to go to home controller
			//request.getSession().setAttribute("action", "index");
		} else if (action.equals("logout")) {
			url = logoutUser(request, response);
		}

		getServletContext().getRequestDispatcher(url).forward(request, response);
		
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	private String registerUser(HttpServletRequest request, HttpServletResponse response) {

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		String country = request.getParameter("country");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = new User();

		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setAddress1(address1);
		user.setAddress2(address2);
		user.setCity(city);
		user.setState(state);
		user.setZip(zip);
		user.setCountry(country);
		user.setEmail(email);
		user.setPassword(password);

		UserDB.insert(user);

		return "/views/login.jsp";
	}

	private String loginUser(HttpServletRequest request, HttpServletResponse response) {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// System.out.println("email: " + email + " password: " + password);

		boolean isValidUser = UserDB.authenticateUser(email, password);

		// System.out.println(isValidUser);

		if (isValidUser) {
			// System.out.println("User is authenticated");
			User user = UserDB.getUser(email);
			
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			Cookie firstNameCookie = new Cookie("firstNameCookie", user.getFirstName());
			firstNameCookie.setMaxAge(60*60*24*365*2);
			firstNameCookie.setPath("/");
			response.addCookie(firstNameCookie);
			
			boolean makeLoginCookie = true;
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase("loggedInCookie")) {
					cookie.setValue("yes");
					response.addCookie(cookie);
					makeLoginCookie = false;
				}
			}
			if (makeLoginCookie) {
				Cookie loggedInCookie = new Cookie("loggedInCookie", "yes");
				loggedInCookie.setMaxAge(60*60*24*365*2);
				loggedInCookie.setPath("/");
				response.addCookie(loggedInCookie);
			}
			
			
//			Cookie[] cookies = request.getCookies();
//			for (Cookie cookieee : cookies) {
//				System.out.println("c name: " + cookieee.getName());
//				System.out.println("c value: " + cookieee.getValue());
//			}	

		} else {
			// System.out.println("Wrong email and/or password!");
			return "/views/loginInvalid.jsp";
		}
		// will be going to home controller to get the cookies to load initially
		return "/index.jsp";
	}
	
	private String logoutUser(HttpServletRequest request, HttpServletResponse response) {
			
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase("loggedInCookie")) {
					cookie.setValue("no");
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}
			
		return "/index.jsp";
	}
}
