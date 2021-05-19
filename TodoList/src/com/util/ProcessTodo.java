package com.util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProcessTodo")
public class ProcessTodo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int todoid = Integer.parseInt(request.getParameter("todoid"));
		String desc = request.getParameter("desc");
		request.setAttribute("todoid", todoid);
		request.setAttribute("desc", desc);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		request.setAttribute("post", "post");
	}

}
