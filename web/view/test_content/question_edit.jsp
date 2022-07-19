<%-- 
    Document   : question_edit
    Created on : Jun 30, 2022, 11:42:20 PM
    Author     : Hai Tran
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Question</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/css/global.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/global.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/test_content/question_view.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="${pageContext.request.contextPath}../../view/header_for_staff.jsp"/>

     
        <div class="content">
            <c:if test="${requestScope.message != null}">
                <div class="error_message">${requestScope.message}</div>
            </c:if>
            <form id="question__form" method="POST" action="editquestion" enctype="multipart/form-data">
                <input type="hidden" value="${requestScope.question.questionID}" name="questionID">
                <input type="hidden" value="${requestScope.question.mediaURL}" name="mediaURl">
                <div class="upperpart row">
                    <div class="upperpart__left col-md-6" >
                        <div class="form-group">
                            <label>Question content: </label>
                            <textarea required rows="3"  class="form-control" name="questioncontent">${requestScope.question.questionContent}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="">Topic: </label>
                            <select class="form-control" name="topicID">
                                <c:forEach items="${requestScope.topics}" var="t">
                                    <c:choose >
                                        <c:when test="${requestScope.question.lesson.topicID == t.topicID}">
                                            <option selected value="${t.topicID}">${t.topicName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option  value="${t.topicID}">${t.topicName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Lesson: </label>
                            <select class="form-control" name="lessonID">
                                <option value="1">Topic 1</option>
                                <option value="2">Topic 2</option>
                                <option value="3">Topic 3</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Dimension: </label>
                            <select class="form-control" id="select_dimension" name="dimensionID">
                                <c:forEach items="${requestScope.dimensions}" var="d">
                                    <c:choose >
                                        <c:when test="${requestScope.question.dimension.dimensionID == d.dimensionID}">
                                            <option selected value="${d.dimensionID}">${d.dimensionName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option  value="${d.dimensionID}">${d.dimensionName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Level: </label>
                            <select class="form-control" id="select_level" name="levelID">
                                <c:forEach items="${requestScope.levels}" var="l">
                                    <c:choose >
                                        <c:when test="${requestScope.question.level.levelID == l.levelID}">
                                            <option selected value="${l.levelID}">${l.levelName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option  value="${l.levelID}">${l.levelName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="row col-md-10 answer__detail">
                            <div class="col-lg-12 form-control">
                                <c:forEach items="${requestScope.question.answers}" var="a" end="0">
                                    <div id="answer__details__1" class="row">
                                        <table>
                                            <tr>
                                                <td class="col-2">
                                                    <span class="question__answer">Answer: </span>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="answer" value="${a.answerContent}">
                                                </td>
                                                <td class="col-2">
                                                    <span class="istrue">Is True:</span>
                                                </td>
                                                <td class="col">
                                                    <c:choose>
                                                        <c:when test="${a.isTrue}">
                                                            <input checked type="checkbox" name="istrue" value="1_istrue">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="checkbox" name="istrue" value="1_istrue">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="col-2">
                                                    <button style="display: none;" name="remove_item" class='remove' id="remove_item">
                                                        <i class="fa-solid fa-trash-can"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </c:forEach>
                                <c:forEach items="${requestScope.question.answers}" var="a" begin="1" end="1">
                                    <div id="answer__details__2" class="row">
                                        <table>
                                            <tr>
                                                <td class="col-2">
                                                    <span class="question__answer">Answer: </span>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="answer" value="${a.answerContent}">
                                                </td>
                                                <td class="col-2">
                                                    <span class="istrue">Is True:</span>
                                                </td>
                                                <td class="col">
                                                    <c:choose>
                                                        <c:when test="${a.isTrue}">
                                                            <input checked type="checkbox" name="istrue" value="2_istrue">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="checkbox" name="istrue" value="2_istrue">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="col-2">
                                                    <button style="display: none;" name="remove_item" class='remove remove__answer' id="remove_item">
                                                        <i class="fa-solid fa-trash"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </c:forEach>
                                <% int i = 2;%>
                                <c:forEach items="${requestScope.question.answers}" var="a" begin="2">
                                    <% i++;%>
                                    <div id="answer__details__<%=i%>" class="row">
                                        <table>
                                            <tr>
                                                <td class="col-2">
                                                    <span class="question__answer">Answer: </span>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="answer" value="${a.answerContent}">
                                                </td>
                                                <td class="col-2">
                                                    <span class="istrue">Is True:</span>
                                                </td>
                                                <td class="col">
                                                    <c:choose>
                                                        <c:when test="${a.isTrue}">
                                                            <input checked type="checkbox" name="istrue" value="<%=i%>_istrue">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="checkbox" name="istrue" value="<%=i%>_istrue">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="col-2">
                                                    <button onclick="this.parentElement.parentElement.parentElement.parentElement.remove()" style="display: block;" name="remove_item" class='remove' id="remove_item" data-id="<%=i%>">
                                                        <i class="fa-solid fa-trash-can"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </c:forEach>
                                <div id="new_item_details" class="new_item_details">
                                </div>
                                <div class="form-group">
                                    <label>Answer explanation: </label>
                                    <textarea required rows="3"  class="form-control" name="explanation">${requestScope.question.explanation}</textarea>
                                </div>
                                <a class="addlink" href="javascript:{}">
                                    <button class="add__answer" type="button" href="javascript:void(0)" name="add_item" id="add_item">Add new answer</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="upperpart__right col-md-6">
                        <div class="media__file">
                            <label>Choose media type: </label>
                            <select class="file__select" id="file__select" onchange="InputFile()" name="mediaID">
                                <c:choose>
                                    <c:when test="${requestScope.question.mediaType.mediaID == 1}">
                                        <option selected="selected" value="1">Picture</option>
                                        <option value="3">Audio</option>
                                        <option value="2">Video</option>
                                    </c:when>
                                    <c:when test="${requestScope.question.mediaType.mediaID == 2}"> 
                                        <option value="1">Picture</option>
                                        <option value="3">Audio</option>
                                        <option selected="selected" value="2">Video</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="1">Picture</option>
                                        <option selected="selected" value="3">Audio</option>
                                        <option value="2">Video</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div class="media__preview">
                            <c:choose>
                                <c:when test="${requestScope.question.mediaType.mediaID == 1}">
                                    <img id="image__preview" class="image__preview__data" src="${pageContext.request.contextPath}/media/image/${requestScope.question.mediaURL}">
                                </c:when>
                                <c:when test="${requestScope.question.mediaType.mediaID == 2}"> 
                                    <video id="video__preview" class="video__preview__data" controls src="${pageContext.request.contextPath}/media/video/${requestScope.question.mediaURL}">

                                    </video>
                                </c:when>
                                <c:otherwise>
                                    <audio id="audio__preview" class="audio__preview__data" controls src="${pageContext.request.contextPath}/media/audio/${requestScope.question.mediaURL}">

                                    </audio>
                                </c:otherwise>
                            </c:choose>
                            <i id="upload__icon" class="fa-solid fa-upload"></i>
                            <img id="image__preview" class="image__preview">
                            <audio id="audio__preview" class="audio__preview" controls></audio>
                            <video id="video__preview" class="video__preview" controls></video>
                        </div>
                        <input disabled id="file__input" type="file" name="mediafile" value="${requestScope.question.mediaURL}">
                    </div>
                </div > 
                <a class="addlink" href="javascript:{}"><button class="save__button" type="submit">Save</button></a>
            </form>
        </div>   
        <jsp:include page="${pageContext.request.contextPath}../../view/footer.jsp"/>
        <jsp:include page="${pageContext.request.contextPath}../../view/user_popup.jsp"/>

        <script src="../../js/userPopup.js"></script>
        <script src="${pageContext.request.contextPath}/js/test_content/addquestion.js" type="text/javascript"></script>
    </body>
</html>
