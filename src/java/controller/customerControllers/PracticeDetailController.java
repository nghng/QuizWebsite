/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customerControllers;

import dal.CourseDBContext;
import dal.DimensionDBContext;
import dal.QuizDBContext;
import dal.TopicDBContext;
import dal.UserQuizDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Course;
import model.Dimension;
import model.Quiz;
import model.TakenUserQuiz;
import model.Topic;
import model.UserQuiz;

/**
 *
 * @author long
 */
public class PracticeDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PracticeDetalController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PracticeDetalController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        //String username = a.getUsername();
        String username = "hunglnhe161003@fpt.edu.vn";
        int ID;
        if (request.getParameter("id") != null) {
            ID = Integer.parseInt(request.getParameter("id"));
            log("ID = " + ID);
            UserQuizDBContext tdbc = new UserQuizDBContext();
            TakenUserQuiz q = tdbc.getATakenQuiz(ID);
            log(q.getQuiz().getQuizName());
            request.setAttribute("quiz", q);
        }
        CourseDBContext cdbc = new CourseDBContext();
        ArrayList<Course> courses = cdbc.getUserCourse(username);
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("view/customer/practicedetail.jsp").forward(request, response);
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
        int courseID = Integer.parseInt(request.getParameter("subject"));
        int quizID = Integer.parseInt(request.getParameter("quizID"));
        int numQ = Integer.parseInt(request.getParameter("numQ"));
        Boolean qType = (request.getParameter("qType").equalsIgnoreCase("dimension"));
        int groupID;

        if (request.getParameter("group").equalsIgnoreCase("all")) {
            groupID = 0;
        } else {
            groupID = Integer.parseInt(request.getParameter("group"));
        }
        UserQuizDBContext uqdbc = new UserQuizDBContext();
        QuizDBContext qdbc = new QuizDBContext();
        Quiz q = qdbc.getAQuiz(quizID);
        q.setIsTaken(true);
        Boolean update = qdbc.updateQuiz(q.getQuizID(), q.getNumOfQuestion(), q.getPassRate(), q.getLevel().getLevelID(), q.getDuration(), q.getQuizType().getQuizTypeID(), q.getCourse().getCourseID(), q.getQuizName(), q.getDescription(), true, q.getNote());
        log(update.toString() + "update");
        log("numQ: " + numQ);
        ArrayList<Integer> IDs = uqdbc.getRandomQuestion(numQ);
        log(IDs + ", ");

        UserQuiz uq = new UserQuiz();
        uq.setQuiz(q);
        uq.setQuestionType(qType);
        uq.setNumOfQ(numQ);
        TopicDBContext tdbc = new TopicDBContext();
        DimensionDBContext ddbc = new DimensionDBContext();
        if (qType == false) {
            if (groupID == 0) {
                uq.setTopic(null);
            } else {
                Topic t = tdbc.getTopic(groupID);
                uq.setTopic(t);
            }
        } else {
            if (groupID == 0) {
                uq.setDimension(null);
            } else {
                Dimension d = ddbc.getDimensionByDimensionID(groupID);
                uq.setDimension(d);
            }
        }
        Boolean insertQuiz = uqdbc.InsertUserQuiz(uq);
        log("insert status:" + insertQuiz.toString());
        int lastID = uqdbc.getLatestID();
        Boolean insert = uqdbc.insertQuestion(lastID, IDs);
        log(insert.toString());
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
