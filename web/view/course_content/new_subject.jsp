<%-- 
    Document   : new_subject
    Created on : Jun 9, 2022, 10:59:42 AM
    Author     : Zuys
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sale Index</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <link href="${path}/css/course_content/new_subject.css" rel="stylesheet"/>
        <link rel="stylesheet" href="${path}/css/popup.css">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Bootstrap's CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/addquestion.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    </head>

    <body>
        <jsp:include page="${pageContext.request.contextPath}../../view/header_for_staff.jsp"/>

        <section class="main">
            <aside class="right">
                <h1>New subject</h1>
                <div class="upperpart" style="margin: 0 auto;">
                    <form action="newsubject" method="POST" id="frmSearch" autocomplete="off" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-8">
                                <div>
                                    <label for="name">Subject name</label>
                                    <input class="form-control" type="text" id="name" name="name" value="${requestScope.subjectName}" placeholder="Enter..." required>
                                </div>
                                <div>
                                    <label for="owner">Owner email</label>
                                    <input class="form-control" type="text" list="owners" id="owner" name="owner" value="${requestScope.owner}" placeholder="Enter..." required>
                                    <datalist id="owners">
                                        <c:forEach items="${requestScope.expertList}" var="e">
                                            <option value="${e.username}">
                                            </c:forEach>
                                    </datalist>
                                </div>
                                <div>
                                    <label for="category">Choose the category:</label>
                                    <select class="form-control" id="category" name="category" class="category" onchange="submitForm();">
                                        <c:forEach var="c" items="${requestScope.categories}">
                                            <option ${(c.categoryID==requestScope.cid)?"selected=\"selected\"":""}
                                                value="${c.categoryID}">${c.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div>
                                    <label for="subcategory">Choose the subcategory:</label>
                                    <select class="form-control" id="subcategory" name="subcategory">
                                        <c:forEach var="sc" items="${requestScope.subcategories}">
                                            <option value="${sc.subcategoryID}">${sc.subcategoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div>
                                    <label for="featured">Choose whether the subject is featured or not:</label>
                                    <select class="form-control" name="featured" id="featured">
                                        <option ${requestScope.featured == "1"?"selected=\"selected\"":""} value="1">Featured</option>
                                        <option ${requestScope.featured == "0"?"selected=\"selected\"":""} value="0">Unfeatured</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div>
                                    <div>
                                        <img class="thumbnail col-md-12" id="thumbnail" src="images/thumbnails/default.png"><br>
                                        <input type="file" name="profilePicture" id="profilePicture" onchange="return fileValidation()" oninvalid="this.setCustomValidity('Please select a picture!')" oninput="this.setCustomValidity('')">
                                        <label class="col-md-12" for="profilePicture" title="Please update your picture!" id="uploadBtnb">Choose Photo</label>
                                    </div>
                                    <div>
                                        <label for="description">Description</label>
                                        <textarea class="form-control" required name="description" id="description">${requestScope.description}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="text-align: center;">
                            <div style="margin: 0 auto;">
                                <button class="savebtn" type="submit">Save</button>
                            </div>
                            <div style="margin: 0 auto;">
                                <p class="notify">${requestScope.create_subject_status}</p>
                            </div>
                        </div>
                    </form>
                </div>
            </aside>
                            
        </section>

        <jsp:include page="${pageContext.request.contextPath}../../view/user_popup.jsp"/>
        <jsp:include page="${pageContext.request.contextPath}../../view/footer.jsp"/>
        
        <script src="${pageContext.request.contextPath}/js/changepass.js"></script>
        <script src="${pageContext.request.contextPath}/js/new_subject.js"></script>
        <script src="${pageContext.request.contextPath}/js/userPopup.js"></script>
        <script src="${pageContext.request.contextPath}/js/profile.js"></script>
    </body>

</html>
