package com.notable.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/product")
public class ProductController extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException {
		doPost(request,response);
	}
	
	@Override
    public void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
		String name = request.getParameter("name");
		String url = "/views/" + name + ".jsp";
		getServletContext().getRequestDispatcher(url).forward(request, response);
		
	}
}
