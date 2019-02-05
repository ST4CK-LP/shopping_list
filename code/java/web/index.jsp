<%-- 
    Document   : index
    Created on : 1-feb-2019, 18.04.40
    Author     : ST4CK
--%>

<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <%
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/shopping_list", "root", "password");
            Statement stmt;
        %>
	<head>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/login_form.css">
		<link rel="stylesheet" href="css/grid_divider.css">
		<link rel="stylesheet" href="css/image_slider.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="javascript/switch_form.js"></script>
		<script src="javascript/asyncronous_search.js"></script>
		<script src="javascript/drag_and_drop.js"></script>
		<script src="javascript/notify.js"></script>

	</head>

	<body>
        <%
            int user_id = 0;
            int active_list = 0;
            
            if(request.getParameter("user_id") != null){
                user_id = Integer.parseInt(request.getParameter("user_id"));
            }
            
            if(request.getParameter("active_list") != null){
                active_list = Integer.parseInt(request.getParameter("active_list"));
            }
            
            if(request.getParameter("new_active_list") != null){
                active_list = Integer.parseInt(request.getParameter("new_active_list"));
            }
            
            stmt = conn.createStatement();
            if(request.getParameter("email") != null && request.getParameter("password") != null){
                ResultSet user = stmt.executeQuery("SELECT `id`,`active_list`,`password` FROM `User` WHERE `email` = \""+request.getParameter("email")+"\";");
                user.next();

                MessageDigest md = MessageDigest.getInstance("SHA-512");
                byte[] hashInBytes = md.digest(request.getParameter("password").getBytes(StandardCharsets.UTF_8));

                StringBuilder sb = new StringBuilder();
                for (byte b : hashInBytes) {
                    sb.append(String.format("%02x", b));
                }

                if(sb.toString().equals(user.getString("password"))){
                    user_id = user.getInt("id");
                    active_list = user.getInt("active_list");
        %>
            <script>
                    $.notify('\nSuccesfully logged in', 'success');
            </script>
        <%
                }
                else{
        %>
            <script>
                    $.notify('\nWrong credentials', 'error');
            </script>
        <%
                }
            }
            if(request.getParameter("signup_name") != null && request.getParameter("signup_surname") != null && request.getParameter("signup_email") != null && request.getParameter("signup_password") != null && request.getParameter("confirm_password") != null){
                
                if(request.getParameter("signup_password").equals(request.getParameter("confirm_password"))){
                    stmt = conn.createStatement();
                    ResultSet email_exist = stmt.executeQuery("SELECT `id` FROM `User` WHERE `email` = \""+request.getParameter("signup_email")+"\";");
                    if(email_exist.next()){
        %>
                    <script>
                        $.notify('\nEmail already used', 'error');
                    </script>
        <%
                    }
                    else if(request.getParameter("signup_privacy") != null){
                        MessageDigest md = MessageDigest.getInstance("SHA-512");
                        byte[] hashInBytes = md.digest(request.getParameter("signup_password").getBytes(StandardCharsets.UTF_8));

                        StringBuilder sb = new StringBuilder();
                        for (byte b : hashInBytes) {
                            sb.append(String.format("%02x", b));
                        }
                        stmt = conn.createStatement();
                        stmt.executeUpdate("INSERT INTO `User`(`user_type`,`name`,`surname`,`avatar`,`email`,`password`) VALUES (0,\""+request.getParameter("signup_name")+"\",\""+request.getParameter("signup_surname")+"\",\"\",\""+request.getParameter("signup_email")+"\",\""+sb.toString()+"\");");
        %>
                        <script>
                            $.notify('\nSuccesfully registered', 'success');
                        </script>
        <%
                    }
                    else {
        %>
                        <script>
                            $.notify('\nYou need to accept the privacy policy', 'error');
                        </script>
        <%
                    }
                }
                else{
        %>
                    <script>
                        $.notify('\nPassword doesn\'t match', 'error');
                    </script>
        <%
                }
            }
        %>

