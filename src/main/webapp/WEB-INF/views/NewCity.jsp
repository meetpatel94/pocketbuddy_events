<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New City</title>
</head>
<body>
<h1>New City</h1>
<form>
   City Name:<input type="text" name="cityName"><br><br>
   State Name:<select name="stateId">
       <option>Select State</option> 
       
       <c:forEach items="${allstate }" var="s">
           <option value="${s.stateId }">${s.stateName }</option>
       </c:forEach> 
       
   </select><br><br>
    <button type="submit" class="submit-btn">Submit</button>
</form>
</body>
</html>