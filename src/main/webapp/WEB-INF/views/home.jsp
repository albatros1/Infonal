<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaImpl" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaResponse" %>
<%@ page session="false" %>
<html>
<link rel="stylesheet" href="resources/styles/styles.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="resources/scripts/scripts.js"></script> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script> 
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="https://raw.githubusercontent.com/digitalBush/jquery.maskedinput/1.3.1/dist/jquery.maskedinput.js" type="text/javascript"></script>
<head>
	<title>User Management</title>
</head>
<body>
	<div>
		<form id = "newUserForm" action="add" method="post">
				<div>
					<div><h3>New User Form</h3></div>
					<div>
			            <label class = "formLabel" for="name0">Name</label>
			            <input type="text" id="name0" name="name"/>
			            <label id="nameEmptyValidation0" style="display:none;"> This field is required </label>
			        </div>
		            <div>
			            <label class = "formLabel" for="surname0">Surname</label>            
			            <input type="text" id="surname0" name="surname"/>   
			            <label id="surnameEmptyValidation0" style="display:none;"> This field is required </label>
		            </div>   
		            <div>
			            <label class = "formLabel" for="telephone0">Telephone</label>
			            <input type="text" id="telephone0" name="telephone"/>
			            <label id="telephoneEmptyValidation0" style="display:none;"> This field is required </label>
			        </div> 
		            <button type="button" class = "button" onclick="addUser(0);">Add</button>
	            </div>
	    </form>    
    </div>
	
	<table id = "userTable" border="1">
		<tr id="tableHeader"><td>Name</td><td>Surname</td><td>Telephone</td><td>Operations</td></tr>
		<c:forEach var="userItem" varStatus = "userCount" items="${userList}">
			<tr id = "userTable${userItem.id}">			
				<td>${userItem.name}</td>					
				<td>${userItem.surname}</td>
				<td>${userItem.telephone}</td>
				<td>
					<input type="button" class = "button" name="deleteButton" value="Delete" onclick="deleteConfirm('${userItem.id}');"/>
					<input type="button" class = "button" name="updateButton" value="Update" onclick="updateConfirm('${userItem.id}');"/>
				</td>				 
			</tr>
		</c:forEach>
	</table>
	
	<div id="updateDialog" title="Create new user" style="display:none;">
		  <p class="validateTips">All form fields are required.</p>
		  <form>
		  <fieldset>
		    <label for="name1">Name</label>
		    <input type="text" name="name1" id="name1" class="text ui-widget-content ui-corner-all">
		    <label id="nameEmptyValidation1" style="display:none;"> This field is required </label>
		    <label for="surname1">Surname</label>
		    <input type="text" name="surname1" id="surname1" value="" class="text ui-widget-content ui-corner-all">
		    <label id="surnameEmptyValidation1" style="display:none;"> This field is required </label>
		    <label for="telephone1">Phone Number</label>
		    <input type="text" name="telephone1" id="telephone1" value="" class="text ui-widget-content ui-corner-all">
		    <label id="telephoneEmptyValidation1" style="display:none;"> This field is required </label>
		  </fieldset>
		  </form>
	</div>
	<div id="deleteDialog" ></div>
</body>
</html>