<!--	Menubar
-->
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>                        
					</button>
                                    <a class="navbar-brand">Shopping List</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">

                                        <%
                                            if(user_id!=0){
                                                stmt = conn.createStatement();
                                                ResultSet is_admin = stmt.executeQuery("SELECT `user_type` FROM `User` WHERE `id`="+user_id+"");
                                                is_admin.next();
                                                if(is_admin.getInt("user_type") == 0){
                                        %>
					<ul class="nav navbar-nav">
						<li class="active"><a href="#" data-toggle="modal" data-target="#new-template-div">Create template</a></li>
					</ul>
                                        <%
                                                }
                                            }
                                        %>

					<ul class="nav navbar-nav">
						<li class="active"><a href="#" onClick="var d=new Date(); var h=d.getHours(); var m=d.getMinutes(); $.notify(h+':'+m+'\nYou are near the shop', 'info')">Test notifications</a></li>
					</ul>

					<ul class="nav navbar-nav">
						<li class="active"><a href="#" onClick="var d=new Date(); var h=d.getHours(); var m=d.getMinutes(); $.notify(h+':'+m+'\nYou have a new message', 'info')">Test messages</a></li>
					</ul>

                                        <%
                                            if(user_id == 0){
                                        %>
                                        
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#" data-toggle="modal" data-target="#login-div" style="width:auto;"><span class="glyphicon glyphicon-log-in"></span> Login / Signup</a></li>
					</ul>
                                        <%
                                            }
                                        %>
				</div>
			</div>
		</nav>

<!--	List selection div
-->
		<div id="list-selection-div" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Choose which list to display</h4>
					</div>
					<div class="modal-body">
						<form id="list-selection" action="#" method="post" >
                                                        <input type="hidden" id="user_id" name="user_id" value="<%= user_id %>"/>
							<div class='row'>
								<div class='col-md-3'>
									<select id="new_active_list" name="new_active_list">
                                                                                <%
                                                                                    stmt = conn.createStatement();
                                                                                    ResultSet user_lists = stmt.executeQuery("SELECT ShoppingList.name AS name, ShoppingList.id AS id FROM `ShoppingList` INNER JOIN `Permission` ON ShoppingList.id=Permission.list WHERE Permission.user="+user_id+";");
                                                                                    while(user_lists.next()){
                                                                                %>
										<option value="<%= user_lists.getString("id") %>"><%= user_lists.getString("name") %></option>
                                                                                <%
                                                                                    }
                                                                                %>
									</select>
								</div>
								<div class='col-md-9'>
									<a href="#" data-toggle="modal" data-target="#new-list-div" style="width:auto;"><img src="images/add.jpg"></a> Create a new one
								</div>
							</div>
							<br>
							<div class='row'>
								<div class="col-md-5">
									<input type="submit" value="Display"/>
								</div>
							</div>
							<br>
							<div class='row'>
								<div class="col-md-5">
									<a href="#"><img src="images/basket.jpg"></a>Delete this list
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

<!--	New template div
-->
		<div id="new-template-div" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Create a new template</h4>
					</div>
					<div class="modal-body">
						<form id="create-category">
							<div class='row'>
								<div class="col-md-5">
									<input type="text" id="category-name" placeholder="Name" aria-label="Name"></input>
								</div>
							</div>
							<div class='row'>
								<div class="col-md-5">
									<textarea id="category-description" cols="20" rows="2" placeholder="Description" aria-label="Description" style="resize: none"></textarea>
								</div>
							</div>
							<div class='row'>
								<div class="col-md-5">
									<h4>Image</h4><input id="category-image" type="file" style="font-size: 15px;"/>
								</div>
							</div><br>
							<div class='row'>
								<div class="col-md-5">
									<input type="Submit" value="Create"/>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

<!--	New list div
-->
		<div id="new-list-div" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Create a new list</h4>
					</div>
					<div class="modal-body">
						<form id="create-list">
							<div class='row'>
								<div class="col-md-5">
									<input type="text" id="list-name" placeholder="Name" aria-label="Name"></input>
								</div>
							</div>
							<div class='row'>
								<div class="col-md-5">
									<textarea id="list-description" cols="20" rows="2" placeholder="Description" aria-label="Description" style="resize: none"></textarea>
								</div>
							</div>
							<div class='row'>
								<div class="col-md-5">
									<select id="list-category">
										<option>Category 1</option>
										<option>Category 2</option>
										<option>Category 3</option>
									</select>
								</div>
							</div><br>
							<div class='row'>
								<div class="col-md-5">
									<h4>Image</h4><input id="list-image" type="file" style="font-size: 15px;"/>
								</div>
							</div><br>
							<div class='row'>
								<div class="col-md-5">
									<input type="Submit" value="Create"/>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

