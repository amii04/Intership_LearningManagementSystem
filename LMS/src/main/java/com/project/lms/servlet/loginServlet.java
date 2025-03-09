////package com.project.lms.servlet;
////
////import java.io.IOException;
////import java.io.PrintWriter;
////import java.sql.Connection;
////import java.sql.PreparedStatement;
////import java.sql.ResultSet;
////
////import javax.servlet.ServletException;
////import javax.servlet.annotation.WebServlet;
////import javax.servlet.http.HttpServlet;
////import javax.servlet.http.HttpServletRequest;
////import javax.servlet.http.HttpServletResponse;
////
////import com.project.lms.util.DBConnect;
////
////@WebServlet("/login")
////public class loginServlet extends HttpServlet {
////    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        String email = request.getParameter("email");
////        String password = request.getParameter("password");
////
////        try (Connection conn = DBConnect.getInstance().getConnection();
////             PreparedStatement stmt = conn.prepareStatement("SELECT password, role FROM Users WHERE email = ?")) {
////            
////            stmt.setString(1, email);
////            ResultSet rs = stmt.executeQuery();
////
////            if (rs.next()) {
////                String storedPassword = rs.getString("password");
////                String role = rs.getString("role");
////
////                if (password.equals(storedPassword)) {
////                    if ("STUDENT".equalsIgnoreCase(role)) {
////                        response.sendRedirect("studashboard.html");
////                    } else if ("INSTRUCTOR".equalsIgnoreCase(role)) {
////                        response.sendRedirect("instructordashboard.html");
////                    } else {
////                        response.sendRedirect("login.html?error=InvalidRole");
////                    }
////                } else {
////                    showAlert(request, response, "Invalid credentials. Please try again.");
////                }
////            } else {
////                showAlert(request, response, "User does not exist. Please register.");
////            }
////        } catch (Exception e) {
////            e.printStackTrace();
////            showAlert(request, response, "Server error. Please try again later.");
////        }
////    }
////
////    private void showAlert(HttpServletRequest request, HttpServletResponse response, String message) throws IOException {
////        response.setContentType("text/html");
////        PrintWriter out = response.getWriter();
////        
////        String loginPage = request.getContextPath() + "/login.html"; // Correct path
////
////        out.println("<script type='text/javascript'>");
////        out.println("alert('" + message + "');");
////        out.println("window.location.href='" + loginPage + "';");  // Redirect to correct path
////        out.println("</script>");
////        
////        out.flush();
////        out.close();
////    }
////
////}
//package com.project.lms.servlet;
//
//import com.project.lms.util.DBConnect;
//import org.mindrot.jbcrypt.BCrypt;
//
//import java.io.IOException;
//import java.io.PrintWriter;
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
//                // ✅ Compare input password with stored hash using BCrypt
//                if (BCrypt.checkpw(password, storedHash)) {
//                    if ("STUDENT".equalsIgnoreCase(role)) {
//                        response.sendRedirect("studashboard.jsp");
//                    } else if ("INSTRUCTOR".equalsIgnoreCase(role)) {
//                        response.sendRedirect("instructordashboard.jsp");
//                    } else {
//                        showAlert(response, "Invalid role.");
//                    }
//                } else {
//                    showAlert(response, "Invalid credentials. Please try again.");
//                }
//            } else {
//                showAlert(response, "User does not exist. Please register.");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            showAlert(response, "Server error. Please try again later.");
//        }
//    }
//
//    private void showAlert(HttpServletResponse response, String message) throws IOException {
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        
//        out.println("<script type='text/javascript'>");
//        out.println("alert('" + message + "');");
//        out.println("window.location.href='login.html';"); // ✅ Redirects to login page without 404 error
//        out.println("</script>");
//        
//        out.flush();
//        out.close();
//    }
//}

package com.project.lms.servlet;

import com.project.lms.util.DBConnect;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBConnect.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT password, role FROM Users WHERE email = ?")) {
            
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedHash = rs.getString("password");
                String role = rs.getString("role");

                if (BCrypt.checkpw(password, storedHash)) {
                    if ("STUDENT".equalsIgnoreCase(role)) {
                        response.sendRedirect("studashboard.jsp");
                    } else if ("INSTRUCTOR".equalsIgnoreCase(role)) {
                        response.sendRedirect("insdashboard.jsp");
                    } else {
                        request.setAttribute("errorMessage", "Invalid role.");
                        request.setAttribute("email", email); // Preserve email
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("errorMessage", "Invalid credentials. Please try again.");
                    request.setAttribute("email", email); // Preserve email
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "User does not exist. Please register.");
                request.setAttribute("email", email); // Preserve email
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Server error. Please try again later.");
            request.setAttribute("email", email); // Preserve email
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
