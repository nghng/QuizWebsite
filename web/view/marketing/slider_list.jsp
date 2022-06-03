<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Slider List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../../css/admin/index.css">
    <link rel="stylesheet" href="../../css/popup.css">
    <link rel="stylesheet" href="../../css/slider/slider list.css">
</head>

<body>
    <header>
        <div class="logo">
            <p>LOGO</p>
        </div>

        <div class="user_bar">
            <div class="user_log">
                <i class="fa fa-user-circle"></i>
                <span class="user_name">Marketing</span>
                <div class="submenu">
                    <ul>
                        <li><a href="#" id="openProfile">User Profile</a></li>
                        <li><a href="#" id="openChangePassword">Change Password</a></li>
                        <li><a href="#">Log out</a></li>
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
                </ul>
            </nav>
        </aside>

        <!-- RIGHT CONTENT -->
        <aside class="right">
            <div class="right_content">
                <form action="#" method="POST">
                    <select name="Satus" id="Status">
                        <option value="#">Status</option>
                    </select>
                    <br>
                    <input type="search" id="searchByTitle" name="searchByTitle" placeholder="search by title">
                    <input type="search" id="searchByBacklink" name="searchByBacklink" placeholder="search by backlink">
                    <input type="submit" value="Search">
                    <a class="link" href="#">Add a slider</a>
                </form>
                <div>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Category</th>
                            <th>Title</th>
                            <th>Backlink</th>
                            <th>Show</th>
                        </tr>
                        <tr>
                            <td>1231</td>
                            <td>Cate1</td>
                            <td>Title1</td>
                            <td>www.asd.com</td>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td class="no_border">
                                <img src="../../images/media-icon.png" alt="Images">
                            </td>
                            <td class="no_border">
                                <a href="#">Slider detail</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1231</td>
                            <td>Cate1</td>
                            <td>Title1</td>
                            <td>www.asd.com</td>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td class="no_border">
                                <img src="../../images/media-icon.png" alt="Images">
                            </td>
                            <td class="no_border">
                                <a href="#">Slider detail</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1231</td>
                            <td>Cate1</td>
                            <td>Title1</td>
                            <td>www.asd.com</td>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td class="no_border">
                                <img src="../../images/media-icon.png" alt="Images">
                            </td>
                            <td class="no_border">
                                <a href="#">Slider detail</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="pagination">
                    <a href="#">&laquo;</a>
                    <a href="#">1</a>
                    <a class="active" href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">&raquo;</a>
                </div>
            </div>
            <footer>
                FOOTER
            </footer>
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

    <script src="../../js/userPopup.js"></script>
</body>

</html>