<!--	New product div
-->
		<div id="new-product-div" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Create a new product</h4>
					</div>
					<div class="modal-body">
						<form id="create-product">
							<div class='row'>
								<div class="col-md-5">
									<input type="text" id="product-name" placeholder="Name" aria-label="Name"></input>
								</div>
							</div>
							<div class='row'>
								<div class="col-md-5">
									<select>
										<option>Category 1</option>
										<option>Category 2</option>
										<option>Category 3</option>
									</select>
								</div>
							</div><br>
							<div class='row'>
								<div class="col-md-5">
									<h4>Logo</h4><input type="file" style="font-size: 15px;"></input>
								</div>
							</div><br>
							<div class='row'>
								<div class="col-md-5">
									<input type="Submit" value="Create"></input>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

<!--	Product div
-->
		<div id="product-div" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Product Name (category)</h4>
					</div>
					<div class="modal-body">

						<div class='row'>
							<div class='col-md-10'>
								<div class="carousel slide media-carousel" id="media">
									<div class="carousel-inner">

										<div class="item  active">
											<div class="row">
												<div class="col-md-4">
													<a class="thumbnail" href="#"><img alt="" src="images/01.jpg"></a>
												</div>          
												<div class="col-md-4">
													<a class="thumbnail" href="#"><img alt="" src="images/02.jpg"></a>
												</div>
												<div class="col-md-4">
													<a class="thumbnail" href="#"><img alt="" src="images/03.jpg"></a>
												</div>        
											</div>
										</div>

										<div class="item">
											<div class="row">
												<div class="col-md-4">
													<a class="thumbnail" href="#"><img alt="" src="images/04.jpg"></a>
												</div>          
												<div class="col-md-4">
													<a class="thumbnail" href="#"><img alt="" src="images/05.jpg"></a>
												</div>  
											</div>
										</div>

									</div>
									<a data-slide="prev" href="#media" class="left carousel-control"><</a>
									<a data-slide="next" href="#media" class="right carousel-control">></a>
									Add a photo
									<input type="file" style="font-size: 15px;"/>
								</div>                          
							</div>
						</div>
						<div class='row'>
							<div class="col-md-5 col-md-offset-1">
								<a href="#"><img src="images/basket.jpg"></a>Delete this product
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

<!--	Login/signup div
-->
		<div id="login-div" class="modal fade" role="dialog">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-login">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6">
									<a href="#" class="active" id="login-form-link">Login</a>
								</div>
								<div class="col-xs-6">
									<a href="#" id="register-form-link">Signup</a>
								</div>
							</div>
							<hr>
						</div>

						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">
									<form id="login-form" action="#" method="post" role="form" style="display: block;">
										<div class="form-group">
											<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email" value="">
										</div>
										<div class="form-group">
											<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
										</div>
										<div class="form-group text-center">
											<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
											<label for="remember"> Remember Me</label>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
													<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-lg-12">
													<div class="text-center">
														<a href="#" tabindex="5" class="forgot-password">Forgot Password?</a>
													</div>
												</div>
											</div>
										</div>
									</form>
									<form id="register-form" action="#" method="post" role="form" style="display: none;">
										<div class="form-group">
											<input type="text" name="signup_name" id="signup_name" tabindex="1" class="form-control" placeholder="Name" value="">
										</div>
										<div class="form-group">
											<input type="text" name="signup_surname" id="signup_surname" tabindex="1" class="form-control" placeholder="Surname" value="">
										</div>
										<div class="form-group">
											<input type="email" name="signup_email" id="signup_email" tabindex="1" class="form-control" placeholder="Email" value="">
										</div>
										<div class="form-group">
											<input type="password" name="signup_password" id="signup_password" tabindex="2" class="form-control" placeholder="Password">
										</div>
										<div class="form-group">
											<input type="password" name="confirm_password" id="confirm_password" tabindex="2" class="form-control" placeholder="Confirm Password">
										</div>
										<div class="form-group text-center">
											<input type="checkbox" tabindex="3" class="" name="signup_privacy" id="accept">
											<label for="signup_privacy"> Accept Privacy Policy</label>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
													<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="container">
			<div class="row grid-divider">

