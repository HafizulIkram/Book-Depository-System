<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%if(session.getAttribute("sessionStudentID")==null)	  
    response.sendRedirect("studLogin.jsp"); %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="book.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>View Order </title>
  <link rel="stylesheet" href="css/viewOrderStyle.css" />
  <!-- Font Awesome Cdn Link -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
  <style>
   body{
	  height: 100vh;
	  justify-content: center;
	  align-items: center;
	  background: linear-gradient(135deg, #71b7e6, #9b59b6);
	  width:100%;
	}
    /*for studentview*/
    
	button {
	  color: #fff;
	  cursor: pointer;
	  display: flex;
	  align-items: center;
	  width:15%;
	}
	
	.button i {
	  margin-right: 5px;
	}
	
	.completed {
    color: green;
  }
  
  .pending{
  	color: red;
  }
  </style>
  <script>
	function confirmLogout() {
	  var result = confirm("Are you sure you want to log out?");
	  return result;
	}
</script>
<script>
function handleButtonClick() {
    var btitle = document.getElementById("btitle").value;
    if (btitle.trim() !== "") {
        location.href = 'BookController?action=searchstudent&btitle=' + encodeURIComponent(btitle);
    } else {
        // Handle empty search query (optional)
        alert("Please enter a search query.");
    }
}
</script>
  
</head>
<body>
  <header class="header">
    <div class="logo">
      <a href="Student.jsp">UiTM Preloved Book Depository System</a>
      <div class="search_box">
        <input type="text" placeholder="Search book by title" id="btitle" >
         <button onclick="handleButtonClick()">
        <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
       </button>
      </div>
    </div>

    <div class="header-icons">
	  <a href="homepage.jsp" title="Log Out" onclick="return confirmLogout()"><i class="fas fa-sign-out-alt"> Log Out</i></a>
	  <div class="account">
	    <p style="font-size: 30px;"><a>&#128100;</a></p>
        <h4>Hello <c:out value='${sessionScope.sessionStudentFName}'/></h4>
      </div>
    </div>
  </header>
  <div class="container">
    <nav>
      <div class="side_navbar">
        <span>Main Menu</span>
        <a href="Student.jsp" class="active ">Dashboard</a>
        <a href="UpdateStudentController?action=studentdetail&studentID=<c:out value="${sessionScope.sessionStudentID}"/>">My Account</a>
        <a href="listOrderStud.jsp" class="highlight-button">View Order</a>
        <a href="BookController?action=listStud">View Book</a>
        <a href="studentCart.jsp">Cart</a>


      </div>
    </nav>
    
    <main class="table">
        <section class="table__header">
            <h1>My Orders</h1>
            <div class="input-group">
                <input type="search" placeholder="Search Data...">

            </div>
        </section>
        <section class="table__body">
            <table>
                <thead>
                    <tr>
                    <th>No</th>
                    <th>Date Order</th>
                    <th>Book Order</th>
                    <th>Status</th>
                    <th>Price</th>
                </thead>
                <tbody>
                    <tr>
                        <td> 1 </td>
                        <td> 17 Dec, 2022 </td>
                        <td> Book 1 <br> Book 2 </td>
						<td class="pending">In-process</td>
                        <td> <strong> RM128.90 </strong></td>
                    </tr>
                  <tr>
                        <td> 2 </td>
                        <td> 23 June, 2023 </td>
                        <td> Book 3 </td>
                        <td class="completed">Completed</td>
                        <td> <strong> RM58.90 </strong></td>
                    </tr>
                    <tr>
                        <td> 3 </td>

                        <td> 2 Feb, 2023 </td>
                        <td> Book 4 </td>
    					<td class="completed">Completed</td>
                        <td> <strong> RM35.90 </strong></td>
                    </tr>
                    <tr>
                        <td> 4 </td>
                        <td> 23 April, 2022 </td>
                        <td> Book 5 </td>
                        <td class="completed">Completed</td>
                        <td> <strong> RM32.00 </strong></td>
                    </tr>
                    

          
                </tbody>
            </table>
        </section>
    </main>
    </div>