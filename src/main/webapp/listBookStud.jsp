<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="book.model.Book" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>List of Books </title>
  <link rel="stylesheet" href="css/viewBook2.css" />
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
  /*for admin view*/
  .bookcontent button {
    margin-right: 5px;
    color: #fff;
    padding: 8px 15px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    font-weight: bold;
    text-transform: uppercase;
    width: 27%;
  }

  .bookcontent button.cart{
    background-color: green;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    border: 1px solid black; /* Add border style */
  }

  th, td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid black; /* Change border color to black */
    border-right: 1px solid black; /* Add right border */
  }

  th:last-child,
  td:last-child {
    border-right: none; /* Remove right border for last column */
  }

  th {
    background-color: #f2f2f2;
  }

  tr:hover {
    background-color: #f5f5f5;
  }

  .btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    border: 1px solid transparent;
    border-radius: 4px;
    color: #fff;
    background-color: orange;
    border-color: #2e6da4;
  }

  .btn-danger {
    background-color: #d9534f;
    border-color: #d43f3a;
  }

  .btn-primary:hover,
  .btn-danger:hover {
    color: #fff;
    background-color: #286090;
    border-color: #204d74;
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
        <a href="Student.jsp" class="active">Dashboard</a>
        <a href="UpdateStudentController?action=studentdetail&studentID=<c:out value="${sessionScope.sessionStudentID}"/>">My Account</a>
        <a href="listOrderStud.jsp">View Order</a>
        <a href="BookController?action=listStud" class="highlight-button">View Book</a>
        <a href="studentCart.jsp">Cart</a>


      </div>
    </nav>

    <div class="main-body">
      <h2>List of Books</h2>
      <div class="container2">
		   
		    	<table style="width:100%;text-align:left;">
		    		<tr>
		    			<th>Book ID</th>
		    			<th>Title</th>
		    			<th>Genre</th>
		    			<th>Price</th>
		    			<th>Condition</th>
		    			<th>Action</th>
		    		</tr>
		    		<c:forEach items="${books}" var="b" varStatus="book">
		    			<tr>
        					<td><c:out value="${b.bookID}"/></td>
		    				<td><c:out value="${b.title}"/></td>
		    				<td><c:out value="${b.genre}"/></td>
		    				<td><c:out value="${b.price}"/></td>
		    				<td><c:out value="${b.condition}"/></td>
		    				<td><a class="btn btn-primary" href="AddtoCartController?bookID=<c:out value="${b.bookID}"/>">Add to Cart</a></td>
		    		</c:forEach>
		    	</table>
		 </div>       
    </div>
  </div>
</body>
</html>