<!--			Products (every user)
-->
				<div class="col-sm-4" style="min-width:375px; max-width:375px; box-sizing: border-box">
					<div class="col-padding">
						<h3>Products</h3>
						<form class="form-inline md-form form-sm mt-0">
	  						<i class="fa fa-search" aria-hidden="true"></i>
	  						<input class="form-control form-control-sm ml-3 w-75" id="myInput" type="text" placeholder="Search" aria-label="Search">
						</form>
						<ul class="list-group" id="myList">
                                                        <%
                                                            if(user_id!=0){
                                                                stmt = conn.createStatement();
                                                                ResultSet is_admin = stmt.executeQuery("SELECT `user_type` FROM `User` WHERE `id`="+user_id+"");
                                                                is_admin.next();
                                                                if(is_admin.getInt("user_type") == 0){
                                                        %>
							<a class="list-group-item" title="Create a new product">
								<table style="width:100%">
									<tr>
										<td style="width:20%">
											<a href="#" data-toggle="modal" data-target="#new-product-div" style="width:auto;"><img src="images/add.jpg"/></a>
										</td>
										<td style="width:80%; color:grey;">Create a new product</td>
									</tr>
								</table>
							</a>
                                                        <%
                                                                }
                                                            }
                                                            stmt = conn.createStatement();
                                                            ResultSet product = stmt.executeQuery("SELECT `id`,`name`,`logo`,`category` FROM `Product` ORDER BY `name` ASC;");
                                                            while (product.next()) {
                                                                stmt = conn.createStatement();
                                                                ResultSet category = stmt.executeQuery("SELECT `Name` from `productcategory` WHERE `id` = " + product.getInt("category") + ";");
                                                                category.next();
                                                        %>
							<li class="list-group-item" id=<%=product.getInt("id")%> draggable="true" ondragstart="drag(event)">
								<table style="width:100%">
									<tr>
										<td style="width:20%">
											<a href="#" data-toggle="modal" data-target="#product-div" style="width:auto;">
												<img src="images/<%= product.getString("logo") %>"/>
											</a>
										</td>
										<td style="width:40%"><%= product.getString("name") %></td>
										<td style="width:40%"><%= category.getString("name") %></td>
									</tr>
								</table>
							</li>
                                                          <%
                                                              }
                                                          %>
						</ul>
					</div>
				</div>

<!--			List (every user)
-->
				<div class="col-sm-4" style="min-width:375px; max-width:375px; box-sizing: border-box"> 
					<div class="col-padding">
                                        <%
                                            stmt = conn.createStatement();
                                            if(active_list!=0){
                                                ResultSet list = stmt.executeQuery("SELECT ShoppingList.name AS slname, ShoppingListCategory.name AS slcname,  ShoppingList.description, ShoppingList.image FROM `ShoppingList` INNER JOIN `ShoppingListCategory` ON ShoppingList.category=ShoppingListCategory.id WHERE ShoppingList.id=\""+active_list+"\";");
                                                list.next();
                                        %>
						<table style="width:350px">
							<tr>
								<td style="width:70%">
									<div>
										<h3><%= list.getString("slname") %> (<%= list.getString("slcname") %>)</h3>
										<p><%= list.getString("description") %></p>
									</div>
								</td>
								<td style="width:30%">
									<img src="images/<%= list.getString("image") %>" style="padding-left:20px"/>
								</td>
							</tr>
						</table>
                                        <%
                                            }
                                            else{
                                        %>
						<table style="width:350px">
							<tr>
								<td style="width:70%">
									<div>
										<h3>Shopping List</h3>
										<p>Register to custom your lists</p>
									</div>
								</td>
								<td style="width:30%">
								</td>
							</tr>
						</table>
                                        <%
                                            }
                                        %>
						<div id="shopping-list" style="width: 350px; min-height: 50px; padding: 10px; border: 1px solid #aaaaaa;">
							<li class="list-group-item" title="Drop here to add products" ondrop="drop(event)" ondragover="allowDrop(event)">
								<table style="width:100%">
									<tr>
										<td style="width:20%"><img src="images/add.jpg"></img></td>
										<td style="width:80%; color:grey;">Drop here to add products</td>
									</tr>
								</table>
							</li>
                                        <%
                                            stmt = conn.createStatement();
                                            if(active_list!=0){
                                                ResultSet product_list = stmt.executeQuery("SELECT `name`,`notes` FROM `Product` INNER JOIN `ListProducts` ON Product.id=ListProducts.product WHERE ListProducts.list="+active_list+";");
                                                while(product_list.next()){
                                        %>
							<li class="list-group-item" title="Drop here to add products" ondrop="drop(event)" ondragover="allowDrop(event)">
								<table style="width:100%">
									<tr>
										<td style="width:20%"><img src="images/basket.jpg"/></td>
										<td style="width:40%"><%= product_list.getString("name") %></td>
                                                                                <% if(product_list.getString("notes") != null){ %>
                                                                                <td style="width:40%"><input type="text" style="width:120px" placeholder="Notes" aria-label="Notes" value="<%= product_list.getString("notes") %>"/></td>
                                                                                <% }else{ %>
                                                                                <td style="width:40%"><input type="text" style="width:120px" placeholder="Notes" aria-label="Notes"/></td>
                                                                                <% } %>
									</tr>
								</table>
							</li>
                                        <%
                                                }
                                            }
                                        %>
						</div><br>
                                        <%
                                            if(active_list!=0){
                                        %>
						<div id="chat" style="width: 350px; min-height: 50px; padding: 10px; border: 1px solid #aaaaaa;">
                                        <%
                                            stmt = conn.createStatement();
                                                ResultSet messages = stmt.executeQuery("SELECT `name`,`message` FROM `User` INNER JOIN `Message` ON User.id=Message.user WHERE Message.list="+active_list+";");
                                                while(messages.next()){
                                        %>
							<li class="list-group-item">
								<table style="width:100%">
									<tr>
										<td style="width:20%"><%= messages.getString("name") %></td>
										<td style="width:10%"></td>
										<td style="width:70%"><%= messages.getString("message") %></td>
									</tr>
								</table>
							</li>
                                        <%
                                                }
                                        %>
							<li class="list-group-item">
								<table style="width:100%">
									<tr>
										<td style="width:70%">
											<select>
												<option>I'm going to grocery</option>
												<option>List updated, check it!</option>
												<option>Shopping made!</option>
											</select>
										</td>
										<td style="width:10%"></td>
										<td style="width:20%">
											<input type="button" value="Send"></input>
										</td>
									</tr>
								</table>
							</li>
						</div>
                                        <%
                                            }
                                        %>
					</div>
				</div>

