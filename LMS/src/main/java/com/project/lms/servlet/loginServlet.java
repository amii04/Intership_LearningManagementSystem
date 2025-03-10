package com.project.lms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/login")
//public class loginServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        try (Connection conn = DBConnect.getInstance().getConnection();
//             PreparedStatement stmt = conn.prepareStatement("SELECT password, role FROM Users WHERE email = ?")) {
//            
//            stmt.setString(1, email);
//            ResultSet rs = stmt.executeQuery();
//
//            if (rs.next()) {
//                String storedHash = rs.getString("password");
//                String role = rs.getString("role");
//
//                if (BCrypt.checkpw(password, storedHash)) {
//                    if ("STUDENT".equalsIgnoreCase(role)) {
//                        response.sendRedirect("studashboard.jsp");
//                    } else if ("INSTRUCTOR".equalsIgnoreCase(role)) {
//                        response.sendRedirect("insdashboard.jsp");
//                    } else {
//                        request.setAttribute("errorMessage", "Invalid role.");
//                        request.setAttribute("email", email); // Preserve email
//                        request.getRequestDispatcher("login.jsp").forward(request, response);
//                    }
//                } else {
//                    request.setAttribute("errorMessage", "Invalid credentials. Please try again.");
//                    request.setAttribute("email", email); // Preserve email
//                    request.getRequestDispatcher("login.jsp").forward(request, response);
//                }
//            } else {
//                request.setAttribute("errorMessage", "User does not exist. Please register.");
//                request.setAttribute("email", email); // Preserve email
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            request.setAttribute("errorMessage", "Server error. Please try again later.");
//            request.setAttribute("email", email); // Preserve email
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        }
//    }
//}

import com.project.lms.util.DBConnect;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("Login attempt: " + email); // Debug log

        try (Connection conn = DBConnect.getInstance().getConnection()) {
            String sql = "SELECT password, role FROM users WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                String role = rs.getString("role");

                System.out.println("User found. Role: " + role); // Debug log

                if (BCrypt.checkpw(password, hashedPassword)) {
                    System.out.println("Password matched for user: " + email);

                    // ✅ Store user details in session
                    HttpSession session = request.getSession();
                    session.setAttribute("role", role);
                    session.setAttribute("userEmail", email);
                    System.out.println("Session set: Role = " + session.getAttribute("role"));  // Debugging log


                    // ✅ Correct the redirect paths
                    if ("STUDENT".equalsIgnoreCase(role)) {
                        System.out.println("Redirecting to Student Dashboard...");
                        response.sendRedirect(request.getContextPath() + "/studashboard.jsp");
                    } else if ("INSTRUCTOR".equalsIgnoreCase(role)) {
                        System.out.println("Redirecting to Instructor Dashboard...");
                        response.sendRedirect(request.getContextPath() + "/insdashboard.jsp");
                    } else {
                        System.out.println("Invalid role found.");
                        request.setAttribute("errorMessage", "Invalid role.");
                        request.setAttribute("email", email);
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } else {
                    System.out.println("Password mismatch!");
                    request.setAttribute("errorMessage", "Invalid credentials.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                System.out.println("User does not exist.");
                request.setAttribute("errorMessage", "User does not exist.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Database error occurred: " + e.getMessage());
            request.setAttribute("errorMessage", "Server error.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
