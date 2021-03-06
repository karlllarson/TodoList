# TodoList Example


## Functionality
### This dynamic web project:
- uses a JSP file to dispay a Todo html form
- uses a servlet to receive a todoid and description from the JSP file and output

<hr/>

## Exemplary Source Code Snippets
### index.jsp
```jsp
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
```
### users.js
```js
import express from 'express';
import {v4 as uuidv4} from 'uuid';
import Router from 'express-promise-router'; 
import { dbQueryUsers, dbQueryUser, dbInsertUser } from '../models/dbHelper.js';

const router = Router();

let users = [];
const queryUsers = async (request, response) => {
    users = await dbQueryUsers();
    response.json( {'data' : users })
}
const queryUser = async (request, response) => {
    const {id} = request.params;
    let user = await dbQueryUser(id);
    response.json( {'data' : user })
}
const insertUser = async (request, response) => {
    const {id, fname, lname} = request.body;
    let user = { 'id': id, 'fname': fname, 'lname': lname }
    console.log('insertUser:' + JSON.stringify(user))
    let count = await dbInsertUser(user);
    response.json( {'data' : count })
}
router.get( '/', queryUsers)
router.get( '/:id', queryUser)
router.post( '/', insertUser)

export default router
```
### processForm.java
```java
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int todoid = Integer.parseInt(request.getParameter("todoid"));
		String desc = request.getParameter("desc");
		request.setAttribute("todoid", todoid);
		request.setAttribute("desc", desc);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		request.setAttribute("post", "post");
	}
```

<hr/>

## Exemplary Screen Shots showing flow

<img height="400" src="https://user-images.githubusercontent.com/35807054/118881107-4d947400-b8b8-11eb-961d-5c0f1bcb3c31.PNG" />

<img height="400" src="https://user-images.githubusercontent.com/35807054/118881109-4d947400-b8b8-11eb-9783-d32f35c6c5b2.PNG" />

<img height="400" src="https://user-images.githubusercontent.com/35807054/118881105-4d947400-b8b8-11eb-9497-8df0eed8e0a2.PNG" />

<hr/>

## Contact Information
If you'd like to me contact me, then feel free to email me at klarson@larsonipl.com or visit my website at [my website](http://msn.com).
