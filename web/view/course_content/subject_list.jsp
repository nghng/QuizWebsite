<%-- 
    Document   : subject_list
    Created on : Jun 8, 2022, 1:03:21 PM
    Author     : Zuys
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subject List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/course/subjectlist.css">
</head>

<body>
    <header>
        <div class="logo">
            <p>LOGO</p>
        </div>

        <div class="user_bar">
            <div class="user_log">
                <i class="fa fa-user-circle"></i>
                <span class="user_name">Administrator</span>
                <div class="submenu">
                    <ul>
                        <li><a href="#" id="openProfile">User Profile</a></li>
                        <li><a href="#" id="openChangePassword">Change Password</a></li>
                        <li><a href="logout">Log out</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <section class="main">
        <!-- LEFT NAVIGATION BAR -->
        <aside class="left">
            <nav>
                <ul>
                    <li><a href="#">Dashboard</a></li>
                    <li><a href="#">Posts</a></li>
                    <li><a href="#">Sliders</a></li>
                    <li><a href="system.html">System Settings</a></li>
                    <li><a href="user_list.html">Users</a></li>
                    <li><a href="#">Course</a></li>
                    <li><a href="#">Test</a></li>
                    <li><a href="#">Quiz</a></li>
                </ul>
            </nav>
        </aside>

        <!-- RIGHT CONTENT -->
        <aside class="right">
            <div class="subject__list">
                <h1>Subject List</h1>
                <div class="add__hyperlink">
                    <a href="#">Add new course</a>
                </div>
                <table>
                    <tr>
                        <td>ID</td>
                        <td>Name</td>
                        <td>Category</td>
                        <td>Description</td>
                        <td>Number of lessons</td>
                        <td>Owner</td>
                        <td>Status</td>
                        <td>Action</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Subject 1</td>
                        <td>Category 1</td>
                        <td>brief info</td>
                        <td>10</td>
                        <td>Administrator</td>
                        <td>Published</td>
                        <td>
                            <a href="#">Edit</a>
                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Subject 1</td>
                        <td>Category 1</td>
                        <td>brief info</td>
                        <td>10</td>
                        <td>Administrator</td>
                        <td>Published</td>
                        <td>
                            <a href="#">Edit</a>
                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Subject 1</td>
                        <td>Category 1</td>
                        <td>brief info</td>
                        <td>10</td>
                        <td>Administrator</td>
                        <td>Published</td>
                        <td>
                            <a href="#">Edit</a>
                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Subject 1</td>
                        <td>Category 1</td>
                        <td>brief info</td>
                        <td>10</td>
                        <td>Administrator</td>
                        <td>Published</td>
                        <td>
                            <a href="#">Edit</a>~
                        </td>
                    </tr>
                </table>
                <div class="pagination">
                    <a href="#">First</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <span>...</span>
                    <a href="#">Last</a>
                </div>
            </div>

            <div class="subject__search">

            </div>
        </aside>
    </section>

    <section class="popup">
        <div class="popup__content">
            <img src="../../images/close.png" alt="" class="close">

            <div class="form_user-profile">
                <h2>User Profile</h2>
                <form action="#">
                    <div class="user__avatar">
                        <!-- <input type="file" name="" id=""> -->
                    </div>
                    <input type="text" name="email" id="email" disabled placeholder="Your email">
                    <input type="text" name="firstName" id="firstName" placeholder="Enter your first name">
                    <input type="text" name="lastName" id="lastName" placeholder="Enter your last name">
                    <input type="text" name="phone" id="phone" placeholder="Enter your phone">
                    <div class="profile__gender signup__gender">
                        <h5>Gender</h5>
                        <input type="radio" name="" id="">
                        <p>Male</p>
                        <input type="radio" name="" id="">
                        <p>Female</p>
                    </div>
                    <input type="text" name="address" id="address" placeholder="Enter your address">
                    <div class="form__button">
                        <button type="submit">Save</button>
                    </div>
                </form>
            </div>

            <div class="form__change-password" style="display: none;">
                <h2>Change Password</h2>
                <form action="#">
                    <input type="password" placeholder="Enter your current password">
                    <input type="password" placeholder="Enter new password">
                    <input type="password" placeholder="Reenter your new password">
                    <div class="form__button">
                        <button type="submit">Save</button>
                    </div>
                </form>
            </div>
        </div>

    </section>

    <script src="${pageContext.request.contextPath}/js/userPopup.js"></script>
</body>

</html>
