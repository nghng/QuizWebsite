/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.testContentController;

import dal.DimensionDBContext;
import dal.LessonDBContext;
import dal.LevelDBContext;
import dal.QuestionDBContext;
import dal.TopicDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import model.Answer;
import model.Dimension;
import model.Level;
import model.Question;
import model.Topic;
import org.apache.taglibs.standard.lang.jstl.LessThanOperator;
import util.UploadFile;
import util.Validation;

/**
 *
 * @author Hai Tran
 */
@MultipartConfig
public class EditQuestionController extends HttpServlet {

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
        TopicDBContext dbTopic = new TopicDBContext();
        DimensionDBContext dbDimension = new DimensionDBContext();
        QuestionDBContext dbQuestion = new QuestionDBContext();
        LevelDBContext dbLevel = new LevelDBContext();
        int questionID = Integer.parseInt(request.getParameter("questionID"));
        Question question = dbQuestion.getQuestion(questionID);
        ArrayList<Topic> topics = dbTopic.getTopics(1);
        ArrayList<Level> levels = dbLevel.getAllLevel();
        ArrayList<Dimension> dimensions = dbDimension.getDimensionsByCourseID(1);
        request.setAttribute("topics", topics);
        request.setAttribute("dimensions", dimensions);
        request.setAttribute("question", question);
        request.setAttribute("levels", levels);
        request.getRequestDispatcher("/view/test_content/question_edit.jsp").forward(request, response);
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
        String rawQuestionID = request.getParameter("questionID");
        String rawQuestionContent = request.getParameter("questioncontent");
        String rawLessonID = request.getParameter("lessonID");
        String rawDimensionID = request.getParameter("dimensionID");
        String rawLevelID = request.getParameter("levelID");
        String rawMediaID = request.getParameter("mediaID");
        String rawExplanation = request.getParameter("explanation");
        String[] rawAnswer = request.getParameterValues("answer");
        String[] rawIstrue = request.getParameterValues("istrue");
        Part mediaURL = request.getPart("mediafile");
        String rawMediaType = null;
        if (mediaURL == null) {
            rawMediaType = "";
        } else {
            rawMediaType = "." + mediaURL.getContentType().substring(6);
        }
        ArrayList<Answer> answers = new ArrayList<>();
        ArrayList<String> rawParameter = new ArrayList<>();
        rawParameter.add(rawQuestionID);
        rawParameter.add(rawQuestionContent);
        rawParameter.add(rawLessonID);
        rawParameter.add(rawDimensionID);
        rawParameter.add(rawLevelID);
        rawParameter.add(rawExplanation);

        Validation validation = new Validation();
        
        if (validation.checkNullOrBlank(rawParameter)) {
            int questionID = Integer.parseInt(rawQuestionID);
            int lessonID = Integer.parseInt(rawLessonID);
            int dimensionID = Integer.parseInt(rawDimensionID);
            int levelID = Integer.parseInt(rawLevelID);
            int mediaID = Integer.parseInt(rawMediaID);
            if (!(rawAnswer.length == 0 || rawIstrue.length == 0)) {
                for (int i = 0; i < rawAnswer.length; i++) {
                    Answer answer = new Answer();
                    for (int j = 0; j < rawIstrue.length; j++) {
                        if (i == Integer.parseInt(rawIstrue[j].substring(0, 1)) - 1) {
                            answer.setAnswerContent(rawAnswer[i]);
                            answer.setIsTrue(true);
                            break;
                        } else {
                            answer.setAnswerContent(rawAnswer[i]);
                            answer.setIsTrue(false);
                        }
                    }
                    answers.add(answer);
                }
                if (mediaURL != null) {
                    if (validation.checkQuestionMedia(mediaURL.getContentType(), mediaID)) {
                        String realPath = null;
                        String realPathWeb = null;
                        switch (mediaID) {
                            case 1:
                                realPath = request.getServletContext().getRealPath("/media/image");
                                realPathWeb = realPath.substring(0, realPath.indexOf("build"));
                                realPathWeb += "web\\media\\image";
                                break;
                            case 2:
                                realPath = request.getServletContext().getRealPath("/media/video");
                                realPathWeb = realPath.substring(0, realPath.indexOf("build"));
                                realPathWeb += "web\\media\\video";
                                break;
                            default:
                                realPath = request.getServletContext().getRealPath("/media/audio");
                                realPathWeb = realPath.substring(0, realPath.indexOf("build"));
                                realPathWeb += "web\\media\\audio";
                                break;
                        }
                        QuestionDBContext dbQuestion = new QuestionDBContext();
                        questionID = dbQuestion.updateQuestion(questionID, rawQuestionContent, mediaURL.getSubmittedFileName(), lessonID, dimensionID, levelID, rawExplanation, mediaID, rawMediaType, 1, answers);
                        String fileName = "question_media_" + questionID + rawMediaType;
                        UploadFile.copyPartToFile(mediaURL, realPath + "/" + fileName);
                        UploadFile.copyPartToFile(mediaURL, realPathWeb + "/" + fileName);
                    }
                } else {

                }
            } else {

            }
        } else {

        }

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
