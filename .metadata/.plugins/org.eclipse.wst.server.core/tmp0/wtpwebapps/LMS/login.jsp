<%-- --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | Pragya</title>
<script src="https://cdn.tailwindcss.com"></script>
<script>
    window.history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        window.history.pushState(null, null, document.URL);
    });
</script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
	rel="stylesheet" />
<style>
body {
	font-family: 'Roboto', sans-serif;
}

img {
	transform: rotate(180deg);
}
</style>
</head>
<body>

	<!-- Authentication Page -->
	<div class="min-h-screen flex items-center justify-center bg-gray-100">
		<div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
			<div class="flex justify-center mb-6">
				<img alt="Company logo" class="w-20 h-20" src="pragya.png" />
			</div>
			<h2 class="text-2xl font-bold mb-6 text-center">Login to Pragya</h2>

			<!-- Display error message dynamically only if it exists -->
			<c:if test="${not empty errorMessage}">
				<div class="bg-red-500 text-white p-2 rounded-md mb-4 text-center">
					${errorMessage}</div>
			</c:if>

			<!-- Login Form -->
			<form action="login" method="post">
				<div class="mb-4">
					<label class="block text-gray-700">Email</label> <input
						type="email" name="email" value="${email}"
						class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
						placeholder="Enter your email" required />
				</div>
				<div class="mb-4">
					<label class="block text-gray-700">Password</label> <input
						type="password" name="password"
						class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
						placeholder="Enter your password" required />
				</div>
				<div class="mb-4">
					<label class="block text-gray-700">Role</label> <select name="role"
						class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
						<option value="INSTRUCTOR">Instructor</option>
						<option value="STUDENT">Student</option>
					</select>
				</div>
				<button type="submit"
					class="w-full bg-blue-500 text-white px-4 py-2 rounded-lg shadow-lg hover:bg-blue-600 transition duration-300">
					Login</button>
			</form>
			<p class="text-center text-gray-600 mt-4">
				Don't have an account? <a href="signup.jsp" class="text-blue-500">Sign
					Up</a>
			</p>
		</div>
	</div>

</body>
</html>
