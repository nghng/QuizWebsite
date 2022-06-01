<<<<<<< HEAD
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subject Name</title>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Bootstrap's CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/global.css">
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/subject/popup.css">
    <link rel="stylesheet" href="../../css/popup.css">
    <link rel="stylesheet" href="../../css/footer.css">
    <link rel="stylesheet" href="../../css/subject/detail.css">

</head>

<body>
    <header>
        <div class="heading_logo">
            <p>LOGO</p>
        </div>
        <nav>
            <ul class="nav_links">
                <li><a href="../../index.html">Home</a></li>
                <li><a href="subjectlist.html">Subject</a></li>
                <li><a href="../blog/list.html">Blog</a></li>
                <li><a href="#" class="login" id="loginButton">Log in</a></li>
            </ul>
        </nav>
    </header>
    <div class="heading">
    </div>


    <div class="main">

        <!-- LEFT  -->
        <section class="subject__list">

            <div class="subject__item">
                <div class="subject__thumbnail"></div>
                <div class="subject__content">
                    <label>Subject Title</label>
                    <div class="subject__info">
                        <p><i class="fa fa-align-justify"></i> Category: Some Category</p>
                        <p><i class="fa fa-user" aria-hidden="true"></i>Expert: Any Expert Name</p>

                    </div>
                    <div class="subject__review">
                        <p>&emsp;&emsp;&emsp;&emsp;Lorem ipsum dolor sit amet, consectetur adipiscing
                            elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Justo donec enim diam vulputate ut
                            pharetra
                            sit amet. Erat imperdiet sed euismod nisi porta lorem mollis aliquam. Tempus egestas sed sed
                            risus pretium quam vulputate dignissim. Urna duis convallis convallis tellus id interdum.
                            Adipiscing elit ut aliquam purus sit amet. At auctor urna nunc id. Cursus turpis massa
                            tincidunt
                            dui ut ornare. Vulputate ut pharetra sit amet aliquam. Dictum fusce ut placerat orci nulla.
                            Erat
                            nam at lectus urna duis. Ultricies integer quis auctor elit sed vulputate mi sit amet.
                            Tortor at
                            risus viverra adipiscing at in. Quis vel eros donec ac. At elementum eu facilisis sed odio
                            morbi
                            quis. Sit amet consectetur adipiscing elit duis tristique sollicitudin nibh.</p>
                        <p>&emsp;&emsp;&emsp;Facilisis leo vel fringilla est ullamcorper. Feugiat scelerisque varius
                            morbi
                            enim nunc. Id velit
                            ut tortor pretium viverra suspendisse potenti nullam ac. Sit amet porttitor eget dolor. Ut
                            morbi
                            tincidunt augue interdum velit euismod in. Amet consectetur adipiscing elit ut aliquam
                            purus. Eu
                            feugiat pretium nibh ipsum consequat. Consequat mauris nunc congue nisi vitae. Tellus in
                            metus
                            vulputate eu scelerisque felis. Justo nec ultrices dui sapien eget mi proin sed libero.
                            Commodo
                            sed egestas egestas fringilla phasellus. Turpis in eu mi bibendum neque egestas congue
                            quisque
                            egestas. Duis ut diam quam nulla.</p>
                    </div>
                    <div class="backlink__container">
                        <div class="subject__detail">
                            <div>Start to learn now!</div><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                        </div>
                        <div class="subject__register">
                            <button onclick="openPopup()">Register</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- RIGHT -->
        <section class="option__box">
            <div class="option__filter">
                <div class="option__searchbar">
                    <form action="#">
                        <input type="text" placeholder="Type something to search...">
                        <!-- <button type="submit">Search</button> -->
                    </form>
                </div>
                <div class="option__checkbox">
                    <h5>Category</h5>
                    <div class="option__options-value">
                        <div class="option__options-value_item">
                            <input type="checkbox" name="" id=""> <span>Category 1</span>
                        </div>
                        <div class="option__options-value_item">
                            <input type="checkbox" name="" id=""> <span>Category 2</span>
                        </div>
                        <div class="option__options-value_item">
                            <input type="checkbox" name="" id=""> <span>Category 3</span>
                        </div>
                        <div class="option__options-value_item">
                            <input type="checkbox" name="" id=""> <span>Category 4</span>
                        </div>
                        <div class="option__options-value_item">
                            <input type="checkbox" name="" id=""> <span>Category 5</span>
                        </div>
                    </div>
                </div>
                <div class="option__sort">
                    <select name="" id="">
                        <option value="All">All</option>
                        <option value="">SortItem1</option>
                        <option value="">SortItem2</option>
                    </select>
                </div>
                <div class="search__button">
                    <button type="submit">Search</button>
                </div>
                <div class="contact__link">
                    <a href="#">Contact Information</a>
                </div>
            </div>
        </section>
    </div>

    <!-- POPUP REGISTER -->
    <div class="register__popup" id="register__popup">
        <div class="register__form">
            <div class="exit__button">
                <button onclick="closePopup()">
                    <i class=" fa fa-times-circle" aria-hidden="true"></i>
                </button>
            </div>
            <div class="subject__name">Subject Name</div>

            <div class="subject__category">
                <p><i class="fa fa-align-justify"></i> Category: Some Category</p>
            </div>

            <div class="subject__info">
                <p>&emsp;&emsp;Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque maxime adipisci quibusdam
                    nulla
                    praesentium consequatur, nisi nostrum fuga cumque, dicta, dolor dolores aliquam rerum labore
                    placeat soluta neque veritatis accusamus.</p>
            </div>

            <div class="subject__price">Price package:
                <select>
                    <option value="">Price option 1</option>
                    <option value="">Price option 2</option>
                    <option value="">Price option 3</option>
                </select>
            </div>

            <h5>Please fill in your information below</h5>

            <div class="user__information__form">
                <input type="text" name="" required="required" placeholder="Full name"><br>
                <input type="text" name="" required="required" placeholder="Email"><br>
                <input type="text" name="" required="required" placeholder="Mobile phone"><br>
                <div class="user__information__gender">
                    <label for="">Gender: </label>
                    <input type="radio" name="gender" value="male">
                    <label for="">Male</label>
                    <input type="radio" name="gender" value="female">
                    <label for="">Female</label>
                </div>
            </div>

            <div class="register__confirm" onclick="openComplete()">
                <button>Register</button>
            </div>
        </div>
        <div class="register__complete" id="register__complete">
            <img src="../../images/Green-Tick-Vector-PNG-Images.png" alt="">
            <h4>Thank you for your registration</h4>
            <button onclick="closeAllForm()">Close</button>
        </div>
    </div>

    <!-- POPUP LOGIN -->
    <section class="popup">
        <div class="popup__content">
            <img src="../../images/close.png" alt="" class="close">

            <div class="popup__login-form">
                <h2>Welcome to Quiz Practice</h2>
                <div class="form__login">
                    <form action="#">
                        <input type="text" name="email" id="emailLogin" placeholder="Enter your email">
                        <input type="text" name="password" id="password" placeholder="Enter your password">
                        <div class="popup__reset">
                            <a href="#">Forgot password?</a>
                        </div>
                        <div class="form__button">
                            <button type="submit">Login</button>
                        </div>
                    </form>
                </div>
                <div class="popup__signup">
                    <a href="#">Don't have any account? Sign up here</a>
                </div>
            </div>

            <div class="popup__signup-form" style="display: none;">
                <i class="fa fa-arrow-left"></i>
                <h2>Register for Quiz Practice</h2>
                <div class="form_signup">
                    <form action="#">
                        <input type="text" name="firstName" id="firstName" placeholder="First Name">
                        <input type="text" name="lastName" id="lastName" placeholder="Last Name">
                        <input type="text" name="email" id="emailSignup" placeholder="Email">
                        <input type="text" name="phone" id="phone" placeholder="Phone Number">
                        <input type="password" name="password" id="password" placeholder="Password">
                        <input type="password" name="confirmPassword" id="confirmPassword"
                            placeholder="Confirm password">
                        <div class="form__button">
                            <button type="submit">Register</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="popup__reset-form" style="display: none;">
                <i class="fa fa-arrow-left"></i>
                <h2>Reset Password</h2>
                <div class="form__reset">
                    <form action="#">
                        <input type="text" name="email" id="emailReset"
                            placeholder="Enter your email to reset your password">
                        <div class="form__button">
                            <button type="submit">Verify your email</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <p>COPYRIGHT</p>
    </footer>


    <script src="../../js/registerPopup.js"></script>
    <script src="../../js/script.js"></script>

