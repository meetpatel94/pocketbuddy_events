<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form id="updateProfileForm" action="update" method="post" enctype="multipart/form-data">
         <div class="profile-pic-container">
           <%--  <img id="profilePicPreview" src="${user.profilePicPath}" class="profile-pic-preview" alt="Profile Picture"> --%>
            <div class="profile-pic-upload">
              
              <input type="file" id="profilePicUpload" name="profilePic" >
              <span class="profile-pic-remove" onclick="removeProfilePic()">
                <i class="fas fa-times"></i> Remove
              </span>
            </div>
          </div>
        
          <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" value="${user.firstName}" required>
          </div>
          
          <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" class="form-control" id="lastName" name="lastName" value="${user.lastName}" required>
          </div>
          
          <div class="form-group">
            <label for="gender">Gender</label>
            <select class="form-control" id="gender" name="gender" required>
              <option value="">Select Gender</option>
              <option value="male" ${user.gender == 'male' ? 'selected' : ''}>Male</option>
              <option value="female" ${user.gender == 'female' ? 'selected' : ''}>Female</option>
              <option value="other" ${user.gender == 'other' ? 'selected' : ''}>Other</option>
            </select>
          </div>
          
          <div class="form-group">
            <label for="dob">Date of Birth</label>
            <input type="date" class="form-control" id="dob" name="bornYear" value="${user.bornYear}" required>
          </div>
          
          <input type="hidden" class="form-control" id="dob" name="userId" value="${user.userId}" required>
          <input type="hidden" class="form-control" id="dob" name="password" value="${user.password}" required>
          <input type="hidden" class="form-control" id="dob" name="email" value="${user.email}" required>
          <input type="hidden" class="form-control" id="dob" name="city" value="${user.city}" required>
          <input type="hidden" class="form-control" id="dob" name="role" value="${user.role}" required>
          
          <div class="form-group">
            <label for="contactNo">Contact Number</label>
            <input type="tel" class="form-control" id="contactNo" name="contactNum" value="${user.contactNum}" required>
          </div>
          <button type="submit" class="btn-primary">Update Profile</button>
        </form>
</body>
</html>