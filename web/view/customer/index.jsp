<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Homepage</title>

        <!-- FontAwesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/global.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/popup.css">
        <link rel="stylesheet" href="css/customer/header.css">
        <link rel="stylesheet" href="css/common/home.css">
        <link rel="stylesheet" href="css/common/profile.css">
    </head>

    <body>
        <!-- HEADER -->
        <header>
            <div class="heading_logo">
                <p>LOGO</p>
            </div>
            <nav>
                <ul class="nav_links">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="#">Subject</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="registration.html">My Registration</a></li>
                    <li><a href="pratice.html">Practice</a></li>
                    <li>
                        <a href="#" class="login" id="loginButton"><i class="fa fa-user-alt"></i>
                            <c:out value="${sessionScope.account.username}"/>
                        </a>
                        <div class="submenu">
                            <ul>
                                <li><a href="#" id="openProfile">User Profile</a></li>
                                <li><a href="#" id="openChangePassword">Change Password</a></li>
                                <li><a href="logout">Log out</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
        </header>

        <!-- PAGE CONTENT -->
        <section id="main">

        </section>

        <!-- POPUP -->
        <section class="popup" style="display: <c:choose>
                     <c:when test="${requestScope.profile_status != null}">
                         <%="flex; "%>
                     </c:when>
                     <c:otherwise>
                         <%="none;"%>
                     </c:otherwise>
                 </c:choose>">
            <div class="popup__content">
                <img src="images/close.png" alt="" class="close">

                <div class="form_user-profile">
                    <h2>User Profile</h2>
                    <form action="profile" method="POST" enctype="multipart/form-data">
                        <div class="user__avatar">
                            <img src="images/profile/default.jpg" id="photo">
                            <input type="file" name="profilePicture" id="profilePicture" onchange="return fileValidation()" oninvalid="this.setCustomValidity('Please select a picture!')" oninput="this.setCustomValidity('')" required placeholder="Upload your profile picture">
                            <label for="profilePicture" id="uploadBtn">Choose Photo</label>
                        </div>
                        <input type="text" name="email" id="email" value="<c:out value="${sessionScope.user.account.username}"/>" disabled placeholder="Your email">
                        <input type="text" name="firstName" id="firstName" value="<c:out value="${sessionScope.user.firstName}"/>" placeholder="Enter your first name" required>
                        <input type="text" name="lastName" id="lastName" value="<c:out value="${sessionScope.user.lastName}"/>" placeholder="Enter your last name" required>
                        <input type="text" name="phone" id="phone" value="<c:out value="${sessionScope.user.phoneNumber}"/>" pattern="[0-9]{9,10}" title="Please enter a valid phone number (9-10 number with no separator)" placeholder="Enter your phone" required>
                        <div class="profile__gender signup__gender">
                            <h5>Gender</h5>
                            <input type="radio" name="gender" id="" required> <p>Male</p>
                            
                            <input type="radio" name="gender" id="" required> <p>Female</p>
                        </div>
                        <input type="text" name="address" id="address" value="<c:out value="${sessionScope.user.address}"/>" placeholder="Enter your address" required>
                        <div class="form__button">
                            <button type="submit">Save</button>
                        </div>
                    </form>
                    <div class="message__box">
                        <p>${requestScope.profile_status}</p>
                    </div>
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

        <script src="js/profile.js"></script>
        <script src="js/userPopup.js"></script>

    </body>

</html>