<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TodoList</title>
<script>
function validateForm() {
	console.log("validateForm start");
	var todoid = document.forms["todoForm"]["todoid"].value;
	var desc = document.forms["todoForm"]["desc"].value;
	console.log("validateForm todoid=" +todoid);
	console.log("validateForm desc=" +desc);

	var errmsg = "";
	if (desc == "") 
		errmsg = "Description must be entered\n";
	if (todoid < 1000 || todoid > 9999)
		errmsg += "ID must be within 1000 and 9999";
	console.log("validateForm errmsg=" +errmsg);

	if (errmsg != "") {
		alert(errmsg)
		return false;		
	}
	return true;
}
</script>
</head>
<body>
<form name="todoForm" action="ProcessTodo" onsubmit="return validateForm()" method="post">
<div>Todo ID: <input type="text" name="todoid" /></div>
<div>Description: <input type="text" name="desc" /></div>
<div><input type="submit" value="Add Todo" /></div>
</form>
<% 		String todoid = request.getParameter("todoid"); 
   		String desc = request.getParameter("desc");
%>
<div>TodoId=<%out.println(todoid);%>, Desc=<%out.println(desc);%></div>

</body>
</html>