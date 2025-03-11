<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
    margin-top: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f0f2f5;

</style>
</head>
<body>
    <form action="savestate" method="post">
        State Name: <input type="text" name="stateName">
        <input type="submit" value="submit">
       </form>
</body>
</html>