<!--			List options (only registered users)
-->
                            <%
                                if(user_id!=0){
                            %>
				<div class="col-sm-4" style="min-width:375px; max-width:375px; box-sizing: border-box"> 
					<div class="col-padding">
						<table style="width:350px">
							<tr>
								<td style="width:70%">
									<div>
										<h3>List options</h3>
										<p>Here you can set privileges<br>and share your list</p>
									</div>
								</td>
								<td style="width:30%">
									<a href="#" data-toggle="modal" data-target="#list-selection-div" style="width:auto;">
										<img src="images/change_list.jpg" style="padding-left:20px"/>
									</a>
								</td>
							</tr>
						</table>
						<div id="shopping-list-users" style="width: 350px; min-height: 50px; padding: 10px; border: 1px solid #aaaaaa;">
							<table style="width:100%;">

								<tr>
									<td style="width:40%; padding:5px;">
										<select>
                                                                                    <%
                                                                                        stmt = conn.createStatement();
                                                                                        if(active_list!=0){
                                                                                            ResultSet users = stmt.executeQuery("SELECT `name` FROM `User`;");
                                                                                            while(users.next()){
                                                                                    %>
											<option><%= users.getString("name") %></option>
                                                                                    <%
                                                                                            }
                                                                                        }
                                                                                    %>
										</select>
									</td>
									<td style="width:40%">
										<select>
											<option>Owner</option>
											<option>Guest</option>
										</select>
									</td>
									<td style="width:20%">
										<img src="images/add.jpg" onclick="addUserRow(event)"/>
									</td>
								</tr>

                                                                <%
                                                                    stmt = conn.createStatement();
                                                                    if(active_list!=0){
                                                                        ResultSet privileges = stmt.executeQuery("SELECT User.name, Permission.permission FROM `User` INNER JOIN `Permission` ON User.id=Permission.user WHERE Permission.list="+active_list+";");
                                                                        while(privileges.next()){
                                                                %>
								<tr>
									<td style="width:40%; padding-left:15px;">
										<h4><%= privileges.getString("name") %></h4>
									</td>
									<td style="width:40%; padding-left:10px;">
										<h4>
                                                                                    <% if(privileges.getInt("permission") == 0){ %>Owner
                                                                                    <% }else{ %>Guest
                                                                                    <% } %>
                                                                                </h4>
									</td>
									<td style="width:20%">
										<img src="images/basket.jpg" onclick="deleteUserRow(event)"/>
									</td>
								</tr>

                                                                <%
                                                                        }
                                                                    }
                                                                %>

							</table>
						</div>
					</div>
				</div>
                            <%
                                }
                            %>


			</div>
		</div>

	</body>

</html>
