package com.project.lms.servlet;

import com.project.lms.util.DBConnect;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); // STUDENT or INSTRUCTOR

        // ✅ Hash the password before storing it
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        try (Connection conn = DBConnect.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO Users (name, email, password, role) VALUES (?, ?, ?, ?)")) {
            
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, hashedPassword);
            stmt.setString(4, role);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                showAlert(response, "Registration successful! Please login.");
            } else {
                showAlert(response, "Signup failed. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            showAlert(response, "Server error. Try again later.");
        }
    }

    private void showAlert(HttpServletResponse response, String message) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<script>alert('" + message + "'); window.location.href='login.jsp';</script>");
    }
}

