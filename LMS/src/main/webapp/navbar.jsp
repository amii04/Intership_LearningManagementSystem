<html>
<head>
<title>Pragnya</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></link>
<style>
.logo-img {
	transform: rotate(180deg);
}
</style>
</head>
<body>
	<header class="bg-white shadow">
		<div class="container mx-auto p-4 flex justify-between items-center">
			<div class="flex items-center space-x-4">
				<img class="logo-img"
					alt="Pragnya logo with a stylized book and graduation cap"
					class="h-12 w-12" height="50" src="pragya.png" width="50" />
				<h1 class="text-2xl font-bold">Pragnya</h1>
			</div>
			<nav class="hidden md:flex space-x-4 items-center">
				<a href="#welcome" class="text-gray-700 hover:text-blue-500">Home</a>
				<a href="#about" class="text-gray-700 hover:text-blue-500">About
					Us</a> <a href="#popular-courses"
					class="text-gray-700 hover:text-blue-500">Popular Courses</a> <a
					href="#feedback" class="text-gray-700 hover:text-blue-500">Feedback</a>
				<div class="relative">
					<input type="text" placeholder="Explore..."
						class="border border-gray-300 rounded-lg px-4 py-2" />
					<button class="absolute right-0 top-0 mt-2 mr-2 text-gray-500">
						<i class="fas fa-search"></i>
					</button>
				</div>
				<div class="relative">
					<button
						class="text-gray-700 hover:text-blue-500 flex items-center w-full">
						<i class="fas fa-user mr-2"> </i> Login
					</button>
					<!--  		<a href="login"
						class="text-gray-700 hover:text-blue-500 flex items-center w-full">
						<i class="fas fa-user mr-2"></i> Login
					</a>-->
				</div>
			</nav>
			<div class="md:hidden">
				<button id="mobile-menu-button"
					class="text-gray-700 hover:text-blue-500">
					<i class="fas fa-bars"></i>
				</button>
			</div>
		</div>
		<div id="mobile-menu-dropdown" class="hidden bg-white shadow-lg">
			<nav class="space-y-2 p-4">
				<a href="#welcome" class="block text-gray-700 hover:text-blue-500">Home</a>
				<a href="#about" class="block text-gray-700 hover:text-blue-500">About
					Us</a> <a href="#popular-courses"
					class="block text-gray-700 hover:text-blue-500">Popular Courses</a>
				<a href="#feedback" class="block text-gray-700 hover:text-blue-500">Feedback</a>
				<div class="relative">
					<input type="text" placeholder="Explore..."
						class="border border-gray-300 rounded-lg px-4 py-2 w-full" />
					<button class="absolute right-0 top-0 mt-2 mr-2 text-gray-500">
						<i class="fas fa-search"></i>
					</button>
				</div>
				<button class="text-gray-700 hover:text-blue-500 flex items-center">
					<i class="fas fa-user mr-2"></i> <a href="login.html">Login</a>
				</button>
			</nav>
		</div>
	</header>

	<script>
		document.getElementById('mobile-menu-button').addEventListener('click',
				function() {
					var menu = document.getElementById('mobile-menu-dropdown');
					if (menu.classList.contains('hidden')) {
						menu.classList.remove('hidden');
					} else {
						menu.classList.add('hidden');
					}
				});
	</script>
</body>
</html>