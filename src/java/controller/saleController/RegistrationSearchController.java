/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.saleController;

import dal.CourseDBContext;
import dal.RegistrationDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.Course;
import model.Registration;
import model.User;

/**
 *
 * @author long
 */
public class RegistrationSearchController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String subject;
        String email;
        Date from;
        Date to;
        Boolean status;
        String stringStatus;
        if (request.getParameter("subject") == null || request.getParameter("subject").isEmpty()) {
            subject = "";
            log("subject = none");
        } else {
            subject = request.getParameter("subject").trim();
            log(subject);
        }

        if (request.getParameter("email") == null || request.getParameter("email").isEmpty()) {
            email = "";
            log("email = none");
        } else {
            email = request.getParameter("email").trim();
            log(email);
        }

        if (request.getParameter("from") == null || request.getParameter("from").isEmpty()) {
            String fromDate = "0001-01-01";
            from = Date.valueOf(fromDate);
            log(from.toString());
        } else {
            from = Date.valueOf(request.getParameter("from"));
            log(from.toString());
        }

        if (request.getParameter("to") == null || request.getParameter("from").isEmpty()) {
            String toDate = "9999-12-31";
            to = Date.valueOf(toDate);
            log(to.toString());
        } else {
            to = Date.valueOf(request.getParameter("to"));
            log(to.toString());
        }

        if (request.getParameter("status") == null || request.getParameter("status").isEmpty()) {
            status = null;
            stringStatus = "";
            log("status = null");
        } else {
            if (request.getParameter("status").equalsIgnoreCase("paid")) {
                status = true;
                stringStatus = "paid";
                log("" + status.toString());
            } else {
                status = false;
                stringStatus = "unpaid";
                log("" + status.toString());
            }
        }
        int pageIndex;
        if (request.getParameter("page") == null) {
            pageIndex = 1;
        } else {
            pageIndex = Integer.parseInt(request.getParameter("page"));
        }
        String sortBy;
        if (request.getParameter("sortBy") == null) {
            sortBy = "registrationID";
        } else {
            sortBy = request.getParameter("sortBy");
        }
        String orderBy;
        if (request.getParameter("orderBy") == null) {
            orderBy = "asc";
        } else {
            orderBy = request.getParameter("orderBy");
        }
        RegistrationDBContext rdbc = new RegistrationDBContext();
        ArrayList<Registration> list = rdbc.searchRegistration(subject, email, from, to, status, pageIndex, 10, sortBy, orderBy);
        int totalPage = rdbc.searchCount(subject, email, from, to, status) / 10;
        log( "count = " + rdbc.searchCount(subject, email, from, to, status));
        if (rdbc.searchCount(subject, email, from, to, status) % 10 != 0) {
            totalPage += 1;
        }
        CourseDBContext cdbc = new CourseDBContext();
        ArrayList<Course> courses = cdbc.getCoursesForHomePage(null);
        UserDBContext udbc = new UserDBContext();
        ArrayList<User> users = udbc.getUsers();
        log(sortBy + ", " + orderBy);
        log("" + list.size());
        request.setAttribute("sortBy", sortBy);
        request.setAttribute("orderBy", orderBy);
        request.setAttribute("courses", courses);
        request.setAttribute("users", users);
        request.setAttribute("list", list);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("target", "search");
        request.setAttribute("subject", subject);
        request.setAttribute("email", email);
        request.setAttribute("status", status);
        request.setAttribute("stringStatus", stringStatus);
        request.setAttribute("fromDate", from);
        request.setAttribute("toDate", to);
        request.getRequestDispatcher("../view/sale/registration_list.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
