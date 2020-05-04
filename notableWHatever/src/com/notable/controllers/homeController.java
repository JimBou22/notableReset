package com.notable.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/home")
public class homeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		
		String url = "/views/" + name + ".jsp";
		
		// for redirecting pages for cookies to be applied
		String action = request.getParameter("action");
		if (action != null && action.equalsIgnoreCase("index")) {
			url = "/views/home.jsp";
		} else if (action != null && action.equalsIgnoreCase("cart")) {
			url = "/views/cart.jsp";
		}
		
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

	
}
