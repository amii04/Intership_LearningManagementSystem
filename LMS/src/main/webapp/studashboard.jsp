<%@ page session="true"%>
<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("STUDENT")) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<%@ page session="true" %>
<%
    if (session.getAttribute("role") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    // Invalidate session on refresh
    session.invalidate();
%>
<%@ include file="navbardashboard.jsp"%>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<title>Student Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Roboto', sans-serif;
}
</style>
<script>
window.history.forward(); // Forces forward navigation after login
window.onload = function () {
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
};
</script>
</head>
<body class="bg-gray-100">

	<main class="container mx-auto p-4">
		<div class="bg-white p-6 rounded-lg shadow-lg">
			<h2 class="text-2xl font-bold mb-4">My Enrolled Courses</h2>
			<div class="space-y-4">
				<div
					class="bg-gray-50 p-4 rounded-lg shadow flex flex-col md:flex-row items-center">
					<img alt="Placeholder image for Enrolled Course 1"
						class="w-32 h-32 object-cover mb-4 md:mb-0 md:mr-4" height="200"
						src="https://storage.googleapis.com/a1aa/image/puAkkvsGIxWM3r08wSwW6HF_ywZ2zTWXjtgMn-HR6t4.jpg"
						width="200" />
					<div class="flex-1 text-center md:text-left">
						<h3 class="text-xl font-semibold mb-2">Enrolled Course 1</h3>
						<p class="text-gray-700 mb-2">Description of Enrolled Course 1</p>
						<div class="w-full bg-gray-200 rounded-full h-1.5 mb-4">
							<div class="bg-blue-500 h-1.5 rounded-full" style="width: 70%"></div>
						</div>
						<button
							class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 md:ml-4"
							onclick="viewCourse('Enrolled Course 1', 'Description of Enrolled Course 1', 'https://www.youtube.com/embed/dQw4w9WgXcQ')">View
							Course</button>
					</div>
				</div>
				<div
					class="bg-gray-50 p-4 rounded-lg shadow flex flex-col md:flex-row items-center">
					<img alt="Placeholder image for Enrolled Course 2"
						class="w-32 h-32 object-cover mb-4 md:mb-0 md:mr-4" height="200"
						src="https://storage.googleapis.com/a1aa/image/imc1B7kYH0tcfKqnmV40KQ-v5uHuhryjxrlhFKeuNmw.jpg"
						width="200" />
					<div class="flex-1 text-center md:text-left">
						<h3 class="text-xl font-semibold mb-2">Enrolled Course 2</h3>
						<p class="text-gray-700 mb-2">Description of Enrolled Course 2</p>
						<div class="w-full bg-gray-200 rounded-full h-1.5 mb-4">
							<div class="bg-blue-500 h-1.5 rounded-full" style="width: 50%"></div>
						</div>
						<button
							class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 md:ml-4"
							onclick="viewCourse('Enrolled Course 2', 'Description of Enrolled Course 2', 'https://www.youtube.com/embed/dQw4w9WgXcQ')">View
							Course</button>
					</div>
				</div>
				<div
					class="bg-gray-50 p-4 rounded-lg shadow flex flex-col md:flex-row items-center">
					<img alt="Placeholder image for Enrolled Course 3"
						class="w-32 h-32 object-cover mb-4 md:mb-0 md:mr-4" height="200"
						src="https://storage.googleapis.com/a1aa/image/LYv2BCH0-cJhoQpaUkXjyJgAFaTocuzj4NLZC-UMKoA.jpg"
						width="200" />
					<div class="flex-1 text-center md:text-left">
						<h3 class="text-xl font-semibold mb-2">Enrolled Course 3</h3>
						<p class="text-gray-700 mb-2">Description of Enrolled Course 3</p>
						<div class="w-full bg-gray-200 rounded-full h-1.5 mb-4">
							<div class="bg-blue-500 h-1.5 rounded-full" style="width: 80%"></div>
						</div>
						<button
							class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 md:ml-4"
							onclick="viewCourse('Enrolled Course 3', 'Description of Enrolled Course 3', 'https://www.youtube.com/embed/dQw4w9WgXcQ')">View
							Course</button>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Modal -->
	<div id="courseModal" class="fixed z-10 inset-0 overflow-y-auto hidden">
		<div class="flex items-center justify-center min-h-screen px-4">
			<div
				class="bg-white rounded-lg shadow-lg overflow-hidden w-full max-w-2xl relative">
				<button id="closeButton"
					class="absolute top-2 right-2 text-red-500 hover:text-red-700"
					onclick="closeModal()">
					<i class="fas fa-times fa-2x"></i>
				</button>
				<div class="p-4">
					<h3 id="modalCourseName" class="text-xl font-semibold mb-2"></h3>
					<p id="modalCourseDescription" class="text-gray-700 mb-4"></p>
					<div class="aspect-w-16 aspect-h-9 mb-4">
						<iframe id="modalCourseVideo" class="w-full h-full" src=""
							frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="space-y-4">
						<div class="bg-gray-50 p-4 rounded-lg shadow">
							<h4 class="text-lg font-semibold mb-2">Module 1</h4>
							<p class="text-gray-700 mb-2">Description of Module 1</p>
							<div class="w-full bg-gray-200 rounded-full h-1.5 mb-4">
								<div class="bg-blue-500 h-1.5 rounded-full" style="width: 60%"></div>
							</div>
							<button
								class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600">Download
								Video</button>
							<button
								class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 ml-2">Download
								Materials</button>
						</div>
						<div class="bg-gray-50 p-4 rounded-lg shadow">
							<h4 class="text-lg font-semibold mb-2">Module 2</h4>
							<p class="text-gray-700 mb-2">Description of Module 2</p>
							<div class="w-full bg-gray-200 rounded-full h-1.5 mb-4">
								<div class="bg-blue-500 h-1.5 rounded-full" style="width: 40%"></div>
							</div>
							<button
								class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600">Download
								Video</button>
							<button
								class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 ml-2">Download
								Materials</button>
						</div>
						<div class="bg-gray-50 p-4 rounded-lg shadow">
							<h4 class="text-lg font-semibold mb-2">Module 3</h4>
							<p class="text-gray-700 mb-2">Description of Module 3</p>
							<div class="w-full bg-gray-200 rounded-full h-1.5 mb-4">
								<div class="bg-blue-500 h-1.5 rounded-full" style="width: 80%"></div>
							</div>
							<button
								class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600">Download
								Video</button>
							<button
								class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 ml-2">Download
								Materials</button>
						</div>
					</div>
				</div>
				<div class="p-4 text-right">
					<button
						class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600"
						onclick="closeModal()">Close</button>
					<button
						class="bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-600 ml-2"
						onclick="closeModal()">Back</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<script>
		function viewCourse(courseName, courseDescription, videoUrl) {
			document.getElementById('modalCourseName').innerText = courseName;
			document.getElementById('modalCourseDescription').innerText = courseDescription;
			document.getElementById('modalCourseVideo').src = videoUrl;
			document.getElementById('courseModal').classList.remove('hidden');
			window.addEventListener('scroll', moveCloseButton);
		}

		function closeModal() {
			document.getElementById('modalCourseVideo').src = "";
			document.getElementById('courseModal').classList.add('hidden');
			window.removeEventListener('scroll', moveCloseButton);
		}

		function moveCloseButton() {
			const closeButton = document.getElementById('closeButton');
			const scrollY = window.scrollY;
			closeButton.style.top = `${scrollY + 10}px`;
		}
	</script>
</body>
</html>