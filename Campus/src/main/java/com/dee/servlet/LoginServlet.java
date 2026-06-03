package com.dee.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dee.entity.UserEntity;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	
	
	
	private static final long serialVersionUID = 1L;

	// Database details
	private static final String URL = "jdbc:mysql://localhost:3306/campus";
	private static final String USER = "root";
	private static final String PASSWORD = "root";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		// Get form data
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			// Load Driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Create Connection
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			// SQL Query
			String query = "SELECT * FROM user WHERE email=? AND password=?";
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				int userId = rs.getInt("user_id");
				String userEmail = rs.getString("email");
				String fullName = rs.getString("full_name");
				String role = rs.getString("role");
				
				UserEntity loggedInUser = new UserEntity(userId, fullName, userEmail,"");
				
				HttpSession session = request.getSession();
				session.setAttribute("loggedInUser", loggedInUser);
				response.sendRedirect(request.getContextPath() + "/student-dashbord.jsp");
			} else {
				request.setAttribute("error", "Invalid Email or Password");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("ERROR : " + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	}