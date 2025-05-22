package com.bonsai_gardener.controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.regex.Pattern;

import com.bonsai_gardener.model.usermodell;
import com.bonsai_gardener.util.ImageUtil;
import com.bonsai_gardener.util.cookieutil;
import com.bonsai_gardener.util.sessionutil;

/**
 * Servlet implementation class register
 */
@SuppressWarnings("unused")
@WebServlet("/register")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50
	)
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String username = request.getParameter("username");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String role_name = request.getParameter("role_name");
	    String Location = request.getParameter("Location");
	    String Phone = request.getParameter("Phone");

	    String errorMessage = null;

	    String textPattern = "^[a-zA-Z]+$";
	    String emailPattern = "^[a-zA-Z0-9@.]+$";
	    String passwordPattern = "^[a-zA-Z0-9]{8,}$";

	    if (username.isEmpty() || email.isEmpty() || password.isEmpty() || Location.isEmpty() || Phone.isEmpty()) {
	        errorMessage = "All fields are required!";
	    } else if (!Pattern.matches(textPattern, username)) {
	        errorMessage = "Username can only contain letters!";
	    } else if (!Pattern.matches(emailPattern, email)) {
	        errorMessage = "Email can only contain letters, numbers, and '@.'!";
	    } else if (!Pattern.matches(passwordPattern, password)) {
	        errorMessage = "Password must be at least 8 characters long and contain only letters and numbers!";
	    } else if (!Pattern.matches(textPattern, Location)) {
	        errorMessage = "Location must be at least 8 characters long and contain only letters!";
	    }

	    if (errorMessage != null) {
	        request.setAttribute("errorMessage", errorMessage);
	        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	        System.out.println("Registration failed");
	    } else {
	        // Handle image upload
	        Part imagePart = request.getPart("profileImage");
	        ImageUtil imageUtil = new ImageUtil();
	        String imageUrl = imageUtil.uploadImage(imagePart, "userprofileimages", request);

	        System.out.println("Image saved at server path: " + request.getServletContext().getRealPath("/images/userprofileimages"));
	        System.out.println("Image URL saved in DB: " + imageUrl);

	        // Create and populate user model
	        usermodell usermodell1 = new usermodell();
	        usermodell1.setUsername(username);
	        usermodell1.setPassword(password);
	        usermodell1.setEmail(email);
	        usermodell1.setrole_name(role_name);
	        usermodell1.setLocation(Location);
	        usermodell1.setPhone(Phone);
	        usermodell1.setImageUrl(imageUrl);

	        // Save to database
	        com.bonsai_gardener.service.registerservice registerService = new com.bonsai_gardener.service.registerservice();
	        Boolean isRegistered = registerService.addUser(usermodell1);

	        if (isRegistered != null && isRegistered) {
	            System.out.println("Successfully registered!");

	            // Set session and cookie
	            sessionutil.setAttribute(request, "username", username);
	            sessionutil.setAttribute(request, "role_name", role_name);
	            sessionutil.setAttribute(request, "loggedInUser", usermodell1);

	            if ("admin".equalsIgnoreCase(username)) {
	                cookieutil.addCookie(response, "role_name", "admin", 30 * 60);
	                response.sendRedirect(request.getContextPath() + "/admindashboard");
	            } else {
	                cookieutil.addCookie(response, username, role_name, 30 * 60);
	                response.sendRedirect(request.getContextPath() + "/home");
	            }

	        } else {
	            System.out.println("Failed to register!");
	            request.setAttribute("errorMessage", "Something went wrong during registration.");
	            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	        }
	    }
	}

	
	
	
	private String getImageNameFromPart(Part part) {
	    String contentDisp = part.getHeader("content-disposition");
	    for (String item : contentDisp.split(";")) {
	        if (item.trim().startsWith("filename")) {
	            return item.substring(item.indexOf("=") + 2, item.length() - 1);
	        }
	    }
	    return "default.png";
	}
	
	
}
