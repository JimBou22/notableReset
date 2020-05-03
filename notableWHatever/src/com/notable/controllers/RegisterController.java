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
			
//			Cookie cookie = new Cookie("userEmailCookie", user.getEmail() );
//			cookie.setMaxAge(60*60*24*365*2);
//			cookie.setPath("/");
//			response.addCookie(cookie);

		} else {
			// System.out.println("Wrong email and/or password!");
			return "/views/loginInvalid.jsp";
		}
		return "/views/home.jsp";
	}
}
