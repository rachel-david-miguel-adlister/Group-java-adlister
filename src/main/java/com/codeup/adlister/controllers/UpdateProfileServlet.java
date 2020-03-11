package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "controllers.UpdateProfileServlet", urlPatterns = "/update-profile")
public class UpdateProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie message = new Cookie("message", "welcome to your profile");
//        if (request.getSession().getAttribute("user") == null) {
////            response.addCookie(message);
//            response.sendRedirect("/login");
//            return;
//        }
        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("user",user);
//        request.setAttribute("ads", getAdsDao().userAds((sessionUser.getId())));
        request.getRequestDispatcher("/WEB-INF/update-profile.jsp").forward(request, response);
    }
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        User user = (User) request.getSession().getAttribute("user");
        String password = request.getParameter("password");
        String newPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        User updateUser = new User (
                user.getId(),
                request.getParameter("username"),
                request.getParameter("email"),
                newPassword
        );
        DaoFactory.getUsersDao().updateUserInfo(updateUser);
        user.setUsername(updateUser.getUsername());
        request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
    }
}
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
//        User sessionUser = (User) request.getSession().getAttribute("user");
//        String oldUsername = request.getParameter("oldUsername");
//        String oldEmail = request.getParameter("oldEmail");
//        String username = request.getParameter("username");
//        String email = request.getParameter("email");
//        String oldPassword = request.getParameter("oldPassword");
//        String newPassword = request.getParameter("newPassword");
//        String newConfirm = request.getParameter("newConfirm");
//
////        editing validation
//        boolean usernameError = username.isEmpty();
//        boolean emailError = email.isEmpty();
//        boolean oldPasswordError = oldPassword.isEmpty();
//        boolean newPasswordError = newPassword.isEmpty();
//        boolean newConfirmError = (!newPassword.equals(newConfirm));
//
////        redirects and error messages
//        if (usernameError) {
//            request.getSession().setAttribute("error", "username error, try again");
//            response.sendRedirect("/update-profile");
//            return;
//        }
//        if (emailError) {
//            request.getSession().setAttribute("error", "email error, try again");
//            response.sendRedirect("/update-profile");
//            return;
//        }
//        if (oldPasswordError) {
//            request.getSession().setAttribute("error", "current password error, try again");
//            response.sendRedirect("/update-profile");
//            return;
//        }
//        if (newPasswordError) {
//            request.getSession().setAttribute("error","new password error, try again");
//            response.sendRedirect("/update-profile");
//            return;
//        }
//        if (newConfirmError) {
//            request.getSession().setAttribute("error","password doesn't match, try again");
//            response.sendRedirect("/update-profile");
//            return;
//        }
//
//        User user = new User(sessionUser.getId(),username,email, BCrypt.hashpw(newPassword, BCrypt.gensalt()));
//        request.getSession().setAttribute("user",user);
//        DaoFactory.getUsersDao().updateUserInfo(user);
//        response.sendRedirect("/profile");
//    }
//
//}