</body>

</html>
=======

<%-- 
    Document   : coursedetails
    Created on : May 30, 2022, 9:39:27 AM
    Author     : long
--%>

<%@page import="model.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Subject Name</title>
        <!-- FontAwesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Bootstrap's CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link rel="stylesheet" href="css/global.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/subject/popup.css">
        <link rel="stylesheet" href="css/popup.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/subject/detail.css">

    </head>

    <body>
        <header>
            <div class="heading_logo">
                <p>LOGO</p>
            </div>
            <nav>
                <ul class="nav_links">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="view/subject/subjectlist.jsp">Subject</a></li>
                    <li><a href="view/blog/list.jsp">Blog</a></li>
                    <li><a href="#" class="login" id="loginButton">Log in</a></li>
                </ul>
            </nav>
        </header>
        <div class="heading">
        </div>


        <div class="main">

            <!-- LEFT  -->
            <section class="subject__list">

                <div class="subject__item">
                    <div class="subject__thumbnail">
                        <img src="images/thumbnails/${requestScope.course.thumbnailUrl}" alt=""/>
                    </div>
                    <div class="subject__content">
                        <label>${requestScope.course.courseName}</label>
                        <div class="subject__info">
                            <p><i class="fa fa-align-justify"></i> Category: ${requestScope.course.subcategory.subcategoryname}</p>
                        </div>
                        <div class="subject__review">
                            <p>&emsp;&emsp;${requestScope.course.briefInfo}</p>
                        </div>
                        <div class="subject__description">
                            <p>&emsp;&emsp;${requestScope.course.description}</p>
                        </div>
                        <div class="backlink__container">
                            <div class="subject__detail">
                                <div>
                                    <p>${requestScope.course.tagline}</p>
                                </div>
                                <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                            </div>
                            <div class="subject__register">
                                <button onclick="openPopup()">Register Now</button>

                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- RIGHT -->
            <section class="option__box">
                <div class="option__filter">
                    <div class="option__searchbar">
                        <form action="#">
                            <input type="text" placeholder="Type something to search...">
                            <!-- <button type="submit">Search</button> -->
                        </form>
                    </div>
                    <div class="option__checkbox">
                        <h5>Category</h5>
                        <div class="option__options-value">
                            <div class="option__options-value_item">
                                <input type="checkbox" name="" id=""> <span>Category 1</span>
                            </div>
                            <div class="option__options-value_item">
                                <input type="checkbox" name="" id=""> <span>Category 2</span>
                            </div>
                            <div class="option__options-value_item">
                                <input type="checkbox" name="" id=""> <span>Category 3</span>
                            </div>
                            <div class="option__options-value_item">
                                <input type="checkbox" name="" id=""> <span>Category 4</span>
                            </div>
                            <div class="option__options-value_item">
                                <input type="checkbox" name="" id=""> <span>Category 5</span>
                            </div>
                        </div>
                    </div>
                    <div class="option__sort">
                        <select name="" id="">
                            <option value="All">All</option>
                            <option value="">SortItem1</option>
                            <option value="">SortItem2</option>
                        </select>
                    </div>
                    <div class="search__button">
                        <button type="submit">Search</button>
                    </div>
                    <div class="contact__link">
                        <a href="#">Contact Information</a>
                    </div>
                </div>
            </section>
        </div>

        <!-- POPUP REGISTER -->
        <div class="register__popup" id="register__popup">
            <div class="register__form">
                <div class="exit__button">
                    <button onclick="closePopup()">
                        <i class=" fa fa-times-circle" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="subject__name">${requestScope.course.courseName}</div>

                <div class="subject__category">
                    <p><i class="fa fa-align-justify"></i> Category: ${requestScope.course.subcategory.subcategoryname}</p>
                </div>
                <div class="subject__price">
                    <i class="fa-solid fa-money-bill"></i>

                    <select>
                        <option value="">Price option 1</option>
                        <option value="">Price option 2</option>
                        <option value="">Price option 3</option>
                    </select>
                </div>

                <h5>Please fill in your information below:</h5>

                <div class="user__information__form">
                    <input type="text" name="" required="required" placeholder="Full name"><br>
                    <input type="text" name="" required="required" placeholder="Email"><br>
                    <input type="text" name="" required="required" placeholder="Mobile phone"><br>
                    <div class="user__information__gender">
                        <label for="">Gender: </label>
                        <input type="radio" name="gender" value="male">
                        <label for="">Male</label>
                        <input type="radio" name="gender" value="female">
                        <label for="">Female</label>
                    </div>
                </div>

                <div class="register__confirm" onclick="openComplete()">
                    <button>Register</button>
                </div>
            </div>
            <div class="register__complete" id="register__complete">
                <img src="../../images/Green-Tick-Vector-PNG-Images.png" alt="">
                <h4>Thank you for your registration</h4>
                <button onclick="closeAllForm()">Close</button>
            </div>
        </div>

        <!-- POPUP LOGIN -->
        <section class="popup">
            <div class="popup__content">
                <img src="../../images/close.png" alt="" class="close">

                <div class="popup__login-form">
                    <h2>Welcome to Quiz Practice</h2>
                    <div class="form__login">
                        <form action="login" method="POST">
                            <input type="text" name="email" id="emailLogin" placeholder="Enter your email" required>
                            <input type="password" name="password" id="password" placeholder="Enter your password" required>
                            <div class="popup__reset">
                                <a href="#">Forgot password?</a>
                            </div>
                            <div class="form__button">
                                <button type="submit">Login</button>
                            </div>
                        </form>
                    </div>

                    <div class="popup__signup">
                        <a href="#">Don't have any account? Sign up here</a>
                    </div>
                </div>

                <div class="popup__signup-form" style="display: none;">
                    <i class="fa fa-arrow-left"></i>
                    <h2>Register for Quiz Practice</h2>
                    <div class="form_signup">
                        <form action="#">
                            <input type="text" name="firstName" id="firstName" placeholder="First Name">
                            <input type="text" name="lastName" id="lastName" placeholder="Last Name">
                            <input type="text" name="email" id="emailSignup" placeholder="Email">
                            <input type="text" name="phone" id="phone" placeholder="Phone Number">
                            <input type="password" name="password" id="password" placeholder="Password">
                            <input type="password" name="confirmPassword" id="confirmPassword"
                                   placeholder="Confirm password">
                            <div class="form__button">
                                <button type="submit">Register</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="popup__reset-form" style="display: none;">
                    <i class="fa fa-arrow-left"></i>
                    <h2>Reset Password</h2>
                    <div class="form__reset">
                        <form action="#">
                            <input type="text" name="email" id="emailReset"
                                   placeholder="Enter your email to reset your password">
                            <div class="form__button">
                                <button type="submit">Verify your email</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <footer>
            <p>COPYRIGHT</p>
        </footer>


        <script src="js/registerPopup.js"></script>
        <script src="js/script.js"></script>

    </body>

</html>
>>>>>>> 2a30032236c1920219f8903220e62f23029e3170
