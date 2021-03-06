<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Netrade - register</title>
<link href="css/register.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Nunito'
	rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="js/register.js"></script>
</head>
<body>
	<div class="demo">
		<div class="register">
			<div class="register__form">
				<h2 style="color: red;">${errorString}</h2>
				<form action="${pageContext.request.contextPath}/doEmployeeRegister">
					<div class="login__row firstname">
						<input type="text" name="firstname" class="login__input firstname"
							placeholder="First Name" />
					</div>
					<div class="login__row lastname">
						<input type="text" name="lastname" class="login__input lastname"
							placeholder="Last Name" />
					</div>
					<div class="login__row">
						<input type="text" name="hourly_rate"
							class="login__input hourlyrate" placeholder="Hourly Rate" />
					</div>
					<div class="login__row">
						<input type="text" name="username" class="login__input username"
							placeholder="username" />
					</div>
					<div class="login__row pass">
						<input type="password" name="password" class="login__input pass"
							placeholder="password" />
					</div>
					<div class="login__row confirmpass">
						<input type="password" name="confirmpass"
							class="login__input confirmpass" placeholder="Confirm password" />
					</div>
					<div class="login__row ssn">
						<input type="text" name="SSN" class="login__input ssn"
							placeholder="Your SSN" />
					</div>
					<div class="login__row tel">
						<input type="text" name="telephone" class="login__input tel"
							placeholder="Telephone" />
					</div>
					<div class="login__row">
						<input type="text" name="address" class="login__input addr"
							placeholder="Address" />
					</div>
					<div class="login__row city">
						<input type="text" name="city" class="login__input city"
							placeholder="City" />
					</div>
					<div class="login__row state">
						<select name="state" class="login__input state">
							<option value="AL">AL</option>
							<option value="AK">AK</option>
							<option value="AZ">AZ</option>
							<option value="AR">AR</option>
							<option value="CA">CA</option>
							<option value="CO">CO</option>
							<option value="CT">CT</option>
							<option value="DE">DE</option>
							<option value="DC">DC</option>
							<option value="FL">FL</option>
							<option value="GA">GA</option>
							<option value="HI">HI</option>
							<option value="ID">ID</option>
							<option value="IL">IL</option>
							<option value="IN">IN</option>
							<option value="IA">IA</option>
							<option value="KS">KS</option>
							<option value="KY">KY</option>
							<option value="LA">LA</option>
							<option value="ME">ME</option>
							<option value="MD">MD</option>
							<option value="MA">MA</option>
							<option value="MI">MI</option>
							<option value="MN">MN</option>
							<option value="MS">MS</option>
							<option value="MO">MO</option>
							<option value="MT">MT</option>
							<option value="NE">NE</option>
							<option value="NV">NV</option>
							<option value="NH">NH</option>
							<option value="NJ">NJ</option>
							<option value="NM">NM</option>
							<option value="NY">NY</option>
							<option value="NC">NC</option>
							<option value="ND">ND</option>
							<option value="OH">OH</option>
							<option value="OK">OK</option>
							<option value="OR">OR</option>
							<option value="PA">PA</option>
							<option value="RI">RI</option>
							<option value="SC">SC</option>
							<option value="SD">SD</option>
							<option value="TN">TN</option>
							<option value="TX">TX</option>
							<option value="UT">UT</option>
							<option value="VT">VT</option>
							<option value="VA">VA</option>
							<option value="WA">WA</option>
							<option value="WV">WV</option>
							<option value="WI">WI</option>
							<option value="WY">WY</option>
						</select>
					</div>
					<div class="login__row zipcode">
						<input type="text" name="zipcode" class="login__input zipcode"
							placeholder="Zip Code" />
					</div>

					<div class="login__row ismanager">
						<select name="ismanager" class="login__input ismanager">
							<option value="Y">Manager</option>
							<option value="N">Customer Rep.</option>
						</select>
					</div>

					<input type="submit" value="Submit" class="login__submit" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>